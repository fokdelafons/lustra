import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/parliament_manager.dart';
import '../../services/curated_list_service.dart';
import '../../services/share_service.dart';
import 'package:go_router/go_router.dart';
import '../../models/legislation.dart';
import '../../widgets/lists_specific/legislation_list_card.dart';
import '../../providers/language_provider.dart';
import '../../providers/user_provider.dart';
import '../../services/app_router.dart';
import '../../services/cache/parliament_cache_manager.dart';
import '../../widgets/osint_loader.dart';
import '../../widgets/error_report_dialog.dart';
import '../../widgets/web_link.dart';

class CuratedLegislationScreen extends StatefulWidget {
  final String listId;
  const CuratedLegislationScreen({super.key, required this.listId});

  @override
  CuratedLegislationScreenState createState() => CuratedLegislationScreenState();
}

class CuratedLegislationScreenState extends State<CuratedLegislationScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  
  final CuratedListService _curatedService = CuratedListService();
  final ScrollController _scrollController = ScrollController();
  
  List<Legislation> _bills = [];
  Map<String, dynamic>? _metadata;
  bool _isLoading = false;
  bool _isSubscribing = false;
  bool _isSubscribed = false;
  bool _isNotifyingSubscribers = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }


Future<void> refreshData() async {
    if (!mounted) return;
    final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
    await ParliamentCacheManager(prefix).clearCuratedListFeed(widget.listId);
    await _loadData(forceRefresh: true);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.listRefreshed)));
    }
  }

  Future<void> _loadData({bool forceRefresh = false}) async {
    if (!mounted) return;
    
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final lang = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
      final manager = Provider.of<ParliamentManager>(context, listen: false);
      final prefix = manager.activeServiceId ?? '';
      final loc = AppLocalizations.of(context)!;

      final data = await _curatedService.getFeed(widget.listId, lang, prefix, forceRefresh: forceRefresh);
      
      if (data == null) throw Exception(loc.errorNoDataReturned);

      final rawLegislations = data['legislations'] ?? [];
      final rawCivic = data['civic'] ?? [];
      _metadata = data['metadata'];

      List<Legislation> combined = [];
      for (var json in rawLegislations) {
        try { combined.add(Legislation.fromJson(json as Map<String, dynamic>)); } catch (_) {}
      }
      for (var json in rawCivic) {
        try { combined.add(Legislation.fromJson(json as Map<String, dynamic>)); } catch (_) {}
      }

      combined.sort((a, b) {
        final dateA = a.processStartDate ?? a.documentDate ?? DateTime.now();
        final dateB = b.processStartDate ?? b.documentDate ?? DateTime.now();
        return dateB.compareTo(dateA);
      });

      _checkSubscriptionStatus();

      if (mounted) {
        setState(() {
          _bills = combined;
          _isLoading = false;
        });
      }
    } catch (e) {
      developer.log('Błąd podczas ładowania feedu listy: $e', name: 'CuratedLegislationScreen');
      if (mounted) {
        setState(() {
          _errorMessage = AppLocalizations.of(context)!.errorFetchData;
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _checkSubscriptionStatus() async {
      if (!mounted) return;
      final userProvider = context.read<UserProvider>();
      setState(() {
        _isSubscribed = userProvider.isSubscribedToList(widget.listId);
      });
    }

  Future<void> _toggleSubscription() async {
    if (FirebaseAuth.instance.currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.errorMustBeLoggedInToSubscribe)),
      );
      return;
    }

    setState(() => _isSubscribing = true);
    try {
      final newState = await _curatedService.toggleSubscription(widget.listId);
      if (mounted) {
        setState(() {
          _isSubscribed = newState;
          if (_metadata != null) {
             _metadata!['subscriberCount'] = (_metadata!['subscriberCount'] as int) + (newState ? 1 : -1);
          }
        });
        
        context.read<UserProvider>().updateListSubscriptionLocally(widget.listId, newState);
        context.read<UserProvider>().triggerCuratedListsRebuild();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(newState ? AppLocalizations.of(context)!.subscribedToList : AppLocalizations.of(context)!.unsubscribedFromList)),
        );
      }
    } catch (e) {
      if (e.toString().contains('not-found') || e.toString().contains('NOT_FOUND')) {
        if (mounted) {
          context.read<UserProvider>().updateListSubscriptionLocally(widget.listId, false);
          setState(() => _isSubscribed = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.errorListRemovedByOwner)),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.errorFailedToUpdateSubscription)),
          );
        }
      }
    } finally {
      if (mounted) setState(() => _isSubscribing = false);
    }
  }
  
  Future<void> _notifySubscribers() async {
    setState(() => _isNotifyingSubscribers = true);
    try {
      final manager = context.read<ParliamentManager>();
      final prefix = manager.activeServiceId ?? '';
      
      await _curatedService.notifySubscribers(widget.listId, prefix);
      
      if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.notificationSentCooldownActive)));
         setState(() {
           if (_metadata != null) {
             _metadata!['lastNotifiedAt'] = DateTime.now().toIso8601String();
           }
         });
      }
    } catch (e) {
      if (mounted) {
        final errorMsg = e.toString().contains('RESOURCE_EXHAUSTED') 
          ? AppLocalizations.of(context)!.errorCooldownActiveNotification
          : AppLocalizations.of(context)!.errorFailedToSendNotification;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMsg)));
      }
    } finally {
      if (mounted) setState(() => _isNotifyingSubscribers = false);
    }
  }

  void _showCreateListFromCTA() {
    if (FirebaseAuth.instance.currentUser == null) {
      final l10n = AppLocalizations.of(context)!;
      final currentUri = GoRouterState.of(context).uri.toString();
      final encodedNext = Uri.encodeComponent(currentUri);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.drafterAuthRequired),
          action: SnackBarAction(
            label: l10n.promptToLogin, 
            onPressed: () => context.smartNavigate('/login?next=$encodedNext'),
          ),
          duration: const Duration(seconds: 5),
        ),
      );
      return;
    }

    final TextEditingController nameController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.nameYourCuratorList, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  maxLength: 40,
                  textCapitalization: TextCapitalization.words,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.hintCuratorListExample,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text(AppLocalizations.of(context)!.actionCancel, style: const TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        final text = nameController.text.trim();
                        if (text.isEmpty) return;
                        
                        final messenger = ScaffoldMessenger.of(context);
                        final manager = context.read<ParliamentManager>();
                        final userProv = context.read<UserProvider>();
                        final prefix = manager.activeServiceId ?? 'us';
                        
                        Navigator.of(ctx).pop(); 
                        
                        try {
                          await _curatedService.createList(text, prefix);
                          await ParliamentCacheManager(prefix).clearMyCuratedLists(); 
                          
                          if (!mounted) return;
                          messenger.showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.listCreatedSuccess(text))));
                          userProv.triggerCuratedListsRebuild(); 
                        } catch (e) {
                          if (!mounted) return;
                          messenger.showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.errorFailedToCreateList)));
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.actionCreate),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildGamificationHeader() {
    if (_metadata == null) return const SizedBox.shrink();
    
    final listName = _metadata!['listName'] ?? AppLocalizations.of(context)!.unnamedList;
    final subs = _metadata!['subscriberCount'] ?? 0;
    final isOwner = context.read<UserProvider>().createdLists.contains(widget.listId);

    bool isOnCooldown = false;
    int hoursLeft = 0;
    if (isOwner && _metadata!['lastNotifiedAt'] != null) {
      try {
        final lastNotified = DateTime.parse(_metadata!['lastNotifiedAt'].toString());
        final diff = DateTime.now().difference(lastNotified);
        if (diff.inHours < 24) {
          isOnCooldown = true;
          hoursLeft = 24 - diff.inHours;
        }
      } catch (_) {}
    }

    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor.withAlpha(20),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(listName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                    if (isOwner)
                      IconButton(
                        icon: const Icon(Icons.edit, size: 20, color: Colors.blueGrey),
                        tooltip: AppLocalizations.of(context)!.tooltipEditList,
                        onPressed: _showEditListModal,
                      ),
                  ],
                ),
                
                if ((_metadata!['description'] != null && _metadata!['description'].toString().isNotEmpty) || isOwner)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 8.0, left: 16.0, right: 16.0),
                    child: Text(
                      (_metadata!['description'] != null && _metadata!['description'].toString().isNotEmpty) 
                          ? _metadata!['description'] 
                          : AppLocalizations.of(context)!.addDescriptionHint,
                      style: TextStyle(
                        fontSize: 14, 
                        color: (_metadata!['description'] != null && _metadata!['description'].toString().isNotEmpty) 
                            ? Colors.black87 
                            : Colors.grey,
                        fontStyle: (_metadata!['description'] != null && _metadata!['description'].toString().isNotEmpty) 
                            ? FontStyle.normal 
                            : FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.people_outline, size: 18),
                    const SizedBox(width: 4),
                    Text(AppLocalizations.of(context)!.subscribersCount(subs), style: const TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12.0,
                  runSpacing: 12.0,
                  children: [
                    ElevatedButton.icon(
                       onPressed: _shareList,
                       icon: const Icon(Icons.ios_share),
                       label: Text(AppLocalizations.of(context)!.actionShareList),
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Theme.of(context).primaryColor, 
                         foregroundColor: Colors.white,
                       ),
                    ),
                    
                    if (_metadata!['tipProvider'] != null && _metadata!['tipProvider'].toString().isNotEmpty && _metadata!['tipUsername'] != null && _metadata!['tipUsername'].toString().isNotEmpty)
                      ElevatedButton.icon(
                         onPressed: () async {
                           final provider = _metadata!['tipProvider'];
                           final user = _metadata!['tipUsername'];
                           String url = '';
                           
                           if (provider == 'Patreon') {
                             url = 'https://www.patreon.com/$user';
                           } else if (provider == 'BuyMeACoffee') {
                             url = 'https://www.buymeacoffee.com/$user';
                           } else if (provider == 'Ko-fi') {
                             url = 'https://ko-fi.com/$user';
                           }
                           
                           // Safety check to prevent app crash on unhandled provider or empty URL
                           if (url.isNotEmpty) {
                             try {
                               await launchUrl(
                                 Uri.parse(url), 
                                 mode: LaunchMode.externalApplication,
                               );
                             } catch (e) {
                               debugPrint('Error launching URL: $e');
                             }
                           }
                         },
                         icon: const Icon(Icons.coffee),
                         label: Text(AppLocalizations.of(context)!.actionSupportCreator),
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.pinkAccent, 
                           foregroundColor: Colors.white,
                         ),
                      ),

                    if (isOwner)
                      ElevatedButton.icon(
                         onPressed: (_isNotifyingSubscribers || isOnCooldown) ? null : _notifySubscribers,
                         icon: _isNotifyingSubscribers 
                           ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                           : Icon(isOnCooldown ? Icons.timer : Icons.campaign),
                         label: Text(isOnCooldown ? AppLocalizations.of(context)!.availableInHours(hoursLeft) : AppLocalizations.of(context)!.actionNotifySubscribers),
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.orange, 
                           foregroundColor: Colors.white,
                           disabledBackgroundColor: Colors.grey[800],
                         ),
                      )
                    else
                      ElevatedButton.icon(
                         onPressed: _isSubscribing ? null : _toggleSubscription,
                         icon: _isSubscribing 
                           ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                           : Icon(_isSubscribed ? Icons.check : Icons.notifications_active),
                         label: Text(_isSubscribed ? AppLocalizations.of(context)!.actionSubscribed : AppLocalizations.of(context)!.actionSubscribe),
                         style: ElevatedButton.styleFrom(
                           backgroundColor: _isSubscribed ? Colors.green : Theme.of(context).primaryColor,
                           foregroundColor: Colors.white,
                         ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          
          if (isOwner)
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(200),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.storage_outlined, size: 12, color: Colors.grey[700]),
                    const SizedBox(width: 4),
                    Text(
                      '${_bills.length}/80',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
            ),

          if (isOwner)
            Positioned(
              top: 4,
              right: 4,
              child: IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red.withAlpha(150), size: 20),
                tooltip: AppLocalizations.of(context)!.tooltipDeleteList,
                onPressed: _confirmDeleteList,
              ),
            ),
          
          Positioned(
            bottom: 4,
            right: 4,
            child: IconButton(
              icon: Icon(Icons.flag_outlined, color: Colors.grey.withAlpha(150), size: 20),
              tooltip: AppLocalizations.of(context)!.tooltipReportList,
              onPressed: () {
                final manager = context.read<ParliamentManager>();
                showErrorReportDialog(
                  context: context,
                  targetId: widget.listId,
                  targetType: 'curated_list',
                  sourceId: manager.activeServiceId ?? 'unknown',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  static const String _lustraMasterListId = 'G0V2PdSmQtwh8bGxdT7e'; // DEFAULT LIST - LUSTRA TRANSPARENCY FIGHT, US only for now

  Widget _buildCivicProjectCTA(BuildContext context) {
    final manager = context.read<ParliamentManager>();
    final lang = context.read<LanguageProvider>().appLanguageCode;
    final slug = manager.activeSlug;
    final path = '/$lang/$slug/civic-project';

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
      child: WebLink(
        path: path,
        builder: (context, onTapCallback) => Card(
          elevation: 0,
          color: Theme.of(context).primaryColor.withAlpha(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          child: InkWell(
            onTap: onTapCallback,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Icon(Icons.volunteer_activism, size: 48, color: Theme.of(context).primaryColor),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.draftYourCivicProject,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.draftCivicProjectDescription,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateListCTA(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
      child: Card(
        elevation: 0,
        color: Colors.orange.withAlpha(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.orange, width: 2),
        ),
        child: InkWell(
          onTap: _showCreateListFromCTA,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Icon(Icons.playlist_add_check_circle, size: 48, color: Colors.orange),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)!.createYourOwnList,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.createYourOwnListDescription,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEditListModal() {
    final currentName = _metadata?['listName'] ?? '';
    final currentDesc = _metadata?['description'] ?? '';
    final currentTipProvider = _metadata?['tipProvider'];
    final currentTipUsername = _metadata?['tipUsername'] ?? '';

    final TextEditingController nameCtrl = TextEditingController(text: currentName);
    final TextEditingController descCtrl = TextEditingController(text: currentDesc);
    final TextEditingController tipUserCtrl = TextEditingController(text: currentTipUsername);
    String selectedProvider = (currentTipProvider != null && currentTipProvider.isNotEmpty) ? currentTipProvider : 'None';

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              child: Container(
                width: 450,
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.editListDetails, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      TextField(
                        controller: nameCtrl,
                        maxLength: 40,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(labelText: AppLocalizations.of(context)!.listNameLabel, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: descCtrl,
                        maxLength: 200,
                        maxLines: 3,
                        decoration: InputDecoration(labelText: AppLocalizations.of(context)!.descriptionOptionalLabel, alignLabelWithHint: true, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 12),
                      Text(AppLocalizations.of(context)!.supportCreatorOptionalLabel, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: selectedProvider,
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), isDense: true),
                        items: ['None', 'Patreon', 'BuyMeACoffee', 'Ko-fi'].map((String val) {
                          return DropdownMenuItem(value: val, child: Text(val));
                        }).toList(),
                        onChanged: (val) {
                          setModalState(() {
                            selectedProvider = val!;
                            if (selectedProvider == 'None') tipUserCtrl.clear();
                          });
                        },
                      ),
                      if (selectedProvider != 'None') ...[
                        const SizedBox(height: 12),
                        TextField(
                          controller: tipUserCtrl,
                          decoration: InputDecoration(labelText: AppLocalizations.of(context)!.providerUsernameLabel(selectedProvider), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                        ),
                      ],
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: Text(AppLocalizations.of(context)!.actionCancel, style: const TextStyle(color: Colors.grey)),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              elevation: 0,
                            ),
                            onPressed: () async {
                              final newName = nameCtrl.text.trim();
                              if (newName.isEmpty) return;

                              final newDesc = descCtrl.text.trim();
                              final tipProv = selectedProvider == 'None' ? '' : selectedProvider;
                              final tipUser = tipUserCtrl.text.trim();

                              final messenger = ScaffoldMessenger.of(context);
                              final userProv = context.read<UserProvider>();
                              final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
                              final loc = AppLocalizations.of(context)!;
                              Navigator.of(ctx).pop(); 

                              try {
                                await _curatedService.updateListMeta(widget.listId, newName, newDesc, tipProv, tipUser);
                                await ParliamentCacheManager(prefix).clearMyCuratedLists();
                                await ParliamentCacheManager(prefix).clearCuratedListFeed(widget.listId);
                                
                                if (!mounted) return;
                                setState(() {
                                  _metadata!['listName'] = newName;
                                  _metadata!['description'] = newDesc;
                                  _metadata!['tipProvider'] = tipProv;
                                  _metadata!['tipUsername'] = tipUser;
                                }); 
                                userProv.triggerCuratedListsRebuild(); 
                                messenger.showSnackBar(SnackBar(content: Text(loc.listUpdatedSuccess)));
                              } catch (e) {
                                if (mounted) messenger.showSnackBar(SnackBar(content: Text(loc.errorFailedToUpdate)));
                              }
                            },
                            child: Text(AppLocalizations.of(context)!.actionSave),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }

  void _confirmDeleteList() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
                  const SizedBox(width: 12),
                  Text(AppLocalizations.of(context)!.deleteListDialogTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 16),
              Text(AppLocalizations.of(context)!.deleteListDialogBody, style: const TextStyle(color: Colors.black87)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text(AppLocalizations.of(context)!.actionCancel, style: const TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, 
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    onPressed: () async {
                      final messenger = ScaffoldMessenger.of(context);
                      final userProv = context.read<UserProvider>();
                      final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
                      final routerCtx = context;
                      final loc = AppLocalizations.of(context)!;
                      Navigator.of(ctx).pop();
                      
                      try {
                        await _curatedService.deleteList(widget.listId);
                        await ParliamentCacheManager(prefix).clearMyCuratedLists();
                        await ParliamentCacheManager(prefix).clearCuratedListFeed(widget.listId);
                        
                        if (!mounted) return;
                        userProv.triggerCuratedListsRebuild();
                        messenger.showSnackBar(SnackBar(content: Text(loc.listDeletedSuccess)));
                        if (routerCtx.mounted) {
                          routerCtx.smartNavigate('/'); 
                        }
                      } catch (e) {
                        if (mounted) messenger.showSnackBar(SnackBar(content: Text(loc.errorFailedToDelete)));
                      }
                    },
                    child: Text(AppLocalizations.of(context)!.actionDelete),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }

  void _shareList() {
    if (_metadata == null) return;
    final manager = context.read<ParliamentManager>();
    ShareService().shareCuratedList(
      context: context, listId: widget.listId, listName: _metadata!['listName'] ?? 'Curated List',
      lang: context.read<LanguageProvider>().appLanguageCode, slug: manager.activeSlug, term: manager.currentTerm ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    if (_isLoading) return Center(child: OsintLoader(text: AppLocalizations.of(context)!.syncingCuratedFeed));
    
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(_errorMessage!, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _loadData, child: Text(AppLocalizations.of(context)!.actionTryAgain)),
          ],
        ),
      );
    }

    final bool isDesktopWeb = kIsWeb && MediaQuery.of(context).size.width > 750;

    Widget listView = ListView.builder(
      controller: _scrollController,
      physics: isDesktopWeb ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 32.0),
      itemCount: _bills.length + 2,
      itemBuilder: (context, index) {
        final isOwner = context.read<UserProvider>().createdLists.contains(widget.listId);

        if (index == 0) {
          return _buildGamificationHeader();
        }

        final billIndex = index - 1;

        if (billIndex == _bills.length) {
          if (isOwner) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildCivicProjectCTA(context),
            );
          } else if (widget.listId == _lustraMasterListId) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildCreateListCTA(context),
            );
          }
          return const SizedBox.shrink();
        }
        
        final bill = _bills[billIndex];
        final isHighlighted = _metadata != null && _metadata!['highlightedBillId'] == bill.id;

        final manager = context.read<ParliamentManager>();
        final slug = manager.activeSlug;
        final lang = context.read<LanguageProvider>().appLanguageCode;
        final term = bill.documentType == 'civic' ? 'civic' : manager.currentTerm.toString();
        final internalPath = '/$lang/$slug/$term/legislations/${bill.id}?list=curated&listId=${widget.listId}';

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: WebLink(
            path: internalPath,
            extra: bill,
            builder: (context, onTapCallback) => LegislationListCard(
              bill: bill,
            onTap: onTapCallback,
            trailingAction: isOwner ? IconButton(
              icon: Icon(
                isHighlighted ? Icons.star : Icons.star_border,
                color: isHighlighted ? Colors.amber : Colors.grey[400],
                size: 28,
              ),
              tooltip: AppLocalizations.of(context)!.tooltipSetAsListCover,
              onPressed: () async {
                final manager = context.read<ParliamentManager>();
                final userProv = context.read<UserProvider>();
                final messenger = ScaffoldMessenger.of(context);
                final prefix = manager.activeServiceId ?? '';
                final loc = AppLocalizations.of(context)!;

                try {
                  await _curatedService.setHighlightedBill(widget.listId, bill.id);
                  
                  await ParliamentCacheManager(prefix).clearMyCuratedLists();
                  await ParliamentCacheManager(prefix).clearCuratedListFeed(widget.listId);
                  await ParliamentCacheManager(prefix).clearCuratedListPreview(widget.listId);
                  
                  if (!mounted) return;
                  
                  userProv.triggerCuratedListsRebuild(); 
                  _loadData(forceRefresh: true); 
                  messenger.showSnackBar(SnackBar(content: Text(loc.coverUpdatedSuccess)));
                  
                } catch (e) {
                  if (!mounted) return;
                  messenger.showSnackBar(SnackBar(content: Text(loc.errorUpdatingCover)));
                }
              },
            ) : null, // <-- FUTURE - BELL : _buildTrackingBell(bill)
          ),
        ));
      },
    );

    Widget content = RefreshIndicator(
      onRefresh: _loadData,
      child: isDesktopWeb
          ? WebSmoothScroll(
              controller: _scrollController,
              scrollAnimationLength: 450,
              scrollSpeed: 0.7,
              curve: Curves.easeOut,
              child: listView,
            )
          : listView,
    );

    return content;
  }
}
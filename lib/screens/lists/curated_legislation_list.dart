import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/parliament_manager.dart';
import '../../services/curated_list_service.dart';
import '../../services/share_service.dart';
import '../../models/legislation.dart';
import '../../widgets/lists_specific/legislation_list_card.dart';
import '../../providers/language_provider.dart';
import '../../providers/user_provider.dart';
import '../../services/app_router.dart';
import '../../services/cache/parliament_cache_manager.dart';
import '../../widgets/osint_loader.dart';
import '../../widgets/error_report_dialog.dart';

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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("List refreshed!"))); // TODO: L10N
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

      final data = await _curatedService.getFeed(widget.listId, lang, prefix, forceRefresh: forceRefresh);
      
      if (data == null) throw Exception("No data returned");

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
          _errorMessage = "Failed to load list data."; // TODO: L10N - errorFetchData
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
        const SnackBar(content: Text("You must be logged in to subscribe.")), // TODO: L10N
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(newState ? "Subscribed to list!" : "Unsubscribed from list.")), // TODO: L10N
        );
      }
    } catch (e) {
      if (e.toString().contains('not-found') || e.toString().contains('NOT_FOUND')) {
        if (mounted) {
          context.read<UserProvider>().updateListSubscriptionLocally(widget.listId, false);
          setState(() => _isSubscribed = false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("List no longer exists. Removed from your subscriptions.")), // TODO: L10N
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to update subscription.")), // TODO: L10N
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
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Notification sent to subscribers!"))); // TODO: L10N
         setState(() {
           if (_metadata != null) {
             _metadata!['lastNotifiedAt'] = DateTime.now().toIso8601String();
           }
         });
      }
    } catch (e) {
      if (mounted) {
        final errorMsg = e.toString().contains('RESOURCE_EXHAUSTED') 
            ? "Cooldown active. You can send 1 notification per 24h." // TODO: L10N
            : "Failed to send notification."; // TODO: L10N
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMsg)));
      }
    } finally {
      if (mounted) setState(() => _isNotifyingSubscribers = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildGamificationHeader() {
    if (_metadata == null) return const SizedBox.shrink();
    
    final listName = _metadata!['listName'] ?? 'Unnamed List'; // TODO: L10N
    final subs = _metadata!['subscriberCount'] ?? 0;

    final currentUid = FirebaseAuth.instance.currentUser?.uid;
    final isOwner = currentUid != null && _metadata!['ownerUid'] == currentUid;

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
                // 1. TYTUŁ I EDYCJA
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(listName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                    if (isOwner)
                      IconButton(
                        icon: const Icon(Icons.edit, size: 20, color: Colors.blueGrey),
                        tooltip: "Rename List", // TODO: L10N
                        onPressed: _showRenameListModal,
                      ),
                  ],
                ),
                
                // 2. SUBSKRYBENCI
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.people_outline, size: 18),
                    const SizedBox(width: 4),
                    Text("$subs subscribers", style: const TextStyle(fontSize: 16)), // TODO: L10N
                  ],
                ),
                const SizedBox(height: 16),
                
                // 3. GŁÓWNE PRZYCISKI AKCJI 
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12.0,
                  runSpacing: 12.0,
                  children: [
                    ElevatedButton.icon(
                       onPressed: _shareList,
                       icon: const Icon(Icons.ios_share),
                       label: const Text("Share List"), // TODO: L10N
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Theme.of(context).primaryColor, 
                         foregroundColor: Colors.white,
                       ),
                    ),
                    
                    if (isOwner)
                      ElevatedButton.icon(
                         onPressed: (_isNotifyingSubscribers || isOnCooldown) ? null : _notifySubscribers,
                         icon: _isNotifyingSubscribers 
                           ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                           : Icon(isOnCooldown ? Icons.timer : Icons.campaign),
                         label: Text(isOnCooldown ? "Available in ${hoursLeft}h" : "Notify Subscribers"), // TODO: L10N
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
                         label: Text(_isSubscribed ? "Subscribed" : "Subscribe"), // TODO: L10N
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
          
          /* TARCZA: App Store UGC Compliance - Report & Delete actions */
          Positioned(
            top: 4,
            right: 4,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Widoczne dla każdego (Apple wymaga zgłaszania UGC)
                IconButton(
                  icon: Icon(Icons.flag_outlined, color: Colors.grey.withAlpha(150), size: 20),
                  tooltip: "Report List", // TODO: L10N
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
                // Widoczne tylko dla właściciela
                if (isOwner)
                  IconButton(
                    icon: Icon(Icons.delete_outline, color: Colors.red.withAlpha(150), size: 20),
                    tooltip: "Delete List", // TODO: L10N
                    onPressed: _confirmDeleteList,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // TARCZA: Logika zarządzania listą sklonowana z Twojego modalu
  void _showRenameListModal() {
    final currentName = _metadata?['listName'] ?? '';
    final TextEditingController nameController = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Rename Public List"), // TODO: L10N
          content: TextField(
            controller: nameController,
            maxLength: 40, 
            textCapitalization: TextCapitalization.words,
            autofocus: true,
            decoration: const InputDecoration(hintText: "New name", border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(AppLocalizations.of(context)!.actionCancel)),
            ElevatedButton(
              onPressed: () async {
                final text = nameController.text.trim();
                if (text.isEmpty || text == currentName) { Navigator.of(ctx).pop(); return; }
                
                final messenger = ScaffoldMessenger.of(context);
                final userProv = context.read<UserProvider>();
                final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
                Navigator.of(ctx).pop(); 
                
                try {
                  await _curatedService.renameList(widget.listId, text);
                  await ParliamentCacheManager(prefix).clearMyCuratedLists();
                  await ParliamentCacheManager(prefix).clearCuratedListFeed(widget.listId);
                  
                  if (!mounted) return;
                  setState(() => _metadata!['listName'] = text); // Optimistic UI
                  userProv.triggerCuratedListsRebuild(); 
                  messenger.showSnackBar(const SnackBar(content: Text("List renamed!"))); // TODO: L10N
                } catch (e) {
                  if (mounted) messenger.showSnackBar(const SnackBar(content: Text("Failed to rename list."))); // TODO: L10N
                }
              },
              child: const Text("Save"), // TODO: L10N
            )
          ],
        );
      }
    );
  }

  void _confirmDeleteList() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Delete List?"), // TODO: L10N
        content: const Text("This action cannot be undone. Are you sure?"), // TODO: L10N
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(AppLocalizations.of(context)!.actionCancel)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final userProv = context.read<UserProvider>();
              final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
              final routerCtx = context; // Kopia contextu do nawigacji
              Navigator.of(ctx).pop();
              
              try {
                await _curatedService.deleteList(widget.listId);
                await ParliamentCacheManager(prefix).clearMyCuratedLists();
                await ParliamentCacheManager(prefix).clearCuratedListFeed(widget.listId);
                
                if (!mounted) return;
                userProv.triggerCuratedListsRebuild();
                messenger.showSnackBar(const SnackBar(content: Text("List deleted."))); // TODO: L10N
                // TARCZA: Usunęliśmy listę, więc musimy wyrzucić usera z tego ekranu
                routerCtx.smartNavigate('/'); 
              } catch (e) {
                if (mounted) messenger.showSnackBar(const SnackBar(content: Text("Failed to delete."))); // TODO: L10N
              }
            },
            child: const Text("Delete"), // TODO: L10N
          ),
        ],
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
    
    if (_isLoading) return const Center(child: OsintLoader(text: "SYNCING CURATED FEED...")); //TODO
    
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(_errorMessage!, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _loadData, child: const Text("Try Again")), // TODO: L10N
          ],
        ),
      );
    }

    final bool isDesktopWeb = kIsWeb && MediaQuery.of(context).size.width > 750;

    Widget listView = ListView.builder(
      controller: _scrollController,
      physics: isDesktopWeb ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      itemCount: _bills.length,
      itemBuilder: (context, index) {
        final bill = _bills[index];
// TARCZA: Sprawdzamy, czy aktualny użytkownik jest właścicielem TEJ listy
        final currentUid = FirebaseAuth.instance.currentUser?.uid;
        final isOwner = _metadata != null && currentUid != null && _metadata!['ownerUid'] == currentUid;
        
        // TARCZA: Sprawdzamy, czy ten konkretny rachunek ma "Koronę"
        final isHighlighted = _metadata != null && _metadata!['highlightedBillId'] == bill.id;

        return LegislationListCard(
          bill: bill,
          onTap: () {
            final manager = context.read<ParliamentManager>();
            final slug = manager.activeSlug;
            final lang = context.read<LanguageProvider>().appLanguageCode;
            final term = bill.documentType == 'civic' ? 'civic' : manager.currentTerm.toString();
            
            context.smartNavigate('/$lang/$slug/$term/legislations/${bill.id}?list=curated&listId=${widget.listId}', extra: bill);
          },
          // TARCZA: Wstrzykujemy Widget tylko dla twórcy. Zwykły user dostanie tu kiedyś Dzwoneczek.
          trailingAction: isOwner ? IconButton(
            icon: Icon(
              isHighlighted ? Icons.star : Icons.star_border,
              color: isHighlighted ? Colors.amber : Colors.grey[400],
              size: 28,
            ),
            tooltip: "Set as list cover", // TODO: L10N
              onPressed: () async {
              // TARCZA: Pobranie referencji PRZED asynchronicznymi zadaniami
              final manager = context.read<ParliamentManager>();
              final userProv = context.read<UserProvider>();
              final messenger = ScaffoldMessenger.of(context);
              final prefix = manager.activeServiceId ?? '';

              try {
                // Uderzenie do Node.js
                await _curatedService.setHighlightedBill(widget.listId, bill.id);
                
                // Czysty Cache
                await ParliamentCacheManager(prefix).clearMyCuratedLists();
                await ParliamentCacheManager(prefix).clearCuratedListFeed(widget.listId);
                await ParliamentCacheManager(prefix).clearCuratedListPreview(widget.listId);
                
                if (!mounted) return;
                
                // TARCZA: Użycie bezpiecznych referencji
                userProv.triggerCuratedListsRebuild(); 
                _loadData(forceRefresh: true); 
                messenger.showSnackBar(const SnackBar(content: Text("Cover updated!"))); // TODO: L10N
                
              } catch (e) {
                if (!mounted) return;
                messenger.showSnackBar(const SnackBar(content: Text("Error updating cover."))); // TODO: L10N
              }
            },
          ) : null, // <-- Tutaj w przyszłości damy : _buildTrackingBell(bill)
        );
      },
    );

    Widget content = Column(
      children: [
        _buildGamificationHeader(),
        Expanded(child: RefreshIndicator(
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
        )),
      ],
    );

    return content;
  }
}
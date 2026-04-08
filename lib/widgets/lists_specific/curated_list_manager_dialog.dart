import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lustra/l10n/app_localizations.dart';

import '../../services/curated_list_service.dart';
import '../../services/share_service.dart';
import '../../services/parliament_manager.dart';
import '../../services/cache/parliament_cache_manager.dart';
import '../../providers/language_provider.dart';
import '../../providers/user_provider.dart';
import '../../models/legislation.dart';

class CuratedListManagerDialog extends StatefulWidget {
  final Legislation bill;
  final String listType;

  const CuratedListManagerDialog({
    super.key,
    required this.bill,
    required this.listType,
  });

  @override
  State<CuratedListManagerDialog> createState() => _CuratedListManagerDialogState();
}

class _CuratedListManagerDialogState extends State<CuratedListManagerDialog> {
  final CuratedListService _curatedService = CuratedListService();
  Future<List<Map<String, dynamic>>>? _listsFuture;

  AppLocalizations get l10n => AppLocalizations.of(context)!;

  @override
  void initState() {
    super.initState();
    _refreshLists();
  }

  void _refreshLists() {
    final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
    setState(() {
      _listsFuture = _curatedService.getMyLists(prefix);
    });
  }

  void _showCreateListModal() {
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
                Text(l10n.titleNameYourList, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  maxLength: 40,
                  textCapitalization: TextCapitalization.words,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: l10n.hintEgMySocialPolicies,
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
                        final prefix = manager.activeServiceId ?? 'us';
                        
                        Navigator.of(ctx).pop(); 
                        
                        try {
                          await _curatedService.createList(text, prefix);
                          await ParliamentCacheManager(prefix).clearMyCuratedLists(); 
                          
                          if (!mounted) return;
                          messenger.showSnackBar(SnackBar(content: Text(l10n.snackbarListCreated(text))));
                          _refreshLists(); 
                        } catch (e) {
                          if (!mounted) return;
                          messenger.showSnackBar(SnackBar(content: Text(l10n.snackbarFailedToCreateList)));
                        }
                      },
                      child: Text(l10n.buttonCreate),
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

  void _showRenameListModal(String listId, String currentName) {
    final TextEditingController nameController = TextEditingController(text: currentName);
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
                Text(l10n.titleRenameYourList, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  maxLength: 40, 
                  textCapitalization: TextCapitalization.words,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: l10n.hintEgMySocialPolicies,
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
                        if (text.isEmpty || text == currentName) {
                          Navigator.of(ctx).pop();
                          return;
                        }
                        
                        final messenger = ScaffoldMessenger.of(context);
                        final userProv = context.read<UserProvider>();
                        final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
                        
                        Navigator.of(ctx).pop(); 
                        
                        try {
                          await _curatedService.updateListMeta(listId, text, null, null, null);
                          
                          await ParliamentCacheManager(prefix).clearMyCuratedLists();
                          await ParliamentCacheManager(prefix).clearCuratedListFeed(listId);
                          await ParliamentCacheManager(prefix).clearCuratedListPreview(listId);
                          
                          if (!mounted) return;
                          userProv.triggerCuratedListsRebuild(); 
                          messenger.showSnackBar(SnackBar(content: Text(l10n.snackbarListRenamed)));
                          _refreshLists(); 
                        } catch (e) {
                          if (!mounted) return;
                          messenger.showSnackBar(SnackBar(content: Text(l10n.snackbarFailedToRenameList)));
                        }
                      },
                      child: Text(l10n.buttonSave),
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
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.titleYourLists, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Flexible(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _listsFuture,
                builder: (context, snapshot) {
                  if (_listsFuture == null || snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(height: 120, child: Center(child: CircularProgressIndicator(strokeWidth: 2)));
                  }
                  
                  final lists = (snapshot.data ?? []).where((l) => l['isOwner'] == true).toList();
                  
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (lists.isEmpty) 
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(l10n.emptyNoListsYet, style: TextStyle(color: Colors.grey)),
                          ),
                        
                        ...lists.map((list) {
                          final bool isInBills = (list['bills'] as List?)?.contains(widget.bill.id) ?? false;
                          final bool isInCivic = (list['civic'] as List?)?.contains(widget.bill.id) ?? false;
                          final bool isAlreadyInList = isInBills || isInCivic;
                          
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.grey[200]!),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isAlreadyInList,
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (bool? val) async {
                                    if (val == null) return;
                                    
                                    final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
                                    final arrayKey = (widget.bill.documentType == 'civic' || widget.listType == 'civic') ? 'civic' : 'bills';
                                    final messenger = ScaffoldMessenger.of(context);

                                    setState(() {
                                      if (val) {
                                        (list[arrayKey] as List?)?.add(widget.bill.id);
                                      } else {
                                        (list[arrayKey] as List?)?.remove(widget.bill.id);
                                      }
                                    });

                                    try {
                                      final docType = (widget.bill.documentType == 'civic' || widget.listType == 'civic') ? 'civic' : 'bill';
                                      await _curatedService.toggleBillInList(list['id'], widget.bill.id, prefix, docType: docType);
                                      
                                      await ParliamentCacheManager(prefix).clearMyCuratedLists();
                                      await ParliamentCacheManager(prefix).clearCuratedListFeed(list['id']);
                                      await ParliamentCacheManager(prefix).clearCuratedListPreview(list['id']);
                                    } catch (e) {
                                      if (!mounted) return;
                                      setState(() {
                                        if (val) {
                                          (list[arrayKey] as List?)?.remove(widget.bill.id);
                                        } else {
                                          (list[arrayKey] as List?)?.add(widget.bill.id);
                                        }
                                      });
                                      messenger.showSnackBar(SnackBar(content: Text(l10n.snackbarErrorUpdatingList)));
                                    }
                                  },
                                ),
                                Expanded(
                                  child: Text(list['listName'], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit_outlined, size: 20, color: Colors.blueGrey),
                                  tooltip: l10n.tooltipRename,
                                  onPressed: () => _showRenameListModal(list['id'], list['listName']),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.share_outlined, size: 20, color: Colors.blueGrey),
                                  tooltip: l10n.tooltipShareList,
                                  onPressed: () {
                                    final manager = context.read<ParliamentManager>();
                                    ShareService().shareCuratedList(
                                      context: context, listId: list['id'], listName: list['listName'],
                                      lang: context.read<LanguageProvider>().appLanguageCode, slug: manager.activeSlug, term: manager.currentTerm ?? 0,
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, size: 20, color: Colors.redAccent),
                                  tooltip: l10n.tooltipDeleteList,
                                  onPressed: () async {
                                    final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
                                    final userProv = context.read<UserProvider>();
                                    final messenger = ScaffoldMessenger.of(context);

                                    try {
                                      await _curatedService.deleteList(list['id']);
                                      await ParliamentCacheManager(prefix).clearMyCuratedLists();
                                      await ParliamentCacheManager(prefix).clearCuratedListFeed(list['id']);
                                      await ParliamentCacheManager(prefix).clearCuratedListPreview(list['id']);
                                      
                                      if (!mounted) return;
                                      userProv.triggerCuratedListsRebuild();
                                      _refreshLists();
                                    } catch (e) {
                                      if (!mounted) return;
                                      messenger.showSnackBar(SnackBar(content: Text(l10n.snackbarFailedToDelete)));
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                        
                        const SizedBox(height: 16),
                        if (lists.length < 3)
                          InkWell(
                            onTap: _showCreateListModal,
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Theme.of(context).primaryColor.withValues(alpha: 0.3)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_circle_outline, color: Theme.of(context).primaryColor),
                                  const SizedBox(width: 8),
                                  Text(l10n.buttonCreateNewList, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          )
                        else 
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(l10n.errorLimitOf3ListsReached, style: const TextStyle(color: Colors.red, fontSize: 13, fontWeight: FontWeight.bold)),
                            ),
                          )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
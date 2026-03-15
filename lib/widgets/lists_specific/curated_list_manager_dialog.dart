import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../services/curated_list_service.dart';
import '../../services/share_service.dart';
import '../../services/parliament_manager.dart';
import '../../services/cache/parliament_cache_manager.dart';
import '../../providers/language_provider.dart';
import '../../providers/user_provider.dart';
import '../../models/legislation.dart';
import '../../widgets/osint_loader.dart';

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
        return AlertDialog(
          title: const Text("Name your Private List"), // TODO: L10N
          content: TextField(
            controller: nameController,
            maxLength: 40,
            textCapitalization: TextCapitalization.words,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "e.g. Tax The Billionaires",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(AppLocalizations.of(context)!.actionCancel),
            ),
            ElevatedButton(
              onPressed: () async {
                final text = nameController.text.trim();
                if (text.isEmpty) return;
                
                // TARCZA: Pobieramy zmienne bezpiecznie przed zamknięciem contextu i asynchem
                final messenger = ScaffoldMessenger.of(context);
                final manager = context.read<ParliamentManager>();
                final prefix = manager.activeServiceId ?? 'us';
                
                Navigator.of(ctx).pop(); 
                
                try {
                  await _curatedService.createList(text, prefix);
                  await ParliamentCacheManager(prefix).clearMyCuratedLists(); 
                  
                  if (!mounted) return;
                  messenger.showSnackBar(SnackBar(content: Text("List '$text' created!"))); // TODO: L10N
                  _refreshLists(); 
                } catch (e) {
                  if (!mounted) return;
                  messenger.showSnackBar(const SnackBar(content: Text("Failed to create list."))); // TODO: L10N
                }
              },
              child: const Text("Create"), // TODO: L10N
            )
          ],
        );
      }
    );
  }

  void _showRenameListModal(String listId, String currentName) {
    final TextEditingController nameController = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Rename Private List"), // TODO: L10N
          content: TextField(
            controller: nameController,
            maxLength: 40, 
            textCapitalization: TextCapitalization.words,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "e.g. Tax The Billionaires",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(AppLocalizations.of(context)!.actionCancel),
            ),
            ElevatedButton(
              onPressed: () async {
                final text = nameController.text.trim();
                if (text.isEmpty || text == currentName) {
                  Navigator.of(ctx).pop();
                  return;
                }
                
                // TARCZA: Bezpieczne pobranie zmiennych z contextu
                final messenger = ScaffoldMessenger.of(context);
                final userProv = context.read<UserProvider>();
                final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
                
                Navigator.of(ctx).pop(); 
                
                try {
                  await _curatedService.renameList(listId, text);
                  
                  await ParliamentCacheManager(prefix).clearMyCuratedLists();
                  await ParliamentCacheManager(prefix).clearCuratedListFeed(listId);
                  await ParliamentCacheManager(prefix).clearCuratedListPreview(listId); // TARCZA: Czyste użycie metody
                  
                  if (!mounted) return;
                  userProv.triggerCuratedListsRebuild(); 
                  messenger.showSnackBar(const SnackBar(content: Text("List renamed!"))); // TODO: L10N
                  _refreshLists(); 
                } catch (e) {
                  if (!mounted) return;
                  messenger.showSnackBar(const SnackBar(content: Text("Failed to rename list."))); // TODO: L10N
                }
              },
              child: const Text("Save"), // TODO: L10N
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Your Public Lists"), // TODO: L10N
      content: SizedBox(
        width: double.maxFinite,
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _listsFuture,
          builder: (context, snapshot) {
            if (_listsFuture == null || snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(height: 120, child: Center(child: OsintLoader(text: "LOADING LISTS..."))); //TODO
            }
            
            final lists = snapshot.data ?? [];
            
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (lists.isEmpty) 
                  const Text("You don't have any private lists yet."), // TODO: L10N
                
                ...lists.map((list) {
                  final bool isInBills = (list['bills'] as List?)?.contains(widget.bill.id) ?? false;
                  final bool isInCivic = (list['civic'] as List?)?.contains(widget.bill.id) ?? false;
                  final bool isAlreadyInList = isInBills || isInCivic;
                  
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                              await _curatedService.toggleBillInList(list['id'], widget.bill.id, docType: docType);
                              
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
                              messenger.showSnackBar(const SnackBar(content: Text("Error updating list.")));
                            }
                          },
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(list['listName'], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit, size: 18, color: Colors.blueGrey),
                                onPressed: () => _showRenameListModal(list['id'], list['listName']),
                              ),
                              IconButton(
                                icon: const Icon(Icons.share, size: 18, color: Colors.blueGrey),
                                tooltip: "Share List", // TODO: L10N
                                onPressed: () {
                                  final manager = context.read<ParliamentManager>();
                                  ShareService().shareCuratedList(
                                    context: context, listId: list['id'], listName: list['listName'],
                                    lang: context.read<LanguageProvider>().appLanguageCode, slug: manager.activeSlug, term: manager.currentTerm ?? 0,
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, size: 18, color: Colors.redAccent),
                                tooltip: "Delete List", // TODO: L10N
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
                                    messenger.showSnackBar(const SnackBar(content: Text("Failed to delete.")));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                
                const Divider(),
                if (lists.length < 3)
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("Create New List"), // TODO: L10N
                    onTap: _showCreateListModal,
                  )
                else 
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Limit of 3 lists reached.", style: TextStyle(color: Colors.red, fontSize: 12)), // TODO: L10N
                  )
              ],
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context)!.actionCancel),
        ),
      ],
    );
  }
}
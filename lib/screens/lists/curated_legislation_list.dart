import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/parliament_manager.dart';
import '../../services/curated_list_service.dart';
import '../../models/legislation.dart';
import '../../widgets/lists_specific/legislation_list_card.dart';
import '../../providers/language_provider.dart';
import '../../providers/user_provider.dart';
import '../../services/app_router.dart';
import '../../services/cache/parliament_cache_manager.dart';
import '../../widgets/osint_loader.dart';

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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildGamificationHeader() {
    if (_metadata == null) return const SizedBox.shrink();
    
    final listName = _metadata!['listName'] ?? 'Unnamed List'; // TODO: L10N
    final subs = _metadata!['subscriberCount'] ?? 0;

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Theme.of(context).primaryColor.withAlpha(20),
      child: Column(
        children: [
          Text(listName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.people_outline, size: 18),
              const SizedBox(width: 4),
              Text("$subs subscribers", style: const TextStyle(fontSize: 16)), // TODO: L10N
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
             onPressed: _isSubscribing ? null : _toggleSubscription,
             icon: _isSubscribing 
               ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
               : Icon(_isSubscribed ? Icons.check : Icons.notifications_active),
             label: Text(_isSubscribed ? "Subscribed" : "Subscribe to List"), // TODO: L10N
             style: ElevatedButton.styleFrom(
               backgroundColor: _isSubscribed ? Colors.green : Theme.of(context).primaryColor,
               foregroundColor: Colors.white,
             ),
          )
        ],
      ),
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
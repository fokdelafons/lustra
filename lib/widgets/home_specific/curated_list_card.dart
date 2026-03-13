import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/legislation.dart';
import '../../services/parliament_manager.dart';
import '../../providers/language_provider.dart';
import '../../providers/user_provider.dart';
import '../../services/curated_list_service.dart';
import '../../widgets/osint_loader.dart';
import 'home_section_card.dart';
import '../partially_expandable_list_widget.dart';
import '../citizen_poll_widget.dart';


class CuratedListCard extends StatefulWidget {
  final String listId;

  const CuratedListCard({super.key, required this.listId});

  @override
  State<CuratedListCard> createState() => _CuratedListCardState();
}

class _CuratedListCardState extends State<CuratedListCard> {

  final CuratedListService _service = CuratedListService();
  bool _isLoading = true;
  
  Legislation? _highlightedItem;
  String _listName = "Public List";
  int _subscriberCount = 0;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final lang = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
      final manager = Provider.of<ParliamentManager>(context, listen: false);
      final prefix = manager.activeServiceId ?? '';
      
      final data = await _service.getFeed(widget.listId, lang, prefix, previewOnly: true);
      
      if (data != null && mounted) {
        if (data['status'] == 'deleted') {
           context.read<UserProvider>().updateListSubscriptionLocally(widget.listId, false);
           setState(() {
             _isLoading = false;
             _highlightedItem = null;
           });
           return;
        }

        final metadata = data['metadata'] as Map<String, dynamic>?;
        if (metadata != null) {
          final listPrefix = metadata['prefix'] as String?;
          if (listPrefix != null && listPrefix != prefix) {
            setState(() {
              _highlightedItem = null;
              _isLoading = false;
            });
            return;
          }
          _listName = metadata['listName'] ?? "Public List";
          _subscriberCount = metadata['subscriberCount'] ?? 0;
        }
        final rawLegislations = data['legislations'] as List? ?? [];
        final rawCivic = data['civic'] as List? ?? [];
        
        List<Legislation> combined = [];
        
        for (var json in [...rawLegislations, ...rawCivic]) {
          try {
            combined.add(Legislation.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            developer.log('Błąd parsowania w CuratedListCard: $e');
          }
        }

        if (combined.isNotEmpty) {
          final String? highlightedBillId = metadata?['highlightedBillId'];
          
          // TARCZA: Szukamy ustawy z Koroną
          if (highlightedBillId != null) {
            try {
              _highlightedItem = combined.firstWhere((bill) => bill.id == highlightedBillId);
            } catch (_) {
              // Błąd cichy: Ustawa usunięta z listy, ale ID zostało w bazie. (Fallback)
              _highlightedItem = null;
            }
          }

          // TARCZA: Fallback (Brak Korony lub usunięta) - dajemy najnowszą
          if (_highlightedItem == null) {
            combined.sort((a, b) {
              final dateA = a.lastUpdated ?? a.votingDate ?? DateTime.fromMillisecondsSinceEpoch(0);
              final dateB = b.lastUpdated ?? b.votingDate ?? DateTime.fromMillisecondsSinceEpoch(0);
              return dateB.compareTo(dateA);
            });
            _highlightedItem = combined.first;
          }
        }

        setState(() => _isLoading = false);
      }
    } catch (e) {
      developer.log('Błąd ładowania CuratedListCard: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    if (_isLoading) {
      return const Center(child: Padding(padding: EdgeInsets.all(16.0), child: OsintLoader(text: "LOADING CURATED FEED..."))); //TODO
    }
    
    if (_highlightedItem == null) {
      return const SizedBox.shrink(); 
    }

    final l10n = AppLocalizations.of(context)!;
    final manager = context.read<ParliamentManager>();
    final slug = manager.activeSlug;
    final lang = context.read<LanguageProvider>().appLanguageCode;
    final term = manager.currentTerm;

return HomeSectionCard(
      title: "$_listName 🔥 $_subscriberCount",
      icon: Icons.campaign,
      destinationPath: '/$lang/$slug/$term/legislations?list=curated&listId=${widget.listId}',
      buttonText: "Open Full List", // TODO: L10N
      legislationItem: _highlightedItem,
      isHighlighted: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              _highlightedItem!.title.isNotEmpty ? _highlightedItem!.title : "No title",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 8),
            Text(
              _highlightedItem!.description.isNotEmpty 
                  ? _highlightedItem!.description 
                  : "No summary available.",
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            const SizedBox(height: 12),
            if (_highlightedItem!.keyPoints.isNotEmpty) ...[
              Text(l10n.keyPoints, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ..._highlightedItem!.keyPoints.map((kp) => bulletPoint(context, kp)),
            ],
            const SizedBox(height: 20),
            CitizenPollWidget(
              targetType: _highlightedItem!.documentType == 'civic' ? 'civic' : 'legislation',
              targetId: _highlightedItem!.id,
              itemData: _highlightedItem!,
            ),
          ],
        ),
      ),
    );
  }
}
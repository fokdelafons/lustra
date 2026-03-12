import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/tracking_service.dart';
import '../../services/parliament_manager.dart';
import '../../providers/language_provider.dart';
import '../../models/legislation.dart';
import '../../services/app_router.dart';
import 'home_section_card.dart';

class TrackedCard extends StatefulWidget {
  const TrackedCard({super.key});

  @override
  State<TrackedCard> createState() => _TrackedCardState();
}

class _TrackedCardState extends State<TrackedCard> {
  final TrackingService _trackingService = TrackingService();
  bool _isLoading = true;
  List<Legislation> _trackedBills = [];

  @override
  void initState() {
    super.initState();
    _fetchTracked();
  }

  Future<void> _fetchTracked() async {
    if (FirebaseAuth.instance.currentUser == null) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    try {
      final manager = Provider.of<ParliamentManager>(context, listen: false);
      final prefix = manager.activeServiceId;
      final lang = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
      if (prefix == null) return;

      final data = await _trackingService.getTrackedItems(prefix, lang);
      
      final rawLegislations = data['legislations'] ?? [];
      final rawCivic = data['civic'] ?? [];
      
      List<Legislation> combined = [];

      for (var json in rawLegislations) {
        try { combined.add(Legislation.fromJson(json as Map<String, dynamic>)); } catch (_) {}
      }
      for (var json in rawCivic) {
        try { combined.add(Legislation.fromJson(json as Map<String, dynamic>)); } catch (_) {}
      }

      combined.sort((a, b) {
        final dateA = a.lastUpdated ?? a.processStartDate ?? DateTime.now();
        final dateB = b.lastUpdated ?? b.processStartDate ?? DateTime.now();
        return dateB.compareTo(dateA);
      });

      if (mounted) {
        setState(() {
          _trackedBills = combined.take(5).toList(); // Max 5 na ekranie głównym
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    // Zwijamy kartę, jeśli user nic nie śledzi (lub nie jest zalogowany)
    if (_trackedBills.isEmpty) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context)!;
    final manager = context.read<ParliamentManager>();
    final slug = manager.activeSlug;
    final lang = context.read<LanguageProvider>().appLanguageCode;
    final term = manager.currentTerm;

    return HomeSectionCard(
      title: "Your Tracked Bills", // TODO: Przenieś do L10N -> l10n.trackedBillsTitle
      icon: Icons.notifications_active,
      destinationPath: '/$lang/$slug/$term/legislations?list=tracked',
      buttonText: "See all tracked", // TODO: L10N
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: _trackedBills.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final bill = _trackedBills[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            title: Text(
              bill.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                bill.id,
                style: TextStyle(fontFamily: 'monospace', fontSize: 11, color: Colors.grey[600]),
              ),
            ),
            trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
            onTap: () {
              context.smartNavigate('/$lang/$slug/$term/legislations/${bill.id}', extra: bill);
            },
          );
        },
      ),
    );
  }
}
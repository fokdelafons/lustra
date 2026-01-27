import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;

import '../../models/home_screen_data.dart';
import '../../services/parliament_manager.dart';
import '../../providers/language_provider.dart';
import 'home_section_card.dart';
import '../partially_expandable_list_widget.dart';
import '../citizen_poll_widget.dart';

class UpcomingCard extends StatelessWidget {
  final HomeScreenLegislationItem item;

  const UpcomingCard({super.key, required this.item});

  String _formatDateTime(BuildContext context, DateTime? date) {
    final l10n = AppLocalizations.of(context)!;
    if (date == null) return l10n.noDate;
    return intl.DateFormat.yMMMMd(l10n.localeName).format(date);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final manager = context.read<ParliamentManager>();
    
    // Dane nawigacyjne
    final slug = manager.activeSlug;
    final lang = context.read<LanguageProvider>().appLanguageCode;
    final term = manager.currentTerm;

    // Dane modelu
    final List<String> keyPoints = item.keyPoints;
    final DateTime? firstUpcomingDate = item.upcomingProceedingDates?.isNotEmpty == true
        ? item.upcomingProceedingDates!.first
        : null;

    return HomeSectionCard(
      title: l10n.sectionUpcoming,
      icon: Icons.upcoming,
      destinationPath: '/$lang/$slug/$term/legislations?list=upcoming',
      buttonText: l10n.actionSeeAll,
      legislationItem: item,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              item.title.isNotEmpty ? item.title : l10n.errorNoDataUpcomingVote,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              (item.summary != null && item.summary!.isNotEmpty) ? item.summary! : l10n.errorNoSummaryUpcomingVote,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            const SizedBox(height: 16),
            PartiallyExpandableListWidget(
              title: keyPoints.isNotEmpty ? l10n.keyPoints : l10n.noKeyPoints,
              items: keyPoints,
              itemBuilder: (context, item) => bulletPoint(context, item as String),
            ),
            const SizedBox(height: 16),
            
            if (firstUpcomingDate != null) ...[
              Text(
                l10n.scheduledMeetingDate(_formatDateTime(context, firstUpcomingDate)),
                style: TextStyle(fontSize: 13, color: Colors.grey[600], fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 20),
            ],
            
            CitizenPollWidget(
              targetType: 'legislation',
              targetId: item.id,
              itemData: item,
            ),
          ],
        ),
      ),
    );
  }
}
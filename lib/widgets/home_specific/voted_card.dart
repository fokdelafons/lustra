import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:math';

import '../../models/home_screen_data.dart';
import '../../services/parliament_manager.dart';
import '../../services/parliament_service_interface.dart';
import '../../providers/language_provider.dart';
import 'home_section_card.dart';
import '../partially_expandable_list_widget.dart';
import '../parliamentary_vote_painter.dart';
import '../citizen_poll_widget.dart';

class VotedCard extends StatelessWidget {
  final HomeScreenLegislationItem item;

  const VotedCard({super.key, required this.item});

  String _formatDateTime(BuildContext context, DateTime? date) {
    final l10n = AppLocalizations.of(context)!;
    if (date == null) return l10n.noDate;
    return intl.DateFormat.yMMMMd(l10n.localeName).format(date);
  }

  Widget _buildVoteCountRow(String label, int count, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
        ),
        const SizedBox(width: 6),
        Text(
          count.toString(),
          style: TextStyle(fontSize: 15, color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final manager = context.read<ParliamentManager>();
    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    
    // Dane nawigacyjne
    final slug = manager.activeSlug;
    final lang = context.read<LanguageProvider>().appLanguageCode;
    final term = manager.currentTerm;

    // Dane modelu
    final int votesForSejm = item.votesFor ?? 0;
    final int votesAgainstSejm = item.votesAgainst ?? 0;
    final int votesAbstainSejm = item.votesAbstain ?? 0;
    final List<String> keyPoints = item.keyPoints;
    final int totalSejmVotes = votesForSejm + votesAgainstSejm + votesAbstainSejm;
    final DateTime? votingDateTime = item.votingDate;

    return HomeSectionCard(
      title: l10n.sectionPopularVotes,
      icon: Icons.how_to_vote,
      destinationPath: '/$lang/$slug/$term/legislations?list=voted',
      buttonText: l10n.actionSeeAll,
      legislationItem: item,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              item.title.isNotEmpty ? item.title : l10n.errorNoDataLastVote,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              (item.summary != null && item.summary!.isNotEmpty) ? item.summary! : l10n.errorNoSummaryLastVote,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            const SizedBox(height: 16),
            PartiallyExpandableListWidget(
              title: keyPoints.isNotEmpty ? l10n.keyPoints : l10n.noKeyPoints,
              items: keyPoints,
              itemBuilder: (context, item) => bulletPoint(context, item as String),
            ),
            const SizedBox(height: 16),
            
            // Sekcja wyników głosowania (Tylko w Voted)
            Center(
              child: Text(
                l10n.votingResultsTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (votingDateTime != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                child: Center(
                  child: Text(
                    _formatDateTime(context, votingDateTime),
                    style: TextStyle(fontSize: 13, color: Colors.grey[700], fontStyle: FontStyle.italic),
                  ),
                ),
              ),

            RepaintBoundary(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double chartFullWidth = max(150.0, constraints.maxWidth);
                  final double calculatedHeightBasedOnWidth = chartFullWidth / 2;
                  final double chartHeight = calculatedHeightBasedOnWidth.clamp(120.0, 220.0);
                  return SizedBox(
                    width: chartFullWidth,
                    height: chartHeight,
                    child: CustomPaint(
                      painter: ParliamentaryVotePainter(
                        labelFor: l10n.votingFor,
                        labelAgainst: l10n.votingAgainst,
                        labelAbstain: l10n.votingAbstainShort,
                        noDataLabel: l10n.errorNoVotingsDetails,
                        votesFor: votesForSejm,
                        votesAgainst: votesAgainstSejm,
                        votesAbstain: votesAbstainSejm,
                      ),
                    ),
                  );
                },
              ),
            ),
            if (totalSejmVotes > 0) ...[
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildVoteCountRow(l10n.labelFor, votesForSejm, Colors.green),
                  _buildVoteCountRow(l10n.labelAgainst, votesAgainstSejm, Colors.red),
                  _buildVoteCountRow(l10n.labelAbstained, votesAbstainSejm, Colors.grey),
                ],
              ),
            ],
            const SizedBox(height: 12.0),
            Center(
              child: Text(
                activeService.translateStatus(context, item.status),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),
            
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
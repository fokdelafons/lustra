import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:math';

import '../../models/legislation.dart';
import '../../services/parliament_manager.dart';
import '../../services/parliament_service_interface.dart';
import '../../providers/language_provider.dart';
import 'ui_home_card.dart';
import '../partially_expandable_list_widget.dart';
import '../parliamentary_vote_painter.dart';
import '../citizen_poll_widget.dart';

class VotedCard extends StatelessWidget {
  final Legislation item;

  const VotedCard({super.key, required this.item});

  String _formatDateTime(BuildContext context, DateTime? date) {
    final l10n = AppLocalizations.of(context)!;
    if (date == null) return l10n.noDate;
    return intl.DateFormat.yMMMMd(l10n.localeName).format(date);
  }

  Widget _buildVoteCountRow(String label, int count, Color color, {double fontSize = 15.0}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: fontSize, color: Colors.grey[700]),
        ),
        const SizedBox(width: 6),
        Text(
          count.toString(),
          style: TextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.bold),
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
              item.description.isNotEmpty ? item.description : l10n.errorNoSummaryLastVote,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            const SizedBox(height: 16),
            PartiallyExpandableListWidget(
              title: keyPoints.isNotEmpty ? l10n.keyPoints : l10n.noKeyPoints,
              items: keyPoints,
              itemBuilder: (context, item) => bulletPoint(context, item as String),
            ),
            const SizedBox(height: 16),
            const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 16),
            RepaintBoundary(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double scaleFactor = ((constraints.maxWidth - 320) / 330).clamp(0.0, 1.0);
                  final double fScale = 4.0 * scaleFactor; 
                  final double paddingH = 12.0 + (4.0 * scaleFactor);
                  final double paddingV = 8.0 + (4.0 * scaleFactor);
                  
                  final double chartFullWidth = max(200.0, constraints.maxWidth);
                  final double calculatedHeightBasedOnWidth = chartFullWidth / 2;
                  final double chartHeight = calculatedHeightBasedOnWidth.clamp(140.0, 240.0);
                  
                  return SizedBox(
                    width: chartFullWidth,
                    height: chartHeight + 10,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          left: 0, 
                          bottom: 10,
                          top: 0,
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
                        ),
                        if (totalSejmVotes > 0)
                          Positioned(
                            left: 0,
                            top: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5).withValues(alpha: 0.95),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: Colors.white, width: 1.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    l10n.votingResultsTitle.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 12 + fScale,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  if (votingDateTime != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2.0, bottom: 8.0),
                                      child: Text(
                                        _formatDateTime(context, votingDateTime),
                                        style: TextStyle(
                                          fontSize: 11 + fScale,
                                          color: Colors.grey[600], 
                                          fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ),
                                  const SizedBox(height: 4),
                                  _buildVoteCountRow(l10n.labelFor, votesForSejm, const Color(0xFF4CAF50), fontSize: 13 + fScale),
                                  const SizedBox(height: 4),
                                  _buildVoteCountRow(l10n.labelAgainst, votesAgainstSejm, const Color(0xFFF44336), fontSize: 13 + fScale),
                                  const SizedBox(height: 4),
                                  _buildVoteCountRow(l10n.labelAbstained, votesAbstainSejm, const Color(0xFF9E9E9E), fontSize: 13 + fScale),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                Expanded(
                  child: item.lastStatus != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      l10n.previousStatusLabel,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey[400],
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      activeService.translateStatus(context, item.lastStatus!),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w500,
                                        height: 1.2,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Icon(Icons.arrow_forward_ios, color: Colors.grey[300], size: 14),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.gavel,
                      size: 48,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.statusLabel,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          activeService.translateStatus(context, item.status),
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black87,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
              ],
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
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lustra/l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/mp.dart';
import '../models/legislation.dart';

// SPAGHETTI CODE - MIGHT CONSIDER REFACTOR

enum ShareableCardType {
  voted,
  scheduled,
  inProcess,
}

enum ShareableContentType {
  legislation,
  deputy,
}

class ShareableImage extends StatelessWidget {
  final Legislation? legislation;
  final MP? deputy;
  final String? tenureText;
  final List<ImportantVote>? recentVotings;
  final String flagAssetPath;
  final String parliamentName;
  final String? votingTitle;
  final String parliamentId;
  final bool showMissingDataWarning;
  final Size size;
  final AppLocalizations l10n;
  final String? translatedStatus;

  const ShareableImage._({
    this.legislation,
    this.deputy,
    this.tenureText,
    required this.size,
    required this.l10n,
    this.translatedStatus,
    this.recentVotings,
    required this.flagAssetPath,
    required this.parliamentName,
    required this.parliamentId,
    this.votingTitle,
    this.showMissingDataWarning = false,
  }) : assert(
          (legislation != null && deputy == null) || (legislation == null && deputy != null),
          'Must provide either legislation or deputy, but not both.',
        );

  factory ShareableImage.legislation({
    required Legislation legislation,
    required Size size,
    required AppLocalizations l10n,
    required String translatedStatus,
    required String flagAssetPath,
    required String parliamentName,
    required String votingTitle,
    required String parliamentId,
    bool showMissingDataWarning = false,
  }) {
    return ShareableImage._(  
      legislation: legislation,
      size: size,
      l10n: l10n,
      translatedStatus: translatedStatus,
      flagAssetPath: flagAssetPath,
      parliamentName: parliamentName,
      votingTitle: votingTitle,
      parliamentId: parliamentId,
      showMissingDataWarning: showMissingDataWarning,
    );
  }

  factory ShareableImage.deputy({
    required MP deputy,
    required Size size,
    required AppLocalizations l10n,
    required String tenureText,
    required List<ImportantVote> recentVotings,
    required String flagAssetPath,
    required String parliamentName,
    required String parliamentId,
  }) {
    return ShareableImage._(
      deputy: deputy,
      size: size,
      l10n: l10n,
      tenureText: tenureText,
      recentVotings: recentVotings,
      flagAssetPath: flagAssetPath,
      parliamentName: parliamentName,
      parliamentId: parliamentId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final contentType = legislation != null ? ShareableContentType.legislation : ShareableContentType.deputy;
    final double aspectRatio = size.width / size.height;
    final bool isSquare = aspectRatio > 0.9 && aspectRatio < 1.1;

    return Theme(
      data: ThemeData.light().copyWith(textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Roboto')),
      child: Material(
        color: Colors.white,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(isSquare ? 40.0 : 50.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.08 * 255).round()),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isSquare ? 40.0 : 50.0),
            child: switch (contentType) {
              ShareableContentType.legislation => _buildLegislationCard(context),
              ShareableContentType.deputy => _buildDeputyCard(context),
            },
          ),
        ),
      ),
    );
  }

// =======================================================================
  // === BUILDER FOR LEGISLATION CARD ===
  // =======================================================================
  Widget _buildLegislationCard(BuildContext context) {
    final double aspectRatio = size.width / size.height;
    final bool isSquare = aspectRatio > 0.9 && aspectRatio < 1.1;
    final double outerPadding = isSquare ? 30.0 : 40.0;
    final double innerPadding = isSquare ? 40.0 : 60.0;
  
    final double titleFontSize = isSquare ? 40 : 54;
    final double keyPointsItemSize = isSquare ? 26 : 36;
    final double pollFontSize = isSquare ? 28 : 40;

    String headerLabel = parliamentName;
    if (legislation!.id.toUpperCase().startsWith('CIVIC-')) {
      headerLabel = l10n.civicProjectTitle;
    }

    final String printNum = legislation!.id.isNotEmpty ? ' (${legislation!.id})' : '';
    headerLabel = "$headerLabel$printNum";
    final String displayTitle = legislation!.title;

    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(outerPadding, outerPadding, outerPadding, outerPadding),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.08 * 255).round()),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(innerPadding, innerPadding, innerPadding, innerPadding / 2),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.black.withAlpha(51), width: 1.5)),
                            child: SvgPicture.asset(flagAssetPath, height: isSquare ? 36 : 48),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              headerLabel,
                              style: TextStyle(fontSize: isSquare ? 28 : 36, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 16),
                          SvgPicture.asset(
                            'assets/logo_solo.svg',
                            height: isSquare ? 36 : 48,
                            colorFilter: ColorFilter.mode(
                              const Color(0xFF005A9C).withAlpha(128),
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(innerPadding, 0, innerPadding, innerPadding / 2),
                      child: Text(
                        displayTitle,
                        style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.w900, color: Colors.black, height: 1.2),
                        maxLines: isSquare ? 4 : 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                    
                    // TARCZA FIX: ClipRect całkowicie ucina wylewające się keypoints. Tekst został wykasowany.
                    Expanded(
                      child: ClipRect(
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.white, Colors.white.withAlpha(0)],
                              stops: const [0.85, 1.0], 
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(innerPadding, innerPadding / 2, innerPadding, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (showMissingDataWarning || legislation!.keyPoints.isEmpty) ...[
                                  _buildMissingDataWarning(isSquare),
                                  const SizedBox(height: 12),
                                ],
                                if (legislation!.keyPoints.isNotEmpty)
                                  _buildKeyPointsSection(
                                    legislation!.keyPoints,
                                    keyPointsItemSize,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    Container(
                      color: Colors.grey[50],
                      padding: EdgeInsets.all(innerPadding),
                      child: _buildLegislationFooter(
                        context: context,
                        status: translatedStatus ?? '',
                        isSquare: isSquare,
                        pollFontSize: pollFontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // === DEPUTY BUILDER ===
  // ===============================================================
  Widget _buildDeputyCard(BuildContext context) {
    // === CONTROL PANEL ===
    final double aspectRatio = size.width / size.height;
    final bool isSquare = aspectRatio > 0.9 && aspectRatio < 1.1;
    final double padding = isSquare ? 30.0 : 65.0;
    
    final fullName = deputy!.firstLastName;
    final clubInfo = l10n.clubLabel(deputy!.club.isNotEmpty ? deputy!.club : l10n.unaffiliatedClub);
    final districtInfo = l10n.districtLabel(deputy!.district, deputy!.districtNum);
    
    final tenureText = this.tenureText!; 

final attendancePercentage = deputy!.attendancePercentage ?? 0.0;
    
    String attendanceText;
    Color attendanceColor;
    bool addExclamation = false;
    if (attendancePercentage >= 95) {
      attendanceColor = Colors.green;
    } else if (attendancePercentage >= 90) {
      attendanceColor = Colors.yellow.shade700;
    } else if (attendancePercentage >= 85) {
      attendanceColor = Colors.orange;
    } else if (attendancePercentage >= 65) {
      attendanceColor = Colors.red;
    } else {
      attendanceColor = Colors.red;
      addExclamation = true;
    }
    attendanceText = "${attendancePercentage.toStringAsFixed(1)}%";
    if (addExclamation) {
      attendanceText += " !";
    }

    final interpellationsText = deputy!.interpellationsCount.toString();
    final mandateStatus = _getMandateStatusText(deputy!.mandateCoverage, deputy!.active);
    int termsCount = 0;
    if (deputy!.parliamentaryHistory != null && deputy!.parliamentaryHistory!['terms'] is List) {
      termsCount = (deputy!.parliamentaryHistory!['terms'] as List).length;
    }
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(padding, padding, padding, padding / 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: isSquare ? 400 : 400,
                height: isSquare ? 500 : 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                  image: deputy!.imageUrl != null
                      ? DecorationImage(image: NetworkImage(deputy!.imageUrl!), fit: BoxFit.cover)
                      : null,
                ),
                child: deputy!.imageUrl == null ? const Icon(Icons.person, size: 60, color: Colors.white) : null,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(fullName, style: TextStyle(fontSize: isSquare ? 60 : 60, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(width: 16),
                        SvgPicture.asset(
                          'assets/logo_solo.svg',
                          height: isSquare ? 48 : 60,
                          colorFilter: const ColorFilter.mode(Color(0xFF005A9C), BlendMode.srcIn),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _buildParliamentInfo(parliamentName, flagAssetPath, isSquare),
                    _buildDeputyRichTextInfo(clubInfo, deputy!.parliamentaryHistory, isSquare),
                    _buildDeputyInfoRow(districtInfo, isSquare),
                    _buildDeputyInfoRow(tenureText, isSquare),
                    _buildDeputyInfoRow("${l10n.termsCountLabel}: $termsCount", isSquare),
                    _buildDeputyInfoRow(mandateStatus, isSquare)
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(padding, 0, padding, padding),
            child: Column(
              children: [
                if (!isSquare && recentVotings!.isNotEmpty)
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          l10n.votingsTab,
                          style: TextStyle(fontSize: 55, color: Colors.grey[800]),
                        ),
                        const Divider(),
                        const SizedBox(height: 8),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            children: recentVotings!
                                .take(4)
                                .map((vote) => _buildVoteRow(vote, isSquare))
                                .toList(),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: _buildVerticalStatItem(
                          l10n.attendanceLabelShort,
                          attendanceText,
                          attendanceColor,
                          isSquare,
                        ),
                      ),
                      Expanded(
                        child: (parliamentId == 'us')
                            // USA exception?
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    l10n.billsLabel,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: isSquare ? 36 : 60, color: Colors.grey[800]),
                                  ),
                                  Text(
                                    l10n.sponsorshipSublabel,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: isSquare ? 28 : 30, color: Colors.grey[700]),
                                  ),
                                  const SizedBox(height: 8),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: isSquare ? 44 : 88,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: (deputy!.sponsoredBillsCount ?? 0).toString(),
                                          style: TextStyle(color: Colors.blue.shade800),
                                        ),
                                        TextSpan(
                                          text: ' / ',
                                          style: TextStyle(color: Colors.grey[800]),
                                        ),
                                        TextSpan(
                                          text: (deputy!.cosponsoredBillsCount ?? 0).toString(),
                                          style: TextStyle(color: Colors.blue.shade600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            // for the rest
                            : _buildVerticalStatItem(
                                l10n.interpellationsTab,
                                interpellationsText,
                                Colors.orange,
                                isSquare,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // --- POLL ---
        Padding(
          padding: EdgeInsets.fromLTRB(padding, 0, padding, padding),
          child: _buildCitizenVoteSection(
            context: context,
            baseFontSize: isSquare ? 40 : 40,
            likes: deputy!.likes ?? 0,
            dislikes: deputy!.dislikes ?? 0,
            customTitle: l10n.supportPollTitle,
            useDeputyStyle: true,
          ),
        ),
      ],
    );
  }

  Widget _buildDeputyInfoRow(String text, bool isSquare) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(text, style: TextStyle(fontSize: isSquare ? 40 : 40, color: Colors.grey[800]), maxLines: 2, overflow: TextOverflow.ellipsis),
    );
  }

Widget _buildVerticalStatItem(String label, String value, Color color, bool isSquare) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label, 
          style: TextStyle(fontSize: isSquare ? 36 : 60, color: Colors.grey[800])
        ),
        const SizedBox(height: 8),
        Text(
          value, 
          style: TextStyle(fontSize: isSquare ? 44 : 88, color: color, fontWeight: FontWeight.bold)
        ),
      ],
    );
  }

Widget _buildDeputyRichTextInfo(String mainText, Map<String, dynamic>? parliamentaryHistory, bool isSquare) {
    List<String> previousClubs = [];
    if (parliamentaryHistory != null && parliamentaryHistory['clubs'] is List) {
      List<dynamic> historyClubs = parliamentaryHistory['clubs'];
      if (historyClubs.length > 1) {
        previousClubs = historyClubs
            .sublist(1)
            .map((club) => club.toString())
            .where((clubName) => clubName.isNotEmpty && clubName != deputy!.club)
            .toList();
      }
    }
    if (previousClubs.isEmpty) {
      return _buildDeputyInfoRow(mainText, isSquare);
    }
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: isSquare ? 40 : 40, color: Colors.grey[800], fontFamily: 'Roboto'),
          children: [
            TextSpan(text: mainText),
            TextSpan(
              text: l10n.formerlyLabel(previousClubs.join(', ')),
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildVoteRow(ImportantVote vote, bool isSquare) {
    const double voteColumnWidth = 270.0;
    final String translatedVote = _translateVote(vote.vote);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              vote.title,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: voteColumnWidth,
            child: Text(
              translatedVote,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: _getVoteColor(translatedVote),
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildParliamentInfo(String parliamentName, String flagAssetPath, bool isSquare) {
  final double fontSize = isSquare ? 40 : 40; 
  return Padding(
    padding: const EdgeInsets.only(bottom: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          parliamentName,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withAlpha(51), width: 1.0),
          ),
          child: SvgPicture.asset(
            flagAssetPath,
            height: fontSize * 0.8,
          ),
        ),
      ],
    ),
  );
}

// NEW FOOTER ARCHITECTURE
  Widget _buildLegislationFooter({
    required BuildContext context,
    required String status,
    required bool isSquare,
    required double pollFontSize,
  }) {
    final statusWidget = _buildModernStatus(status, isSquare);
    final actionWidget = _buildCitizenVoteSection(
      context: context,
      baseFontSize: pollFontSize,
      likes: legislation!.likes,
      dislikes: legislation!.dislikes,
    );

    if (isSquare) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 6, child: actionWidget),
          const SizedBox(width: 32),
          Expanded(flex: 4, child: Center(child: statusWidget)),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.85,
            child: actionWidget,
          ),
          const SizedBox(height: 32),
          statusWidget,
        ],
      );
    }
  }

  Widget _buildModernStatus(String status, bool isSquare) {
    final double iconSize = isSquare ? 56 : 72;
    final double labelSize = isSquare ? 20 : 28;
    final double statusSize = isSquare ? 36 : 48;

    return ConstrainedBox(
      constraints: BoxConstraints(
        // Tarcza: Chronimy wariant Column przed wymuszeniem nieskończonej szerokości
        maxWidth: isSquare ? double.infinity : size.width * 0.85,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.gavel, size: iconSize, color: Colors.grey[400]),
          const SizedBox(width: 16),
          Flexible( // Tarcza: Teraz to zadziała, bo ConstrainedBox zapiął pasy
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.statusLabel,
                  style: TextStyle(fontSize: labelSize, color: Colors.grey[500], height: 1.0),
                ),
                const SizedBox(height: 8),
                Text(
                  status,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: statusSize,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black87,
                    height: 1.15, // Tarcza: Zwiększono dystans dla podkreślenia
                  ),
                  maxLines: 3, // Tarcza: Zwiększono margines błędu dla długich statusów
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  // NEW UI FOR GENERATED IMAGE - MERGED POLL LOGIC
  Widget _buildCitizenVoteSection({
    required BuildContext context,
    required double baseFontSize,
    required int likes,
    required int dislikes,
    String? customTitle,
    bool useDeputyStyle = false,
  }) {
    final String pollTitle = customTitle ?? l10n.citizenPollTitle;
    final primaryColor = const Color(0xFF005A9C);
    final int totalVotes = likes + dislikes;

    bool isInactive = false;
    String inactiveLine1 = '';
    String inactiveLine2 = '';

    if (deputy != null) {
      if (deputy!.mandateCoverage == 'PARTIAL') {
        isInactive = true;
        inactiveLine1 = l10n.mandateInactive;
        inactiveLine2 = l10n.votingUnavailable;
      } else if (deputy!.mandateCoverage == 'FULL' && !deputy!.active) {
        isInactive = true;
        inactiveLine1 = l10n.historicalTerm;
        inactiveLine2 = l10n.pollUnavailable;
      }
    }

    final contentColumn = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isInactive) ...[
          Text(pollTitle, textAlign: TextAlign.center, style: TextStyle(fontSize: baseFontSize, color: primaryColor, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(inactiveLine1, textAlign: TextAlign.center, style: TextStyle(fontSize: baseFontSize * 0.8, color: Colors.grey[800], fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
          const SizedBox(height: 4),
          Text(inactiveLine2, textAlign: TextAlign.center, style: TextStyle(fontSize: baseFontSize * 0.6, color: Colors.grey[600], fontStyle: FontStyle.italic)),
        ] else ...[
          Row(
            children: [
              Container(width: baseFontSize * 0.3, height: baseFontSize * 0.3, decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle)),
              const SizedBox(width: 12),
              Text(
                l10n.civicWillRecord.toUpperCase(),
                style: TextStyle(fontSize: baseFontSize * 0.5, fontWeight: FontWeight.bold, letterSpacing: 1.5, color: primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (useDeputyStyle)
            _buildStaticDeputyResultsView(likes, dislikes, totalVotes, baseFontSize)
          else
            _buildStaticModernResultsBar(likes, dislikes, totalVotes, baseFontSize),
          const SizedBox(height: 32),
          const Divider(height: 1, thickness: 2),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.how_to_vote, size: baseFontSize * 0.7, color: Colors.grey[600]),
              const SizedBox(width: 12),
              Text(
                l10n.loginToVote,
                style: TextStyle(fontSize: baseFontSize * 0.6, color: Colors.grey[600], fontWeight: FontWeight.w600, letterSpacing: 0.5),
              ),
            ],
          ),
        ]
      ],
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: primaryColor, width: 8.0)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            primaryColor.withAlpha((255 * 0.08).round()),
            primaryColor.withAlpha((255 * 0.02).round()),
          ],
        ),
      ),
      child: CustomPaint(
        painter: TargetingBracketsPainter(
          color: primaryColor.withAlpha(80),
          strokeWidth: 4.0,
          length: baseFontSize,
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: contentColumn,
        ),
      ),
    );
  }

  Widget _buildStaticModernResultsBar(int forVotes, int againstVotes, int totalVotes, double baseFontSize) {
    if (totalVotes == 0) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        alignment: Alignment.center,
        child: Text(
          l10n.pollNoVotesCast,
          style: TextStyle(color: Colors.grey[500], fontStyle: FontStyle.italic, letterSpacing: 0.5, fontSize: baseFontSize * 0.7)
        ),
      );
    }

    final double forPercent = (forVotes / totalVotes * 100);
    final double againstPercent = (againstVotes / totalVotes * 100);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.pollSupportPercent(forPercent.round().toString()), style: TextStyle(color: Colors.green[700], fontSize: baseFontSize * 0.5, fontWeight: FontWeight.w800, letterSpacing: 1)),
            Text(l10n.pollOpposePercent(againstPercent.round().toString()), style: TextStyle(color: Colors.red[700], fontSize: baseFontSize * 0.5, fontWeight: FontWeight.w800, letterSpacing: 1)),
          ],
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: baseFontSize * 0.4,
            child: Row(
              children: [
                if (forVotes > 0) Expanded(flex: forVotes, child: Container(color: Colors.green[600])),
                if (againstVotes > 0) Expanded(flex: againstVotes, child: Container(color: Colors.red[600])),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.totalVotesRecorded(totalVotes.toString()),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: baseFontSize * 0.5, color: Colors.grey[500], fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ],
    );
  }

  Widget _buildStaticDeputyResultsView(int upVotes, int downVotes, int totalVotes, double baseFontSize) {
    final double supportPercentage = totalVotes > 0 ? upVotes / totalVotes : 0.0;
    final String supportPercentageFormatted = intl.NumberFormat.percentPattern(l10n.localeName).format(supportPercentage);

    Color percentageTextColor;
    String supportDescription;

    if (totalVotes == 0) {
      percentageTextColor = Colors.grey;
      supportDescription = l10n.pollResultNoVotes;
    } else if (supportPercentage >= 0.75) {
      percentageTextColor = Colors.green;
      supportDescription = l10n.pollResultOverwhelmingMajority;
    } else if (supportPercentage >= 0.50) {
      percentageTextColor = Colors.green;
      supportDescription = l10n.pollResultMajority;
    } else if (supportPercentage >= 0.25) {
      percentageTextColor = Colors.orange;
      supportDescription = l10n.pollResultMinority;
    } else {
      percentageTextColor = Colors.red;
      supportDescription = l10n.pollResultOverwhelmingMinority;
    }

    final String combinedSupportText = totalVotes > 0
        ? l10n.pollResultFormatted(supportPercentageFormatted, supportDescription)
        : supportDescription;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          combinedSupportText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: baseFontSize * 0.8,
            fontWeight: FontWeight.bold,
            color: percentageTextColor,
          ),
        ),
        const SizedBox(height: 24),
        ClipRRect(
          borderRadius: BorderRadius.circular(baseFontSize * 0.2),
          child: SizedBox(
            height: baseFontSize * 0.4,
            child: Row(
              children: [
                if (totalVotes > 0) ...[
                  Expanded(flex: upVotes, child: Container(color: Colors.green.shade500)),
                  Expanded(flex: downVotes, child: Container(color: Colors.red.shade500)),
                ] else
                  Expanded(flex: 1, child: Container(color: Colors.grey[300])),
              ],
            ),
          ),
        ),
      ],
    );
  }

Widget _buildKeyPointsSection(
  List<String> keyPoints,
  double itemSize,
) {
  if (keyPoints.isEmpty) {
    return const SizedBox.shrink();
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: keyPoints.map((point) => _bulletPoint(point, itemSize)).toList(),
  );
}

  Widget _bulletPoint(String text, double itemSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, left: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: itemSize * 0.4, right: 12.0), 
            width: 7.0,
            height: 7.0,
            decoration: BoxDecoration(color: Colors.grey[600], shape: BoxShape.circle),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey[800], height: 1.4, fontSize: itemSize),
            ),
          ),
        ],
      ),
    );
  }


  String _getMandateStatusText(String mandateCoverage, bool isActive) {
    switch (mandateCoverage) {
      case 'FULL':
        return isActive ? l10n.mandateStatusActive : l10n.mandateStatusFulfilled;
      case 'PARTIAL':
        return l10n.mandateStatusCancelled;
      case 'UNKNOWN':
      default:
        return isActive ? l10n.mandateStatusActive : l10n.mandateStatusInactive;
    }
  }

  String _translateVote(String rawVote) {
    switch (parliamentId) {
      case 'pl':
        switch (rawVote.trim().toLowerCase()) {
          case 'za': return l10n.voteTypeFor;
          case 'przeciw': return l10n.voteTypeAgainst;
          case 'wstrzymał się': return l10n.voteTypeAbstain;
          case 'nieobecny': return l10n.voteTypeAbsent;
          default: return rawVote;
        }
      case 'us':
        switch (rawVote.trim().toLowerCase()) {
          case 'yea': return l10n.voteTypeFor;
          case 'aye': return l10n.voteTypeFor;
          case 'nay': return l10n.voteTypeAgainst;
          case 'present': return l10n.voteTypeAbstain;
          case 'not voting': return l10n.voteTypeAbsent;
          case 'absent': return l10n.voteTypeAbsent;
          default: return rawVote;
        }
      default:
        return rawVote;
    }
  }

  Color _getVoteColor(String translatedVote) {
    if (translatedVote == l10n.voteTypeFor) return Colors.green;
    if (translatedVote == l10n.voteTypeAgainst) return Colors.red;
    if (translatedVote == l10n.voteTypeAbstain) return Colors.orange;
    if (translatedVote == l10n.voteTypeAbsent) return Colors.grey;
    return Colors.black;
  }
    Widget _buildMissingDataWarning(bool isSquare) {
    final double iconSize = isSquare ? 40 : 50;
    final double fontSize = isSquare ? 40 : 50;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange.shade800,
            size: iconSize,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              l10n.missingDataSourceUserMessage,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: fontSize,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TargetingBracketsPainter extends CustomPainter {
  final Color color;
  final double length;
  final double strokeWidth;

  TargetingBracketsPainter({
    required this.color,
    this.length = 16.0,
    this.strokeWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawPath(
      Path()
        ..moveTo(size.width - length, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, length),
      paint,
    );

    canvas.drawPath(
      Path()
        ..moveTo(size.width - length, size.height)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, size.height - length),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
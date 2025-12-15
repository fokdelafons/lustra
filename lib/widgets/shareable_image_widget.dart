import 'package:flutter/material.dart';
import 'package:lustra/models/home_screen_data.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math';
import '../models/mp.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ShareableCardType {
  voted,
  scheduled,
  inProcess,
}

class ParliamentaryVotePainter extends CustomPainter {
  final int votesFor;
  final int votesAgainst;
  final int votesAbstain;
  final String labelFor;
  final String labelAgainst;
  final String labelAbstain;
  final Color forColor;
  final Color againstColor;
  final Color abstainColor;

  ParliamentaryVotePainter({
    required this.votesFor,
    required this.votesAgainst,
    required this.votesAbstain,
    required this.labelFor,
    required this.labelAgainst,
    required this.labelAbstain,
    this.forColor = Colors.green,
    this.againstColor = Colors.red,
    this.abstainColor = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const int fixedTotalDots = 123; // Stała liczba kropek do wyświetlenia
    final double spacingFraction = 0.15;

    final int actualTotalVotes = votesFor + votesAgainst + votesAbstain;

    if (actualTotalVotes == 0 || fixedTotalDots == 0) return;

    double pFor = votesFor / actualTotalVotes;
    double pAgainst = votesAgainst / actualTotalVotes;
    double pAbstain = votesAbstain / actualTotalVotes;

    int numDotsFor = (pFor * fixedTotalDots).floor();
    int numDotsAgainst = (pAgainst * fixedTotalDots).floor();
    int numDotsAbstain = (pAbstain * fixedTotalDots).floor();

    int currentTotalRoundedDots = numDotsFor + numDotsAgainst + numDotsAbstain;
    int remainderDots = fixedTotalDots - currentTotalRoundedDots;

    List<MapEntry<int, double>> fractionalParts = [
      MapEntry(0, pFor * fixedTotalDots - numDotsFor),
      MapEntry(1, pAgainst * fixedTotalDots - numDotsAgainst),
      MapEntry(2, pAbstain * fixedTotalDots - numDotsAbstain),
    ];
    fractionalParts.sort((a, b) => b.value.compareTo(a.value));

    for (int k = 0; k < remainderDots; k++) {
      int categoryIndex = fractionalParts[k].key;
      if (categoryIndex == 0) {
        numDotsFor++;
      } else if (categoryIndex == 1) {
        numDotsAgainst++;
      } else {
        numDotsAbstain++;
      }
    }

    final List<Color> dotColors = [];
    for (int i = 0; i < numDotsFor; i++) {
      dotColors.add(forColor);
    } for (int i = 0; i < numDotsAgainst; i++) {
      dotColors.add(againstColor);
    } for (int i = 0; i < numDotsAbstain; i++) {
      dotColors.add(abstainColor);
    }

    final double chartCenterX = size.width / 2;
    final double chartFocalY = size.height;
    final double chartOuterRadius = min(chartCenterX, chartFocalY);
    final double chartInnerRadiusRatio = 0.35;
    final double chartInnerRadius = chartOuterRadius * chartInnerRadiusRatio;

    if (chartOuterRadius <= chartInnerRadius) return;

    final double annulusArea = (pi / 2.0) * (pow(chartOuterRadius, 2) - pow(chartInnerRadius, 2));
    if (annulusArea <= 0) return;

    const double maxAllowableDotDiameter = 40.0;
    const double minAllowableDotDiameter = 1.0; // Minimalna średnica kropki (da promień 0.5px)

    double currentEstimatedDotDiameter;
    double initialDotDiameterEstimate = sqrt(annulusArea / fixedTotalDots) / (1 + spacingFraction);
    if (initialDotDiameterEstimate.isNaN || initialDotDiameterEstimate.isInfinite || initialDotDiameterEstimate <= 0) {
        initialDotDiameterEstimate = 4.0; // Domyślna wartość, jeśli obliczenia zawiodą
    }
    currentEstimatedDotDiameter = initialDotDiameterEstimate.clamp(minAllowableDotDiameter, maxAllowableDotDiameter);

    double dotRadius = 0;
    double interDotSpacing = 0;
    int numRows = 0;

    int loopGuard = 0;
    while (loopGuard < 20) {
      dotRadius = currentEstimatedDotDiameter / 2.0;
      if (dotRadius < 0.5 && fixedTotalDots > 0) {
          if (loopGuard > 0) break;
          return;
      }

      interDotSpacing = currentEstimatedDotDiameter * spacingFraction;
      final double tempRowHeight = currentEstimatedDotDiameter + interDotSpacing;
      if (tempRowHeight <= 0) return;

      numRows = max(1, ((chartOuterRadius - chartInnerRadius) / tempRowHeight).floor());
      
      int totalAvailableSlots = 0;
      for (int i = 0; i < numRows; i++) {
        final currentRowNominalRadius = chartInnerRadius + (i * tempRowHeight) + (tempRowHeight / 2);
        final int maxDotsInThisRow = (pi * currentRowNominalRadius / (currentEstimatedDotDiameter + interDotSpacing)).floor();
        totalAvailableSlots += maxDotsInThisRow;
      }

      if (totalAvailableSlots >= fixedTotalDots || currentEstimatedDotDiameter <= minAllowableDotDiameter) {
        break;
      }

      currentEstimatedDotDiameter = max(minAllowableDotDiameter, currentEstimatedDotDiameter * 0.95);
      loopGuard++;
    }
    
    if (dotRadius < 0.5 && fixedTotalDots > 0) return;
    final double rowHeight = currentEstimatedDotDiameter + interDotSpacing;

    final paint = Paint()..style = PaintingStyle.fill;
    int dotsDrawnCount = 0;

    for (int i = 0; i < numRows; i++) {
      if (dotsDrawnCount >= fixedTotalDots) break;

      final currentRowNominalRadius = chartInnerRadius + (i * rowHeight) + (rowHeight / 2);
      final int maxDotsInThisRow = (pi * currentRowNominalRadius / (currentEstimatedDotDiameter + interDotSpacing)).floor();

      if (maxDotsInThisRow == 0) continue;

      final double angleStep = pi / maxDotsInThisRow;

      for (int j = 0; j < maxDotsInThisRow; j++) {
        if (dotsDrawnCount >= fixedTotalDots) break;

        final double angle = pi - (j * angleStep) - (angleStep / 2); 
        final double dotX = chartCenterX + currentRowNominalRadius * cos(angle);
        final double dotY = chartFocalY - currentRowNominalRadius * sin(angle); 

        if (dotY < -dotRadius || dotY > size.height + dotRadius || dotX < -dotRadius || dotX > size.width + dotRadius) {
            continue;
        }

        paint.color = dotColors[dotsDrawnCount];
        canvas.drawCircle(Offset(dotX, dotY), dotRadius, paint);
        dotsDrawnCount++;
      }
    }

    if (actualTotalVotes > 0) {
      double forP = (votesFor / actualTotalVotes) * 100;
      double againstP = (votesAgainst / actualTotalVotes) * 100;
      double abstainP = (votesAbstain / actualTotalVotes) * 100;
// ignore: unused_local_variable
      String largestLabel = '';
      double largestPercent = 0;
      Color largestColor = Colors.black;
      if (forP >= againstP && forP >= abstainP) {
        largestLabel = labelFor; largestPercent = forP; largestColor = forColor;
      } else if (againstP >= forP && againstP >= abstainP) {
        largestLabel = labelAgainst; largestPercent = againstP; largestColor = againstColor;
      } else {
        largestLabel = labelAbstain; largestPercent = abstainP; largestColor = abstainColor;
      }

      final textSpan = TextSpan(
        text: '${largestPercent.toStringAsFixed(0)}%',
        style: TextStyle(
            color: largestColor, 
            fontSize: chartInnerRadius * 0.5,
            fontWeight: FontWeight.bold
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(minWidth: 0, maxWidth: chartInnerRadius * 1.5);

      final double textX = chartCenterX - textPainter.width / 2;
      final double textY = (chartFocalY - chartInnerRadius / 2) - (textPainter.height / 2);
      canvas.drawRRect(RRect.fromLTRBR(textX - 6, textY - 3, textX + textPainter.width + 6, textY + textPainter.height + 3, Radius.circular(chartInnerRadius * 0.1)), Paint()..color = Colors.white.withAlpha((255 * 0.05).round())..maskFilter = MaskFilter.blur(BlurStyle.normal, 2.0));
      textPainter.paint(canvas, Offset(textX, textY));
    }
  }

  @override
  bool shouldRepaint(ParliamentaryVotePainter oldDelegate) {
    return oldDelegate.votesFor != votesFor ||
        oldDelegate.votesAgainst != votesAgainst ||
        oldDelegate.votesAbstain != votesAbstain ||
        oldDelegate.forColor != forColor ||
        oldDelegate.againstColor != againstColor ||
        oldDelegate.abstainColor != abstainColor;
  }
}

// Definiujemy enumy potrzebne dla nowej, elastycznej architektury
enum LegislationCardType {
  voted,
  scheduled,
  inProcess,
}

enum ShareableContentType {
  legislation,
  deputy,
}


// Nowa, generyczna klasa, która zastępuje ShareableLegislationImage
class ShareableImage extends StatelessWidget {
  final HomeScreenLegislationItem? legislation;
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
    required HomeScreenLegislationItem legislation,
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

  // === GŁÓWNA METODA BUILD ===
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
  // === BUILDER DLA KARTY LEGISLACJI (nasz stary, dopracowany kod) ===
  // =======================================================================
  Widget _buildLegislationCard(BuildContext context) {
    LegislationCardType cardType;
    if (legislation!.votingDate != null) {
      cardType = LegislationCardType.voted;
    } else if (legislation!.upcomingProceedingDates?.isNotEmpty == true) {
      cardType = LegislationCardType.scheduled;
    } else {
      cardType = LegislationCardType.inProcess;
    }

// === POCZĄTEK PANELU STEROWANIA ===
    final double aspectRatio = size.width / size.height;
    final bool isSquare = aspectRatio > 0.9 && aspectRatio < 1.1;
    final double padding = isSquare ? 30.0 : 80.0;
  
    final double summaryFontSize = isSquare ? 23 : 34;
    final double keyPointsTitleSize = isSquare ? 22 : 34;
    final double keyPointsItemSize = isSquare ? 22 : 30;

    final double chartHeightMultiplier = isSquare ? 0.45 : 0.5;
    final double voteCountFontSize = isSquare ? 20 : 32;
    final double statusFontSize = isSquare ? 28 : 60;
    final double footerInfoFontSize = isSquare ? 24 : 28;
    // === KONIEC PANELU STEROWANIA ===

    final votesForSejm = legislation!.votesFor ?? 0;
    final votesAgainstSejm = legislation!.votesAgainst ?? 0;
    final votesAbstainSejm = legislation!.votesAbstain ?? 0;

    String headerLabel = parliamentName;
    if (legislation!.id.toUpperCase().startsWith('CIVIC-')) {
      headerLabel = l10n.civicProjectTitle;
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(padding, padding, padding, padding / 2),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: isSquare ? 36 : 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withAlpha(51),
                        width: 1.5,
                      ),
                    ),
                    child: SvgPicture.asset(
                      flagAssetPath,
                      height: isSquare ? 36 : 40, 
                    ),
                  ),
                ),
                TextSpan(
                  text: " $headerLabel: ${legislation!.title}",
                ),
              ],
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
        Expanded(
                  child: Stack(
                    children: [
                      // --- WARSTWA 1: TREŚĆ ---
                      Positioned.fill(
                        child: ClipRect(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(padding, padding / 2, padding, padding * 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // NOWA SEKCJA: OSTRZEŻENIE O BRAKUJĄCYCH DANYCH
                                  if (showMissingDataWarning) ...[
                                    _buildMissingDataWarning(isSquare),
                                    const SizedBox(height: 20),
                                  ],
                                  
                                  Text(
                                    legislation!.summary ?? l10n.errorNoSummaryLastVote,
                                    style: TextStyle(fontSize: summaryFontSize, color: Colors.grey[800], height: 1.4),
                                  ),
                                  const SizedBox(height: 24),
                                  if (legislation!.keyPoints.isNotEmpty)
                                    _buildKeyPointsSection(
                                      legislation!.keyPoints,
                                      l10n,
                                      keyPointsTitleSize,
                                      keyPointsItemSize,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

// --- WARSTWA 2: STREFA Z INFORMACJĄ (wyrównana do lewej) ---
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withAlpha(0),
                        Colors.white,
                      ],
                      stops: const [0.0, 0.3],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: padding, bottom: 8.0),
                        child: Text(
                          l10n.morePointsInApp,
                          style: TextStyle(fontSize: isSquare ? 18 : 28, color: Colors.grey[600], fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (cardType == LegislationCardType.voted)
          LayoutBuilder(
            builder: (context, constraints) {
              final chartWidth = constraints.maxWidth;
              return _buildVotedFooter(
                padding,
                isSquare,
                votesForSejm,
                votesAgainstSejm,
                votesAbstainSejm,
                chartHeightMultiplier,
                voteCountFontSize,
                statusFontSize,
                translatedStatus!,
                chartWidth: chartWidth,
              );
            },
          )
        else if (cardType == LegislationCardType.scheduled)
          _buildScheduledFooter(context, padding, footerInfoFontSize, translatedStatus!, isSquare: isSquare)
        else if (cardType == LegislationCardType.inProcess)
          _buildInProcessFooter(context, padding, footerInfoFontSize, translatedStatus!, isSquare: isSquare),
        
        _buildBrandingFooter(isSquare: isSquare),
      ],
    );
  }

// ===============================================================
  // === NOWY BUILDER DLA KARTY POSŁA ===
  // ===============================================================
  Widget _buildDeputyCard(BuildContext context) {
    // === LOKALNY PANEL STEROWANIA ===
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
        // --- SEKCJA 1: NAGŁÓWEK ---
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
                    Text(fullName, style: TextStyle(fontSize: isSquare ? 60 : 60, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
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
        
// --- SEKCJA 2: AKTYWNOŚĆ (z nową hierarchią) ---
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(padding, 0, padding, padding),
            child: Column(
              children: [
                // === CZĘŚĆ DODATKOWA (GŁOSOWANIA - teraz na górze, tylko dla 16:9) ===
                if (!isSquare && recentVotings!.isNotEmpty)
                  Expanded(
                    flex: 2, // Dajemy więcej miejsca na listę głosowań
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          l10n.votingsTab,
                          // === POKRĘTŁO 1: Rozmiar tytułu "Głosowania" ===
                          style: TextStyle(fontSize: 55, color: Colors.grey[800]), // Usunięto fontWeight.bold
                        ),
                        const Divider(),
                        const SizedBox(height: 8),
                        // Lista głosowań (zajmie resztę miejsca w tym Expanded)
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

// === CZĘŚĆ WSPÓLNA (STATYSTYKI - teraz warunkowe) ===
                Expanded(
                  flex: 1, // Dajemy mniej miejsca na statystyki
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Kolumna 1: Frekwencja (zawsze widoczna).
                      Expanded(
                        child: _buildVerticalStatItem(
                          l10n.attendanceLabelShort,
                          attendanceText,
                          attendanceColor,
                          isSquare,
                        ),
                      ),
                      
                      // Kolumna 2: Warunkowa.
                      Expanded(
                        child: (parliamentId == 'us')
                            // Dla USA: Nowy, zwarty layout w jednej kolumnie.
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
                            // Dla innych parlamentów: Standardowy widget.
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

        // --- SEKCJA 3: SONDAŻ POPARCIA ---
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
        _buildBrandingFooter(isSquare: isSquare),
      ],
    );
  }

  // --- OSTATECZNE WERSJE METOD POMOCNICZYCH ---

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

  // ===============================================================
  // === METODY POMOCNICZE (WSPÓLNE I SPECYFICZNE) ===
  // ===============================================================

  /// Buduje statyczny, procentowy pasek ankiety na potrzeby obrazka.
  Widget _buildPollBar({required int likes, required int dislikes}) {
    final totalVotes = likes + dislikes;
    final double forPercent = totalVotes > 0 ? (likes / totalVotes * 100) : 0;
    final double againstPercent = totalVotes > 0 ? (dislikes / totalVotes * 100) : 0;

    if (totalVotes == 0) {
      return Container(
        height: 36,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(18),
        ),
        alignment: Alignment.center,
        child: Text(
          l10n.pollNoVotesCast,
          style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
        ),
      );
    }

    bool onlyFor = forPercent > 0 && againstPercent == 0;
    bool onlyAgainst = againstPercent > 0 && forPercent == 0;
    int flexFor = forPercent.round();
    int flexAgainst = againstPercent.round();

    if (flexFor == 0 && likes > 0) flexFor = 1;
    if (flexAgainst == 0 && dislikes > 0) flexAgainst = 1;

    return Row(
      children: [
        if (flexFor > 0)
          Expanded(
            flex: flexFor,
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: onlyFor ? BorderRadius.circular(18) : const BorderRadius.only(topLeft: Radius.circular(18), bottomLeft: Radius.circular(18)),
              ),
              alignment: Alignment.center,
              child: forPercent > 15 ? Text('${forPercent.round()}%', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)) : null,
            ),
          ),
        if (flexAgainst > 0)
          Expanded(
            flex: flexAgainst,
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: onlyAgainst ? BorderRadius.circular(18) : const BorderRadius.only(topRight: Radius.circular(18), bottomRight: Radius.circular(18)),
              ),
              alignment: Alignment.center,
              child: againstPercent > 15 ? Text('${againstPercent.round()}%', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)) : null,
            ),
          ),
      ],
    );
  }

    Widget _buildDeputyPollBar({required int likes, required int dislikes}) {
    final totalVotes = likes + dislikes;
    final double forPercent = totalVotes > 0 ? (likes / totalVotes * 100) : 0;
    final double againstPercent = totalVotes > 0 ? (dislikes / totalVotes * 100) : 0;

    if (totalVotes == 0) {
      return Container(
        height: 55, // Dopasowujemy wysokość do aktywnego paska
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(18),
        ),
        alignment: Alignment.center,
        child: Text(
          l10n.pollNoVotesCast,
          style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic, fontSize: 24),
        ),
      );
    }

    bool onlyFor = forPercent > 0 && againstPercent == 0;
    bool onlyAgainst = againstPercent > 0 && forPercent == 0;
    int flexFor = forPercent.round();
    int flexAgainst = againstPercent.round();

    if (flexFor == 0 && likes > 0) flexFor = 1;
    if (flexAgainst == 0 && dislikes > 0) flexAgainst = 1;

    return Row(
      children: [
        if (flexFor > 0)
          Expanded(
            flex: flexFor,
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: onlyFor ? BorderRadius.circular(18) : const BorderRadius.only(topLeft: Radius.circular(18), bottomLeft: Radius.circular(18)),
              ),
              alignment: Alignment.center,
              child: forPercent > 15 ? Text('${forPercent.round()}%', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)) : null,
            ),
          ),
        if (flexAgainst > 0)
          Expanded(
            flex: flexAgainst,
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: onlyAgainst ? BorderRadius.circular(18) : const BorderRadius.only(topRight: Radius.circular(18), bottomRight: Radius.circular(18)),
              ),
              alignment: Alignment.center,
              child: againstPercent > 15 ? Text('${againstPercent.round()}%', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)) : null,
            ),
          ),
      ],
    );
  }

  Widget _buildBrandingFooter({required bool isSquare}) {
    return Container(
      // ZMIANA 1: Wymuszamy na kontenerze zajęcie całej dostępnej szerokości
      width: double.infinity,
      color: const Color(0xFFF5F5F5),
      padding: EdgeInsets.symmetric(
        vertical: isSquare ? 16.0 : 20.0, // Możemy lekko zmniejszyć padding pionowy
        horizontal: isSquare ? 30.0 : 50.0,
      ),
      // ZMIANA 2: Używamy Row zamiast Column, aby ułożyć elementy poziomo
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Wyśrodkowujemy grupę (logo + tekst) w poziomie
        crossAxisAlignment: CrossAxisAlignment.center, // Wyśrodkowujemy elementy względem siebie w pionie
        mainAxisSize: MainAxisSize.min, // Powoduje, że Row zajmuje tyle miejsca, ile potrzebuje (a MainAxisAlignment.center go centruje)
        children: [
          SvgPicture.asset(
            'assets/logo_full.svg',
            // ZMIANA 3: Znacznie zmniejszamy logo, aby pasowało do jednej linii z tekstem
            height: isSquare ? 24 : 28, 
            colorFilter: const ColorFilter.mode(
              Color(0xFF005A9C),
              BlendMode.srcIn,
            ),
          ),
          // ZMIANA 4: Dodajemy odstęp poziomy
          const SizedBox(width: 12.0), 
          Text(
            l10n.appMotto,
            style: TextStyle(
              fontSize: isSquare ? 18 : 22,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }


Widget _buildVotedFooter(double padding, bool isSquare, int votesForSejm, int votesAgainstSejm, int votesAbstainSejm, double chartHeightMultiplier, double voteCountFontSize, double statusFontSize, String status, {required double chartWidth}) {
  // === GŁÓWNY LAYOUT STOPKI ===
  return Padding(
    padding: EdgeInsets.fromLTRB(padding, 0, padding, padding),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
        SizedBox(height: padding / 2),
        
        // --- SEKCJA GŁOSOWANIA (zależna od formatu) ---
        Stack(
          children: [
            // --- WARSTWA 1: WYKRES (z Twoimi proporcjami) ---
            CustomPaint(
              size: Size(chartWidth, chartWidth * (isSquare ? 0.23 : 0.5)),
              painter: ParliamentaryVotePainter(
                labelFor: l10n.votingFor,
                labelAgainst: l10n.votingAgainst,
                labelAbstain: l10n.votingAbstainShort,
                votesFor: legislation!.votesFor ?? 0,
                votesAgainst: legislation!.votesAgainst ?? 0,
                votesAbstain: legislation!.votesAbstain ?? 0,
              ),
            ),

            // --- WARSTWA 2: PUDEŁKO Z DANYMI (z Twoimi proporcjami) ---
            Positioned(
              top: 0,
              left: padding / 4,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200]!.withAlpha((255 * 0.98).round()),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                  boxShadow: [ BoxShadow(color: Colors.black.withAlpha((255 * 0.1).round()), blurRadius: 8, offset: const Offset(0, 4)) ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: chartWidth * (isSquare ? 0.21 : 0.33),
                      child: Text(
                        votingTitle!,
                        style: TextStyle(fontSize: isSquare ? 22 : 34, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDateTime(legislation!.votingDate!, l10n),
                      style: TextStyle(fontSize: isSquare ? 16 : 26, color: Colors.grey[700], fontStyle: FontStyle.italic),
                    ),
                    const Divider(height: 20, thickness: 1),
                    _buildVoteCountRow(l10n.labelFor, votesForSejm, Colors.green, voteCountFontSize),
                    const SizedBox(height: 8),
                    _buildVoteCountRow(l10n.labelAgainst, votesAgainstSejm, Colors.red, voteCountFontSize),
                    const SizedBox(height: 8),
                    _buildVoteCountRow(l10n.labelAbstained, votesAgainstSejm, Colors.grey, voteCountFontSize),
                  ],
                ),
              ),
            ),
// === NOWA, WARUNKOWA WARSTWA 3: STATUS (tylko dla kwadratu) ===
            if (isSquare)
              Positioned(
                top: 0,
                bottom: 0,
                right: padding / 4,
                child: Center(
                  child: SizedBox(
                    width: chartWidth * 0.25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.filterStatusLabel, 
                          style: TextStyle(fontSize: 30, color: Colors.grey[700]),
                          textAlign: TextAlign.center, 
                        ),
                        const SizedBox(height: 4),
                        Text(
                          status, 
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.underline),
                          textAlign: TextAlign.center, 
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
        // === SEKCJA STATUSU (renderowana tylko dla 16:9, zachowuje Twój kod) ===
        if (!isSquare) ...[
          SizedBox(height: isSquare ? 20 : 30),
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
          const SizedBox(height: 16),
          Center(child: Text("${l10n.filterStatusLabel}$status", textAlign: TextAlign.center, style: TextStyle(fontSize: statusFontSize, fontWeight: FontWeight.w500))),
        ]
      ],
    ),
  );
}
Widget _buildScheduledFooter(BuildContext context, double padding, double fontSize, String status, {required bool isSquare}) {
    final double pollWidthFactor = isSquare ? 0.37 : 0.5; 

    return Padding(
      padding: EdgeInsets.fromLTRB(padding, 0, padding, padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
          SizedBox(height: padding / 2),
          Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
                  final pollWidth = maxWidth * pollWidthFactor;

                  return Center(
                    child: SizedBox(
                      width: pollWidth,
                      child: _buildCitizenVoteSection(
                        context: context,
                        baseFontSize: fontSize,
                        likes: legislation!.likes ?? 0,
                        dislikes: legislation!.dislikes ?? 0,
                      ),
                    ),
                  );
                },
              ),
              
// --- WARSTWA 2: TREŚĆ (bez ramek, z pełną kontrolą) ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.consideredOnLabel,
                          // === POKRĘTŁO 1: Rozmiar tytułu daty ===
                          style: TextStyle(fontSize: isSquare ? 30 : 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatDateTime(legislation!.upcomingProceedingDates!.first, l10n),
                          // === POKRĘTŁO 2: Rozmiar samej daty ===
                          style: TextStyle(fontSize: isSquare ? 24 : 24, color: Colors.grey[700], fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),

                  // --- SEKCJA ZE STATUSEM ---
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          l10n.filterStatusLabel,
                          // === POKRĘTŁO 3: Rozmiar etykiety statusu ===
                          style: TextStyle(fontSize: isSquare ? 24 : 24, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.statusInProgress, 
                          // === POKRĘTŁO 4: Rozmiar samego statusu ===
                          style: TextStyle(fontSize: isSquare ? 30 : 30, fontWeight: FontWeight.bold, color: Colors.black),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

Widget _buildInProcessFooter(BuildContext context, double padding, double fontSize, String status, {required bool isSquare}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: padding / 2, horizontal: padding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: _buildCitizenVoteSection(
                  context: context,
                  baseFontSize: fontSize,
                  likes: legislation!.likes ?? 0,
                  dislikes: legislation!.dislikes ?? 0,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 4,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        l10n.filterStatusLabel, 
                        style: TextStyle(fontSize: isSquare ? 30 : 30, color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        status, 
                        style: TextStyle(fontSize: isSquare ? 40 : 40, fontWeight: FontWeight.bold, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCitizenVoteSection({
    required BuildContext context,
    required double baseFontSize,
    required int likes,
    required int dislikes,
    String? customTitle,
    bool useDeputyStyle = false,
  }) {
    final String pollTitle = customTitle ?? l10n.citizenPollTitle;

    if (deputy != null) {
      if (deputy!.mandateCoverage == 'PARTIAL') {
        return _buildInactivePollContainer(
          context: context,
          baseFontSize: baseFontSize,
          title: pollTitle,
          line1: l10n.mandateInactive,
          line2: l10n.votingUnavailable,
        );
      }
      if (deputy!.mandateCoverage == 'FULL' && !deputy!.active) {
        return _buildInactivePollContainer(
          context: context,
          baseFontSize: baseFontSize,
          title: pollTitle,
          line1: l10n.historicalTerm,
          line2: l10n.pollUnavailable,
        );
      }
    }

    final totalVotes = likes + dislikes;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(pollTitle, style: TextStyle(fontSize: baseFontSize, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(
            l10n.pollVotingViaApp,
            style: TextStyle(fontSize: baseFontSize - 6, color: Colors.grey[600]),
          ),
          const SizedBox(height: 16),
          if (useDeputyStyle)
            _buildDeputyPollBar(likes: likes, dislikes: dislikes)
          else
            _buildPollBar(likes: likes, dislikes: dislikes),
          const SizedBox(height: 8),
          if (totalVotes > 0)
            Text(l10n.pollTotalVotes(totalVotes), style: TextStyle(fontSize: baseFontSize - 4, color: Colors.grey[600], fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  Widget _buildInactivePollContainer({
    required BuildContext context,
    required double baseFontSize,
    required String title,
    required String line1,
    required String line2,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: baseFontSize, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            line1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: baseFontSize,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            line2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: baseFontSize - 2, color: Colors.grey[600], fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

Widget _buildKeyPointsSection(
  List<String> keyPoints,
  AppLocalizations l10n,
  double titleSize,
  double itemSize,
) {
  if (keyPoints.isEmpty) {
    return const SizedBox.shrink();
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        l10n.keyPoints,
        style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold, color: Colors.grey[700]),
      ),
      const SizedBox(height: 8),
      ...keyPoints.map((point) => _bulletPoint(point, itemSize)),
    ],
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

  Widget _buildVoteCountRow(String label, int count, Color color, double fontSize) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: fontSize, color: Colors.grey[700]),
        ),
        const SizedBox(width: 8),
        Text(
          count.toString(),
          style: TextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String _formatDateTime(DateTime date, AppLocalizations l10n) {
    return intl.DateFormat.yMMMMd(l10n.localeName).format(date);
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
    final double iconSize = isSquare ? 40 : 50; // Zwiększono rozmiar ikonki
    final double fontSize = isSquare ? 40 : 50; // Zwiększono rozmiar czcionki

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
              l10n.missingDataWarningShare,
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
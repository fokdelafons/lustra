import 'package:flutter/material.dart';
import 'dart:math';

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
  
  final String? noDataLabel;
  final Color noDataColor;

  ParliamentaryVotePainter({
    required this.votesFor,
    required this.votesAgainst,
    required this.votesAbstain,
    required this.labelFor,
    required this.labelAgainst,
    required this.labelAbstain,
    this.noDataLabel,
    this.forColor = Colors.green,
    this.againstColor = Colors.red,
    this.abstainColor = Colors.grey,
    this.noDataColor = const Color.fromRGBO(189, 189, 189, 0.4),
  });

  @override
  void paint(Canvas canvas, Size size) {
    const int fixedTotalDots = 123; 
    final double spacingFraction = 0.15;

    final int actualTotalVotes = votesFor + votesAgainst + votesAbstain;
    
    final List<Color> dotColors;

    if (actualTotalVotes > 0) {
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

      final calculatedColors = <Color>[];
      for (int i = 0; i < numDotsFor; i++) {
        calculatedColors.add(forColor);
      }
      for (int i = 0; i < numDotsAgainst; i++) {
        calculatedColors.add(againstColor);
      }
      for (int i = 0; i < numDotsAbstain; i++) {
        calculatedColors.add(abstainColor);
      }
      dotColors = calculatedColors;

    } else {
      dotColors = List.generate(fixedTotalDots, (_) => noDataColor);
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
    const double minAllowableDotDiameter = 1.0;

    double currentEstimatedDotDiameter;
    double initialDotDiameterEstimate = sqrt(annulusArea / fixedTotalDots) / (1 + spacingFraction);
    
    if (initialDotDiameterEstimate.isNaN || initialDotDiameterEstimate.isInfinite || initialDotDiameterEstimate <= 0) {
        initialDotDiameterEstimate = 4.0;
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

      double largestPercent = 0;
      Color largestColor = Colors.black;
      if (forP >= againstP && forP >= abstainP) {
         largestPercent = forP; largestColor = forColor;
      } else if (againstP >= forP && againstP >= abstainP) {
         largestPercent = againstP; largestColor = againstColor;
      } else {
         largestPercent = abstainP; largestColor = abstainColor;
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
      
      canvas.drawRRect(RRect.fromLTRBR(textX - 6, textY - 3, textX + textPainter.width + 6, textY + textPainter.height + 3, Radius.circular(chartInnerRadius * 0.1)), Paint()..color = Colors.white.withAlpha((255 * 0.05).round())..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0));
      textPainter.paint(canvas, Offset(textX, textY));

    } else if (noDataLabel != null) {
        final textSpan = TextSpan(
          text: noDataLabel,
          style: TextStyle(
              color: Colors.grey[700], 
              fontSize: (chartInnerRadius * 0.4).clamp(12.0, 16.0),
              fontWeight: FontWeight.bold
          ),
        );
        final textPainter = TextPainter(
          text: textSpan,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(minWidth: 0, maxWidth: size.width * 0.7);
        final double textX = chartCenterX - textPainter.width / 2;
        final double textY = (chartFocalY - chartOuterRadius / 2) - (textPainter.height / 2);
        textPainter.paint(canvas, Offset(textX, textY));
    }
  }

  @override
  bool shouldRepaint(ParliamentaryVotePainter oldDelegate) {
    return oldDelegate.votesFor != votesFor ||
        oldDelegate.votesAgainst != votesAgainst ||
        oldDelegate.votesAbstain != votesAbstain ||
        oldDelegate.noDataLabel != noDataLabel ||
        oldDelegate.forColor != forColor ||
        oldDelegate.againstColor != againstColor ||
        oldDelegate.abstainColor != abstainColor;
  }
}
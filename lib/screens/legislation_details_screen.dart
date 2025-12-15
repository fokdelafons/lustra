import 'package:flutter/material.dart';
import 'dart:math';
import '../models/legislation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'dart:developer' as developer;
import 'package:provider/provider.dart';
import '../services/parliament_service_interface.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;
import '../services/share_service.dart';
import 'package:lustra/models/home_screen_data.dart';
import '../services/parliament_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/citizen_poll_widget.dart';
import '../widgets/missing_data_widget.dart';
import '../services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:lustra/providers/translators.dart';
import 'package:go_router/go_router.dart';


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
  }) ;

  @override
  void paint(Canvas canvas, Size size) {
    const int fixedTotalDots = 117;
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
      if (categoryIndex == 0) 
      {numDotsFor++;}
      else if (categoryIndex == 1) 
      {numDotsAgainst++;}
      else 
      {numDotsAbstain++;}
    }

    final List<Color> dotColors = [];
    for (int i = 0; i < numDotsFor; i++) 
    {dotColors.add(forColor);}
    for (int i = 0; i < numDotsAgainst; i++) 
    {dotColors.add(againstColor);}
    for (int i = 0; i < numDotsAbstain; i++) 
    {dotColors.add(abstainColor);}

    final double chartCenterX = size.width / 2;
    final double chartFocalY = size.height;
    final double chartOuterRadius = min(chartCenterX, chartFocalY);
    final double chartInnerRadiusRatio = 0.35;
    final double chartInnerRadius = chartOuterRadius * chartInnerRadiusRatio;
    if (chartOuterRadius <= chartInnerRadius) return;
    final double annulusArea = (pi / 2.0) * (pow(chartOuterRadius, 2) - pow(chartInnerRadius, 2));
    if (annulusArea <= 0) return;
    const double maxAllowableDotDiameter = 20.0;
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

Widget bulletPoint(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6.0, left: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6, right: 8),
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              height: 1.4,
            ),
          ),
        ),
      ],
    ),
  );
}

class PartiallyExpandableListWidget extends StatefulWidget {
  final String title;
  final List<dynamic> items;
  final int initiallyVisibleCount;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  const PartiallyExpandableListWidget({
    super.key,
    required this.title,
    required this.items,
    required this.initiallyVisibleCount,
    required this.itemBuilder,
  });

  @override
  PartiallyExpandableListWidgetState createState() =>
      PartiallyExpandableListWidgetState();
}

class PartiallyExpandableListWidgetState extends State<PartiallyExpandableListWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }
    final bool canExpand = widget.items.length > widget.initiallyVisibleCount;
    final List<dynamic> visibleItems = _isExpanded
        ? widget.items
        : widget.items.take(widget.initiallyVisibleCount).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: visibleItems.length,
          itemBuilder: (context, index) => widget.itemBuilder(context, visibleItems[index]),
        ),
        if (canExpand)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _isExpanded ? AppLocalizations.of(context)!.actionCollapse : AppLocalizations.of(context)!.actionExpand,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class LegislationDetailsScreen extends StatefulWidget {
  final Legislation? bill;
  final String? legislationId;
  final String? summarizedBy;
  final String? usedPrompt;

  const LegislationDetailsScreen({
    super.key,
    this.bill,
    this.legislationId,
    this.summarizedBy,
    this.usedPrompt,
  }) : assert(bill != null || legislationId != null, 'Either bill or legislationId must be provided.');

  @override
  State<LegislationDetailsScreen> createState() => _LegislationDetailsScreenState();
}

class _LegislationDetailsScreenState extends State<LegislationDetailsScreen> {
  Legislation? _bill;
  bool _isLoading = false;
  bool _isFetchingDetails = false;
  String? _error;

  String _formatDateTime(BuildContext context, DateTime? date) {
    if (date == null) return AppLocalizations.of(context)!.noDate;
    return intl.DateFormat.yMMMMd(AppLocalizations.of(context)!.localeName).format(date);
  }

  @override
  void initState() {
    super.initState();
    if (widget.bill != null) {
      _bill = widget.bill;
      _isLoading = false;
      _initializeStateData();
      if (_bill!.category.isEmpty) {
        developer.log(
          'LEGISLATION_SCREEN: Otrzymano niepełny obiekt. Dociągam pełne dane w tle...',
          name: 'LegislationDetailsScreen'
        );
        _fetchLegislationDetails(isBackgroundFetch: true);
      }
    } else if (widget.legislationId != null) {
      developer.log(
        'LEGISLATION_SCREEN: Otrzymano legislationId: ${widget.legislationId}. Uruchamiam _fetchLegislationDetails...',
        name: 'LegislationDetailsScreen'
      );
      _fetchLegislationDetails();
    }
  }

void _initializeStateData() {
  // Funkcja celowo pozostawiona pusta, jeśli w przyszłości dojdzie tu inna logika.
  // Cała logika ankiety jest teraz w widgecie.
}

  Future<void> _fetchLegislationDetails({bool isBackgroundFetch = false}) async {
    setState(() {
      if (!isBackgroundFetch) {
        _isLoading = true;
      }
      _isFetchingDetails = true;
      if (_error != null && !isBackgroundFetch) {
        _error = null;
      }
    });
    try {
      final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
      final idToFetch = widget.legislationId ?? _bill!.id;
      final fetchedBill = await activeService.getLegislationDetails(context, idToFetch);
      if (mounted) {
        if (fetchedBill != null) {
          setState(() {
            _bill = fetchedBill;
          });
          _initializeStateData();
        } else {
          if (!isBackgroundFetch) {
            setState(() {
              _error = "error";
            });
          }
        }
        setState(() {
          _isLoading = false;
          _isFetchingDetails = false;
        });
      }
    } catch (e) {
      developer.log('Failed to fetch legislation details: $e');
      if (mounted) {
        setState(() {
          if (!isBackgroundFetch) {
            _error = "error";
          }
          _isLoading = false;
          _isFetchingDetails = false;
        });
      }
    }
  }

  Future<void> _launchUrlHelper(String? urlString) async {
    if (urlString == null || urlString.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.noUrlAvailableSnackbar)),
        );
      }
      return;
    }
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.cannotOpenLinkSnackbar(urlString))),
        );
      }
      developer.log('Could not launch $urlString');
    }
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

Widget _buildCitizenPoll(BuildContext context) {
    return CitizenPollWidget(
      targetType: 'legislation',
      targetId: _bill!.id,
      itemData: _bill!,
      onVoteSuccess: (updatedCounters) {
        if (mounted) {
          setState(() {
            _bill = _bill!.copyWith(
              likes: updatedCounters['likes'],
              dislikes: updatedCounters['dislikes'],
               popularity: updatedCounters['popularity'],
             );
          });
         }
      },
    );
  }

void _shareLegislation() {
    // 1. Stwórz instancję serwisu.
    final shareService = ShareService();
    final parliamentId = context.read<ParliamentManager>().activeServiceId;

    // 2. Zbierz dane ZANIM otworzysz bottom sheet.
    final l10n = AppLocalizations.of(context)!;
    final activeService = context.read<ParliamentServiceInterface>();
    final status = activeService.translateStatus(context, _bill!.status);
    final String dynamicVotingTitle = activeService.getVotingTitle(context, _bill!);

    // 3. Stwórz adapter/obiekt do udostępnienia ZANIM otworzysz bottom sheet.
    final shareableItem = HomeScreenLegislationItem(
      id: _bill!.id,
      title: _bill!.title,
      summary: _bill!.description,
      status: _bill!.status,
      votingDate: _bill!.date,
      votesFor: _bill!.votesFor,
      votesAgainst: _bill!.votesAgainst,
      votesAbstain: _bill!.votesAbstain,
      keyPoints: _bill!.keyPoints,
      likes: _bill!.likes,
      dislikes: _bill!.dislikes,
      popularity: _bill!.popularity ?? 0,
      upcomingProceedingDates: _bill!.upcomingProceedingDates,
      category: _bill!.category.isNotEmpty 
          ? categoryApiKeyToLabel(context, _bill!.category.split(',').first.trim()) 
          : null,
    );
    
    // 4. Pokaż modalny arkusz z opcjami formatu.
    showModalBottomSheet(
      context: context,
      builder: (bottomSheetContext) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.crop_square),
                title: Text(l10n.shareAsPost), // Upewnij się, że ten klucz tłumaczenia istnieje
                onTap: () {
                  Navigator.of(bottomSheetContext).pop();
                  shareService.shareLegislation(
                    context: context,
                    legislation: shareableItem,
                    imageSize: const Size(1080, 1080),
                    l10n: l10n,
                    translatedStatus: status,
                    parliamentId: parliamentId!,
                    flagAssetPath: activeService.flagAssetPath,
                    parliamentName: activeService.name,
                    votingTitle: dynamicVotingTitle,
                    showMissingDataWarning: _bill!.missingDataInfo != null,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone_android),
                title: Text(l10n.shareAsStory), // Upewnij się, że ten klucz tłumaczenia istnieje
                onTap: () {
                  Navigator.of(bottomSheetContext).pop();
                  shareService.shareLegislation(
                    context: context,
                    legislation: shareableItem,
                    imageSize: const Size(1080, 1920),
                    l10n: l10n,
                    translatedStatus: status,
                    parliamentId: parliamentId!,
                    flagAssetPath: activeService.flagAssetPath,
                    parliamentName: activeService.name,
                    votingTitle: dynamicVotingTitle,
                    showMissingDataWarning: _bill!.missingDataInfo != null,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showReportErrorDialog() {
    final TextEditingController reportController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    // Przechwytujemy kontekst głównego ekranu PRZED pokazaniem dialogu.
    final mainScreenContext = context;
    bool isSending = false; // Zmienna stanu dla naszego dialogu

    showDialog(
      context: mainScreenContext,
      barrierDismissible: false, // Zapobiegamy zamknięciu dialogu w trakcie wysyłania
      builder: (dialogContext) {
        // Używamy StatefulBuilder, aby móc odświeżać tylko zawartość dialogu
        return StatefulBuilder(
          builder: (context, setDialogState) {
            
            return AlertDialog(
              title: Text(AppLocalizations.of(mainScreenContext)!.reportErrorButton),
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isSending) ...[ // Pokaż pole tekstowe tylko, jeśli NIE wysyłamy
                      Text(AppLocalizations.of(mainScreenContext)!.reportErrorDescription),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: reportController,
                        maxLines: 4,
                        maxLength: 400,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(mainScreenContext)!.reportErrorHint,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(mainScreenContext)!.reportErrorValidationEmpty;
                          }
                          return null;
                        },
                      ),
                    ] else ...[ // Pokaż wskaźnik ładowania, gdy WYSYŁAMY
                      const SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                // Zawsze pokazuj przycisk Anuluj
                TextButton(
                  onPressed: isSending ? null : () => Navigator.of(dialogContext).pop(),
                  child: Text(AppLocalizations.of(mainScreenContext)!.actionCancel),
                ),
                // Przycisk Wyślij jest widoczny tylko, gdy nie wysyłamy
                if (!isSending)
                  ElevatedButton(
                    onPressed: () async {
                      if (!(formKey.currentState?.validate() ?? false)) {
                        return;
                      }

                      // --- ZMIANA: POKAZUJEMY ŁADOWANIE ---
                      setDialogState(() {
                        isSending = true;
                      });
                      
                      final l10n = AppLocalizations.of(mainScreenContext)!;
                      final navigator = Navigator.of(dialogContext);
                      final messenger = ScaffoldMessenger.of(mainScreenContext);
                      final parliamentManager = Provider.of<ParliamentManager>(mainScreenContext, listen: false);

                      try {
                        final apiService = ApiService();
                        await apiService.callFunction(
                          'reportError',
                          params: {
                            'targetId': _bill!.id,
                            'targetType': 'legislation',
                            'message': reportController.text.trim(),
                            'source': parliamentManager.activeServiceId,
                          },
                        );
                        if (navigator.context.mounted) navigator.pop();
                        messenger.showSnackBar(
                          SnackBar(content: Text(l10n.reportErrorSuccess), backgroundColor: Colors.green),
                        );
                      } on FirebaseFunctionsException catch (e) {
                        if (navigator.context.mounted) navigator.pop();
                        String errorMessage;
                        if (e.code == 'resource-exhausted') {
                          errorMessage = l10n.reportErrorRateLimitExceeded;
                        } else {
                          errorMessage = e.message ?? l10n.errorFailedToLoadData;
                        }
                        messenger.showSnackBar(
                          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
                        );
                      }
                    },
                    child: Text(AppLocalizations.of(mainScreenContext)!.actionSend),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  void _reportError() {
    if (FirebaseAuth.instance.currentUser != null) {
      _showReportErrorDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.mustBeLoggedInToReport)),
      );
    }
  }


@override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final manager = Provider.of<ParliamentManager>(context);
    
// APP BAR (używany w loading/error i głównym widoku)
    final bool isWideScreen = kIsWeb && MediaQuery.of(context).size.width > 800;
    final bool canPop = context.canPop();
    
    final appBar = AppBar(
      title: Text(l10n.detailsScreenTitle),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      
      // --- LEWA STRONA (Cofnij / Dom) ---
      // Na szerokim ekranie dajemy więcej miejsca na napis
      leadingWidth: isWideScreen ? 140 : null, 
      leading: isWideScreen
          ? InkWell(
              onTap: () => canPop ? context.pop() : context.go('/'),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Icon(canPop ? Icons.arrow_back : Icons.home, color: Colors.white),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        canPop ? l10n.actionBack : l10n.bottomNavHome, 
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : (canPop 
              ? null // Standardowa strzałka na mobile
              : IconButton(
                  icon: const Icon(Icons.home),
                  tooltip: l10n.bottomNavHome,
                  onPressed: () => context.go('/'),
                )),

      // --- PRAWA STRONA (Udostępnij) ---
      actions: _bill == null ? [] : [
            if (isWideScreen)
              // Używamy TextButton ze zwykłym Row, aby wymusić kolejność: Tekst -> Ikona
              TextButton(
                onPressed: _isFetchingDetails ? null : _shareLegislation,
                child: Row(
                  children: [
                    Text(l10n.shareAction, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    const Icon(Icons.share, color: Colors.white),
                  ],
                ),
              )
            else
              IconButton(
                icon: const Icon(Icons.share),
                tooltip: l10n.shareTooltip,
                onPressed: _isFetchingDetails ? null : _shareLegislation,
              ),
            const SizedBox(width: 8),
          ],
    );

    // LOADING / ERROR STANY
    if (manager.isLoading || !manager.isInitialized) {
      return Scaffold(appBar: appBar, body: const Center(child: CircularProgressIndicator()));
    }
    if (manager.error != null) {
      return Scaffold(
        appBar: appBar,
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(padding: const EdgeInsets.all(16.0), child: Text(l10n.noMPsForSource, textAlign: TextAlign.center)),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () => manager.changeSource(manager.activeServiceId!), child: Text(l10n.tryAgainButton)),
        ])),
      );
    }
    if (_isLoading) {
      return Scaffold(appBar: appBar, body: const Center(child: CircularProgressIndicator()));
    }
    if (_error != null) {
      return Scaffold(appBar: appBar, body: Center(child: Padding(padding: const EdgeInsets.all(16.0), child: Text(_error!, textAlign: TextAlign.center, style: TextStyle(color: Colors.red[700], fontSize: 16)))));
    }
    if (_bill == null) {
      return Scaffold(appBar: appBar, body: Center(child: Text(l10n.errorFailedToLoadData)));
    }

// PRZYGOTOWANIE DANYCH (Zmienne lokalne)
    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    final action = activeService.getMissingDataAction(context, _bill!);
    
    // Nowa, bezpieczna logika flag
    final bool isDocumentMissing = _bill!.noDocument;
    
    // Sprawdzamy stare pole bezpiecznie (tylko jeśli nie jest nullem)
    final bool isLegacyNoSource = _bill!.missingDataInfo?.type == 'NO_SOURCE_DOCUMENT';
    final bool isVotingPending = _bill!.missingDataInfo?.type == 'VOTING_RESULTS_PENDING';

    // Ustalamy co pokazać
    bool showFullPageWarning = isDocumentMissing || isLegacyNoSource;
    bool showVotingWarning = isVotingPending;
    final finalSummarizedBy = _bill!.summaryGeneratedBy;
    final int votesForSejm = _bill!.votesFor ?? 0;
    final int votesAgainstSejm = _bill!.votesAgainst ?? 0;
    final int votesAbstainSejm = _bill!.votesAbstain ?? 0; 
    final String currentVoteDate = _formatDateTime(context, _bill!.date);
    final String currentProcessStartDate = _formatDateTime(context, _bill!.processStartDate);
    final List<String> currentkeyPoints = _bill!.keyPoints;
    final List<DateTime>? upcomingProceedingDates = _bill!.upcomingProceedingDates;
    final int? currentMeetingNumber = _bill!.meetingNumber;
    final int? currentVotingNumber = _bill!.votingNumber;

    // --- TREŚĆ (Widget) ---
    // Budujemy kolumnę z treścią raz, żeby użyć jej w obu wariantach
    
 // Logika tytułu: Użyj AI title, a jak pusty/null -> titleOfficial -> Fallback
    String displayTitle = _bill!.title;
    if (displayTitle.isEmpty || displayTitle == 'No AI title' || displayTitle == 'Brak tytułu' || displayTitle == 'No Title') {
      displayTitle = _bill!.titleOfficial ?? l10n.errorNoDataLegislationInProcess;
    }
    
    // Logika opisu: Ukryj jeśli "Brak opisu" lub pusty
    final bool showDescription = _bill!.description.isNotEmpty && 
                                 _bill!.description != 'Brak opisu' && 
                                 _bill!.description != 'No description';

    Widget contentColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayTitle,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        if (showDescription)
          Text(_bill!.description, style: TextStyle(fontSize: 15, color: Colors.grey[800], height: 1.4)),
        
        // UWAGA: Jeśli action jest null (serwis nie obsłużył noDocument), widget się nie pokaże.
        // Należy zaktualizować getMissingDataAction w serwisie.
        if ((showFullPageWarning || isDocumentMissing) && action != null) 
           Center(child: MissingDataWidget(action: action)),
        
        const SizedBox(height: 24),
        PartiallyExpandableListWidget(
          title: l10n.keyPointsSectionTitle,
          items: currentkeyPoints,
          initiallyVisibleCount: 3,
          itemBuilder: (context, item) => bulletPoint(item as String),
        ),
        const SizedBox(height: 16),
        
        // Linki (Official / Process)
        Builder(builder: (context) {
          final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
          final String? officialUrl = activeService.getOfficialUrl(_bill!);
          final String? processUrl = activeService.getProcessUrl(_bill!);
          final List<Widget> buttonWidgets = [];
          if (officialUrl != null) {
            buttonWidgets.add(Expanded(child: OutlinedButton.icon(icon: const Icon(Icons.article_outlined), label: Text(l10n.officialContentButton, textAlign: TextAlign.center), onPressed: () => _launchUrlHelper(officialUrl), style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)))));
          }
          if (processUrl != null) {
            if (buttonWidgets.isNotEmpty) buttonWidgets.add(const SizedBox(width: 12));
            buttonWidgets.add(Expanded(child: OutlinedButton.icon(icon: const Icon(Icons.account_balance_outlined), label: Text(l10n.processPageButton, textAlign: TextAlign.center), onPressed: () => _launchUrlHelper(processUrl), style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)))));
          }
          if (buttonWidgets.isEmpty) return const SizedBox.shrink();
          return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Row(children: buttonWidgets));
        }),
        
        const SizedBox(height: 24),
        
        // Sekcja Głosowania
        if (showVotingWarning)
          Center(child: MissingDataWidget(action: action!))
        else if (_bill!.date != null) ...[
          Center(child: Builder(builder: (context) {
            final activeService = context.read<ParliamentServiceInterface>();
            return Text(activeService.getVotingTitle(context, _bill!), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
          })),
          Padding(padding: const EdgeInsets.only(top: 4.0, bottom: 8.0), child: Center(child: Text(_formatDateTime(context, _bill!.date), style: TextStyle(fontSize: 13, color: Colors.grey[700], fontStyle: FontStyle.italic)))),
          RepaintBoundary(child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            // Tutaj constraints przyjdą od rodzica (750px na webie), więc kropki będą OK
            final double chartFullWidth = max(150.0, constraints.maxWidth);
            final double calculatedHeightBasedOnWidth = chartFullWidth / 2;
            final double chartHeight = calculatedHeightBasedOnWidth.clamp(120.0, 220.0); 
            return SizedBox(width: chartFullWidth, height: chartHeight, child: CustomPaint(painter: ParliamentaryVotePainter(votesFor: votesForSejm, votesAgainst: votesAgainstSejm, votesAbstain: votesAbstainSejm, labelFor: l10n.votingFor, labelAgainst: l10n.votingAgainst, labelAbstain: l10n.votingAbstainShort)));
          })),
          const SizedBox(height: 8.0),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _buildVoteCountRow(l10n.labelFor, votesForSejm, Colors.green),
            _buildVoteCountRow(l10n.labelAgainst, votesAgainstSejm, Colors.red),
            _buildVoteCountRow(l10n.labelAbstained, votesAbstainSejm, Colors.grey),
          ]),
          const SizedBox(height: 12),
          InkWell(onTap: () {
            final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
            final url = activeService.getVotingPdfUrl(_bill!);
            _launchUrlHelper(url);
          }, child: Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Row(mainAxisSize: MainAxisSize.min, children: [Text(l10n.fullVotingResultsPDF, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor, decoration: TextDecoration.underline, decorationColor: Theme.of(context).primaryColor)), const SizedBox(width: 4), Icon(Icons.open_in_new, size: 18, color: Theme.of(context).primaryColor)]))),
        ] else if (upcomingProceedingDates != null && upcomingProceedingDates.isNotEmpty) ...[
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 12),
            Center(child: Text(l10n.scheduledMeetingsSectionTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87))),
            const SizedBox(height: 12),
            ListView.builder(padding: EdgeInsets.zero, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: upcomingProceedingDates.length, itemBuilder: (context, index) {
              final formattedDate = _formatDateTime(context, upcomingProceedingDates[index]);
              return bulletPoint(formattedDate);
            }),
          ]),
        ],
        
        const SizedBox(height: 12),
        Padding(padding: const EdgeInsets.only(bottom: 24.0), child: Center(child: Builder(builder: (context) {
          final activeService = context.read<ParliamentServiceInterface>();
          return Text(activeService.translateStatus(context, _bill!.status), textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w500, decoration: TextDecoration.underline, decorationColor: Colors.black87));
        }))),
        
        _buildCitizenPoll(context),
        
        const SizedBox(height: 24),
        Text(l10n.additionalInfoSectionTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (_bill!.id.isNotEmpty)
            Text(l10n.printNumberLabel(_bill!.id), style: const TextStyle(fontSize: 15, height: 1.5)),
          if (_bill!.processStartDate != null)
            Text(l10n.processStartDateLabel(currentProcessStartDate), style: const TextStyle(fontSize: 15, height: 1.5)),
          if (_bill!.date != null) 
            Text(l10n.votingDateLabel(currentVoteDate), style: const TextStyle(fontSize: 15, height: 1.5)),
          if (currentMeetingNumber != null)
            Text(l10n.meetingNumberLabel(currentMeetingNumber.toString()), style: const TextStyle(fontSize: 15, height: 1.5)),
          if (currentVotingNumber != null)
            Text(l10n.votingNumberLabel(currentVotingNumber.toString()), style: const TextStyle(fontSize: 15, height: 1.5)),
        ]),
        
        const SizedBox(height: 8),
        Builder(builder: (context) {
          final activeService = context.read<ParliamentServiceInterface>();
          final governmentApiUrl = activeService.governmentApiUrl;
          final footerTextStyle = TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.5);
          
          // Na razie użyjemy helpera _launchUrlHelper z gotowym linkiem, jeśli activeService go dostarcza, lub zbudujemy go ręcznie.
          // Tu prosta wersja: dodajemy klikalny tekst.
          final jsonUrl = "https://lustra.news/lustra-logs/${activeService.source.id}/legislations/${_bill!.id}.json";

          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(l10n.legislationFooterAiDisclaimer, style: footerTextStyle),
            const SizedBox(height: 8),
            if (finalSummarizedBy != null) Padding(padding: const EdgeInsets.only(bottom: 4.0), child: Text('${l10n.legislationFooterModelUsed} $finalSummarizedBy', style: footerTextStyle)),
            Text('${l10n.legislationFooterSourceData} $governmentApiUrl', style: footerTextStyle),
            const SizedBox(height: 8),
             InkWell(
              onTap: () => _launchUrlHelper(jsonUrl),
              child: Text(
                l10n.actionViewSourceJson,
                style: footerTextStyle
              ),
            ),
          ]);
        }),
        
        const SizedBox(height: 16),
        Container(color: Colors.grey[100], padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0), child: SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _reportError, style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300], foregroundColor: Colors.black87, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), padding: const EdgeInsets.symmetric(vertical: 12)), child: Text(l10n.reportErrorButton)))),
        const SizedBox(height: 20),
      ],
    );

    // --- SCAFFOLD ---
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        // Na Webie dodajemy odstępy z góry/dołu
        padding: kIsWeb ? const EdgeInsets.symmetric(vertical: 32.0) : const EdgeInsets.all(16.0), // Mobile: 16.0 padding
        child: kIsWeb 
          ? Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 750),
                child: Container(
                  // Styl "Kartki" na Webie
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(20), blurRadius: 20, offset: const Offset(0, 4))
                    ],
                  ),
                  child: contentColumn, // Wstawiamy przygotowaną kolumnę
                ),
              ),
            )
          : Padding(
              // Na mobile tylko podstawowy padding, bo SingleChildScrollView już ma 16.0? 
              // Chwila, na mobile SingleChildScrollView ma padding: 16.0.
              // Więc tutaj w child dajemy contentColumn bezpośrednio.
              padding: EdgeInsets.zero, 
              child: contentColumn,
            ),
      ),
    );
  }
}
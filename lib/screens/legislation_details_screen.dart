import 'dart:math';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lustra/providers/language_provider.dart';
import 'package:url_launcher/link.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../models/legislation.dart';
import '../providers/interaction_provider.dart';
import '../providers/user_provider.dart';
import '../services/parliament_service_interface.dart';
import '../services/share_service.dart';
import '../services/parliament_manager.dart';
import '../services/tracking_service.dart';
import '../widgets/parliamentary_vote_painter.dart';
import '../widgets/partially_expandable_list_widget.dart';
import '../widgets/citizen_poll_widget.dart';
import '../widgets/missing_data_widget.dart';
import '../widgets/details_app_bar.dart';
import '../widgets/error_report_dialog.dart';
import '../widgets/lists_specific/curated_list_manager_dialog.dart';
import '../../widgets/osint_loader.dart';
import '../../widgets/web_link.dart';


class LegislationDetailsScreen extends StatefulWidget {
  final Legislation? bill;
  final String? legislationId;
  final String? summarizedBy;
  final String? usedPrompt;
  final String? listType;
  final String? initialAction;

  const LegislationDetailsScreen({
    super.key,
    this.bill,
    this.legislationId,
    this.summarizedBy,
    this.usedPrompt,
    this.listType,
    this.initialAction,
  }) : assert(bill != null || legislationId != null, 'Either bill or legislationId must be provided.');

  @override
  State<LegislationDetailsScreen> createState() => _LegislationDetailsScreenState();
}

class _LegislationDetailsScreenState extends State<LegislationDetailsScreen> {
  final ScrollController _pageScrollController = ScrollController();
  final TrackingService _trackingService = TrackingService();
  Legislation? _bill;
  bool _isLoading = false;
  bool _isFetchingDetails = false;
  String? _error;

  String _formatDateTime(BuildContext context, DateTime? date) {
    if (date == null) return AppLocalizations.of(context)!.noDate;
    return intl.DateFormat.yMMMMd(AppLocalizations.of(context)!.localeName).format(date);
  }

  @override
  void dispose() {
    _pageScrollController.dispose();
    super.dispose();
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
  if (widget.initialAction != null) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleInitialAction(widget.initialAction!);
    });
  }
}

void _handleInitialAction(String action) {
  if (!mounted || _bill == null) return;
  
  developer.log('LEGISLATION_SCREEN: Intercepted action: $action', name: 'LegislationDetailsScreen');
  
  if (action == 'share') {
    _shareLegislation();
  } else if (action == 'track') {
    _toggleTracking();
  }
}

Future<void> _toggleTracking() async {
  final l10n = AppLocalizations.of(context)!;
  if (FirebaseAuth.instance.currentUser == null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.mustBeLoggedInToReport)));
    return;
  }

  final activeService = Provider.of<ParliamentManager>(context, listen: false).activeServiceId;
  if (activeService == null) return;

  final interactionProvider = context.read<InteractionProvider>();
  final currentDocType = (_bill!.documentType == 'civic' || widget.listType == 'civic') ? 'civic' : 'bill';
  final isCurrentlyTracked = interactionProvider.isTracked(_bill!.id, docType: currentDocType);
  interactionProvider.toggleTrackingLocally(_bill!.id, !isCurrentlyTracked, docType: currentDocType);

  try {
    await _trackingService.toggleTrackBill(activeService, _bill!.id, docType: currentDocType);
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(!isCurrentlyTracked ? l10n.snackbarAddedToList : l10n.snackbarRemovedFromList),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    if (!kIsWeb && !isCurrentlyTracked && mounted) {
      final userProv = context.read<UserProvider>();
      final messaging = FirebaseMessaging.instance;
      final settings = await messaging.getNotificationSettings();
      
      if (settings.authorizationStatus != AuthorizationStatus.authorized || !userProv.notificationsTrackedBills) {
        final newSettings = await messaging.requestPermission(alert: true, badge: true, sound: true);
        
        if (newSettings.authorizationStatus == AuthorizationStatus.authorized) {
          final token = await messaging.getToken();
          if (token != null) {
            await userProv.updatePreferences(notificationsTrackedBills: true, fcmToken: token);
          }
        }
      }
    }

  } catch (e) {
    interactionProvider.toggleTrackingLocally(_bill!.id, isCurrentlyTracked, docType: currentDocType);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.errorFailedToLoadData)));
    }
  }
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
      final docType = (widget.listType == 'civic') ? 'civic' : 'bill';
      final fetchedBill = await activeService.getLegislationDetails(context, idToFetch, documentType: docType);
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

  Widget _buildCitizenPoll(BuildContext context) {
      final voteTargetType = (_bill!.documentType == 'civic' || widget.listType == 'civic') ? 'civic' : 'legislation';
      return CitizenPollWidget(
        targetType: voteTargetType,
        targetId: _bill!.id,
        itemData: _bill!,
        enablePostVoteAction: true,
        onShare: _shareLegislation,
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
    // 1. Service Instance
    final shareService = ShareService();
    final manager = context.read<ParliamentManager>();
    final langProvider = context.read<LanguageProvider>();

    final parliamentId = manager.activeServiceId;
    final slug = manager.activeSlug;
    final lang = langProvider.appLanguageCode;
    final term = manager.currentTerm ?? 0;

    // 2. Data before bottom sheet.
    final l10n = AppLocalizations.of(context)!;
    final activeService = context.read<ParliamentServiceInterface>();
    final status = activeService.translateStatus(context, _bill!.status);
    final String dynamicVotingTitle = activeService.getVotingTitle(context, _bill!);
    
    showModalBottomSheet(
      context: context,
      builder: (bottomSheetContext) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.crop_square),
                title: Text(l10n.shareAsPost),
                onTap: () {
                  Navigator.of(bottomSheetContext).pop();
                  shareService.shareLegislation(
                    context: context,
                    legislation: _bill!,
                    imageSize: const Size(1080, 1080),
                    l10n: l10n,
                    translatedStatus: status,
                    parliamentId: parliamentId!,
                    slug: slug,
                    lang: lang,
                    term: term,
                    flagAssetPath: activeService.flagAssetPath,
                    parliamentName: activeService.name,
                    votingTitle: dynamicVotingTitle,
                    showMissingDataWarning: _bill!.missingDataInfo != null,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone_android),
                title: Text(l10n.shareAsStory),
                onTap: () {
                  Navigator.of(bottomSheetContext).pop();
                  shareService.shareLegislation(
                    context: context,
                    legislation: _bill!,
                    imageSize: const Size(1080, 1920),
                    l10n: l10n,
                    translatedStatus: status,
                    parliamentId: parliamentId!,
                    slug: slug,
                    lang: lang,
                    term: term,
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


void _reportError() {
  if (FirebaseAuth.instance.currentUser != null) {
    final manager = Provider.of<ParliamentManager>(context, listen: false);
    showErrorReportDialog(
      context: context,
      targetId: _bill!.id,
      targetType: 'legislation',
      sourceId: manager.activeServiceId!,
    );
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
    
    if (manager.isLoading || !manager.isInitialized) {
      return Scaffold(
        appBar: DetailsAppBar(title: l10n.detailsScreenTitle, onShare: null),
        body: OsintLoader(text: l10n.loaderLoadingData)
      );
    }
    if (manager.error != null) {
      return Scaffold(
        appBar: DetailsAppBar(title: l10n.detailsScreenTitle, onShare: null),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(padding: const EdgeInsets.all(16.0), child: Text(l10n.noMPsForSource, textAlign: TextAlign.center)),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () => manager.changeSource(manager.activeServiceId!), child: Text(l10n.tryAgainButton)),
        ])),
      );
    }
    if (_isLoading) {
      return Scaffold(
        appBar: DetailsAppBar(title: l10n.detailsScreenTitle, onShare: null),
        body: OsintLoader(text: l10n.loaderLoadingData)
      );
    }
    if (_error != null) {
      return Scaffold(
        appBar: DetailsAppBar(title: l10n.detailsScreenTitle, onShare: null),
        body: Center(child: Padding(padding: const EdgeInsets.all(16.0), child: Text(_error!, textAlign: TextAlign.center, style: TextStyle(color: Colors.red[700], fontSize: 16))))
      );
    }
    if (_bill == null) {
      return Scaffold(
        appBar: DetailsAppBar(title: l10n.detailsScreenTitle, onShare: null),
        body: Center(child: Text(l10n.errorFailedToLoadData))
      );
    }

    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    final action = activeService.getMissingDataAction(context, _bill!);
    
    final bool isDocumentMissing = _bill!.noDocument;
    
    final bool isLegacyNoSource = _bill!.missingDataInfo?.type == 'NO_SOURCE_DOCUMENT';
    final bool isVotingPending = _bill!.missingDataInfo?.type == 'VOTING_RESULTS_PENDING';

    bool showFullPageWarning = isDocumentMissing || isLegacyNoSource;
    bool showVotingWarning = isVotingPending;
    final finalSummarizedBy = _bill!.summaryGeneratedBy;
    final int votesForSejm = _bill!.votesFor ?? 0;
    final int votesAgainstSejm = _bill!.votesAgainst ?? 0;
    final int votesAbstainSejm = _bill!.votesAbstain ?? 0;
    final int totalSejmVotes = votesForSejm + votesAgainstSejm + votesAbstainSejm;
    final String currentVoteDate = _formatDateTime(context, _bill!.votingDate);
    final String currentProcessStartDate = _formatDateTime(context, _bill!.processStartDate);
    final List<String> currentkeyPoints = _bill!.keyPoints;
    final List<DateTime>? upcomingProceedingDates = _bill!.upcomingProceedingDates;
    final int? currentMeetingNumber = _bill!.meetingNumber;
    final int? currentVotingNumber = _bill!.votingNumber;


    String displayTitle = _bill!.title;
    if (displayTitle.isEmpty || displayTitle == 'No AI title') {
      displayTitle = _bill!.titleOfficial ?? l10n.errorNoDataLegislationInProcess;
    }
    
    final bool showDescription = _bill!.description.isNotEmpty && 
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
        
        if ((showFullPageWarning || isDocumentMissing) && action != null) 
           Center(child: MissingDataWidget(action: action)),
        
        const SizedBox(height: 24),
        PartiallyExpandableListWidget(
          title: l10n.keyPointsSectionTitle,
          items: currentkeyPoints,
          initiallyVisibleCount: 20,
          itemBuilder: (context, item) => bulletPoint(context, item as String),
        ),
        const SizedBox(height: 16),
        
        Builder(builder: (context) {
          final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
          final String? officialUrl = activeService.getOfficialUrl(_bill!);
          final String? processUrl = activeService.getProcessUrl(_bill!);
          final List<Widget> buttonWidgets = [];
          
          if (officialUrl != null) {
            buttonWidgets.add(
              Link(
                uri: Uri.parse(officialUrl),
                target: LinkTarget.blank,
                builder: (context, followLink) => OutlinedButton.icon(
                  icon: const Icon(Icons.article_outlined),
                  label: Text(l10n.officialContentButton, textAlign: TextAlign.center),
                  onPressed: followLink,
                  style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12))
                ),
              )
            );
          }
          if (processUrl != null) {
            buttonWidgets.add(
              Link(
                uri: Uri.parse(processUrl),
                target: LinkTarget.blank,
                builder: (context, followLink) => OutlinedButton.icon(
                  icon: const Icon(Icons.account_balance_outlined),
                  label: Text(l10n.processPageButton, textAlign: TextAlign.center),
                  onPressed: followLink,
                  style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12))
                ),
              )
            );
          }
          
          final interactionProvider = context.watch<InteractionProvider>();
          final currentDocType = (_bill!.documentType == 'civic' || widget.listType == 'civic') ? 'civic' : 'bill';
          final isCurrentlyTracked = interactionProvider.isTracked(_bill!.id, docType: currentDocType);

          buttonWidgets.add(
            OutlinedButton.icon(
              icon: Icon(isCurrentlyTracked ? Icons.notifications_active : Icons.notifications_none,
                      color: isCurrentlyTracked ? Theme.of(context).primaryColor : null),
              label: Text(
                isCurrentlyTracked ? l10n.actionTracked : l10n.actionTrack,
                textAlign: TextAlign.center,
                style: TextStyle(color: isCurrentlyTracked ? Theme.of(context).primaryColor : null),
              ),
              onPressed: _toggleTracking,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                side: isCurrentlyTracked ? BorderSide(color: Theme.of(context).primaryColor) : null,
              ),
            )
          );

          final userProv = context.watch<UserProvider>();
          if (userProv.createdLists.isNotEmpty) {
            buttonWidgets.add(
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: Text(l10n.buttonAddToList, textAlign: TextAlign.center),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) => CuratedListManagerDialog(
                      bill: _bill!,
                      listType: widget.listType ?? 'bill',
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            );
          }

          if (buttonWidgets.isEmpty) return const SizedBox.shrink();

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 600;

                if (isMobile) {
                  final List<Widget> mobileRows = [];
                  for (int i = 0; i < buttonWidgets.length; i += 2) {
                    mobileRows.add(
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: buttonWidgets[i]),
                              if (i + 1 < buttonWidgets.length) ...[
                                const SizedBox(width: 8.0),
                                Expanded(child: buttonWidgets[i + 1]),
                              ]
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: mobileRows,
                  );
                } else {
                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: buttonWidgets.map((w) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: w,
                        ),
                      )).toList(),
                    ),
                  );
                }
              },
            ),
          );
        }),
        
        const SizedBox(height: 16),
        
        if (showVotingWarning)
          Center(child: MissingDataWidget(action: action!))
        else if (_bill!.votingDate != null) ...[
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0, bottom: 8.0),
                                  child: Text(
                                    currentVoteDate,
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
          const SizedBox(height: 12),
          Builder(builder: (context) {
            final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
            final urlString = activeService.getVotingPdfUrl(_bill!);
            
            if (urlString == null || urlString.isEmpty) return const SizedBox.shrink();

            return Link(
              uri: Uri.parse(urlString),
              target: LinkTarget.blank,
              builder: (context, followLink) {
                return InkWell(
                  onTap: followLink,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.fullVotingResultsPDF, 
                          style: TextStyle(
                            fontSize: 15, 
                            fontWeight: FontWeight.w500, 
                            color: Theme.of(context).primaryColor, 
                            decoration: TextDecoration.underline, 
                            decorationColor: Theme.of(context).primaryColor
                          )
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.open_in_new, size: 18, color: Theme.of(context).primaryColor)
                      ]
                    )
                  )
                );
              }
            );
          }),
        ] else if (upcomingProceedingDates != null && upcomingProceedingDates.isNotEmpty) ...[
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 12),
            Center(child: Text(l10n.scheduledMeetingsSectionTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87))),
            const SizedBox(height: 12),
            ListView.builder(padding: EdgeInsets.zero, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: upcomingProceedingDates.length, itemBuilder: (context, index) {
              final formattedDate = _formatDateTime(context, upcomingProceedingDates[index]);
              return bulletPoint(context, formattedDate);
            }),
          ]),
        ],

        const SizedBox(height: 32),
        Builder(builder: (context) {
          final activeService = context.read<ParliamentServiceInterface>();
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Expanded(
                child: _bill!.lastStatus != null
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
                                    activeService.translateStatus(context, _bill!.lastStatus!),
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
                    (_bill!.documentType == 'civic' || widget.listType == 'civic')
                        ? Icons.history_edu 
                        : Icons.gavel,
                    size: (_bill!.documentType == 'civic' || widget.listType == 'civic') ? 62.0 : 48.0,
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
                        activeService.translateStatus(context, _bill!.status),
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
          );
        }),
        const SizedBox(height: 24),
        
        _buildCitizenPoll(context),
        
        const SizedBox(height: 24),
        Text(l10n.additionalInfoSectionTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (_bill!.id.isNotEmpty)
            Text(l10n.printNumberLabel(_bill!.id), style: const TextStyle(fontSize: 15, height: 1.5)),

          if (_bill!.sponsor != null && _bill!.sponsor!['name'] != null)
            Builder(builder: (context) {
              final sponsorId = _bill!.sponsor!['id'];
              final sponsorName = _bill!.sponsor!['name'];
              final labelText = "${l10n.legislationSponsorLabel}: $sponsorName";
    
              const textStyle = TextStyle(fontSize: 15, height: 1.5); 
              if (sponsorId == null || sponsorId.isEmpty) {
                return Text(labelText, style: textStyle);
              }
              
              final manager = context.read<ParliamentManager>();
              final slug = manager.activeSlug;
              final lang = context.read<LanguageProvider>().appLanguageCode;
              final term = _bill!.term; 

              final compositeId = '${_bill!.term}_$sponsorId';
              final internalPath = '/$lang/$slug/$term/members/$compositeId';

              return WebLink(
                path: internalPath,
                builder: (context, onTapCallback) => InkWell(
                  onTap: onTapCallback,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          labelText,
                          style: textStyle.copyWith(color: Colors.black87),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.launch, size: 14, color: Colors.grey[600]), 
                    ],
                  ),
                ),
              );
            }),
          if (_bill!.processStartDate != null)
            Text(l10n.processStartDateLabel(currentProcessStartDate), style: const TextStyle(fontSize: 15, height: 1.5)),
          if (_bill!.votingDate != null) 
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
          
          // Easy version - clickable text
          final jsonUrl = "https://storage.googleapis.com/lustra-logs/${activeService.source.id}/legislations/${_bill!.id}.json";

          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(l10n.legislationFooterAiDisclaimer, style: footerTextStyle),
            const SizedBox(height: 8),
            if (finalSummarizedBy != null) Padding(padding: const EdgeInsets.only(bottom: 4.0), child: Text('${l10n.legislationFooterModelUsed} $finalSummarizedBy', style: footerTextStyle)),
            Text('${l10n.legislationFooterSourceData} $governmentApiUrl', style: footerTextStyle),
            const SizedBox(height: 8),
             Link(
               uri: Uri.parse(jsonUrl),
               target: LinkTarget.blank,
               builder: (context, followLink) => InkWell(
                onTap: followLink,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.actionViewSourceJson,
                      style: footerTextStyle
                    ),
                    const SizedBox(width: 6),
                    Icon(Icons.launch, size: 14, color: Colors.grey[700]),
                  ],
                ),
              ),
            ),
          ]);
        }),
        
        const SizedBox(height: 16),
        Container(color: Colors.grey[100], padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0), child: SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _reportError, style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300], foregroundColor: Colors.black87, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), padding: const EdgeInsets.symmetric(vertical: 12)), child: Text(l10n.reportErrorButton)))),
        const SizedBox(height: 20),
      ],
    );

    final bool isDesktopWeb = kIsWeb && MediaQuery.of(context).size.width > 750;

    Widget contentBody = SingleChildScrollView(
        controller: _pageScrollController,
        physics: isDesktopWeb ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
        padding: kIsWeb ? const EdgeInsets.symmetric(vertical: 32.0) : const EdgeInsets.all(16.0),
        child: kIsWeb 
          ? Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 750),
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(20), blurRadius: 20, offset: const Offset(0, 4))
                    ],
                  ),
                  child: contentColumn,
                ),
              ),
            )
        : Padding(
          padding: EdgeInsets.zero, 
          child: contentColumn,
        ),
      );

    return Scaffold(
      appBar: DetailsAppBar(
        title: l10n.detailsScreenTitle,
        onShare: _shareLegislation,
        isShareEnabled: !_isFetchingDetails,
      ),
      body: Listener(
        onPointerDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        child: SelectionArea(
          child: isDesktopWeb
              ? WebSmoothScroll(
                  controller: _pageScrollController,
                  scrollAnimationLength: 450,
                  scrollSpeed: 0.7,
                  curve: Curves.easeOut,
                  child: contentBody,
                )
              : contentBody,
        ),
      ),
    );
  }
}
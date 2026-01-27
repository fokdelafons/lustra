import 'dart:math';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lustra/providers/translators.dart';
import 'package:lustra/providers/language_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lustra/models/home_screen_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/legislation.dart';
import '../services/parliament_service_interface.dart';
import '../services/share_service.dart';
import '../services/parliament_manager.dart';
import '../widgets/parliamentary_vote_painter.dart';
import '../widgets/partially_expandable_list_widget.dart';
import '../widgets/citizen_poll_widget.dart';
import '../widgets/missing_data_widget.dart';
import '../widgets/details_app_bar.dart';
import '../widgets/error_report_dialog.dart';


class LegislationDetailsScreen extends StatefulWidget {
  final Legislation? bill;
  final String? legislationId;
  final String? summarizedBy;
  final String? usedPrompt;
  final String? listType;

  const LegislationDetailsScreen({
    super.key,
    this.bill,
    this.legislationId,
    this.summarizedBy,
    this.usedPrompt,
    this.listType,
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
  // Empty, ready for future
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
    final voteTargetType = (widget.listType == 'civic') ? 'civic' : 'legislation';

    return CitizenPollWidget(
      targetType: voteTargetType,
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

    // 3. Adapter before bottom sheet.
    final shareableItem = HomeScreenLegislationItem(
      id: _bill!.id,
      title: _bill!.title,
      summary: _bill!.description,
      status: _bill!.status,
      votingDate: _bill!.votingDate,
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
                    legislation: shareableItem,
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
                    legislation: shareableItem,
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
        body: const Center(child: CircularProgressIndicator())
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
        body: const Center(child: CircularProgressIndicator())
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
              Expanded(
                child: Link(
                  uri: Uri.parse(officialUrl),
                  target: LinkTarget.blank,
                  builder: (context, followLink) => OutlinedButton.icon(
                    icon: const Icon(Icons.article_outlined),
                    label: Text(l10n.officialContentButton, textAlign: TextAlign.center),
                    onPressed: followLink,
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12))
                  ),
                ),
              )
            );
          }
          if (processUrl != null) {
            if (buttonWidgets.isNotEmpty) buttonWidgets.add(const SizedBox(width: 12));
            buttonWidgets.add(
              Expanded(
                child: Link(
                  uri: Uri.parse(processUrl),
                  target: LinkTarget.blank,
                  builder: (context, followLink) => OutlinedButton.icon(
                    icon: const Icon(Icons.account_balance_outlined),
                    label: Text(l10n.processPageButton, textAlign: TextAlign.center),
                    onPressed: followLink,
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12))
                  ),
                ),
              )
            );
          }
          if (buttonWidgets.isEmpty) return const SizedBox.shrink();
          return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Row(children: buttonWidgets));
        }),
        
        const SizedBox(height: 24),
        
        if (showVotingWarning)
          Center(child: MissingDataWidget(action: action!))
        else if (_bill!.votingDate != null) ...[
          Center(child: Builder(builder: (context) {
            final activeService = context.read<ParliamentServiceInterface>();
            return Text(activeService.getVotingTitle(context, _bill!), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
          })),
          Padding(padding: const EdgeInsets.only(top: 4.0, bottom: 8.0), child: Center(child: Text(_formatDateTime(context, _bill!.votingDate), style: TextStyle(fontSize: 13, color: Colors.grey[700], fontStyle: FontStyle.italic)))),
          RepaintBoundary(child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
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
              final fullWebUrl = kIsWeb 
                  ? Uri.parse(Uri.base.origin + internalPath)
                  : Uri.parse('https://lustra.dev$internalPath');

              return Link(
                uri: fullWebUrl,
                target: LinkTarget.blank,
                builder: (context, followLink) {
                  return InkWell(
                    onTap: () {
                      if (kIsWeb) {
                        followLink?.call();
                      } else {
                        context.push(internalPath);
                      }
                    },
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
                  );
                },
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

    return Scaffold(
      appBar: DetailsAppBar(
        title: l10n.detailsScreenTitle,
        onShare: _shareLegislation,
        isShareEnabled: !_isFetchingDetails,
      ),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
import 'dart:developer' as developer;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lustra/providers/language_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/link.dart';

import '../models/mp.dart';
import '../services/parliament_service_interface.dart';
import '../services/share_service.dart';
import '../services/parliament_manager.dart';
import '../widgets/details_app_bar.dart';
import '../widgets/error_report_dialog.dart';
import '../widgets/citizen_poll_widget.dart';

// --- LEGACY CODE --- 
// potential for some rework

class MPDetailsScreen extends StatefulWidget {
  final MP? mp;
  final String? mpId;

  const MPDetailsScreen({
    super.key,
    this.mp,
    this.mpId,
  }) : assert(mp != null || mpId != null, 'Either mp or mpId must be provided.');

  @override
  MPDetailsScreenState createState() => MPDetailsScreenState();
}
class MPDetailsScreenState extends State<MPDetailsScreen> with SingleTickerProviderStateMixin {
  MP? _mp;
  bool _isInitialized = false;
  bool _isLoading = true;
  String? _error;
  late TabController _tabController;
  List<ImportantVote> _mpVotings = [];
  List<InterpellationPreview> _mpInterpellations = [];
  bool _isLoadingVotings = false;
  String? _votingsError;
  bool _votingsLoaded = false;
  bool _isLoadingInterpellations = false;
  String? _interpellationsError;
  bool _interpellationsLoaded = false;
  static const int _initialVotingsLimit = 4;
  static const int _moreVotingsLimit = 20;
  String? _lastVoteId;
  bool _hasMoreVotings = true;
  bool _isLoadingMoreVotings = false;
  static const int _initialInterpellationsLimit = 3;
  static const int _moreInterpellationsLimit = 20;
  String? _lastInterpellationId;
  bool _hasMoreInterpellations = true;
  bool _isLoadingMoreInterpellations = false;

@override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    if (widget.mp != null) {
      _mp = widget.mp;
      _isLoading = false;
      } else if (widget.mpId != null) {
       _mp = MP.empty().copyWith(id: widget.mpId!);
       _isLoading = true; 
       WidgetsBinding.instance.addPostFrameCallback((_) {
          _fetchVotings(isRefresh: true, forceRefresh: false);
       });
    }
  }

@override
void didChangeDependencies() {
  super.didChangeDependencies();
  if (!_isInitialized && _mp != null) {
    _isInitialized = true;
    _initializeScreenState();
  }
}

void _initializeScreenState() {
  developer.log('MPDetailsScreen: _initializeScreenState - Initial _mp.id: ${_mp!.id}, imageUrl: ${_mp!.imageUrl}');
  _mpVotings = []; _isLoadingVotings = false; _votingsError = null; _votingsLoaded = false; _lastVoteId = null; _hasMoreVotings = true;
  _mpInterpellations = []; _isLoadingInterpellations = false; _interpellationsError = null; _interpellationsLoaded = false; _lastInterpellationId = null; _hasMoreInterpellations = true;
  _tabController.removeListener(_onTabChanged);
  _tabController.addListener(_onTabChanged);
  _fetchVotings(isRefresh: false, forceRefresh: false);
}
void _onTabChanged() {
  final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
  final tabs = activeService.getMPActivityTabs(context);
  if (tabs.length < 2) return;
  if (_tabController.index == 1 && !_interpellationsLoaded && !_isLoadingInterpellations) {
    if (_mpInterpellations.isEmpty) {
      _fetchInterpellations(isRefresh: false, forceRefresh: false);
    }
  }
}

@override
void didUpdateWidget(MPDetailsScreen oldWidget) {
  super.didUpdateWidget(oldWidget);
  final oldId = oldWidget.mp?.id ?? oldWidget.mpId;
  final newId = widget.mp?.id ?? widget.mpId;
  if (oldId != newId) {
    developer.log('MPDetailsScreen: Wykryto zmianę posła. Resetowanie stanu.', name: 'didUpdateWidget');
    _isInitialized = false;
    _mp = widget.mp;
    _isLoading = true;
    _error = null;
    if (widget.mp != null) {
       _isLoading = false;
      } else if (widget.mpId != null) {
      _mp = MP.empty().copyWith(id: widget.mpId!);
      _isLoading = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
         _fetchVotings(isRefresh: true);
      });
    }
    setState(() {});
  }
}

  Future<void> _fetchVotings({bool isRefresh = false, bool forceRefresh = false}) async {
    developer.log('MPDetailsScreen: _fetchVotings CALLED for MP ID: ${_mp!.id}, isRefresh: $isRefresh');
    if (!mounted) {
      developer.log('MPDetailsScreen: _fetchVotings - Widget not mounted. Aborting.');
      return;
    }
    if (_mp!.id.isEmpty) { developer.log('MPDetailsScreen: _fetchVotings - MP ID is empty. Aborting.'); return;}
    if ((isRefresh && _isLoadingVotings) || (!isRefresh && _isLoadingMoreVotings)) return;
    if (!isRefresh && !_hasMoreVotings) return;
    setState(() {
      if (isRefresh) {
        _isLoadingVotings = true;
        _mpVotings = [];
        _lastVoteId = null;
        _hasMoreVotings = true;
      } else {
        _isLoadingMoreVotings = true;
      }
      _votingsError = null;
    });
    try {
      final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
      developer.log('MPDetailsScreen: _fetchVotings - Calling service for ID: ${_mp!.id}, term: ${activeService.currentTerm}, limit: ${isRefresh ? _initialVotingsLimit : _moreVotingsLimit} (initial fetch)');
      final tempMPWithVotings = await activeService.getMPData(
        context, 
        _mp!.id, 
        dataType: 'votings',
        forceRefresh: forceRefresh,
        params: {
        'limit': _mpVotings.isEmpty ? _initialVotingsLimit : _moreVotingsLimit,
        if (_lastVoteId != null && !isRefresh) 'startAfterDocId': _lastVoteId,
      }
      );
      if (!mounted) return;
      if (tempMPWithVotings != null) {
        List<ImportantVote> fetchedVotings = tempMPWithVotings.votings;
        bool serverHasMore = tempMPWithVotings.hasMoreVotings;
        String? serverLastVoteId = tempMPWithVotings.lastVoteId;
        developer.log('MPDetailsScreen: _fetchVotings - Service returned. Votings count: ${fetchedVotings.length}, serverHasMore: $serverHasMore, serverLastVoteId: $serverLastVoteId');
        
        setState(() {
          _mp = tempMPWithVotings;
          _mpVotings.addAll(fetchedVotings);
          _votingsLoaded = true;
          _lastVoteId = serverLastVoteId; 
          _hasMoreVotings = serverHasMore;
          if (_isLoading) _isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _votingsError = AppLocalizations.of(context)!.errorLoadVotings;
        _votingsLoaded = true;
        developer.log("MPDetailsScreen: _fetchVotings - ERROR: $e, StackTrace: ${StackTrace.current}");
      });
    } finally {
      if(mounted) {
        setState(() {
          _isLoadingVotings = false;
          _isLoadingMoreVotings = false;
        });
      }
    }
  }

  Future<void> _fetchInterpellations({bool isRefresh = false, bool forceRefresh = false}) async {
    if (!mounted) return;
    if ((isRefresh && _isLoadingInterpellations) || (!isRefresh && _isLoadingMoreInterpellations)) return;
    if (!isRefresh && !_hasMoreInterpellations) return;
    if (_mp!.id.isEmpty) return;
    developer.log('MPDetailsScreen: _fetchInterpellations CALLED for MP ID: ${_mp!.id}, isRefresh: $isRefresh');
    setState(() {
      if (isRefresh) {
        _isLoadingInterpellations = true;
        _mpInterpellations = [];
        _lastInterpellationId = null;
        _hasMoreInterpellations = true;
      } else {
        _isLoadingMoreInterpellations = true;
      }
      _interpellationsError = null;
    });
    try {
      final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
      
      final tabs = activeService.getMPActivityTabs(context);
      if (tabs.length < 2) {
        setState(() => _isLoadingInterpellations = false);
        return;
      }
      final String dataTypeForTab = tabs[1].type;

      developer.log('MPDetailsScreen: _fetchInterpellations - Calling service for ID: ${_mp!.id}, dataType: $dataTypeForTab');
      final tempMPWithInterpellations = await activeService.getMPData(
        context, 
        _mp!.id, 
        dataType: dataTypeForTab, // dynamic
        forceRefresh: forceRefresh,
        params: {
          'limit': isRefresh ? _initialInterpellationsLimit : _moreInterpellationsLimit,
          if (_lastInterpellationId != null && !isRefresh) 'startAfterDocId': _lastInterpellationId,
        },
      );
      if (!mounted) return;
      if (tempMPWithInterpellations != null) {
        List<InterpellationPreview> fetchedInterpellations = tempMPWithInterpellations.interpellationsPreview;
        bool serverHasMore = tempMPWithInterpellations.hasMoreInterpellations;
        String? serverLastInterpellationId = tempMPWithInterpellations.lastInterpellationId;
        developer.log('MPDetailsScreen: _fetchInterpellations - Service returned. Count: ${fetchedInterpellations.length}, HasMore: $serverHasMore, LastId: $serverLastInterpellationId');
        setState(() {
          _mpInterpellations.addAll(fetchedInterpellations);
          _interpellationsLoaded = true;
          _lastInterpellationId = serverLastInterpellationId;
          _hasMoreInterpellations = serverHasMore;
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _interpellationsError = AppLocalizations.of(context)!.errorLoadInterpellations;
        _interpellationsLoaded = true;
        developer.log("MPDetailsScreen: _fetchInterpellations - ERROR: $e, StackTrace: ${StackTrace.current}");
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingInterpellations = false;
          _isLoadingMoreInterpellations = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

void _shareMPDetails() {
    final shareService = ShareService();
    final l10n = AppLocalizations.of(context)!;
    final mpForShare = _mp!;

    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    final tenureYears = activeService.calculateTotalTenureInYears(mpForShare);
    final tenureText = tenureYears > 0 
      ? l10n.parliamentaryTenureSectionTitle(tenureYears) 
      : l10n.parliamentaryTenureNoData;
    final manager = context.read<ParliamentManager>();
    final langProvider = context.read<LanguageProvider>();
    final parliamentId = manager.activeServiceId;
    final slug = manager.activeSlug;
    final lang = langProvider.appLanguageCode;
    final term = manager.currentTerm ?? 0;
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
                  shareService.shareDeputy(
                    context: context,
                    deputy: mpForShare,
                    imageSize: const Size(1080, 1080),
                    l10n: l10n,
                    tenureText: tenureText,
                    recentVotings: _mpVotings,
                    parliamentId: parliamentId!,
                    slug: slug,
                    lang: lang,
                    term: term,
                    flagAssetPath: activeService.flagAssetPath,
                    parliamentName: activeService.name,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone_android),
                title: Text(l10n.shareAsStory),
                onTap: () {
                  Navigator.of(bottomSheetContext).pop();
                  shareService.shareDeputy(
                    context: context,
                    deputy: mpForShare,
                    imageSize: const Size(1080, 1920),
                    l10n: l10n,
                    tenureText: tenureText,
                    recentVotings: _mpVotings,
                    parliamentId: parliamentId!,
                    slug: slug,
                    lang: lang,
                    term: term,
                    flagAssetPath: activeService.flagAssetPath,
                    parliamentName: activeService.name,
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
        targetId: _mp!.id,
        targetType: 'deputy',
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
  final ThemeData theme = Theme.of(context);
  final manager = Provider.of<ParliamentManager>(context);
  if (manager.isLoading || !manager.isInitialized) {
    return Scaffold(
      appBar: DetailsAppBar(title: '', onShare: null),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
  if (manager.error != null) {
    return Scaffold(
      appBar: DetailsAppBar(title: l10n.errorFailedToLoadData, onShare: null),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(l10n.noMPsForSource, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => manager.changeSource(manager.activeServiceId!),
              child: Text(l10n.tryAgainButton),
            ),
          ],
        ),
      ),
    );
  }
  if (_isLoading) {
    return Scaffold(
      appBar: DetailsAppBar(title: '', onShare: null),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
  if (_error != null) {
    return Scaffold(
      appBar: DetailsAppBar(title: l10n.errorFailedToLoadData, onShare: null),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(_error!, textAlign: TextAlign.center, style: TextStyle(color: Colors.red[700], fontSize: 16)),
      )),
    );
  }
  final TextTheme textTheme = theme.textTheme;
  final TextStyle? sectionTitleStyle = textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600);
  final TextStyle? subSectionTitleStyle = textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);
  final displayMP = _mp!;

return Scaffold(
      appBar: DetailsAppBar(
        title: l10n.mpDetailsScreenTitle(displayMP.firstName, displayMP.lastName),
        onShare: _shareMPDetails,
        isShareEnabled: !(_isLoadingVotings),
      ),
      body: kIsWeb
        ? SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 750),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 32.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withAlpha(20), blurRadius: 20, offset: const Offset(0, 4))],
                  ),
                  child: _buildContent(theme, textTheme, sectionTitleStyle, subSectionTitleStyle),
                ),
              ),
            ),
          )
        : SingleChildScrollView(
            child: _buildContent(theme, textTheme, sectionTitleStyle, subSectionTitleStyle),
          ),
    );
  }

  Widget _buildContent(ThemeData theme, TextTheme textTheme, TextStyle? sectionTitleStyle, TextStyle? subSectionTitleStyle) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildSectionTitle(l10n.socialPollSectionTitle, sectionTitleStyle),
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildSupportSectionContent(),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle(l10n.parliamentaryActivitySectionTitle, sectionTitleStyle),
            _buildParliamentaryActivityCard(subSectionTitleStyle),
            const SizedBox(height: 24),
            _buildParliamentaryTenureSection(sectionTitleStyle, subSectionTitleStyle),
            const SizedBox(height: 8),
            Consumer<ParliamentServiceInterface>(
              builder: (context, activeService, child) {
                final disclaimerText = activeService.getHistoricalDataDisclaimer(context);
                if (disclaimerText != null) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      disclaimerText,
                      style: TextStyle(fontSize: 11, color: Colors.grey[600], fontStyle: FontStyle.italic),
                      textAlign: TextAlign.start,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            const SizedBox(height: 24),
            _buildGenericDetailSection(
              context.read<ParliamentServiceInterface>().getMPPersonalDetails(context, _mp!),
              sectionTitleStyle,
            ),
            if (_mp!.email.isNotEmpty) ...[
              _buildSectionTitle(l10n.contactSectionTitle, sectionTitleStyle),
              _buildContactInfo(context, _mp!),
              const SizedBox(height: 12),
            ],
            Builder(
              builder: (context) {
                final activeService = context.read<ParliamentServiceInterface>();
                final governmentApiUrl = activeService.governmentApiUrl;
                final footerTextStyle = TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.5);
                final l10n = AppLocalizations.of(context)!;
                return Text(
                  '${l10n.legislationFooterSourceData} $governmentApiUrl',
                  style: footerTextStyle
                );
              }
            ),
            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _reportError,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black87,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(l10n.reportErrorButton),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
  }

  Widget _buildSectionTitle(String title, TextStyle? style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title, style: style),
    );
  }

  Widget _buildHeader() {
    final currentMP = _mp!;
    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    final headerDetails = activeService.getMPHeaderDetails(context, currentMP);
    final textStyle = TextStyle(fontSize: 16, color: Colors.grey[800], fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: 'mp-photo-${currentMP.id}',
          child: currentMP.imageUrl != null
              ? Container(
                  width: 120,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(currentMP.imageUrl!),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) {
                        developer.log('MPDetailsScreen: _buildHeader - NetworkImage Error: $exception for URL: ${currentMP.imageUrl}');
                      },
                    ),
                  ),
                )
              : Container(
                  width: 120,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.person, size: 60, color: Colors.white),
                ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${currentMP.firstName} ${currentMP.lastName}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              ...headerDetails.map((detail) {
                Widget itemWidget;
                if (detail.value != null) {
                  itemWidget = RichText(
                    text: TextSpan(
                      style: textStyle,
                      children: [
                        TextSpan(text: detail.label),
                        TextSpan(text: detail.value, style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  );
                } else {
                  itemWidget = Text(detail.label, style: textStyle);
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: itemWidget,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGenericDetailSection(MPDetailSection? section, TextStyle? titleStyle) {
    if (section == null || section.items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(section.title, titleStyle),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: section.items.asMap().entries.map((entry) {
                int idx = entry.key;
                MPDetailItem item = entry.value;
                return Column(
                  children: [
                    _buildInfoRow(item.label, item.value ?? ''),
                    if (idx < section.items.length - 1)
                      const SizedBox(height: 8.0),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildParliamentaryActivityCard(TextStyle? subSectionTitleStyle) {
    return Card(
          margin: EdgeInsets.zero, 
          child: Padding(
            padding: const EdgeInsets.all(16.0), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Builder(
                builder: (context) {
                  final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
                  final tabsInfo = activeService.getMPActivityTabs(context);
                  return TabBar(
                    controller: _tabController,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.grey[600],
                    indicatorColor: Theme.of(context).primaryColor,
                    tabs: tabsInfo.map((tab) => Tab(text: tab.title)).toList(),
                  );
                }
              ),
                SizedBox(
                  height: 400, 
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildVotingsTabContent(_mpVotings, subSectionTitleStyle),
                      _buildInterpellationsTabContent(_mpInterpellations, subSectionTitleStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }

  Widget _buildParliamentaryTenureSection(TextStyle? mainTitleStyle, TextStyle? itemTitleStyle) {
    final l10n = AppLocalizations.of(context)!;
    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    final tenureSection = activeService.getMPTenureDetails(context, _mp!);

    if (tenureSection == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(tenureSection.title, style: mainTitleStyle),
              const SizedBox(width: 8),
              Tooltip(
                message: l10n.tenureTooltip,
                triggerMode: TooltipTriggerMode.tap,
                showDuration: const Duration(seconds: 4),
                child: Icon(
                  Icons.info_outline,
                  size: (mainTitleStyle?.fontSize ?? 20) * 0.85,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tenureSection.items.length,
              itemBuilder: (context, index) {
                final item = tenureSection.items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    item.label,
                    style: itemTitleStyle?.copyWith(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 12, thickness: 0.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAttendancePercentageWidget(BuildContext context, double percentage, String? mandateCoverage) {
    final l10n = AppLocalizations.of(context)!;
    final int roundedPercentage = percentage.round();
    String numberText = '$roundedPercentage%';
    Color textColor;
    bool addExclamation = false;
    if (percentage >= 95) {
      textColor = Colors.green;
    } else if (percentage >= 90) {
      textColor = Colors.yellow.shade700;
    } else if (percentage >= 85) {
      textColor = Colors.orange;
    } else if (percentage >= 65) {
      textColor = Colors.red;
    } else {
      textColor = Colors.red;
      addExclamation = true;
    }
    String displayText = addExclamation ? '$numberText !' : numberText;
    String baseDisclaimer = l10n.attendanceTooltipBase;
    String tooltipMessage = baseDisclaimer;
    if (mandateCoverage == 'PARTIAL') {
      tooltipMessage += l10n.attendanceTooltipPartialMandate;
    } else if (mandateCoverage == 'UNKNOWN') {
      tooltipMessage += l10n.attendanceTooltipWarning;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          displayText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: textColor,
          ),
        ),
        const SizedBox(width: 4),
        Tooltip(
          message: tooltipMessage,
          triggerMode: TooltipTriggerMode.tap,
          showDuration: const Duration(seconds: 4),
          child: Icon(Icons.info_outline, size: 22, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildVotingsTabContent(List<ImportantVote> votes, TextStyle? titleStyle) {
    final l10n = AppLocalizations.of(context)!;
    final voteTextStyle = TextStyle(
      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize ?? 14,
    );
    final bool attendanceAvailable = _mp!.attendancePercentage != null;
    if (!attendanceAvailable) {
      if (_isLoadingVotings && votes.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
      if (_votingsError != null && votes.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_votingsError ?? l10n.authErrorUnexpected, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _fetchVotings(isRefresh: true),
                child: Text(l10n.tryAgainButton),
              )
            ],
          ),
        ),
      );
    }
  }

    List<Widget> listChildren = [];
    if (attendanceAvailable) {
      listChildren.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                l10n.attendanceLabel,
                style: voteTextStyle.copyWith(fontSize: (voteTextStyle.fontSize ?? 14) + 1),
                textAlign: TextAlign.center,
              ),
              _buildAttendancePercentageWidget(
                context,
                _mp!.attendancePercentage!,
                _mp!.mandateCoverage,
              ),
            ],
          ),
        )
      );

      bool showDividerAfterAttendance =
          (_isLoadingVotings && votes.isEmpty) ||
          (_votingsError != null && votes.isEmpty) ||
          votes.isNotEmpty ||
          (_votingsLoaded && votes.isEmpty && !_hasMoreVotings) ||
          _isLoadingMoreVotings ||
          _hasMoreVotings;
      if (showDividerAfterAttendance) {
           listChildren.add(const Divider(height: 1, thickness: 1.2));
      }
    }

    if (votes.isNotEmpty) {
      for (int i = 0; i < votes.length; i++) {
        final vote = votes[i];
        listChildren.add(
        ListTile(
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                if (vote.votingUrl != null && vote.votingUrl!.isNotEmpty) ...[
                  Tooltip(
                    message: AppLocalizations.of(context)!.votingSourceTooltip,
                    child: Link(
                      uri: Uri.parse(vote.votingUrl!),
                      target: LinkTarget.blank,
                      builder: (context, followLink) => InkWell(
                        customBorder: const CircleBorder(),
                        onTap: followLink,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.launch, size: 20, color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 1,
                    color: Colors.grey[300],
                    margin: const EdgeInsets.only(right: 12.0),
                  ),
                ],
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final manager = context.read<ParliamentManager>();
                      final slug = manager.activeSlug;
                      final lang = context.read<LanguageProvider>().appLanguageCode;
                      final term = manager.currentTerm;

                      if (vote.link.isNotEmpty) {
                         final internalPath = '/$lang/$slug/$term/legislations/${vote.link}';
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
                               child: Text(
                                  vote.title,
                                  style: voteTextStyle.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                               ),
                             );
                           }
                         );
                      } 
                      else if (vote.votingUrl != null && vote.votingUrl!.isNotEmpty) {
                         return Link(
                           uri: Uri.parse(vote.votingUrl!),
                           target: LinkTarget.blank,
                           builder: (context, followLink) => InkWell(
                             onTap: followLink,
                             child: Text(
                                vote.title,
                                style: voteTextStyle.copyWith(color: Theme.of(context).primaryColor),
                             ),
                           ),
                         );
                      }
                      else {
                        return Text(vote.title, style: voteTextStyle);
                      }
                    }
                  ),
                ),
              ],
            ),
            trailing: Builder(
              builder: (context) {
                final activeService = context.read<ParliamentServiceInterface>();
                final String translatedVote = activeService.translateVote(context, vote.vote);
                return Text(
                  translatedVote,
                  style: voteTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: activeService.getVoteColor(context, translatedVote),
                  ),
                );
              }
            ),
          )
        );
        if (i < votes.length - 1 || (_isLoadingMoreVotings || (_hasMoreVotings && !(_isLoadingVotings && votes.isEmpty)))) {
          listChildren.add(const Divider(height: 1));
        }
      }
    } else if (_isLoadingVotings && votes.isEmpty) {
      listChildren.add(
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: CircularProgressIndicator(),
          ),
        )
      );
    } else if (_votingsError != null && votes.isEmpty) {
      listChildren.add(
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_votingsError!, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _fetchVotings(isRefresh: true),
                  child: Text(l10n.tryAgainButton),
                )
              ],
            ),
          ),
        )
      );
    } else if (_votingsLoaded && votes.isEmpty && !_hasMoreVotings) {
      listChildren.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Center(child: Text(l10n.noVotingsData, style: TextStyle(color: Colors.grey[600]))),
        )
      );
    }
    if (_isLoadingMoreVotings) {
      listChildren.add(const Center(child: Padding(padding: EdgeInsets.all(16.0), child: CircularProgressIndicator())));
    } else if (_hasMoreVotings && !_isLoadingVotings && _votingsError == null) { 
      listChildren.add(
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () => _fetchVotings(isRefresh: false), 
              child: Text(votes.isEmpty && !_isLoadingVotings && _votingsError == null
                  ? l10n.loadVotingsButton : l10n.loadMoreButton),
            ),
          ),
        )
      );
    }
    if (listChildren.isEmpty) {
      if (_isLoadingVotings && !attendanceAvailable) {
        return const Center(child: CircularProgressIndicator());
      }
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Text(l10n.noData, style: TextStyle(color: Colors.grey[600]))),
      );
    }
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      children: listChildren,
    );
  }

  Widget _buildInterpellationsTabContent(List<InterpellationPreview> interpellations, TextStyle? titleStyle) {
    final l10n = AppLocalizations.of(context)!;
    developer.log('MPDetailsScreen: _buildInterpellationsTabContent - _isLoadingInterpellations: $_isLoadingInterpellations, _interpellationsError: $_interpellationsError, _interpellationsLoaded: $_interpellationsLoaded, interpellations.isEmpty: ${interpellations.isEmpty}');
    if (_isLoadingInterpellations && interpellations.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_interpellationsError != null && interpellations.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_interpellationsError!, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _fetchInterpellations(isRefresh: true),
                child: Text(l10n.tryAgainButton),
              )
            ],
          ),
        ),
      );
    }
    if (_interpellationsLoaded && interpellations.isEmpty && !_hasMoreInterpellations) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Text(l10n.noInterpellationsData, style: TextStyle(color: Colors.grey[600]))),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      itemCount: interpellations.length + ((_hasMoreInterpellations || _isLoadingMoreInterpellations) ? 1 : 0), 
      itemBuilder: (context, index) {
        if (index == interpellations.length) {
          if (_isLoadingMoreInterpellations) {
            return const Center(child: Padding(padding: EdgeInsets.all(16.0), child: CircularProgressIndicator()));
          } else if (_hasMoreInterpellations && !_isLoadingInterpellations) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => _fetchInterpellations(isRefresh: false), 
                  child: Text(l10n.loadMoreButton),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        }
        final interp = interpellations[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (interp.tag != null && interp.tag!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      interp.tag!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                Builder(
                  builder: (context) {
                    final activeService = context.read<ParliamentServiceInterface>();
                    final tapAction = activeService.getInterpellationTapAction(context, interp);
                    return InkWell(
                      onTap: tapAction,
                      child: Text(
                        interp.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: tapAction != null ? Theme.of(context).primaryColor : null,
                        ),
                      ),
                    );
                  }
                ),
                if (interp.sentDate != null && interp.sentDate!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(l10n.interpellationSentDate(DateFormat('dd.MM.yyyy').format(DateTime.parse(interp.sentDate!))),),
                ],
                if (interp.replyFrom != null && interp.replyFrom!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.interpellationReplyFrom,
                        style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: Colors.grey[800]),
                      ),
                      Expanded(
                        child: interp.replyUrl != null && interp.replyUrl!.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  final scaffoldMessenger = ScaffoldMessenger.of(context);
                                  final urlString = interp.replyUrl!;
                                  final Uri url = Uri.parse(urlString);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url, mode: LaunchMode.externalApplication);
                                  } else {
                                    scaffoldMessenger.showSnackBar(
                                       SnackBar(content: Text(l10n.cannotOpenReplyLink(urlString))),
                                    );
                                  }
                                },
                                child: Text(
                                  interp.replyFrom!,
                                  style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.secondary, decoration: TextDecoration.underline),
                                ),
                              )
                            : Text(
                                interp.replyFrom!,
                                style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: Colors.grey[800]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        }


  Widget _buildSupportSectionContent() {
      return CitizenPollWidget(
        targetType: 'deputy',
        targetId: _mp!.id,
        itemData: _mp!,
        showContainer: false,
        onVoteSuccess: (updatedCounters) {
          if (mounted) {
            setState(() {
              _mp = _mp!.copyWith(
                likes: updatedCounters['likes'],
                dislikes: updatedCounters['dislikes'],
                popularity: updatedCounters['popularity'],
              );
            });
          }
        },
      );
    }

  Widget _buildContactInfo(BuildContext context, MP currentMP) {
    final l10n = AppLocalizations.of(context)!;
     return Card(
       margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(l10n.emailLabelWithColon, currentMP.email),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    if (value.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:lustra/widgets/verification_guard.dart';
import 'package:lustra/providers/interaction_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:lustra/l10n/app_localizations.dart';
import 'package:lustra/providers/user_provider.dart';

import '../models/legislation.dart';
import '../models/mp.dart';
import '../services/voting_service.dart';
import '../services/parliament_service_interface.dart';
import '../services/parliament_manager.dart';
import '../services/api_service.dart';
import '../services/cache/parliament_cache_manager.dart';

class CitizenPollWidget extends StatefulWidget {
  final String targetType;
  final String targetId;
  final dynamic itemData;
  final bool showContainer;
  final bool enablePostVoteAction;
  final VoidCallback? onShare;
  final Function(Map<String, int> updatedCounters)? onVoteSuccess;

  const CitizenPollWidget({
    super.key,
    required this.targetType,
    required this.targetId,
    required this.itemData,
    this.showContainer = true,
    this.enablePostVoteAction = false,
    this.onShare,
    this.onVoteSuccess,
  });

  @override
  State<CitizenPollWidget> createState() => _CitizenPollWidgetState();
}

class _CitizenPollWidgetState extends State<CitizenPollWidget> {
  final VotingService _votingService = VotingService();
  bool _isVoteProcessing = false;

  bool _hasVotedLocally = false;
  Map<String, int>? _pollCounters;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeVoteStatus();
  }

  Map<String, int> _extractCountersFromItemData() {
    int likes = 0;
    int dislikes = 0;
    int popularity = 0;

    if (widget.itemData is Legislation) {
      likes = widget.itemData.likes ?? 0;
      dislikes = widget.itemData.dislikes ?? 0;
      popularity = widget.itemData.popularity ?? 0;
    } else if (widget.itemData is MP) {
      likes = widget.itemData.likes ?? 0;
      dislikes = widget.itemData.dislikes ?? 0;
      popularity = widget.itemData.popularity ?? 0;
    }
    return {'likes': likes, 'dislikes': dislikes, 'popularity': popularity};
  }

  Future<void> _initializeVoteStatus() async {
      if (widget.targetId.isEmpty || widget.targetId == 'unknown') {
        if (mounted) setState(() => _isLoading = false);
        return;
      }

      final interactionProvider = Provider.of<InteractionProvider>(context, listen: false);
      final parliamentManager = Provider.of<ParliamentManager>(context, listen: false);
      
      final countryPrefix = parliamentManager.activeServiceId ?? 'unknown';
      final voteKey = '${countryPrefix}_${widget.targetType}_${widget.targetId}';
      
      final bool finalHasVoted = interactionProvider.hasVoted(voteKey);
      final persistedCounters = await _votingService.getOptimisticCounters(widget.targetType, widget.targetId);

      Map<String, int> finalCounters;
      if (persistedCounters != null) {
        finalCounters = persistedCounters.cast<String, int>();
      } else {
        finalCounters = _extractCountersFromItemData();
      }
      
      if (mounted) {
        setState(() {
          _hasVotedLocally = finalHasVoted;
          _pollCounters = finalCounters;
          _isLoading = false;
        });
      }
    }

  Future<void> _handleVoteButtonPressed(String voteType) async {
    if (_isVoteProcessing) return;
    final user = Provider.of<User?>(context, listen: false);
    final parliamentManager = Provider.of<ParliamentManager>(context, listen: false);
    final parliamentService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    
    final l10n = AppLocalizations.of(context)!;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final countryPrefix = parliamentManager.activeServiceId ?? 'unknown';
    final voteKey = '${countryPrefix}_${widget.targetType}_${widget.targetId}';

    if (user == null) {
      final currentPath = GoRouterState.of(context).uri.toString();
      context.push(Uri(path: '/login', queryParameters: {'next': currentPath}).toString());
      return;
    }
    setState(() => _isVoteProcessing = true);

    final isVerified = await checkVerificationOrShowDialog(context);
    if (!isVerified) {
      if (mounted) setState(() => _isVoteProcessing = false);
      return;
    }

    final previousHasVoted = _hasVotedLocally;
    final previousCounters = _pollCounters != null ? Map<String, int>.from(_pollCounters!) : null;

    if (!mounted) return;
    final interactionProvider = Provider.of<InteractionProvider>(context, listen: false);
    interactionProvider.markAsVotedLocally(voteKey);

    Map<String, int> currentCounters = _pollCounters ?? _extractCountersFromItemData();
    Map<String, int> optimisticCounters = Map<String, int>.from(currentCounters);

    if (voteType == 'like') {
      optimisticCounters['likes'] = (optimisticCounters['likes'] ?? 0) + 1;
    } else if (voteType == 'dislike') {
      optimisticCounters['dislikes'] = (optimisticCounters['dislikes'] ?? 0) + 1;
    }
    optimisticCounters['popularity'] = (optimisticCounters['popularity'] ?? 0) + 1;
    
    await _votingService.saveOptimisticCounters(widget.targetType, widget.targetId, optimisticCounters);
    
    if (mounted) {
      setState(() {
        _hasVotedLocally = true;
        _pollCounters = optimisticCounters;
      });
    }

    try {
      final ApiService apiService = ApiService();
      await user.reload(); 
      await user.getIdToken(true);
      developer.log("Wymuszono odświeżenie tokena przed głosowaniem", name: 'CitizenPollWidget');
      final responseData = await apiService.callFunction(
        parliamentService.citizenVoteFunctionName,
        params: { 'targetId': widget.targetId, 'targetType': widget.targetType, 'voteType': voteType, },
      );

      if (responseData.containsKey('counters')) {
        final backendCounters = Map<String, int>.from((responseData['counters'] as Map).map((k, v) => MapEntry(k.toString(), v as int)));
        
        bool backendSeemsStale = (backendCounters['popularity'] ?? 0) < (optimisticCounters['popularity'] ?? 0);
        final countersToDisplay = backendSeemsStale ? optimisticCounters : backendCounters;

        await _votingService.saveOptimisticCounters(widget.targetType, widget.targetId, countersToDisplay);
        
        if (mounted) {  setState(() { _pollCounters = countersToDisplay; });  }
        widget.onVoteSuccess?.call(countersToDisplay);
        
        // Trigger cross-tab / background interaction sync for current user
        await ParliamentCacheManager(countryPrefix).markInteractionChanged(user.uid);
      } 
    } on FirebaseFunctionsException catch (e) {
      if (mounted) setState(() => _isVoteProcessing = false);
      _handleError(e.code == 'permission-denied' ? l10n.pollPermissionDeniedError : l10n.authErrorDefault, previousHasVoted, previousCounters, scaffoldMessenger);
    } catch (e) {
      _handleError(l10n.authErrorDefault, previousHasVoted, previousCounters, scaffoldMessenger);
    }
  }

  Future<void> _handleError(String message, bool prevVoted, Map<String, int>? prevCounters, ScaffoldMessengerState messenger) async {
      await _votingService.clearVoteStatus(widget.targetType, widget.targetId);
      if (mounted) {
        setState(() { 
          _hasVotedLocally = prevVoted; 
          _pollCounters = prevCounters; 
          _isVoteProcessing = false;
        });
        messenger.showSnackBar(SnackBar(content: Text(message)));
      }
  }


  @override
  Widget build(BuildContext context) {
    final interactionProvider = context.watch<InteractionProvider>(); 
    final parliamentManager = context.read<ParliamentManager>();
    final l10n = AppLocalizations.of(context)!;
    final countryPrefix = parliamentManager.activeServiceId ?? 'unknown';
    final voteKey = '${countryPrefix}_${widget.targetType}_${widget.targetId}';
    
    if (interactionProvider.hasVoted(voteKey) && !_hasVotedLocally) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
         _initializeVoteStatus();
      });
    }

    if (widget.targetId.isEmpty || widget.targetId == 'unknown' || _isLoading) {
      return Container(
        padding: const EdgeInsets.all(16),
        height: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: _isLoading ? const CircularProgressIndicator() : Text(l10n.pollTemporarilyUnavailable, style: TextStyle(color: Colors.grey[600])),
      );
    }

    final counters = _pollCounters ?? _extractCountersFromItemData();
    int votesForCitizen = counters['likes'] ?? 0;
    int votesAgainstCitizen = counters['dislikes'] ?? 0;
    int totalCitizenVotes = counters['popularity'] ?? 0;

    final double forCitizenPercent = totalCitizenVotes > 0 ? (votesForCitizen / totalCitizenVotes * 100) : 0;
    final double againstCitizenPercent = totalCitizenVotes > 0 ? (votesAgainstCitizen / totalCitizenVotes * 100) : 0;

    final Widget resultsWidget = widget.targetType == 'deputy' 
        ? _buildDeputyResultsView(votesForCitizen, votesAgainstCitizen, totalCitizenVotes)
        : _buildModernResultsBar(forCitizenPercent, againstCitizenPercent, votesForCitizen, votesAgainstCitizen, totalCitizenVotes);

    final Widget actionWidget;
    if (_hasVotedLocally) {
      actionWidget = _buildOfficialReceipt(totalCitizenVotes);
    } else {
      final firebaseUser = context.watch<User?>();
      if (firebaseUser == null) {
        actionWidget = _buildLoginToVoteButton(key: ValueKey('login_button_${widget.targetId}'));
      } else {
        final userProvider = context.watch<UserProvider>();
        final parliamentService = context.read<ParliamentServiceInterface>();
        final canVote = userProvider.primaryParliamentId == parliamentService.name;

        if (!canVote) {
          actionWidget = _buildRestrictedView(parliamentService.name);
        } else {
          actionWidget = _buildVotingButtons(key: ValueKey('voting_buttons_${widget.targetId}'));
        }
      }
    }

    final contentColumn = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (totalCitizenVotes > 0) ...[
          if (widget.showContainer) ...[
            Row(
              children: [
                Container(width: 6, height: 6, decoration: BoxDecoration(color: Theme.of(context).primaryColor, shape: BoxShape.circle)),
                const SizedBox(width: 8),
                Text(
                  l10n.civicWillRecord,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5, color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
          resultsWidget,
          const SizedBox(height: 24),
          const Divider(height: 1, thickness: 1),
          const SizedBox(height: 20),
        ],
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: actionWidget,
        ),
      ],
    );
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Theme.of(context).primaryColor, width: 4.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Theme.of(context).primaryColor.withAlpha((255 * 0.08).round()), 
            Theme.of(context).primaryColor.withAlpha((255 * 0.02).round()), 
          ],
        ),
      ),
      child: CustomPaint(
        painter: TargetingBracketsPainter(
          color: Theme.of(context).primaryColor.withAlpha(80),
          strokeWidth: 1.0,
          length: 12.0,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0, right: 16.0),
          child: contentColumn,
        ),
      ),
    );
  }

  Widget _buildModernResultsBar(double forPercent, double againstPercent, int forVotes, int againstVotes, int totalVotes) {
    final l10n = AppLocalizations.of(context)!;
    if (totalVotes == 0) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Text(
          AppLocalizations.of(context)!.pollNoVotesCast, 
          style: TextStyle(color: Colors.grey[500], fontStyle: FontStyle.italic, letterSpacing: 0.5)
        ),
      );
    }

    int knownVotes = forVotes + againstVotes;
    int flexPending = (totalVotes - knownVotes).clamp(0, totalVotes);
    
    int flexFor = forVotes > 0 ? forVotes : 0;
    int flexAgainst = againstVotes > 0 ? againstVotes : 0;
    if (flexFor == 0 && flexAgainst == 0 && flexPending == 0) flexPending = 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.pollSupportPercent(forPercent.round().toString()), style: TextStyle(color: Colors.green[700], fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 1)),
            if (flexPending > 0) Text(l10n.pollSyncing, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
            Text(l10n.pollOpposePercent(againstPercent.round().toString()), style: TextStyle(color: Colors.red[700], fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 1)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 8,
            child: Row(
              children: [
                if (flexFor > 0) Expanded(flex: flexFor, child: Container(color: Colors.green[600])),
                if (flexPending > 0) Expanded(flex: flexPending, child: Container(color: Colors.grey[300])),
                if (flexAgainst > 0) Expanded(flex: flexAgainst, child: Container(color: Colors.red[600])),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.totalVotesRecorded(totalVotes.toString()),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, color: Colors.grey[500], fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ],
    );
  }

  Widget _buildVotingButtons({Key? key}) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      key: key,
      children: [
        Text(
          l10n.recordYourPositionForAudit,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _handleVoteButtonPressed('like'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green.withAlpha((255 * 0.06).round()),
                  side: BorderSide(color: Colors.green.withAlpha(60), width: 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  foregroundColor: Colors.green[800],
                  elevation: 0,
                ),
                child: Column(
                  children: [
                    const Icon(Icons.check_circle_outline, size: 24),
                    const SizedBox(height: 4),
                    Text(l10n.pollSupport.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: 1)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: () => _handleVoteButtonPressed('dislike'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.red.withAlpha((255 * 0.06).round()),
                  side: BorderSide(color: Colors.red.withAlpha(60), width: 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  foregroundColor: Colors.red[800],
                  elevation: 0,
                ),
                child: Column(
                  children: [
                    const Icon(Icons.cancel_outlined, size: 24),
                    const SizedBox(height: 4),
                    Text(l10n.pollDontSupport.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: 1)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOfficialReceipt(int totalVotes) {
    final primaryColor = Theme.of(context).primaryColor;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      key: ValueKey('voted_receipt_${widget.targetId}'),
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: primaryColor.withAlpha((255 * 0.08).round()), 
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.verified_user, size: 20, color: primaryColor), 
              const SizedBox(width: 8),
              Text(
                l10n.pollPositionRecorded,
                style: TextStyle(
                  fontSize: 14, 
                  fontWeight: FontWeight.w900, 
                  color: primaryColor,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          
          if (widget.enablePostVoteAction) ...[
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    l10n.pollVoteSignificance, 
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.pollShareImpact,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: widget.onShare,
                  icon: const Icon(Icons.share, size: 16),
                  label: Text(l10n.pollShareAction, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }

Widget _buildRestrictedView(String parliamentName) {
  final l10n = AppLocalizations.of(context)!;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: primaryColor.withAlpha((255 * 0.08).round()), 
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.security, size: 20, color: primaryColor),
          const SizedBox(width: 8),
          Text(
            l10n.pollRestrictedToCitizens,
            style: TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.w900, 
              color: primaryColor,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginToVoteButton({Key? key}) {
    return Center(
      key: key,
      child: OutlinedButton.icon(
        icon: const Icon(Icons.login, size: 18),
        label: Text(AppLocalizations.of(context)!.loginToVote, style: const TextStyle(fontWeight: FontWeight.bold)),
        onPressed: () {
          final currentPath = GoRouterState.of(context).uri.toString();
          context.push(Uri(path: '/login', queryParameters: {'next': currentPath}).toString());
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }

  Widget _buildDeputyResultsView(int upVotes, int downVotes, int totalVotes) {
    final l10n = AppLocalizations.of(context)!;
    final double supportPercentage = totalVotes > 0 ? upVotes / totalVotes : 0.0;
    final String supportPercentageFormatted = NumberFormat.percentPattern(l10n.localeName).format(supportPercentage);

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

    const double progressBarHeight = 8.0;

    return Column(
      key: ValueKey('deputy_results_${widget.targetId}'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          combinedSupportText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: percentageTextColor,
          ),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(progressBarHeight / 2),
          child: SizedBox(
            height: progressBarHeight,
            child: Row(
              children: [
                if (totalVotes > 0) ...[
                  Expanded(
                    flex: upVotes,
                    child: Container(color: Colors.green.shade500),
                  ),
                  Expanded(
                    flex: downVotes,
                    child: Container(color: Colors.red.shade500),
                  ),
                ] else
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.grey[300]),
                  ),
              ],
            ),
          ),
        ),
      ],
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
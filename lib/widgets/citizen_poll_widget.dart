import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:lustra/widgets/verification_guard.dart';
import 'package:lustra/providers/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/legislation.dart';
import '../models/home_screen_data.dart';
import '../models/mp.dart';
import '../services/voting_service.dart';
import '../services/parliament_service_interface.dart';
import '../services/parliament_manager.dart';
import '../services/api_service.dart';

class CitizenPollWidget extends StatefulWidget {
  final String targetType;
  final String targetId;
  final dynamic itemData;
  final bool showContainer;
  final Function(Map<String, int> updatedCounters)? onVoteSuccess;

  const CitizenPollWidget({
    super.key,
    required this.targetType,
    required this.targetId,
    required this.itemData,
    this.showContainer = true,
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

    if (widget.itemData is HomeScreenLegislationItem) {
      likes = widget.itemData.likes ?? 0;
      dislikes = widget.itemData.dislikes ?? 0;
      popularity = widget.itemData.popularity;
    } else if (widget.itemData is Legislation) {
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

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final parliamentManager = Provider.of<ParliamentManager>(context, listen: false);
    
    final countryPrefix = parliamentManager.activeServiceId ?? 'unknown';
    
    final voteKey = '${countryPrefix}_${widget.targetType}_${widget.targetId}';
    final bool hasVotedInProfile = userProvider.hasVoted(voteKey);

    final hasVotedOnDevice = await _votingService.hasVotedLocally(widget.targetType, widget.targetId);
    
    final bool finalHasVoted = hasVotedInProfile || hasVotedOnDevice;

    final persistedCounters = await _votingService.getOptimisticCounters(widget.targetType, widget.targetId);

    if (mounted) {
      setState(() {
        _hasVotedLocally = finalHasVoted;
        if (persistedCounters != null && finalHasVoted) {
           _pollCounters = persistedCounters.cast<String, int>();
        } else {
           _pollCounters = _extractCountersFromItemData();
        }
        _isLoading = false;
      });
    }
  }

  Future<void> _handleVoteButtonPressed(String voteType) async {
    if (_isVoteProcessing) return;
    final user = Provider.of<User?>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
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

    await _votingService.markAsVotedLocally(widget.targetType, widget.targetId);
    
    userProvider.markAsVotedLocally(voteKey);

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
        
        if (mounted) { 
          setState(() { _pollCounters = countersToDisplay; }); 
        }
        widget.onVoteSuccess?.call(countersToDisplay);
      } 
    } on FirebaseFunctionsException catch (e) {
      if (mounted) setState(() => _isVoteProcessing = false);
      developer.log('Błąd Cloud Function (${e.code}): ${e.message}', name: 'CitizenPollWidget');
      _handleError(e.code == 'permission-denied' ? l10n.pollPermissionDeniedError : l10n.authErrorDefault, previousHasVoted, previousCounters, scaffoldMessenger);
    } catch (e) {
      developer.log('Błąd nie-Firebase: $e', name: 'CitizenPollWidget');
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
    final userProvider = context.watch<UserProvider>(); 
    final parliamentManager = context.read<ParliamentManager>();
    final l10n = AppLocalizations.of(context)!;
    final countryPrefix = parliamentManager.activeServiceId ?? 'unknown';
    final voteKey = '${countryPrefix}_${widget.targetType}_${widget.targetId}';
    
    if (userProvider.hasVoted(voteKey) && !_hasVotedLocally) {
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
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300] ?? Colors.grey),
        ),
        child: _isLoading ? const CircularProgressIndicator() : Text(l10n.pollTemporarilyUnavailable, style: TextStyle(color: Colors.grey[600]), textAlign: TextAlign.center),
      );
    }

    final counters = _pollCounters ?? _extractCountersFromItemData();

    int votesForCitizen = counters['likes'] ?? 0;
    int votesAgainstCitizen = counters['dislikes'] ?? 0;
    int totalCitizenVotes = counters['popularity'] ?? 0;

    final double forCitizenPercent = totalCitizenVotes > 0 ? (votesForCitizen / totalCitizenVotes * 100) : 0;
    final double againstCitizenPercent = totalCitizenVotes > 0 ? (votesAgainstCitizen / totalCitizenVotes * 100) : 0;
    final primaryColor = Theme.of(context).primaryColor;

        final Widget resultsWidget;
    if (widget.targetType == 'deputy') {
      resultsWidget = _buildDeputyResultsView(votesForCitizen, votesAgainstCitizen, totalCitizenVotes);
    } else {
      resultsWidget = _buildResultsBar(forCitizenPercent, againstCitizenPercent, votesForCitizen, votesAgainstCitizen, totalCitizenVotes);
    }

    final Widget actionWidget;
    if (_hasVotedLocally) {
      actionWidget = _buildVoteCountDisplay(totalCitizenVotes);
    } else {
      final firebaseUser = context.watch<User?>();
      actionWidget = firebaseUser != null
          ? _buildVotingButtons(key: ValueKey('voting_buttons_${widget.targetId}'))
          : _buildLoginToVoteButton(key: ValueKey('login_button_${widget.targetId}'));
    }

    final contentColumn = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showContainer) ...[
          Center(child: Text(l10n.citizenPollTitle, style: TextStyle(fontSize: 15, color: primaryColor, fontWeight: FontWeight.bold))),
          const SizedBox(height: 16),
        ],
        resultsWidget,
        const SizedBox(height: 16),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: actionWidget,
        ),
      ],
    );

    if (!widget.showContainer) {
      return contentColumn;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      padding: const EdgeInsets.all(16),
      child: contentColumn,
    );
  }

  Widget _buildVoteCountDisplay(int totalVotes) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      key: ValueKey('voted_info_${widget.targetId}'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          l10n.pollTotalVotesLabel(totalVotes),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[800],
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  Widget _buildResultsBar(double forPercent, double againstPercent, int forVotes, int againstVotes, int totalVotes) {
    int flexFor = forPercent.round();
    int flexAgainst = againstPercent.round();

    if (totalVotes > 0) {
      if (flexFor == 0 && forVotes > 0) flexFor = 1;
      if (flexAgainst == 0 && againstVotes > 0) flexAgainst = 1;
      if (flexFor == 0 && flexAgainst == 0) {
        flexFor = 1; flexAgainst = 1;
      }
    }

    if (totalVotes == 0) {
      return Container(
        height: 36,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(18),
        ),
        alignment: Alignment.center,
        child: Text(AppLocalizations.of(context)!.pollNoVotesCast, style: TextStyle(color: Colors.grey[700], fontStyle: FontStyle.italic)),
      );
    }

    return Row(
      key: ValueKey('percentages_${widget.targetId}'),
      children: [
        if (flexFor > 0) Expanded(
          flex: flexFor,
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              color: Colors.green.withAlpha(220),
              borderRadius: flexAgainst <= 0 ? BorderRadius.circular(18) : const BorderRadius.only(topLeft: Radius.circular(18), bottomLeft: Radius.circular(18)),
            ),
            alignment: Alignment.center,
            child: forPercent > 10 ? Text('${forPercent.round()}%', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)) : null,
          ),
        ),
        if (flexAgainst > 0) Expanded(
          flex: flexAgainst,
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              color: Colors.red.withAlpha(220),
              borderRadius: flexFor <= 0 ? BorderRadius.circular(18) : const BorderRadius.only(topRight: Radius.circular(18), bottomRight: Radius.circular(18)),
            ),
            alignment: Alignment.center,
            child: againstPercent > 10 ? Text('${againstPercent.round()}%', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)) : null,
          ),
        ),
      ],
    );
  }
  
  Widget _buildVotingButtons({Key? key}) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(children: [
          IconButton(icon: const Icon(Icons.thumb_up_outlined), onPressed: () => _handleVoteButtonPressed('like'), color: Colors.green, iconSize: 32),
          Text(l10n.pollSupport, style: const TextStyle(fontSize: 12))
        ]),
        Column(children: [
          IconButton(icon: const Icon(Icons.thumb_down_outlined), onPressed: () => _handleVoteButtonPressed('dislike'), color: Colors.red, iconSize: 32),
          Text(l10n.pollDontSupport, style: const TextStyle(fontSize: 12))
        ]),
      ],
    );
  }

  Widget _buildLoginToVoteButton({Key? key}) {
    return Center(
      key: key,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.login, size: 18),
        label: Text(AppLocalizations.of(context)!.loginToVote),
        onPressed: () {
          final currentPath = GoRouterState.of(context).uri.toString();
          context.push(Uri(path: '/login', queryParameters: {'next': currentPath}).toString());
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                    child: Container(color: Colors.green.shade300),
                  ),
                  Expanded(
                    flex: downVotes,
                    child: Container(color: Colors.red.shade300),
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
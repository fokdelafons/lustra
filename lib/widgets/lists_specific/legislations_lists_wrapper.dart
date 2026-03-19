import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/parliament_service_interface.dart';
import '../../screens/lists/voted_legislation_list.dart';
import '../../screens/lists/process_legislation_list.dart';
import '../../screens/lists/upcoming_legislation_list.dart';
import '../../screens/lists/civic_legislation_list.dart';
import '../../screens/lists/tracked_legislation_list.dart';
import '../../screens/lists/curated_legislation_list.dart';

/// **LegislationWrapperScreen**
///
/// Serves as the **Traffic Controller** and **UI Container** for various legislation lists.
///
/// ### Core Responsibilities:
/// 1.  **Routing Map:** Decides which specific list widget (Voted, Process, Upcoming, Civic)
///     to render based on the [type] parameter passed from the URL (e.g., `?list=process`).
/// 2.  **Unified UI Frame:** Provides the common `Scaffold` and `AppBar` to ensure consistent
///     look & feel across different list types (DRY principle).
/// 3.  **Refresh Command Center:** Holds `GlobalKeys` to its children. This allows the
///     "Refresh" button in the AppBar to trigger the `refreshData()` method on the
///     currently active list child.
///
/// ### Architecture Note:
/// Uses a `Builder` with a `switch` statement instead of `IndexedStack`.
/// -   **Reason:** Performance & Throttling.
/// -   `IndexedStack` instantiates ALL children at once, causing 4 simultaneous API calls.
/// -   The `switch` approach ensures **only the requested list is built and fetches data**,
///     reducing server load by ~75%.
///
/// ### Navigation:
/// Handles the "Back" logic. If the history stack allows popping, it shows a Back arrow.
/// Otherwise (e.g., deep link entry), it offers a Home button to prevent app exit.

class LegislationWrapperScreen extends StatefulWidget {
  final String type;
  final String? listId;

  const LegislationWrapperScreen({
    super.key, 
    required this.type, 
    this.listId,
  });

  @override
  State<LegislationWrapperScreen> createState() => _LegislationWrapperScreenState();
}

// Keys are crucial here. They allow the parent (Wrapper) to invoke methods
// on the children (Lists) without coupling the state logic tightly.
class _LegislationWrapperScreenState extends State<LegislationWrapperScreen> {
  final GlobalKey<LegislationScreenState> _votedKey = GlobalKey();
  final GlobalKey<ProcessLegislationScreenState> _processKey = GlobalKey();
  final GlobalKey<FutureLegislationScreenState> _futureKey = GlobalKey();
  final GlobalKey<CivicLegislationScreenState> _civicKey = GlobalKey();
  final GlobalKey<TrackedLegislationScreenState> _trackedKey = GlobalKey();
  final GlobalKey<CuratedLegislationScreenState> _curatedKey = GlobalKey();

  /// Triggers the `refreshData()` method on the currently active child widget.
  void _triggerRefresh() {
    switch (widget.type) {
      case 'civic':
        _civicKey.currentState?.refreshData();
        break;
      case 'process':
        _processKey.currentState?.refreshData();
        break;
      case 'upcoming':
        _futureKey.currentState?.refreshData();
        break;
      case 'tracked':
        _trackedKey.currentState?.refreshData();
        break;
      case 'curated':
        _curatedKey.currentState?.refreshData();
        break;
      case 'voted':
      default:
        _votedKey.currentState?.refreshData();
        break;
    }
  }

  String _getTitle(BuildContext context, String type) {
    final l10n = AppLocalizations.of(context)!;
    switch (type) {
      case 'process': return l10n.sectionLegislationInProcess;
      case 'upcoming': return l10n.sectionUpcoming;
      case 'civic': return l10n.civicProjectsSectionTitle;
      case 'tracked': return l10n.trackedBillsTitle;
      case 'curated': return l10n.curatedListTitle;
      case 'voted': return l10n.sectionPopularVotes;
      default: return l10n.legislationScreenTitle(""); 
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeService = context.watch<ParliamentServiceInterface>();
    final currentTitle = _getTitle(context, widget.type);
    final bool isWideScreen = kIsWeb && MediaQuery.of(context).size.width > 800;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              activeService.source.flagIconAsset,
              width: 18,
              height: 18,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                currentTitle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        
        // --- LEADING (HOME) ---
        leadingWidth: null,
        leading: Builder(
          builder: (context) {
            void goHome() => context.go('/');

            if (isWideScreen) {
              return InkWell(
                onTap: goHome,
                borderRadius: BorderRadius.circular(50),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.home, color: Colors.white),
                ),
              );
            }

            return IconButton(
              icon: const Icon(Icons.home),
              tooltip: l10n.bottomNavHome,
              onPressed: goHome,
            );
          },
        ),

        // --- ACTIONS (REFRESH) ---
        actions: [
          if (isWideScreen)
            TextButton(
              onPressed: _triggerRefresh,
              child: Row(
                children: [
                  Text(
                    l10n.refreshDataTooltip,
                    style: const TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold
                    )
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.refresh, color: Colors.white),
                ],
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: l10n.refreshDataTooltip,
              onPressed: _triggerRefresh,
            ),
          const SizedBox(width: 8),
        ],
      ),

      // --- BODY (LAZY LOADING) ---
      // Using Builder + Switch ensures only the requested widget is instantiated.
      body: Builder(
        builder: (context) {
          switch (widget.type) {
            case 'tracked':
              return TrackedLegislationScreen(key: _trackedKey);
            case 'process':
              return ProcessLegislationScreen(key: _processKey);
            case 'upcoming':
              return FutureLegislationScreen(key: _futureKey);
            case 'civic':
              return CivicLegislationScreen(key: _civicKey);
            case 'curated':
              if (widget.listId == null) {
                 return Center(child: Text(l10n.errorMissingListId));
              }
              return CuratedLegislationScreen(key: _curatedKey, listId: widget.listId!);
            case 'voted':
            default:
              return LegislationScreen(key: _votedKey);
          }
        },
      ),
    );
  }
}
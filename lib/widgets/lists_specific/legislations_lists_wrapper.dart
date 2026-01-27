import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../services/parliament_service_interface.dart';
import '../../screens/lists/voted_legislation_list.dart';
import '../../screens/lists/process_legislation_list.dart';
import '../../screens/lists/upcoming_legislation_list.dart';
import '../../screens/lists/civic_legislation_list.dart';

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

  const LegislationWrapperScreen({super.key, required this.type});

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
      case 'voted':
      default: return l10n.legislationScreenTitle(""); 
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeService = context.watch<ParliamentServiceInterface>();
    final currentTitle = _getTitle(context, widget.type);
    final bool isWideScreen = kIsWeb && MediaQuery.of(context).size.width > 800;
    final l10n = AppLocalizations.of(context)!;
    
    // Logic for appending parliament name (e.g., "Votings (Sejm RP)")
    final fullTitle = currentTitle.contains(activeService.name) 
        ? currentTitle 
        : "$currentTitle (${activeService.name})";

    return Scaffold(
      appBar: AppBar(
        title: Text(fullTitle),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        
        // --- LEADING (BACK / HOME) ---
        leadingWidth: null,
        leading: Builder(
          builder: (context) {
            final bool canPop = context.canPop();
            
            void onNavigation() {
              if (canPop) {
                context.pop();
              } else {
                context.go('/');
              }
            }

            // WEB STYLE (Matching DetailsAppBar)
            if (isWideScreen) {
              return InkWell(
                onTap: onNavigation,
                borderRadius: BorderRadius.circular(50),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    canPop ? Icons.arrow_back : Icons.home, 
                    color: Colors.white
                  ),
                ),
              );
            }

            // MOBILE STYLE (Standard Icon Button)
            return IconButton(
              icon: Icon(canPop ? Icons.arrow_back : Icons.home),
              tooltip: canPop ? l10n.actionBack : l10n.bottomNavHome,
              onPressed: onNavigation,
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
            case 'process':
              return ProcessLegislationScreen(key: _processKey);
            case 'upcoming':
              return FutureLegislationScreen(key: _futureKey);
            case 'civic':
              return CivicLegislationScreen(key: _civicKey);
            case 'voted':
            default:
              return LegislationScreen(key: _votedKey);
          }
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../services/parliament_service_interface.dart';
import 'ended_legislation_list.dart';
import 'process_legislation_list.dart';
import 'future_legislation_list.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

class LegislationWrapperScreen extends StatefulWidget {
  final String type; // 'voted', 'process', 'upcoming'

  const LegislationWrapperScreen({super.key, required this.type});

  @override
  State<LegislationWrapperScreen> createState() => _LegislationWrapperScreenState();
}

class _LegislationWrapperScreenState extends State<LegislationWrapperScreen> {
    final GlobalKey<LegislationScreenState> _votedKey = GlobalKey();
  final GlobalKey<ProcessLegislationScreenState> _processKey = GlobalKey();
  final GlobalKey<FutureLegislationScreenState> _futureKey = GlobalKey();

  void _triggerRefresh() {
    switch (widget.type) {
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
  int _getIndex(String type) {
    switch (type) {
      case 'process': return 1;
      case 'upcoming': return 2;
      case 'voted':
      default: return 0;
    }
  }

  String _getTitle(BuildContext context, String type) {
    final l10n = AppLocalizations.of(context)!;
    switch (type) {
      case 'process': return l10n.sectionLegislationInProcess;
      case 'upcoming': return l10n.sectionUpcoming;
      case 'voted':
      default: return l10n.legislationScreenTitle(""); 
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeService = context.watch<ParliamentServiceInterface>();
    final currentIndex = _getIndex(widget.type);
    final currentTitle = _getTitle(context, widget.type);
    final bool isWideScreen = kIsWeb && MediaQuery.of(context).size.width > 800;
    
    // Logika doklejania nazwy parlamentu (np. "Głosowania (Sejm RP)")
    final fullTitle = currentTitle.contains(activeService.name) 
        ? currentTitle 
        : "$currentTitle (${activeService.name})";

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: AppLocalizations.of(context)!.refreshDataTooltip,
            onPressed: _triggerRefresh,
          ),
        ],
        title: Text(fullTitle),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        // Dodajemy przycisk:
leadingWidth: isWideScreen ? 140 : null,
        leading: Builder(
          builder: (context) {
            void onNavigation() {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/');
              }
            }

            if (isWideScreen) {
              return InkWell(
                onTap: onNavigation,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back, color: Colors.white),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.actionBack, // Używamy contextu buildera
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: AppLocalizations.of(context)!.actionBack,
              onPressed: onNavigation,
            );
          },
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          LegislationScreen(key: _votedKey),
          ProcessLegislationScreen(key: _processKey),
          FutureLegislationScreen(key: _futureKey),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

import '../../services/parliament_service_interface.dart';
import '../../screens/lists/mp_list.dart';

/// **MPWrapperScreen**
///
/// Serves as the **Unified UI Frame** for the MP list.
/// Currently supports only one list type (Deputies), but ready for expansion (Senators etc.).

class MPWrapperScreen extends StatefulWidget {
  const MPWrapperScreen({super.key});

  @override
  State<MPWrapperScreen> createState() => _MPWrapperScreenState();
}

class _MPWrapperScreenState extends State<MPWrapperScreen> {
  final GlobalKey<MPScreenState> _mpListKey = GlobalKey();

  void _triggerRefresh() {
    // Triggers refresh on the list child
    _mpListKey.currentState?.forceRefresh();
  }

  @override
  Widget build(BuildContext context) {
    final activeService = context.watch<ParliamentServiceInterface>();
    final l10n = AppLocalizations.of(context)!;
    final bool isWideScreen = kIsWeb && MediaQuery.of(context).size.width > 800;
    
    final baseTitle = l10n.mpScreenTitle("");
    final fullTitle = baseTitle.contains(activeService.name) 
        ? baseTitle 
        : l10n.mpScreenTitle(activeService.name);

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

      // --- BODY ---
      body: MPScreen(key: _mpListKey),
    );
  }
}
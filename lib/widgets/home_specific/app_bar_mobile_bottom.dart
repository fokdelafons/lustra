import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../services/app_router.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({super.key});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/info')) return 1;
    if (location.startsWith('/support')) return 2;
    if (location.startsWith('/future')) return 3;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.smartNavigate('/');
        break;
      case 1:
        context.smartNavigate('/info');
        break;
      case 2:
        context.smartNavigate('/support');
        break;
      case 3:
        context.smartNavigate('/future');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final int currentIndex = _calculateSelectedIndex(context);

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: const Icon(Icons.home), label: l10n.bottomNavHome),
        BottomNavigationBarItem(icon: const Icon(Icons.info_outline), label: l10n.bottomNavInfo),
        BottomNavigationBarItem(icon: const Icon(Icons.favorite_outline), label: l10n.bottomNavSupport),
        BottomNavigationBarItem(icon: const Icon(Icons.lightbulb_outline), label: l10n.bottomNavFutureFeatures),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onShare;
  final bool isShareEnabled;

  const DetailsAppBar({
    super.key,
    required this.title,
    this.onShare,
    this.isShareEnabled = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isWideScreen = kIsWeb && MediaQuery.of(context).size.width > 800;

    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      leadingWidth: null,

      leading: Builder(
        builder: (context) {
          // Smart navigation logic: if ?list = back | if no = home;
          // To ensure deep links don't 
          final uri = GoRouterState.of(context).uri;
          final hasTypeParam = uri.queryParameters.containsKey('list') || 
                               uri.queryParameters.containsKey('mp');
          final bool canPop = context.canPop();
          final bool showBack = hasTypeParam && canPop;

          void onNavigation() {
            if (showBack) {
              context.pop();
            } else {
              context.go('/');
            }
          }

          // WEB
          if (isWideScreen) {
            return InkWell(
              onTap: onNavigation,
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(showBack ? Icons.arrow_back : Icons.home, color: Colors.white),
              ),
            );
          }

          // MOBILE (ICON)
          return IconButton(
            icon: Icon(showBack ? Icons.arrow_back : Icons.home),
            tooltip: showBack ? l10n.actionBack : l10n.bottomNavHome,
            onPressed: onNavigation,
          );
        },
      ),

      // --- SHARE ---
      actions: onShare == null
          ? []
          : [
              if (isWideScreen)
                TextButton(
                  onPressed: isShareEnabled ? onShare : null,
                  child: Row(
                    children: [
                      Text(l10n.shareAction,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      const Icon(Icons.share, color: Colors.white),
                    ],
                  ),
                )
              else
                IconButton(
                  icon: const Icon(Icons.share),
                  tooltip: l10n.shareTooltip,
                  onPressed: isShareEnabled ? onShare : null,
                ),
              const SizedBox(width: 8),
            ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../services/tracking_service.dart';
import '../../services/parliament_manager.dart';
import '../../providers/language_provider.dart';
import '../../models/legislation.dart';
import '../../services/app_router.dart';
import 'ui_home_card.dart';
import '../../widgets/osint_loader.dart';

class TrackedCard extends StatefulWidget {
  const TrackedCard({super.key});

  @override
  State<TrackedCard> createState() => _TrackedCardState();
}

class _TrackedCardState extends State<TrackedCard> {
  final TrackingService _trackingService = TrackingService();
  bool _isLoading = true;
  bool _playAnimation = true;
  List<Legislation> _trackedBills = [];

  @override
  void initState() {
    super.initState();
    _fetchTracked();
  }

  Future<void> _fetchTracked() async {
    if (FirebaseAuth.instance.currentUser == null) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    try {
      final manager = Provider.of<ParliamentManager>(context, listen: false);
      final prefix = manager.activeServiceId;
      final lang = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
      if (prefix == null) return;

      final data = await _trackingService.getTrackedItems(prefix, lang);
      
      final rawLegislations = data['legislations'] ?? [];
      final rawCivic = data['civic'] ?? [];
      
      List<Legislation> combined = [];

      for (var json in rawLegislations) {
        try { combined.add(Legislation.fromJson(json as Map<String, dynamic>)); } catch (_) {}
      }
      for (var json in rawCivic) {
        try { combined.add(Legislation.fromJson(json as Map<String, dynamic>)); } catch (_) {}
      }

      combined.sort((a, b) {
        final dateA = a.lastUpdated ?? a.processStartDate ?? DateTime.now();
        final dateB = b.lastUpdated ?? b.processStartDate ?? DateTime.now();
        return dateB.compareTo(dateA);
      });

      if (mounted) {
        setState(() {
          _trackedBills = combined.take(5).toList(); // Max 5 na ekranie głównym
          _isLoading = false;
        });
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) setState(() => _playAnimation = false);
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context)!;
    final manager = context.read<ParliamentManager>();
    final slug = manager.activeSlug;
    final lang = context.read<LanguageProvider>().appLanguageCode;
    final term = manager.currentTerm;

    Widget content;

    if (_isLoading) {
      // 1. HARD LOADER (Twarda wysokość, żeby karta nie skakała)
      content = const SizedBox(
        height: 150, // Minimalna wysokość loadera
        child: Center(child: OsintLoader(text: "LOADING TRACKED BILLS...")), //TODO L10N
      );
    } else if (_trackedBills.isEmpty) {
      final bool isWideScreen = MediaQuery.of(context).size.width > 750;
      
      content = Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.notifications_off_outlined, size: 48, color: Colors.grey[400]),
              const SizedBox(height: 16),
              const Text("You are not tracking any bills yet.", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)), // TODO: L10N
              
              const SizedBox(height: 24),
              const Text("Real-time push notifications are available only in our mobile app.", textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.blueGrey, height: 1.4)), // TODO: L10N
              if (!isWideScreen) ...[
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.android, size: 16), label: const Text("Google Play"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
                      onPressed: () => launchUrlString("https://play.google.com/store/apps/details?id=dev.lustra"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.apple, size: 16), label: const Text("App Store"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
                      onPressed: () => launchUrlString("https://apps.apple.com/app/id6751850630"),
                    ),
                  ],
                )
              ]
            ],
          ),
        ),
      );
    } else {
      // 3. TWARDA LISTA
      content = ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _trackedBills.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final bill = _trackedBills[index];
          
          final tile = ListTile(
            hoverColor: Colors.black.withAlpha(15), 
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            title: Text(
              bill.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                bill.id,
                style: TextStyle(fontFamily: 'monospace', fontSize: 11, color: Colors.grey[600]),
              ),
            ),
            trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
            onTap: () {
              context.smartNavigate('/$lang/$slug/$term/legislations/${bill.id}', extra: bill);
            },
          );

          // TARCZA: Animujemy TYLKO, jeśli to pierwsze twarde ładowanie (_playAnimation).
          if (_playAnimation) {
             return _StaggeredListItem(index: index, child: tile);
          }
          return tile; // Jeśli dane są z cache lub po re-renderze, zwracamy CZYSTY widget. Zero animacji.
        },
      );
    }

    // TARCZA: Wyrzucony AnimatedSize. Zwracamy po prostu twardy kontener.
    return HomeSectionCard(
      title: "Your Tracked Bills", // TODO: L10N
      icon: Icons.notifications_active,
      destinationPath: '/$lang/$slug/$term/legislations?list=tracked',
      buttonText: "See all tracked", // TODO: L10N
      showFooter: _trackedBills.isNotEmpty,
      child: AnimatedSize(
        duration: Duration(milliseconds: _playAnimation ? 400 : 0), 
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: content,
      ),
    );
  }
}

class _StaggeredListItem extends StatefulWidget {
  final int index;
  final Widget child;
  final bool animate;
  const _StaggeredListItem({required this.index, required this.child, this.animate = true});

  @override
  State<_StaggeredListItem> createState() => _StaggeredListItemState();
}

class _StaggeredListItemState extends State<_StaggeredListItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.animate) {
      _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
      _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

      Future.delayed(Duration(milliseconds: widget.index * 100), () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    if (widget.animate) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.animate) return widget.child;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
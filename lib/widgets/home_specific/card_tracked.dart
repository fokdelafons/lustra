import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../services/tracking_service.dart';
import '../../services/parliament_manager.dart';
import '../../providers/language_provider.dart';
import '../../models/legislation.dart';
import 'ui_home_card.dart';
import '../../widgets/osint_loader.dart';
import '../../widgets/web_link.dart';

class TrackedCard extends StatefulWidget {
  const TrackedCard({super.key});

  @override
  State<TrackedCard> createState() => _TrackedCardState();
}

class _TrackedCardState extends State<TrackedCard> {
  final TrackingService _trackingService = TrackingService();
  bool _isLoading = true;
  bool _playAnimation = true;
  bool _isQrHovered = false;
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
          _trackedBills = combined.take(5).toList();
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
    final firebaseUser = context.watch<User?>();
    if (firebaseUser == null) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context)!;
    final manager = context.read<ParliamentManager>();
    final slug = manager.activeSlug;
    final lang = context.read<LanguageProvider>().appLanguageCode;
    final term = manager.currentTerm;

    Widget content;

    if (_isLoading) {
      content = SizedBox(
        height: 150,
        child: Center(child: OsintLoader(text: l10n.loaderLoadingTrackedBills)),
      );
    } else if (_trackedBills.isEmpty) {
      final double screenWidth = MediaQuery.of(context).size.width;
      final bool showQrCode = screenWidth >= 1024;
      
      content = Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.notifications_off_outlined, size: 48, color: Colors.grey[400]),
              const SizedBox(height: 16),
              Text(l10n.emptyTrackedBills, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
              if (kIsWeb) ...[
                const SizedBox(height: 24),
                Text(l10n.notificationsMobileOnly, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: Colors.blueGrey, height: 1.4)),
                const SizedBox(height: 16),
                if (showQrCode)
                  MouseRegion(
                    onEnter: (_) => setState(() => _isQrHovered = true),
                    onExit: (_) => setState(() => _isQrHovered = false),
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(_isQrHovered ? 16.0 : 12.0),
                        border: Border.all(
                          color: _isQrHovered ? Theme.of(context).primaryColor.withAlpha(100) : Colors.grey.shade300,
                          width: _isQrHovered ? 2.0 : 1.0,
                        ),
                      ),
                      child: FittedBox(
                        child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: QrImageView(
                              data: 'https://www.lustra.news/download',
                              version: QrVersions.auto,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                    .animate(target: _isQrHovered ? 1 : 0)
                    .custom(
                      duration: 400.ms,
                      curve: Curves.easeOutBack,
                      builder: (context, value, child) {
                        // Size increase
                        final size = 64.0 + (256.0 * value);
                        return SizedBox(width: size, height: size, child: child);
                      },
                    )
                    .fade(begin: 0.35, end: 1.0, duration: 250.ms)
                    .boxShadow(
                      begin: const BoxShadow(color: Colors.transparent),
                      end: BoxShadow(
                        color: Theme.of(context).primaryColor.withAlpha(30), 
                        blurRadius: 16, 
                        spreadRadius: 2
                      ),
                      duration: 300.ms,
                    ),
                  )
                else
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
      content = ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _trackedBills.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final bill = _trackedBills[index];
          
          final tile = WebLink(
            path: '/$lang/$slug/$term/legislations/${bill.id}',
            extra: bill,
            builder: (context, onTapCallback) => ListTile(
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
              onTap: onTapCallback,
            ),
          );
          if (_playAnimation) {
             return _StaggeredListItem(key: ValueKey('stagger_$index'), index: index, child: tile);
          }
          return tile;
        },
      );
    }
    return HomeSectionCard(
      title: l10n.titleYourTrackedBills,
      icon: Icons.notifications_active,
      destinationPath: '/$lang/$slug/$term/legislations?list=tracked',
      buttonText: l10n.buttonSeeAllTracked,
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
  
  const _StaggeredListItem({super.key, required this.index, required this.child});

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
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
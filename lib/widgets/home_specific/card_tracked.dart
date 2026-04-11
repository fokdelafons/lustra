import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:lustra/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../services/tracking_service.dart';
import '../../services/parliament_manager.dart';
import '../../providers/language_provider.dart';
import '../../providers/interaction_provider.dart';
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
  List<Legislation> _trackedBills = [];
  int? _lastDbUpdateStamp;
  bool _showQrExplicitly = false;

  @override
  void initState() {
    super.initState();
    _fetchTracked();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final interactionProvider = context.watch<InteractionProvider>();
    final currentStamp = interactionProvider.trackedDbUpdateStamp;
    
    if (_lastDbUpdateStamp != null && _lastDbUpdateStamp != currentStamp) {
      _fetchTracked();
    }
    _lastDbUpdateStamp = currentStamp;
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
    final l10n = AppLocalizations.of(context)!;
    final manager = context.read<ParliamentManager>();
    final slug = manager.activeSlug;
    final lang = context.read<LanguageProvider>().appLanguageCode;
    final term = manager.currentTerm;

    Widget content;

    if (_isLoading) {
      content = SizedBox(height: 150, child: Center(child: OsintLoader(text: l10n.loaderLoadingTrackedBills)));
    } else if (firebaseUser == null || _trackedBills.isEmpty) {
      final bool isGuest = firebaseUser == null;
      content = Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Column(
            children: [
              Icon(isGuest ? Icons.auto_awesome : Icons.notifications_off_outlined, size: 48, color: Colors.grey[400]),
              const SizedBox(height: 16),
              Text(
                isGuest ? l10n.promoGuestTrackBills : l10n.emptyTrackedBills,
                textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)
              ),
              if (kIsWeb) ...[
                const SizedBox(height: 32),
                _buildDownloadButtons(),
                
                if (_showQrExplicitly) ...[
                  const SizedBox(height: 24),
                  _buildQrCode(),
                ],
                const SizedBox(height: 24),
                Text(l10n.promoGetAppForNotifications, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: Colors.blueGrey)),
              ]
            ],
          ),
        ),
      );
    } else {
      content = Column(
        children: [
          ...List.generate(_trackedBills.length, (index) {
            final bill = _trackedBills[index];
            final tile = WebLink(
              path: '/$lang/$slug/$term/legislations/${bill.id}',
              extra: bill,
              builder: (context, onTapCallback) => ListTile(
                hoverColor: Colors.black.withAlpha(15), contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                title: Text(bill.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                subtitle: Padding(padding: const EdgeInsets.only(top: 4.0), child: Text(bill.id, style: TextStyle(fontFamily: 'Roboto', fontSize: 11, color: Colors.grey[600]))),
                trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
                onTap: onTapCallback,
              ),
            );
            final item = _playAnimation ? _StaggeredListItem(key: ValueKey('stagger_$index'), index: index, child: tile) : tile;
            return index < _trackedBills.length - 1 ? Column(children: [item, const Divider(height: 1)]) : item;
          }),
          if (kIsWeb) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(l10n.promoGetAppForNotifications, style: const TextStyle(fontSize: 12, color: Colors.blueGrey), textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  _buildDownloadButtons(small: true),
                  if (_showQrExplicitly) ...[
                    const SizedBox(height: 24),
                    _buildQrCode(),
                  ],
                ],
              ),
            ),
          ]
        ],
      );
    }
    return HomeSectionCard(
      title: l10n.titleYourTrackedBills,
      icon: Icons.notifications_active,
      destinationPath: '/$lang/$slug/$term/legislations?list=tracked',
      buttonText: l10n.buttonSeeAllTracked,
      showHeaderAction: false,
      showFooter: _trackedBills.isNotEmpty,
      child: AnimatedSize(
        duration: Duration(milliseconds: _playAnimation ? 400 : 0), 
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: content,
      ),
    );
  }
  Widget _buildDownloadButtons({bool small = false}) {
    final l10n = AppLocalizations.of(context)!;
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12.0,
      runSpacing: 12.0,
      children: [
        ElevatedButton.icon(
          icon: Icon(Icons.android, size: small ? 14 : 16),
          label: Text("Google Play", style: TextStyle(fontSize: small ? 11 : 13)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          onPressed: () => launchUrlString("https://play.google.com/store/apps/details?id=dev.lustra"),
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.apple, size: small ? 14 : 16),
          label: Text("App Store", style: TextStyle(fontSize: small ? 11 : 13)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          onPressed: () => launchUrlString("https://apps.apple.com/app/id6751850630"),
        ),
        if (kIsWeb && MediaQuery.of(context).size.width > 800)
        ElevatedButton.icon(
          icon: Icon(_showQrExplicitly ? Icons.close : Icons.qr_code_scanner, size: small ? 14 : 16),
          label: Text(_showQrExplicitly ? l10n.actionHideQr : l10n.actionSyncViaQr, style: TextStyle(fontSize: small ? 11 : 13)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey[800], foregroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          onPressed: () => setState(() => _showQrExplicitly = !_showQrExplicitly),
        ),
      ],
    );
  }

  Widget _buildQrCode() {
    
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey.shade300, width: 1.0),
            boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 10, spreadRadius: 2)],
          ),
          child: SizedBox(
            width: 140, height: 140,
            child: QrImageView(data: 'https://www.lustra.news/download', version: QrVersions.auto, backgroundColor: Colors.white),
          ),
        ).animate().fade(duration: 300.ms).scale(begin: const Offset(0.9, 0.9), curve: Curves.easeOutBack),
      ],
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
import 'dart:developer' as developer;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lustra/providers/language_provider.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/parliament_manager.dart';
import '../../services/tracking_service.dart';
import '../../models/legislation.dart';
import '../../widgets/lists_specific/legislation_list_card.dart';
import '../../services/app_router.dart';

class TrackedLegislationScreen extends StatefulWidget {
  const TrackedLegislationScreen({super.key});

  @override
  TrackedLegislationScreenState createState() => TrackedLegislationScreenState();
}

class TrackedLegislationScreenState extends State<TrackedLegislationScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  
  final TrackingService _trackingService = TrackingService();
  final ScrollController _scrollController = ScrollController();
  
  List<Legislation> _bills = [];
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> refreshData() async {
    await _loadData();
  }

  Future<void> _loadData() async {
    if (!mounted) return;
    
    if (FirebaseAuth.instance.currentUser == null) {
      setState(() {
        _errorMessage = "You must be logged in to track bills."; // TODO: L10N
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final manager = Provider.of<ParliamentManager>(context, listen: false);
      final prefix = manager.activeServiceId;
      final lang = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
      
      if (prefix == null) throw Exception("No active parliament source.");

      final data = await _trackingService.getTrackedItems(prefix, lang);
      
      final rawLegislations = data['legislations'] ?? [];
      final rawCivic = data['civic'] ?? [];

      List<Legislation> combined = [];
      
      // Parsowanie z Fail-Safe
      for (var json in rawLegislations) {
        try { combined.add(Legislation.fromJson(json as Map<String, dynamic>)); } catch (_) {}
      }
      for (var json in rawCivic) {
        try { combined.add(Legislation.fromJson(json as Map<String, dynamic>)); } catch (_) {}
      }

      // Sortowanie lokalne (najnowsze na górze)
      combined.sort((a, b) {
        final dateA = a.processStartDate ?? a.documentDate ?? DateTime.now();
        final dateB = b.processStartDate ?? b.documentDate ?? DateTime.now();
        return dateB.compareTo(dateA);
      });

      if (mounted) {
        setState(() {
          _bills = combined;
          _isLoading = false;
        });
      }
    } catch (e) {
      developer.log('Błąd podczas ładowania śledzonych: $e', name: 'TrackedLegislationScreen');
      if (mounted) {
        setState(() {
          _errorMessage = AppLocalizations.of(context)!.errorFetchData;
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      final l10n = AppLocalizations.of(context)!;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(_errorMessage!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: Text(l10n.tryAgainButton),
              onPressed: _loadData,
            ),
          ],
        ),
      );
    }

    if (_bills.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.notifications_off_outlined, size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              "You are not tracking any bills yet.", // TODO: L10N
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    final bool isDesktopWeb = kIsWeb && MediaQuery.of(context).size.width > 750;

    Widget listView = ListView.builder(
      controller: _scrollController,
      physics: isDesktopWeb ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      itemCount: _bills.length,
      itemBuilder: (context, index) {
        final bill = _bills[index];
        
        return LegislationListCard(
          bill: bill,
          onTap: () {
            final manager = context.read<ParliamentManager>();
            final slug = manager.activeSlug;
            final lang = context.read<LanguageProvider>().appLanguageCode;
            
            // Dynamiczne routowanie: Obywatelskie vs Oficjalne
            final term = bill.documentType == 'civic' ? 'civic' : manager.currentTerm.toString();
            
            context.smartNavigate('/$lang/$slug/$term/legislations/${bill.id}?list=tracked', extra: bill);
          },
        );
      },
    );

    return RefreshIndicator(
      onRefresh: _loadData,
      child: isDesktopWeb
          ? WebSmoothScroll(
              controller: _scrollController,
              scrollAnimationLength: 600,
              scrollSpeed: 2.5,
              curve: Curves.easeOutQuart,
              child: listView,
            )
          : listView,
    );
  }
}
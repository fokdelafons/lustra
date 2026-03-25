import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/cache/parliament_cache_manager.dart';
import '../services/cache/cache_service.dart';

class InteractionProvider with ChangeNotifier, WidgetsBindingObserver {
  final ApiService _apiService = ApiService();
  String? _lastUserId;
  String? _lastPrefix;
  int _lastFetchTimestamp = 0;

  InteractionProvider() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _lastPrefix != null && _lastUserId != null) {
      _checkCrossTabSync();
    }
  }

  Future<void> _checkCrossTabSync() async {
    await CacheService().reload();
    
    final cache = ParliamentCacheManager(_lastPrefix!);
    final syncData = await cache.getInteractionSyncData();
    
    if (syncData != null) {
      final mutationTime = syncData['timestamp'] as int? ?? 0;
      final mutationUserId = syncData['userId'] as String?;

      if (mutationTime > _lastFetchTimestamp && mutationUserId == _lastUserId) {
        developer.log('Cross-tab mutation detected for current user. Syncing & Invalidating Cache...', name: 'InteractionProvider');
        
        await cache.clearTrackedItems(); 
        
        notifyTrackedListUpdatedInDb(); 
        
        fetchInteractions(_lastPrefix!);
      }
    }
  }

  void updateDependencies(String? userId, String? prefix) {
    if (_lastUserId != userId || _lastPrefix != prefix) {
      _lastUserId = userId;
      _lastPrefix = prefix;

      if (prefix != null) {
        _loadLocalViewedBills(prefix);
      }

      if (userId != null && prefix != null) {
        fetchInteractions(prefix);
      } else {
        clear();
      }
    }
  }

  Future<void> _loadLocalViewedBills(String prefix) async {
    final cache = ParliamentCacheManager(prefix);
    final localViewed = await cache.getLocalViewedBills();
    _viewedThisSession.addAll(localViewed);
    notifyListeners();
  }

  Set<String> _trackedBills = {};
  Set<String> _trackedCivic = {};
  Map<String, dynamic> _votes = {};
  final Set<String> _viewedThisSession = {};

  bool isViewedInSession(String billId) => _viewedThisSession.contains(billId);
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int get trackedCount => _trackedBills.length + _trackedCivic.length;
  int _trackedDbUpdateStamp = 0;
  int get trackedDbUpdateStamp => _trackedDbUpdateStamp;
  
  void notifyTrackedListUpdatedInDb() {
    _trackedDbUpdateStamp++;
    notifyListeners();
  }

  bool isTracked(String billId, {String docType = 'bill'}) {
    if (docType == 'civic') {
      return _trackedCivic.contains(billId);
    }
    return _trackedBills.contains(billId);
  }

  bool hasVoted(String voteKey) {
    return _votes.containsKey(voteKey);
  }

  Future<void> fetchInteractions(String prefix, {int maxRetries = 3}) async {
    _isLoading = true;
    notifyListeners();
    
    int attempt = 0;
    final cacheManager = ParliamentCacheManager(prefix);

    while (attempt < maxRetries) {
      try {
        developer.log('Pobieram zunifikowany stan dla: $prefix...', name: 'InteractionProvider');
        final response = await _apiService.callFunction('getUserInteractions', params: {
          'prefix': prefix,
        });

        final billsList = (response['trackedBills'] as List?)?.map((e) => e.toString()).toList() ?? [];
        final civicList = (response['trackedCivic'] as List?)?.map((e) => e.toString()).toList() ?? [];
        
        _trackedBills = Set.from(billsList);
        _trackedCivic = Set.from(civicList);
        _votes = Map<String, dynamic>.from(response['votes'] ?? {});
        _lastFetchTimestamp = DateTime.now().millisecondsSinceEpoch;

        await cacheManager.saveTrackedItems({
          'trackedBills': billsList,
          'trackedCivic': civicList,
          'votes': _votes
        }, 'all');

        developer.log('Załadowano do RAM z Firebase: ${_trackedBills.length} śledzonych, ${_votes.length} głosów.', name: 'InteractionProvider');
        break;
      } catch (e) {
        attempt++;
        developer.log('Błąd pobierania interakcji (próba $attempt/$maxRetries): $e', name: 'InteractionProvider');
        
        if (attempt >= maxRetries) {
          developer.log('Próba odzyskania interakcji z lokalnego cache...', name: 'InteractionProvider');
          final cachedData = await cacheManager.getTrackedItems('all');
          if (cachedData != null) {
            _trackedBills = Set.from((cachedData['trackedBills'] as List?)?.map((e) => e.toString()) ?? []);
            _trackedCivic = Set.from((cachedData['trackedCivic'] as List?)?.map((e) => e.toString()) ?? []);
            _votes = Map<String, dynamic>.from(cachedData['votes'] ?? {});
          }
        } else {
          await Future.delayed(Duration(milliseconds: 500 * attempt));
        }
      }
    }
    
    _isLoading = false;
    notifyListeners();
  }

  void toggleTrackingLocally(String billId, bool isNowTracked, {String docType = 'bill'}) {
    if (docType == 'civic') {
      isNowTracked ? _trackedCivic.add(billId) : _trackedCivic.remove(billId);
    } else {
      isNowTracked ? _trackedBills.add(billId) : _trackedBills.remove(billId);
    }
    notifyListeners();
  }

  void markAsVotedLocally(String voteKey) {
    _votes[voteKey] = true;
    notifyListeners();
  }

  void markAsViewedLocally(String billId) {
    if (!_viewedThisSession.contains(billId)) {
      _viewedThisSession.add(billId);
      notifyListeners(); // Natychmiastowe zgaszenie poświaty w UI
      
      // Zapis do lokalnego pliku w tle (Fire & Forget)
      if (_lastPrefix != null) {
        ParliamentCacheManager(_lastPrefix!).addLocalViewedBill(billId);
      }
    }
  }

  void clear() {
    _trackedBills.clear();
    _trackedCivic.clear();
    _votes.clear();
    notifyListeners();
  }
}
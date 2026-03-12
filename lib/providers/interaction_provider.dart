import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import '../services/api_service.dart';

class InteractionProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  String? _lastUserId;
  String? _lastPrefix;

  void updateDependencies(String? userId, String? prefix) {
    if (_lastUserId != userId || _lastPrefix != prefix) {
      _lastUserId = userId;
      _lastPrefix = prefix;

      if (userId != null && prefix != null) {
        fetchInteractions(prefix);
      } else {
        clear();
      }
    }
  }

  Set<String> _trackedBills = {};
  Set<String> _trackedCivic = {};
  Map<String, dynamic> _votes = {};
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool isTracked(String billId, {String docType = 'bill'}) {
    if (docType == 'civic') {
      return _trackedCivic.contains(billId);
    }
    return _trackedBills.contains(billId);
  }

  bool hasVoted(String voteKey) {
    return _votes.containsKey(voteKey);
  }

  Future<void> fetchInteractions(String prefix) async {
    _isLoading = true;
    notifyListeners();

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

      developer.log('Załadowano do RAM: ${_trackedBills.length} śledzonych, ${_votes.length} głosów.', name: 'InteractionProvider');
    } catch (e) {
      developer.log('Błąd pobierania interakcji: $e', name: 'InteractionProvider');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Optimistic UI
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

  void clear() {
    _trackedBills.clear();
    _trackedCivic.clear();
    _votes.clear();
    notifyListeners();
  }
}
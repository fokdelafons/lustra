import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lustra/services/api_service.dart';
import 'dart:developer' as developer;

class UserProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  Map<String, dynamic> _votes = {};
  bool _marketingConsent = false;
  bool _notificationsEnabled = false;
  String? _notificationParliamentId;
  
  bool _isInitialized = false;
  bool _profileExists = true;
  bool _isOnboarding = false;

  bool get profileExists => _profileExists;
  void setOnboardingStatus(bool status) {
    _isOnboarding = status;
  }
  String? _currentUserId;

  bool get isInitialized => _isInitialized;
  bool get marketingConsent => _marketingConsent;
  bool get notificationsEnabled => _notificationsEnabled;
  String? get notificationParliamentId => _notificationParliamentId;

  bool hasVoted(String targetKey) {
    return _votes.containsKey(targetKey);
  }

  void updateAuthStatus(User? firebaseUser) {
    if (firebaseUser == null) {
      _clear();
    } else if (_currentUserId != firebaseUser.uid) {
      _currentUserId = firebaseUser.uid;
      if (!_isOnboarding) {
        _fetchUserProfile();
      }
    }
  }

  Future<void> refreshProfile() async {
    await _fetchUserProfile();
  }

  Future<void> createProfile({required bool marketingConsent, required String parliamentId}) async {
    try {
      await _apiService.callFunction('userOnboarding', params: {
        'marketingConsent': marketingConsent, 
        'parliamentId': parliamentId,
      });
      _marketingConsent = marketingConsent;
      _profileExists = true;
      _isOnboarding = false;
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      developer.log("Błąd tworzenia profilu: $e", name: 'UserProvider');
      rethrow;
    }
  }

  Future<void> _fetchUserProfile() async {
    developer.log("Pobieranie profilu użytkownika (UserProvider)...", name: 'UserProvider');
    try {
      final result = await _apiService.callFunction('checkUserProfile');
      _profileExists = result['exists'] ?? false;

      if (result['exists'] == true && result['profile'] != null) {
        final profile = result['profile'] as Map<String, dynamic>;
        
        _marketingConsent = profile['marketingConsent'] ?? false;
        _notificationsEnabled = profile['notificationsEnabled'] ?? false;
        _notificationParliamentId = profile['notificationParliamentId'];

        if (profile.containsKey('votes')) {
          _votes = Map<String, dynamic>.from(profile['votes']);
          developer.log("Pobrano ${_votes.length} głosów.", name: 'UserProvider');
        } else {
          _votes = {};
        }
      }
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      developer.log("Błąd pobierania profilu: $e", name: 'UserProvider');
    }
  }

  void markAsVotedLocally(String targetKey) {
    _votes[targetKey] = true;
    notifyListeners();
  }

  Future<void> updatePreferences({bool? marketing, bool? notifications, String? parliamentId, String? fcmToken}) async {
    if (marketing != null) _marketingConsent = marketing;
    if (notifications != null) _notificationsEnabled = notifications;
    if (parliamentId != null) _notificationParliamentId = parliamentId;
    
    notifyListeners();

    try {
      final Map<String, dynamic> data = {};
      if (marketing != null) data['marketingConsent'] = marketing;
      if (notifications != null) data['notificationsEnabled'] = notifications;
      if (parliamentId != null) data['notificationParliamentId'] = parliamentId;
      if (fcmToken != null) data['fcmToken'] = fcmToken;
    } catch (e) {
      developer.log("Błąd aktualizacji preferencji: $e", name: 'UserProvider');
    }
  }

  void _clear() {
    _votes = {};
    _marketingConsent = false;
    _notificationsEnabled = false;
    _notificationParliamentId = null;
    _currentUserId = null;
    _isInitialized = false;
    notifyListeners();
  }
}
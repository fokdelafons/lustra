import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lustra/services/api_service.dart';
import 'package:lustra/services/cache/cache_service.dart';
import 'dart:developer' as developer;

class UserProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  Map<String, dynamic> _votes = {};
  bool _marketingConsent = false;
  bool _notificationsTrackedBills = false;
  List<String> _subscribedParliaments = [];
  String? _primaryParliamentId;

  bool get notificationsTrackedBills => _notificationsTrackedBills;

  List<String> _subscribedLists = [];
  List<String> _createdLists = [];
  bool _isCurator = false;
  
  bool _isInitialized = false;
  bool _profileExists = true;
  bool _isOnboarding = false;

  bool get profileExists => _profileExists;
  void setOnboardingStatus(bool status) {
    _isOnboarding = status;
  }
  String? _currentUserId;

  bool get isInitialized => _isInitialized;
  Map<String, dynamic> get votes => _votes;
  bool get marketingConsent => _marketingConsent;
  List<String> get subscribedParliaments => _subscribedParliaments;
  String? get primaryParliamentId => _primaryParliamentId;

  // Helper method for quick UI checks
  bool isParliamentSubscribed(String parliamentId) => _subscribedParliaments.contains(parliamentId);

  List<String> get subscribedLists => _subscribedLists;
  List<String> get createdLists => _createdLists;
  bool get isCurator => _isCurator;
  bool isSubscribedToList(String listId) => _subscribedLists.contains(listId);
  void updateListSubscriptionLocally(String listId, bool isSubscribed) {
    if (isSubscribed && !_subscribedLists.contains(listId)) {
      _subscribedLists.add(listId);
    } else if (!isSubscribed) {
      _subscribedLists.remove(listId);
    }
    notifyListeners();
  }


  void updateAuthStatus(User? firebaseUser) {
    if (firebaseUser == null) {
      _clear();
    } else if (_currentUserId != firebaseUser.uid || !_isInitialized) {
      _currentUserId = firebaseUser.uid;
            if (!_isOnboarding) {
        _fetchUserProfile(firebaseUser.uid);
      }
    }
  }

    Future<void> refreshProfile() async {
    if (_currentUserId == null) return;
    await _fetchUserProfile(_currentUserId!);
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

  Future<void> _fetchUserProfile(String uid, {int maxRetries = 5}) async {
      developer.log("Fetching User Profile for $uid...", name: 'UserProvider');
      int attempt = 0;

      while (attempt < maxRetries) {
        try {
          final result = await _apiService.callFunction('checkUserProfile');

          // GUARD: user changed during request — discard stale response
          if (_currentUserId != uid) return;

          _profileExists = result['exists'] ?? false;

          if (result['exists'] == true && result['profile'] != null) {
            final profile = Map<String, dynamic>.from(result['profile']);

            _marketingConsent = profile['marketingConsent'] ?? false;
            _notificationsTrackedBills = profile['notificationsTrackedBills'] ?? false;
            _subscribedParliaments = List<String>.from(profile['subscribedParliaments'] ?? []);
            _primaryParliamentId = profile['primaryParliamentId']?.toString();
            _votes = profile['votes'] != null ? Map<String, dynamic>.from(profile['votes']) : {};
            _subscribedLists = List<String>.from(profile['subscribedLists'] ?? []);
            _createdLists = List<String>.from(profile['createdLists'] ?? []);
            _isCurator = profile['isCurator'] ?? false;

            // Cache per UID — prevents cross-account data leaks
            await CacheService().save('_cached_user_profile_$uid', profile);
            developer.log("Profile fetched & cached for $uid.", name: 'UserProvider');
          }

          if (_currentUserId != uid) return;
          _isInitialized = true;
          notifyListeners();
          return;
        } catch (e) {
          attempt++;
          developer.log("Fetch failed (Attempt $attempt/$maxRetries): $e", name: 'UserProvider');

          if (attempt >= maxRetries) {
            final cachedProfile = await CacheService().get('_cached_user_profile_$uid');

            // GUARD after await — user may have changed
            if (_currentUserId != uid) return;

            if (cachedProfile != null) {
              _marketingConsent = cachedProfile['marketingConsent'] ?? false;
              _notificationsTrackedBills = cachedProfile['notificationsTrackedBills'] ?? false;
              _subscribedParliaments = List<String>.from(cachedProfile['subscribedParliaments'] ?? []);
              _primaryParliamentId = cachedProfile['primaryParliamentId'];
              _subscribedLists = List<String>.from(cachedProfile['subscribedLists'] ?? []);
              _createdLists = List<String>.from(cachedProfile['createdLists'] ?? []);
              _isCurator = cachedProfile['isCurator'] ?? false;
              developer.log("Loaded profile from cache for $uid.", name: 'UserProvider');
            }
            _isInitialized = true;
            notifyListeners();
          } else {
            await Future.delayed(Duration(seconds: attempt * 1));
          }
        }
      }
    }

    Future<void> updatePreferences({bool? marketing, bool? notificationsTrackedBills, List<String>? subscribedParliaments, String? fcmToken, String? lang}) async {
    // Snapshot for rollback on failure
    final prevMarketing = _marketingConsent;
    final prevNotifications = _notificationsTrackedBills;
    final prevSubscribed = List<String>.from(_subscribedParliaments);

    // Optimistic update
    if (marketing != null) _marketingConsent = marketing;
    if (notificationsTrackedBills != null) _notificationsTrackedBills = notificationsTrackedBills;
    if (subscribedParliaments != null) _subscribedParliaments = subscribedParliaments;
    notifyListeners();

    try {
      final Map<String, dynamic> data = {};
      if (marketing != null) data['marketingConsent'] = marketing;
      if (notificationsTrackedBills != null) data['notificationsTrackedBills'] = notificationsTrackedBills;
      if (subscribedParliaments != null) data['subscribedParliaments'] = subscribedParliaments;
      if (fcmToken != null) data['fcmToken'] = fcmToken;
      if (lang != null) data['preferredLanguage'] = lang;
      if (data.isNotEmpty) {
        await _apiService.callFunction('updateUserProfile', params: data);
      }
    } catch (e) {
      // Rollback — UI shows truth, not stale optimistic state
      _marketingConsent = prevMarketing;
      _notificationsTrackedBills = prevNotifications;
      _subscribedParliaments = prevSubscribed;
      notifyListeners();
      developer.log("Błąd aktualizacji preferencji (rollback): $e", name: 'UserProvider');
    }
  }

    void _clear() {
    final uid = _currentUserId;
    _votes = {};
    _marketingConsent = false;
    _subscribedParliaments = [];
    _primaryParliamentId = null;
    _subscribedLists = [];
    _createdLists = [];
    _isCurator = false;
    _currentUserId = null;
    _isInitialized = false;
    // Fire-and-forget — async clear runs in background while UI resets
    CacheService().clearUserData(uid: uid);
    notifyListeners();
  }

  int curatedListUpdateStamp = 0;

  void triggerCuratedListsRebuild() {
    curatedListUpdateStamp++;
    notifyListeners();
  }
}
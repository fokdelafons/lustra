import 'dart:developer' as developer;
import 'package:firebase_auth/firebase_auth.dart';
import 'api_service.dart';
import 'cache/parliament_cache_manager.dart';

class TrackingService {
  final ApiService _apiService = ApiService();

  Future<bool> toggleTrackBill(String prefix, String billId, {String docType = 'bill'}) async {
    try {
      final response = await _apiService.callFunction('toggleBillTracking', params: {
        'prefix': prefix,
        'billId': billId,
        'docType': docType,
      });
      
      final cacheManager = ParliamentCacheManager(prefix);
      await cacheManager.clearTrackedItems();
      
      final currentUserId = FirebaseAuth.instance.currentUser?.uid;
      if (currentUserId != null) {
        await cacheManager.markInteractionChanged(currentUserId);
      }
      
      return response['isTracked'] as bool? ?? false;
    } catch (e) {
      developer.log('Błąd podczas przełączania śledzenia: $e', name: 'TrackingService');
      rethrow;
    }
  }

  Future<bool> checkTrackBill(String prefix, String billId, {String docType = 'bill'}) async {
    try {
      final response = await _apiService.callFunction('checkBillTracking', params: {
        'prefix': prefix,
        'billId': billId,
        'docType': docType,
      });
      return response['isTracked'] as bool? ?? false;
    } catch (e) {
      developer.log('Błąd podczas sprawdzania śledzenia: $e', name: 'TrackingService');
      return false; // Fail-safe
    }
  }

  Future<Map<String, List<dynamic>>> getTrackedItems(String prefix, String lang, {bool forceRefresh = false}) async {
    final cacheManager = ParliamentCacheManager(prefix);

    if (!forceRefresh) {
      final cachedData = await cacheManager.getTrackedItems(lang);
      if (cachedData != null) {
        developer.log('Zwracam śledzone z CacheService.', name: 'TrackingService');
        return {
          'legislations': cachedData['legislations'] as List? ?? [],
          'civic': cachedData['civic'] as List? ?? [],
        };
      }
    }

    try {
      final response = await _apiService.callFunction('getTrackedItems', params: {
        'prefix': prefix,
        'lang': lang,
      });
      
      final legislations = (response['legislations'] as List?) ?? [];
      final civic = (response['civic'] as List?) ?? [];
      
      final resultData = {
        'legislations': legislations,
        'civic': civic,
      };

      await cacheManager.saveTrackedItems(resultData, lang);
      
      return resultData;
    } catch (e) {
      developer.log('Błąd podczas pobierania śledzonych elementów z API: $e', name: 'TrackingService');
      return {'legislations': [], 'civic': []};
    }
  }
}
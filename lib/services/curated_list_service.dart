import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'api_service.dart';
import 'cache/parliament_cache_manager.dart';

class CuratedListService {
  final ApiService _apiService = ApiService();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<String?> createList(String listName, String prefix, {String description = ''}) async {
    try {
      final response = await _apiService.callFunction('createCuratedList', params: {
        'listName': listName,
        'prefix': prefix,
        'description': description,
      });
      return response['listId'] as String?;
    } catch (e) {
      developer.log('Błąd podczas tworzenia listy: $e', name: 'CuratedListService');
      rethrow;
    }
  }

  Future<bool> toggleBillInList(String listId, String billId, String prefix, {String docType = 'bill'}) async {
    try {
      final response = await _apiService.callFunction('toggleBillInCuratedList', params: {
        'listId': listId,
        'billId': billId,
        'docType': docType,
        'prefix': prefix,
      });
      await ParliamentCacheManager(prefix).clearMyCuratedLists();
      await ParliamentCacheManager(prefix).clearCuratedListFeed(listId);
      await ParliamentCacheManager(prefix).clearCuratedListPreview(listId);
      return response['isAdded'] as bool? ?? false;
    } catch (e) {
      developer.log('Błąd podczas edycji listy: $e', name: 'CuratedListService');
      rethrow;
    }
  }

  Future<bool> toggleSubscription(String listId) async {
    try {
      final response = await _apiService.callFunction('subscribeToCuratedList', params: {
        'listId': listId,
      });
      
      final bool isSubscribed = response['isSubscribed'] as bool? ?? false;
      final topicName = 'list_$listId';
      
      if (!kIsWeb) {
        try {
          if (isSubscribed) {
            await _messaging.subscribeToTopic(topicName);
            developer.log('Zasubskrybowano temat FCM: $topicName', name: 'CuratedListService');
          } else {
            await _messaging.unsubscribeFromTopic(topicName);
            developer.log('Odsubskrybowano z tematu FCM: $topicName', name: 'CuratedListService');
          }
        } catch (fcmError) {
          developer.log('Ignorowany błąd FCM: $fcmError', name: 'CuratedListService');
        }
      } else {
         developer.log('FCM Topics pominięte (brak wsparcia na Webie). Backend zaktualizowany.', name: 'CuratedListService');
      }

      return isSubscribed;
    } catch (e) {
      developer.log('Błąd podczas subskrypcji listy: $e', name: 'CuratedListService');
      rethrow;
    }
  }

Future<Map<String, dynamic>?> getFeed(String listId, String lang, String prefix, {bool forceRefresh = false, bool previewOnly = false}) async {
    final cacheManager = ParliamentCacheManager(prefix);

    if (!forceRefresh) {
      final cachedData = previewOnly 
          ? await cacheManager.getCuratedListPreview(listId, lang)
          : await cacheManager.getCuratedListFeed(listId, lang);
          
      if (cachedData != null) return cachedData;
    }

    try {
      final response = await _apiService.callFunction('getCuratedListFeed', params: {
        'listId': listId,
        'lang': lang,
        'previewOnly': previewOnly,
      });
      
      final resultData = {
        'status': response['status'],
        'metadata': response['metadata'] ?? {},
        'legislations': response['legislations'] as List? ?? [],
        'civic': response['civic'] as List? ?? [],
      };
      
      if (previewOnly) {
        await cacheManager.saveCuratedListPreview(listId, resultData, lang);
      } else {
        await cacheManager.saveCuratedListFeed(listId, resultData, lang);
      }
      
      return resultData;
    } catch (e) {
      if (e.toString().contains('NOT_FOUND') || e.toString().contains('not-found')) {
        return {'status': 'deleted'};
      }
      developer.log('Błąd podczas pobierania feedu: $e', name: 'CuratedListService');
      return null;
    }
  }

Future<List<Map<String, dynamic>>> getMyLists(String prefix, {bool forceRefresh = false}) async {
    final cacheManager = ParliamentCacheManager(prefix);

    if (!forceRefresh) {
      final cachedLists = await cacheManager.getMyCuratedLists();
      if (cachedLists != null) {
        return cachedLists.map((e) => Map<String, dynamic>.from(e as Map)).toList();
      }
    }

    try {
      final response = await _apiService.callFunction('getMyCuratedLists', params: {
        'prefix': prefix,
      });
      final lists = response['lists'] as List<dynamic>? ?? [];
      
      await cacheManager.saveMyCuratedLists(lists);
      return lists.map((e) => e as Map<String, dynamic>).toList();
    } catch (e) {
      developer.log('Błąd podczas pobierania własnych list: $e', name: 'CuratedListService');
      return [];
    }
  }

Future<bool> updateListMeta(String listId, String newName, String? newDesc, String? tipProvider, String? tipUsername) async {
    try {
      final response = await _apiService.callFunction('updateCuratedListMeta', params: {
        'listId': listId,
        'newName': newName,
        if (newDesc != null) 'newDescription': newDesc,
        if (tipProvider != null) 'tipProvider': tipProvider,
        if (tipUsername != null) 'tipUsername': tipUsername,
      });
      return response['success'] as bool? ?? false;
    } catch (e) {
      developer.log('Error updating list meta: $e', name: 'CuratedListService');
      rethrow;
    }
  }

  Future<bool> deleteList(String listId) async {
    try {
      final response = await _apiService.callFunction('deleteCuratedList', params: {
        'listId': listId,
      });
      return response['success'] as bool? ?? false;
    } catch (e) {
      developer.log('Błąd podczas usuwania listy: $e', name: 'CuratedListService');
      rethrow;
    }
  }

  Future<bool> setHighlightedBill(String listId, String billId) async {
    try {
      final response = await _apiService.callFunction('setHighlightedBill', params: {
        'listId': listId,
        'billId': billId,
      });
      return response['success'] as bool? ?? false;
    } catch (e) {
      developer.log('Błąd podczas ustawiania korony: $e', name: 'CuratedListService');
      rethrow;
    }
  }

  Future<void> notifySubscribers(String listId, String prefix) async {
    try {
      await _apiService.callFunction('sendCuratedListPush', params: {
        'listId': listId,
        'prefix': prefix,
      });
    } catch (e) {
      developer.log('Błąd podczas wysyłania powiadomień z listy: $e', name: 'CuratedListService');
      rethrow;
    }
  }
}
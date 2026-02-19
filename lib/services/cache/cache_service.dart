import 'dart:convert';
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static final CacheService _instance = CacheService._internal();
  factory CacheService() => _instance;
  CacheService._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<Map<String, dynamic>?> get(String key, {String? validationKey}) async {
    await init();
    try {
      final cachedJson = _prefs?.getString(key);
      if (cachedJson == null) return null;

      if (validationKey == null) {
        return json.decode(cachedJson) as Map<String, dynamic>;
      }

      final timestampStr = _prefs?.getString('${key}_timestamp');
      final lastUpdatedStr = _prefs?.getString(validationKey);

      if (timestampStr == null || lastUpdatedStr == null) return null;

      final cacheTime = DateTime.tryParse(timestampStr);
      final lastUpdatedTime = _parseDate(lastUpdatedStr);

      if (cacheTime != null && lastUpdatedTime != null && cacheTime.isAfter(lastUpdatedTime)) {
        return json.decode(cachedJson) as Map<String, dynamic>;
      }
    } catch (e) {
      developer.log('Błąd odczytu cache ($key): $e', name: 'CacheService');
    }
    return null;
  }

  Future<void> save(String key, Map<String, dynamic> data, {String? globalUpdateKey, String? globalUpdateValue}) async {
    await init();
    try {
      final jsonString = json.encode(data);
      await _prefs?.setString(key, jsonString);
      await _prefs?.setString('${key}_timestamp', DateTime.now().toIso8601String());

      if (globalUpdateKey != null && globalUpdateValue != null) {
        await _prefs?.setString(globalUpdateKey, globalUpdateValue);
        developer.log('Zaktualizowano globalny timestamp: $globalUpdateKey', name: 'CacheService');
      }
    } catch (e) {
      developer.log('Błąd zapisu cache ($key): $e', name: 'CacheService');
    }
  }

  Future<void> remove(String key) async {
    await init();
    await _prefs?.remove(key);
  }

  Future<void> clearByPrefix(String prefix) async {
    await init();
    final keys = _prefs?.getKeys();
    if (keys == null) return;
    
    final toRemove = keys.where((k) => k.startsWith(prefix)).toList();
    for (var key in toRemove) {
      await _prefs?.remove(key);
    }
    developer.log('Wyczyszczono cache dla prefixu: $prefix', name: 'CacheService');
  }

  DateTime? _parseDate(String? dateString) {
    if (dateString == null) return null;
    final int? timestamp = int.tryParse(dateString);
    if (timestamp != null) {
      return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
    }
    return DateTime.tryParse(dateString);
  }

  Future<void> removeOldEntries({required int daysToKeep, String? prefix}) async {
    await init();
    final keys = _prefs?.getKeys();
    if (keys == null) return;

    final now = DateTime.now();
    final cutoff = now.subtract(Duration(days: daysToKeep));
    
    final timestampKeys = keys.where((k) => k.endsWith('_timestamp')).toList();
    
    int removedCount = 0;

    for (var tsKey in timestampKeys) {
      if (prefix != null && !tsKey.startsWith(prefix)) continue;

      final tsValue = _prefs?.getString(tsKey);
      if (tsValue != null) {
        final date = DateTime.tryParse(tsValue);
        if (date != null && date.isBefore(cutoff)) {
          await _prefs?.remove(tsKey);
          
          final dataKey = tsKey.substring(0, tsKey.length - 10);
          await _prefs?.remove(dataKey);
          removedCount++;
        }
      }
    }
    
    if (removedCount > 0) {
      developer.log('Garbage Collector: Usunięto $removedCount starych wpisów z cache.', name: 'CacheService');
    }
  }
}
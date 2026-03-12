import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class VotingService {
  static const String _optimisticCountersPrefix = 'optimistic_poll_counters_';
  static const String _optimisticTimestampPrefix = 'optimistic_poll_timestamp_';
  static const Duration _optimisticCacheDuration = Duration(hours: 24); // Cache lifetime

  Future<void> saveOptimisticCounters(String targetType, String targetId, Map<String, int> counters) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final pollKey = '${targetType}_$targetId';
      await prefs.setString('$_optimisticCountersPrefix$pollKey', jsonEncode(counters));
      await prefs.setInt('$_optimisticTimestampPrefix$pollKey', DateTime.now().millisecondsSinceEpoch);
    } catch (e) {
      developer.log('Error saving optimistic counters: $e');
    }
  }

  Future<Map<String, int>?> getOptimisticCounters(String targetType, String targetId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final pollKey = '${targetType}_$targetId';
      final timestampMillis = prefs.getInt('$_optimisticTimestampPrefix$pollKey');

      if (timestampMillis != null) {
        final timestamp = DateTime.fromMillisecondsSinceEpoch(timestampMillis);
        if (DateTime.now().difference(timestamp) < _optimisticCacheDuration) {
          final countersString = prefs.getString('$_optimisticCountersPrefix$pollKey');
          if (countersString != null) {
            final decodedMap = jsonDecode(countersString) as Map<String, dynamic>;
            return decodedMap.map((key, value) => MapEntry(key, value as int));
          }
        } else {
          await clearOptimisticCounters(targetType, targetId);
        }
      }
      return null; 
    } catch (e) {
      developer.log('Error getting optimistic counters: $e');
      await clearOptimisticCounters(targetType, targetId);
      return null;
    }
  }

  Future<void> clearOptimisticCounters(String targetType, String targetId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final pollKey = '${targetType}_$targetId';
      await prefs.remove('$_optimisticCountersPrefix$pollKey');
      await prefs.remove('$_optimisticTimestampPrefix$pollKey');
    } catch (e) {
      developer.log('Error removing SharedPreferences key for resetLocalVote: $e');
    }
  }

  Future<void> clearVoteStatus(String targetType, String targetId) async {
    await clearOptimisticCounters(targetType, targetId);
  }
}
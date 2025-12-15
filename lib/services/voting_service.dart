import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class VotingService {
  // Klucze dla SharedPreferences
  static const String _votedPollPrefix = 'voted_poll_';

  // Generuje unikalny klucz dla SharedPreferences
  // Klucz będzie np. "voted_poll_legislation_123" lub "voted_poll_deputy_456"
  String _generateStorageKey(String targetType, String targetId) {
    return '$_votedPollPrefix${targetType}_$targetId';
  }

  /// Sprawdza, czy użytkownik już głosował na dany cel (ustawę/posła)
  /// na tym urządzeniu.
  Future<bool> hasVotedLocally(String targetType, String targetId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_generateStorageKey(targetType, targetId)) ?? false;
    } catch (e) {
      // Możesz tutaj dodać logowanie błędu, jeśli chcesz
      developer.log('Error reading SharedPreferences for hasVotedLocally: $e');
      return false; // W przypadku błędu, załóż, że nie głosowano
    }
  }

  /// Zapisuje informację, że użytkownik zagłosował na dany cel
  /// na tym urządzeniu.
  Future<void> markAsVotedLocally(String targetType, String targetId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_generateStorageKey(targetType, targetId), true);
    } catch (e) {
      developer.log('Error writing SharedPreferences for markAsVotedLocally: $e');
      // Rozważ, jak obsłużyć błąd zapisu - czy rzucić wyjątek, czy tylko zalogować
    }
  }

  /// Opcjonalnie: Metoda do resetowania lokalnego stanu głosowania
  /// (np. do celów testowych lub jeśli użytkownik wyloguje się i chcesz wyczyścić stan).
  Future<void> resetLocalVote(String targetType, String targetId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_generateStorageKey(targetType, targetId));
      // Dodatkowo usuń zcache'owane liczniki, gdy resetujemy głos
      await clearOptimisticCounters(targetType, targetId);
    } catch (e) {
      developer.log('Error removing SharedPreferences key for resetLocalVote: $e');
    }
  }

  // --- Nowe metody do cachowania optymistycznych liczników ---
  static const String _optimisticCountersPrefix = 'optimistic_poll_counters_';
  static const String _optimisticTimestampPrefix = 'optimistic_poll_timestamp_';
  static const Duration _optimisticCacheDuration = Duration(hours: 24); // Czas życia cache'a

  /// Zapisuje optymistyczne liczniki sondażu lokalnie.
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

  /// Pobiera zcache'owane optymistyczne liczniki sondażu, jeśli nie wygasły.
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
            // Bezpieczne dekodowanie i konwersja na Map<String, int>
            final decodedMap = jsonDecode(countersString) as Map<String, dynamic>;
            return decodedMap.map((key, value) => MapEntry(key, value as int));
          }
        } else {
          // Cache wygasł, usuń stare dane
          await clearOptimisticCounters(targetType, targetId);
        }
      }
      return null; // Brak danych lub wygasły cache
    } catch (e) {
      developer.log('Error getting optimistic counters: $e');
      // W przypadku błędu odczytu lub parsowania, wyczyść dane i zwróć null
      await clearOptimisticCounters(targetType, targetId);
      return null;
    }
  }

  /// Czyści zcache'owane optymistyczne liczniki i timestamp.
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
    await resetLocalVote(targetType, targetId);
  }
}
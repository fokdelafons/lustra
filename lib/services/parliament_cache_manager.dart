import 'package:lustra/models/home_screen_data.dart';
import 'package:lustra/models/legislation.dart';
import 'package:lustra/models/mp.dart';
import 'package:lustra/services/cache_service.dart';

class ParliamentCacheManager {
  final String prefix;
  final CacheService _storage = CacheService();

  ParliamentCacheManager(this.prefix);

  // --- KEYS ---
  String get _globalUpdateKey => '${prefix}_last_updated';

  // --- CLEANER ---
  Future<void> cleanUp() async {
    await _storage.removeOldEntries(daysToKeep: 7, prefix: prefix);
  }

  // --- METADATA ---
  
  Future<Map<String, dynamic>?> getMetadata() async {
    return await _storage.get('${prefix}_metadata_cache');
  }

  Future<void> saveMetadata(Map<String, dynamic> data) async {
    var rawDate = data['lastUpdated'];
    String? cleanTimestamp;
    if (rawDate is Map && rawDate.containsKey('_seconds')) {
      cleanTimestamp = rawDate['_seconds'].toString();
    } 
    else if (rawDate != null) {
      cleanTimestamp = rawDate.toString();
    }
    await _storage.save(
      '${prefix}_metadata_cache', 
      data,
      globalUpdateKey: _globalUpdateKey,
      globalUpdateValue: cleanTimestamp
    );
  }

  Future<void> clearAll() async {
    await _storage.clearByPrefix('${prefix}_');
  }

  // --- HOME SCREEN ---

  Future<HomeScreenData?> getHomeScreenData(String lang, int term, {bool ignoreTimestamp = false}) async {
    final key = '${prefix}_cached_homescreen_term_${term}_lang_$lang';
    final jsonMap = await _storage.get(key, validationKey: ignoreTimestamp ? null : _globalUpdateKey);
    return jsonMap != null ? HomeScreenData.fromJson(jsonMap) : null;
  }

  Future<void> saveHomeScreenData(HomeScreenData data, String lang, int term) async {
    final key = '${prefix}_cached_homescreen_term_${term}_lang_$lang';
    await _storage.save(key, data.toJson());
  }

  // --- LISTS BILLS (CURSOR) ---

  Future<Map<String, dynamic>?> getLegislationsCursor(
    String langCode, int limit, String? lastVisibleId, 
    {String? status, List<String>? documentType, String? category, String? sortBy, String? processStartDateAfter, required int term}
  ) async {
    final key = _genBillsKey(langCode, limit, lastVisibleId, status, documentType, category, sortBy, processStartDateAfter, term);
    return await _storage.get(key, validationKey: _globalUpdateKey);
  }

  Future<void> saveLegislationsCursor(
    Map<String, dynamic> data, String langCode, int limit, String? lastVisibleId,
    {String? status, List<String>? documentType, String? category, String? sortBy, String? processStartDateAfter, required int term}
  ) async {
    final key = _genBillsKey(langCode, limit, lastVisibleId, status, documentType, category, sortBy, processStartDateAfter, term);
    await _storage.save(key, data);
  }

  String _genBillsKey(String lang, int limit, String? cursor, String? status, List<String>? types, String? cat, String? sort, String? after, int term) {
    final tStr = types?.join(',') ?? 'none';
    final sStr = status?.isNotEmpty == true ? status : 'none';
    final cStr = cat?.isNotEmpty == true && cat != 'Wszystkie' ? cat : 'none';
    final curStr = cursor ?? 'firstPage';
    final sortStr = sort ?? 'popularity';
    final aftStr = after ?? 'none';
    return '${prefix}_cached_bills_cursor_term_${term}_lang_${lang}_lim_${limit}_cursor_${curStr}_stat_${sStr}_type_${tStr}_cat_${cStr}_sort_${sortStr}_after_$aftStr';
  }

  // --- BILL DETAILS ---

  Future<Legislation?> getLegislationDetails(String id, String lang) async {
    final key = '${prefix}_cached_legislation_details_id_${id}_lang_$lang';
    final jsonMap = await _storage.get(key, validationKey: _globalUpdateKey);
    return jsonMap != null ? Legislation.fromJson(jsonMap) : null;
  }

  Future<void> saveLegislationDetails(Legislation item, String lang) async {
    final key = '${prefix}_cached_legislation_details_id_${item.id}_lang_$lang';
    await _storage.save(key, item.toJson());
  }

  // --- LIST MP (CURSOR) ---

  Future<Map<String, dynamic>?> getMPsCursor(String lang, int limit, String? lastVisibleId, {required int term, String? club, String? sortBy}) async {
    final key = _genMPsKey(lang, limit, lastVisibleId, term, club, sortBy);
    return await _storage.get(key, validationKey: _globalUpdateKey);
  }

  Future<void> saveMPsCursor(Map<String, dynamic> data, String lang, int limit, String? lastVisibleId, {required int term, String? club, String? sortBy}) async {
    final key = _genMPsKey(lang, limit, lastVisibleId, term, club, sortBy);
    await _storage.save(key, data);
  }

  String _genMPsKey(String lang, int limit, String? cursor, int term, String? club, String? sortBy) {
    final cKey = club ?? 'all';
    final sKey = sortBy ?? 'popularity';
    final curStr = cursor ?? 'firstPage';
    return '${prefix}_cached_mps_cursor_term_${term}_lang_${lang}_lim_${limit}_cursor_${curStr}_club_${cKey}_sort_$sKey';
  }

  // --- MP DETAILS ---

  Future<MP?> getMPDetails(String id, {required String lang, String? dataType, Map<String, dynamic>? params, required int term}) async {
    final key = _genMPDetailsKey(id, lang, dataType, params, term);
    final jsonMap = await _storage.get(key, validationKey: _globalUpdateKey);
    return jsonMap != null ? MP.fromJson(jsonMap) : null;
  }

  Future<void> saveMPDetails(MP mp, {required String lang, String? dataType, Map<String, dynamic>? params, required int term}) async {
    final key = _genMPDetailsKey(mp.id, lang, dataType, params, term);
    await _storage.save(key, mp.toJson());
  }

  String _genMPDetailsKey(String id, String lang, String? dataType, Map<String, dynamic>? params, int term) {
    String key = '${prefix}_cached_mp_term_${term}_id_${id}_lang_$lang'; 
    if (dataType != null) key += '_data_$dataType';
    if (params != null) {
      if (params.containsKey('startAfterDocId')) key += '_after_${params['startAfterDocId']}';
      if (params.containsKey('limit')) key += '_limit_${params['limit']}';
    }
    return key;
  }
  
  // --- CIVIC ---
  
  Future<Map<String, dynamic>?> getCivicProjects(String lang, int limit, String? lastVisibleId, String? category, String? sortBy) async {
     final key = '${prefix}_cached_civic_lang_${lang}_lim_${limit}_cursor_${lastVisibleId ?? 'firstPage'}_cat_${category ?? 'none'}_sort_${sortBy ?? 'popularity'}';
     return await _storage.get(key, validationKey: _globalUpdateKey);
  }
  
  Future<void> saveCivicProjects(Map<String, dynamic> data, String lang, int limit, String? lastVisibleId, String? category, String? sortBy) async {
     final key = '${prefix}_cached_civic_lang_${lang}_lim_${limit}_cursor_${lastVisibleId ?? 'firstPage'}_cat_${category ?? 'none'}_sort_${sortBy ?? 'popularity'}';
     await _storage.save(key, data);
  }
}
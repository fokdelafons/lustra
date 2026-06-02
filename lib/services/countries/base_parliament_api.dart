import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/legislation.dart';
import '../../models/mp.dart';
import '../../models/home_screen_data.dart';
import '../../providers/language_provider.dart';
import '../api_service.dart';
import '../cache/parliament_cache_manager.dart';

abstract class BaseParliamentApi with ChangeNotifier {
  final ApiService _apiService = ApiService();

  final String _countryPrefix;
    final ParliamentCacheManager _cache;

    String get countryPrefix => _countryPrefix;
    ParliamentCacheManager get cache => _cache;

    // --- UI overrides ---
    String get name;
    Map<int, String> get termDurations;
    Map<int, int> get termYears;

    // --- stan ---
    int? _currentTerm;
    int? _latestTerm;
    List<int> _availableTerms = [];
    List<String> _clubFilters = [];
    bool _isLoading = false;

    int? get currentTerm => _currentTerm;
    int? get latestTerm => _latestTerm;
    List<int> get availableTerms => _availableTerms;
    List<String> get clubFilters => _clubFilters;

    Completer<void> _initializationCompleter = Completer<void>();
    Future<void> get initializationDone => _initializationCompleter.future;

    bool get isLoading => _isLoading;

    BaseParliamentApi(this._countryPrefix)
        : _cache = ParliamentCacheManager(_countryPrefix);

  // ============================================================
  // INIT
  // ============================================================
      Future<void> initialize() async {
    if (_initializationCompleter.isCompleted) {
      _initializationCompleter = Completer<void>();
    }
    developer.log('Inicjalizacja $name...', name: name);
    _isLoading = true;
    notifyListeners();

    final cachedMeta = await _cache.getMetadata();
    final bool hasCache = cachedMeta != null;

    if (hasCache) {
      try {
        _currentTerm = cachedMeta['currentTerm'] as int?;
        _latestTerm = cachedMeta['currentTerm'] as int?;
        _availableTerms = (cachedMeta['availableTerms'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];
        _clubFilters = (cachedMeta['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
        _clubFilters.sort();
        notifyListeners();
      } catch (e) {
        developer.log('Błąd parsowania cache metadanych', name: name);
      }
    }

    try {
      final data = await _apiService.callFunction('${_countryPrefix}_getMetadata');
      _cache.cleanUp().catchError((e) {
        developer.log('Błąd podczas czyszczenia cache: $e', name: name);
      });
      await _cache.saveMetadata(data);

      _currentTerm = data['currentTerm'] as int?;
      _latestTerm = data['currentTerm'] as int?;
      _availableTerms = (data['availableTerms'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];
      _clubFilters = (data['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
      _clubFilters.sort();
      developer.log('$name zainicjalizowany (z sieci). Kadencja: $_currentTerm', name: name);
    } catch (e, stackTrace) {
      developer.log(
        'Błąd sieciowy podczas inicjalizacji $name: ${e.toString()}',
        name: name,
        error: e,
        stackTrace: stackTrace,
      );
      if (!hasCache) {
        if (!_initializationCompleter.isCompleted) {
          _initializationCompleter.completeError(e, stackTrace);
        }
        throw Exception('Brak połączenia z siecią i brak danych w cache.');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
      if (!_initializationCompleter.isCompleted) {
        _initializationCompleter.complete();
      }
    }
  }

  // ============================================================
  // CHANGE TERM
  // ============================================================
    Future<void> changeTerm(int newTerm) async {
    if (_currentTerm == newTerm) return;
    _isLoading = true;
    notifyListeners();
    _currentTerm = newTerm;
    try {
      final data = await _apiService.callFunction(
        '${_countryPrefix}_getMetadata',
        params: {'type': 'term_clubs', 'term': newTerm},
      );
      _clubFilters = (data['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
      _clubFilters.sort();
    } catch (e) {
      _clubFilters = [];
      developer.log('Błąd podczas zmiany kadencji: $e', name: name);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ============================================================
  // HOME SCREEN
  // ============================================================
    Future<HomeScreenData> getHomeScreenData(BuildContext context, {bool forceRefresh = false}) async {
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    await initializationDone;
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w $name");

    if (!forceRefresh) {
      final cachedData = await _cache.getHomeScreenData(langCode, termToUse);
      if (cachedData != null) return cachedData;
    }

    try {
      final resultData = await _apiService.callFunction(
        '${_countryPrefix}_getHomeScreenDataV2',
        params: {'lang': langCode, 'term': termToUse.toString()},
      );
      final homeData = HomeScreenData.fromJson(resultData);
      await _cache.saveHomeScreenData(homeData, langCode, termToUse);
      return homeData;
    } catch (e) {
      developer.log('Błąd sieciowy. Próba fallback offline.', name: name);
      final cachedFallback = await _cache.getHomeScreenData(langCode, termToUse, ignoreTimestamp: true);
      if (cachedFallback != null) return cachedFallback;
      throw Exception('Błąd sieci i brak danych w cache: $e');
    }
  }

  // ============================================================
  // LEGISLATIONS
  // ============================================================
  Future<Map<String, dynamic>> getLegislations(
    BuildContext context, {
    int limit = 20,
    String? lastVisibleId,
    bool forceRefresh = false,
    String? searchQuery,
    String? status,
    List<String>? documentType,
    bool? active,
    String? category,
    String? sortBy,
    String? processStartDateAfter,
    bool? hideNoDocument,
  }) async {
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w $name");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      final searchResult = await _trySearchFromAPI(
        type: 'legislations',
        country: _countryPrefix,
        langCode: langCode,
        searchQuery: searchQuery,
        term: termToUse,
        limit: 50,
        offset: 0,
      );
      if (searchResult == null || searchResult['results'] == null) {
        return {'legislations': [], 'nextCursor': null};
      }
      return {'legislations': searchResult['results'], 'nextCursor': null};
    } else {
      try {
        if (!forceRefresh) {
          final cachedData = await _cache.getLegislationsCursor(
            langCode,
            limit,
            lastVisibleId,
            status: status,
            documentType: documentType,
            category: category,
            sortBy: sortBy,
            processStartDateAfter: processStartDateAfter,
            term: termToUse,
            hideNoDocument: hideNoDocument,
          );
          if (cachedData != null) return cachedData;
        }

        final params = {
          'limit': limit,
          'lang': langCode,
          'term': termToUse.toString(),
          if (lastVisibleId != null) 'lastVisibleDocId': lastVisibleId,
          if (category != null && category.isNotEmpty) 'category': category,
          if (status != null && status.isNotEmpty) 'status': status,
          if (documentType != null && documentType.isNotEmpty) 'documentType': documentType.join(','),
          if (sortBy != null && sortBy.isNotEmpty) 'sortBy': sortBy,
          if (processStartDateAfter != null && processStartDateAfter.isNotEmpty)
            'processStartDateAfter': processStartDateAfter,
          if (hideNoDocument == true) 'hideNoDocument': 'true',
        };
        developer.log('Wywołanie API ${_countryPrefix}_getLegislations z parametrami: $params', name: name);
        final resultData = await _apiService.callFunction('${_countryPrefix}_getLegislations', params: params);
        await _cache.saveLegislationsCursor(
          resultData,
          langCode,
          limit,
          lastVisibleId,
          status: status,
          documentType: documentType,
          category: category,
          sortBy: sortBy,
          processStartDateAfter: processStartDateAfter,
          term: termToUse,
          hideNoDocument: hideNoDocument,
        );
        return resultData;
      } catch (e) {
        developer.log('Błąd w getLegislations (filtr), próba odczytu z cache: $e', name: name);
        final cachedData = await _cache.getLegislationsCursor(
          langCode,
          limit,
          lastVisibleId,
          status: status,
          documentType: documentType,
          category: category,
          sortBy: sortBy,
          processStartDateAfter: processStartDateAfter,
          term: termToUse,
          hideNoDocument: hideNoDocument,
        );
        if (cachedData != null) return cachedData;
        rethrow;
      }
    }
  }

  // ============================================================
  // CIVIC PROJECTS
  // ============================================================
  Future<Map<String, dynamic>> getCivicProjects(
    BuildContext context, {
    int limit = 20,
    String? lastVisibleId,
    bool forceRefresh = false,
    String? category,
    String? sortBy,
  }) async {
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;

    try {
      if (!forceRefresh) {
        final cachedData = await _cache.getCivicProjects(langCode, limit, lastVisibleId, category, sortBy);
        if (cachedData != null) return cachedData;
      }

      final params = {
        'limit': limit,
        'lang': langCode,
        if (lastVisibleId != null) 'lastVisibleDocId': lastVisibleId,
        if (category != null && category.isNotEmpty) 'category': category,
        if (sortBy != null && sortBy.isNotEmpty) 'sortBy': sortBy,
      };

      developer.log('Wywołanie API ${_countryPrefix}_getCivicProjects z parametrami: $params', name: name);
      final resultData = await _apiService.callFunction('${_countryPrefix}_getCivicProjects', params: params);
      await _cache.saveCivicProjects(resultData, langCode, limit, lastVisibleId, category, sortBy);
      return resultData;
    } catch (e) {
      developer.log('Błąd w getCivicProjects, próba odczytu z cache: $e', name: name);
      final cachedData = await _cache.getCivicProjects(langCode, limit, lastVisibleId, category, sortBy);
      if (cachedData != null) return cachedData;
      rethrow;
    }
  }

  // ============================================================
  // MPs
  // ============================================================
  Future<Map<String, dynamic>> getMPs(
    BuildContext context, {
    required int limit,
    String? lastVisibleId,
    bool forceRefresh = false,
    String? searchQuery,
    String? club,
    String? sortBy,
  }) async {
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w $name");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      final searchResult = await _trySearchFromAPI(
        type: 'deputies',
        country: _countryPrefix,
        langCode: langCode,
        searchQuery: searchQuery,
        term: termToUse,
        limit: 50,
        offset: 0,
      );
      if (searchResult == null || searchResult['results'] == null) {
        return {'deputies': [], 'nextCursor': null};
      }
      return {'deputies': searchResult['results'], 'nextCursor': null};
    } else {
      try {
        if (!forceRefresh) {
          final cachedData = await _cache.getMPsCursor(
            langCode,
            limit,
            lastVisibleId,
            term: termToUse,
            club: club,
            sortBy: sortBy,
          );
          if (cachedData != null) return cachedData;
        }

        final params = {
          'limit': limit,
          'lang': langCode,
          'term': termToUse.toString(),
          if (lastVisibleId != null) 'lastVisibleDocId': lastVisibleId,
          if (club != null) 'club': club,
          if (sortBy != null) 'sortBy': sortBy,
        };
        final resultData = await _apiService.callFunction('${_countryPrefix}_getDeputies', params: params);
        await _cache.saveMPsCursor(
          resultData,
          langCode,
          limit,
          lastVisibleId,
          term: termToUse,
          club: club,
          sortBy: sortBy,
        );
        return resultData;
      } catch (e) {
        developer.log('Błąd w getMPs (filtr), próba odczytu z cache: $e', name: name);
        final cachedData = await _cache.getMPsCursor(
          langCode,
          limit,
          lastVisibleId,
          term: termToUse,
          club: club,
          sortBy: sortBy,
        );
        if (cachedData != null) return cachedData;
        rethrow;
      }
    }
  }

  // ============================================================
  // LEGISLATION DETAILS
  // ============================================================
  Future<Legislation?> getLegislationDetails(
    BuildContext context,
    String legislationId, {
    bool forceRefresh = false,
    String? documentType,
  }) async {
    developer.log('SERVICE: Szczegóły ID: $legislationId, forceRefresh: $forceRefresh, type: $documentType', name: name);
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    final backendType = (documentType == 'civic') ? 'civic' : 'bill';
    try {
      if (!forceRefresh) {
        final cachedBill = await _cache.getLegislationDetails(legislationId, langCode);
        if (cachedBill != null) return cachedBill;
      }

      final data = await _apiService.callFunction(
        '${_countryPrefix}_getDetails',
        params: {'type': backendType, 'id': legislationId, 'lang': langCode},
      );
      final bill = Legislation.fromJson(data);
      await _cache.saveLegislationDetails(bill, langCode);
      return bill;
    } catch (e) {
      developer.log('Błąd sieciowy w getLegislationDetails, próba odczytu z cache: $e', name: name);
      return await _cache.getLegislationDetails(legislationId, langCode);
    }
  }

  // ============================================================
  // MP DATA (z aktywnościami)
  // ============================================================
  Future<MP?> getMPData(
    BuildContext context,
    String mpId, {
    bool forceRefresh = false,
    String? dataType,
    Map<String, dynamic>? params,
  }) async {
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w $name");
    try {
      if (!forceRefresh) {
        MP? cachedMP = await _cache.getMPDetails(mpId, lang: langCode, dataType: dataType, params: params, term: termToUse);
        if (cachedMP != null) return cachedMP;
      }

      MP? mp = await _tryFetchMPDataFromAPI(langCode, mpId, termToUse, dataType: dataType, params: params);
      if (mp != null) {
        await _cache.saveMPDetails(mp, lang: langCode, dataType: dataType, params: params, term: termToUse);
        return mp;
      }
      return await _cache.getMPDetails(mpId, lang: langCode, dataType: dataType, params: params, term: termToUse);
    } catch (e) {
      developer.log('Błąd w getMPData: $e', name: name);
      return await _cache.getMPDetails(mpId, lang: langCode, dataType: dataType, params: params, term: termToUse);
    }
  }

  // ============================================================
  // MP DETAILS (podstawowe, bez aktywności)
  // ============================================================
  Future<MP?> getMPDetails(
    BuildContext context,
    String mpId, {
    bool forceRefresh = false,
    String? dataType,
    Map<String, dynamic>? params,
}) async {
    developer.log('SERVICE: Rozpoczynam pobieranie szczegółów posła (callable). ID: $mpId', name: name);
    try {
      final data = await _apiService.callFunction(
        '${_countryPrefix}_getDetails',
        params: {'type': 'deputy', 'id': mpId},
      );
      return MP.fromJson(data);
    } on ApiException catch (e) {
      developer.log('Błąd funkcji callable ${_countryPrefix}_getDetails (deputy) (${e.code}): ${e.message}', name: name, error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieciowy w getMPDetails: $e', name: name);
      return null;
    }
  }

  // ============================================================
  // FETCH MP DATA FROM API (private)
  // ============================================================
  Future<MP?> _tryFetchMPDataFromAPI(
    String langCode,
    String mpId,
    int term, {
    String? dataType,
    Map<String, dynamic>? params,
  }) async {
    final effectiveDataType = (dataType == 'interpellations') ? 'sponsorships' : dataType;
    final Map<String, dynamic> callableParams = {
      'id': mpId,
      'lang': langCode,
      'term': term.toString(),
      if (effectiveDataType != null) 'dataType': effectiveDataType,
    };
    if (params != null) callableParams.addAll(params);
    developer.log('Wywoływanie funkcji callable ${_countryPrefix}_getDeputyDetails z parametrami: $callableParams', name: name);
    try {
      final responseJson = await _apiService.callFunction('${_countryPrefix}_getDeputyDetails', params: callableParams);

      if (effectiveDataType == 'votings' && responseJson['votings'] is List) {
        final votingsRaw = (responseJson['votings'] as List)
            .map((item) => Map<String, dynamic>.from(item as Map))
            .toList();
        final votingsProcessed = votingsRaw.map((v) {
          final id = v['id'] as String? ?? '';
          final idParts = id.split('_');
          if (idParts.length > 1) {
            v['id'] = idParts.take(idParts.length - 1).join('_');
          }
          return v;
        }).toList();
        responseJson['votings'] = votingsProcessed;
      }

      if (effectiveDataType == 'sponsorships' && responseJson['interpellationsPreview'] is List) {
        final sponsorshipsRaw = (responseJson['interpellationsPreview'] as List)
            .map((item) => Map<String, dynamic>.from(item as Map))
            .toList();
        sponsorshipsRaw.sort((a, b) {
          if (a['sponsorshipType'] == b['sponsorshipType']) return 0;
          if (a['sponsorshipType'] == 'sponsor') return -1;
          if (b['sponsorshipType'] == 'sponsor') return 1;
          return 0;
        });
        responseJson['interpellationsPreview'] = sponsorshipsRaw;
      }

      responseJson['id'] = mpId;
      return MP.fromJson(responseJson);
    } on ApiException catch (e) {
      developer.log('Błąd funkcji callable ${_countryPrefix}_getDeputyDetails ($mpId, ${e.code}): ${e.message}', name: name, error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieci lub inny podczas pobierania szczegółów posła $mpId: $e', name: name, error: e);
      return null;
    }
  }

  // ============================================================
  // SEARCH 
  // ============================================================
  Future<Map<String, dynamic>?> _trySearchFromAPI({
    required String type,
    required String country,
    required String langCode,
    required String searchQuery,
    required int term,
    required int limit,
    required int offset,
    Map<String, dynamic>? otherParams,
  }) async {
    final Map<String, dynamic> params = {
      'type': type,
      'country': country,
      'lang': langCode,
      'searchQuery': searchQuery,
      'term': term.toString(),
      'limit': limit.toString(),
      'offset': offset.toString(),
      if (otherParams != null) ...otherParams,
    };
    developer.log('Wywoływanie funkcji callable search z parametrami: $params', name: name);
    try {
      return await _apiService.callFunction('search', params: params);
    } on ApiException catch (e) {
      developer.log('Błąd funkcji callable search (typ: $type, ${e.code}): ${e.message}', name: name, error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieci w _trySearchFromAPI: $e', name: name);
      return null;
    }
  }

  // ============================================================
  // CLEAR CACHE
  // ============================================================
  Future<void> clearCache() async {
    await _cache.clearAll();
  }
}
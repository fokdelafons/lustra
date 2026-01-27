import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

import '../../models/legislation.dart';
import '../../models/mp.dart';
import '../../models/parliament_source.dart';
import '../../models/home_screen_data.dart';
import '../../providers/language_provider.dart';
import '../../providers/translators.dart';
import '../parliament_service_interface.dart';
import '../api_service.dart';
import '../parliament_cache_manager.dart';
import '../parliament_manager.dart';

class USParliamentService with ChangeNotifier implements ParliamentServiceInterface {
  final ApiService _apiService = ApiService();
  final String baseUrl = 'https://api.lustra.dev';

  final ParliamentCacheManager _cache = ParliamentCacheManager('us');
  
  USParliamentService();

  static const Map<int, String> _termDurations = {
    118: "(2023-2024)", 117: "(2021-2022)", 116: "(2019-2020)", 115: "(2017-2018)",
    114: "(2015-2016)", 113: "(2013-2014)", 112: "(2011-2012)", 111: "(2009-2010)",
    110: "(2007-2008)", 109: "(2005-2006)", 108: "(2003-2004)", 107: "(2001-2002)",
    106: "(1999-2000)", 105: "(1997-1998)", 104: "(1995-1996)", 103: "(1993-1994)",
    102: "(1991-1992)", 101: "(1989-1990)", 100: "(1987-1988)", 99: "(1985-1986)",
    98: "(1983-1984)", 97: "(1981-1982)", 96: "(1979-1980)", 95: "(1977-1978)",
    94: "(1975-1976)", 93: "(1973-1974)", 92: "(1971-1972)", 91: "(1969-1970)",
    90: "(1967-1968)", 89: "(1965-1966)", 88: "(1963-1964)", 87: "(1961-1962)",
    86: "(1959-1960)", 85: "(1957-1958)", 84: "(1955-1956)", 83: "(1953-1954)",
    82: "(1951-1952)", 81: "(1949-1950)", 80: "(1947-1948)", 79: "(1945-1946)",
    78: "(1943-1944)",
  };

  static const Map<int, int> _termYears = { 
    // Każda kadencja Kongresu Stanów Zjednoczonych trwa 2 lata.
    118: 2, 117: 2, 116: 2, 115: 2, 114: 2, 113: 2, 112: 2, 111: 2, 110: 2,
    109: 2, 108: 2, 107: 2, 106: 2, 105: 2, 104: 2, 103: 2, 102: 2, 101: 2,
    100: 2, 99: 2, 98: 2, 97: 2, 96: 2, 95: 2, 94: 2, 93: 2, 92: 2, 91: 2,
    90: 2, 89: 2, 88: 2, 87: 2, 86: 2, 85: 2, 84: 2, 83: 2, 82: 2, 81: 2,
    80: 2, 79: 2, 78: 2,
  };

  @override
  int calculateTotalTenureInYears(MP mp) {
    if (mp.termsUS.isEmpty) {
      return 0;
    }
    final uniqueTerms = mp.termsUS.map((termInfo) => termInfo.term).toSet();

    int totalYears = 0;
    for (var termNum in uniqueTerms) {
      totalYears += _termYears[termNum] ?? 0;
    }
    return totalYears;
  }

  int? _currentTerm;
  int? _latestTerm;
  List<int> _availableTerms = [];
  List<String> _clubFilters = [];
  bool _isLoading = false;

  @override
  String get name => 'United States Congress';

  @override
  String get governmentApiUrl => 'https://api.congress.gov/';

  @override
  String get flagAssetPath => 'assets/flags/us.svg';

  @override
  String? getHistoricalDataDisclaimer(BuildContext context) {
    return null;
  }

  @override
  int? get currentTerm => _currentTerm;

  @override
  List<int> get availableTerms => _availableTerms;

  @override
  List<String> get clubFilters => _clubFilters;

  Completer<void> _initializationCompleter = Completer<void>();
  Future<void> get initializationDone => _initializationCompleter.future;

  @override
  bool get isLoading => _isLoading;

  @override
  Future<Map<String, String>> getLegislationFilterStatuses(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    return {
      'all': l10n.filterStatusAll,
      'Accepted': l10n.filterStatusPassed,
      'Rejected': l10n.filterStatusRejected,
    };
  }

  @override
  String get futureStatusId => 'upcoming_session';

  @override
  String get processStatusId => 'process';

  @override
  Future<Map<String, String>> getLegislationFilterDocumentTypes(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    return {
      'all': l10n.filterStatusAll,
      'bill': l10n.docTypeBill,
      'resolution': l10n.docTypeResolution,
    };
  }

  @override
  List<String> get defaultDocumentTypeIds => [];
  
  @override
  DisplayableStatus getDisplayableStatusInfo(BuildContext context, String? status) {
    final String translatedLabel = translateUSStatus(context, status);
    final String lowerStatus = status?.toLowerCase() ?? '';
    const List<String> acceptedDisplayVariants = [
      "passed house",
      "passed senate",
      "adopted",
      "became law",
      "to president",
    ];
    const List<String> rejectedDisplayVariants = [
      "vetoed",
      "failed",
    ];
    const List<String> processDisplayVariants = [
      "introduced",
    ];
    if (acceptedDisplayVariants.contains(lowerStatus)) {
      return DisplayableStatus(
        label: translatedLabel,
        backgroundColor: Colors.green.withAlpha(20),
        textColor: Colors.green[800]!,
      );
    } else if (rejectedDisplayVariants.contains(lowerStatus)) {
      return DisplayableStatus(
        label: translatedLabel,
        backgroundColor: Colors.red.withAlpha(20),
        textColor: Colors.red[800]!,
      );
    } else if (processDisplayVariants.contains(lowerStatus)) {
      return DisplayableStatus(
        label: translatedLabel,
        backgroundColor: Colors.orange.withAlpha(20),
        textColor: Colors.orange[800]!,
      );
    } else if (lowerStatus == 'placed on calendar' || lowerStatus == 'resolving differences') {
      return DisplayableStatus(
        label: translatedLabel,
        backgroundColor: Colors.blue.withAlpha(20),
        textColor: Colors.blue[800]!,
      );
    }

    return DisplayableStatus(
      label: translatedLabel,
      backgroundColor: Colors.grey.withAlpha(20),
      textColor: Colors.grey[800]!,
    );
  }

  @override
  String getVotingTitle(BuildContext context, Legislation legislation) {
    final l10n = AppLocalizations.of(context)!;
    final status = legislation.statusText?.toLowerCase();
    
    if (status != null) {
      if (status.contains('table')) {
        return l10n.votingResultsUSMotionToTableTitle;
      }
      if (status.contains('refer') || status.contains('commit')) {
        return l10n.votingResultsUSMotionToReferTitle; 
      }
    }
    return l10n.votingResultsTitle;
  }

  @override
  Color getVoteColor(BuildContext context, String translatedVote) {
    final l10n = AppLocalizations.of(context)!;
    final vote = translatedVote;

    if (vote == l10n.voteTypeFor) {
      return Colors.green;
    } else if (vote == l10n.voteTypeAgainst) {
      return Colors.red;
    } else if (vote == l10n.voteTypeAbstain) {
      return Colors.orange;
    } else if (vote == l10n.voteTypeAbsent) {
      return Colors.grey;
    } else {
      return Colors.black;
    }
  }

@override
  String translateVote(BuildContext context, String vote) {
    final l10n = AppLocalizations.of(context)!;
    switch (vote.trim().toLowerCase()) {
      case 'yea':
        return l10n.voteTypeFor;
      case 'aye':
        return l10n.voteTypeFor;
      case 'nay':
        return l10n.voteTypeAgainst;
      case 'no':
        return l10n.voteTypeAgainst;
      case 'present':
        return l10n.voteTypeAbstain;
      case 'not voting':
        return l10n.voteTypeAbsent;
      case 'absent':
        return l10n.voteTypeAbsent;
      default:
        return vote;
    }
  }

  @override
  String? getOfficialUrl(Legislation legislation) {
    if (legislation.attachmentUrls != null && legislation.attachmentUrls!.isNotEmpty) {
      return legislation.attachmentUrls!.first;
    }
    return null;
  }

@override
  String? getProcessUrl(Legislation legislation) {
    return legislation.fullContent;
  }

  @override
  String? getVotingPdfUrl(Legislation legislation) {
    return legislation.votingUrl;
  }

  @override
  String translateStatus(BuildContext context, String? status) {
    return translateUSStatus(context, status);
  }


  @override
  Map<int, String> get termDurations => _termDurations;
	
	@override
	ParliamentSource get source => ParliamentSource.us;

  @override
  String get citizenVoteFunctionName => 'us_citizenVote';

@override
  Future<void> initialize() async {
    if (_initializationCompleter.isCompleted) {
      _initializationCompleter = Completer<void>();
    }
    developer.log('Inicjalizacja USParliamentService...', name: 'USParliamentService');
    _isLoading = true;
    notifyListeners();

    // CACHE LOAD
    final cachedMeta = await _cache.getMetadata();
    final bool hasCache = cachedMeta != null;
    
    if (hasCache) {
      try {
        _currentTerm = cachedMeta['currentTerm'] as int?;
        _latestTerm = cachedMeta['currentTerm'] as int?;
        _availableTerms = (cachedMeta['availableTerms'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];
        _clubFilters = (cachedMeta['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
        _clubFilters.sort();
        developer.log('Załadowano metadane z cache. Kadencja: $_currentTerm', name: 'USParliamentService');
        notifyListeners();
      } catch (e) {
        developer.log('Błąd parsowania cache metadanych', name: 'USParliamentService');
      }
    }

    try {
      final data = await _apiService.callFunction('us_getMetadata');
      // CACHE CLEANER
      _cache.cleanUp().catchError((e) {
      developer.log('Błąd podczas czyszczenia cache: $e', name: 'USParliamentService');
      });
      
      // CACHE SAVE
      await _cache.saveMetadata(data);
      
      _currentTerm = data['currentTerm'] as int?;
      _latestTerm = data['currentTerm'] as int?;
      _availableTerms = (data['availableTerms'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];
      _latestTerm = data['currentTerm'] as int?;
      _clubFilters = (data['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
      _clubFilters.sort();
      developer.log('USParliamentService zainicjalizowany (z sieci). Kadencja: $_currentTerm', name: 'USParliamentService');
    } catch (e, stackTrace) {
      developer.log(
        'Błąd sieciowy podczas inicjalizacji USParliamentService: ${e.toString()}', 
        name: 'USParliamentService',
        error: e,
        stackTrace: stackTrace
      );
      if (!hasCache) {
        if (!_initializationCompleter.isCompleted) {
          _initializationCompleter.completeError(e, stackTrace);
        }
        throw Exception('Brak połączenia z siecią i brak danych w cache. Nie można uruchomić aplikacji.');
      }
      developer.log('Używam danych z cache z powodu błędu sieci.', name: 'USParliamentService');
    } finally {
      _isLoading = false;
      notifyListeners();
      if (!_initializationCompleter.isCompleted) {
        _initializationCompleter.complete();
      }
    }
  }

  @override
  Future<void> changeTerm(int newTerm) async {
    if (_currentTerm == newTerm) return;
    _isLoading = true;
    notifyListeners();
    _currentTerm = newTerm;
    try {
      final data = await _apiService.callFunction(
        'us_getMetadata',
        params: {
          'type': 'term_clubs',
          'term': newTerm,
        },
      );
      _clubFilters = (data['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
      _clubFilters.sort();
    } catch (e) {
       _clubFilters = [];
       developer.log('Błąd podczas zmiany kadencji: $e', name: 'USParliamentService');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
    String getMandateStatusText(BuildContext context, MP mp) {
      final l10n = AppLocalizations.of(context)!;
      switch (mp.mandateCoverage) {
        case 'FULL':
          return mp.active ? l10n.mandateStatusActive : l10n.mandateStatusFulfilled;
        case 'PARTIAL':
          return l10n.mandateStatusCancelled;
        case 'UNKNOWN':
        default:
          return mp.active ? l10n.mandateStatusActive : l10n.mandateStatusInactive;
      }
    }

@override
  List<MPDetailItem> getMPHeaderDetails(BuildContext context, MP mp) {
    final l10n = AppLocalizations.of(context)!;
    final details = <MPDetailItem>[];
    final int age = _calculateAge(mp.birthDate);
    if (age > 0) {
      details.add(MPDetailItem(label: l10n.ageUnit(age)));
    }
    final String currentClubText = mp.club.isNotEmpty ? mp.club : l10n.unaffiliatedClub;
    final List<String> previousClubs = (mp.parliamentaryHistory?['previous_clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
    String? formerlyText;
    if (previousClubs.isNotEmpty) {
      formerlyText = l10n.formerlyLabel(previousClubs.join(', '));
    }
    details.add(MPDetailItem(label: currentClubText, value: formerlyText));
      if (mp.memberType.isNotEmpty) {
      final String translatedRole = translateUSRole(context, mp.memberType);
      details.add(MPDetailItem(label: translatedRole));
    }
    if (mp.district.isNotEmpty) {
      details.add(MPDetailItem(label: l10n.districtLabelUS(mp.district, mp.districtNum.toString())));
    }
    if (mp.leadership != null && mp.leadership!.isNotEmpty) {
        details.add(MPDetailItem(label: mp.leadership!));
    }
    details.add(MPDetailItem(label: getMandateStatusText(context, mp)));
    return details;
  }

    int _calculateAge(String birthDateString) {
    if (birthDateString.isEmpty) return 0;
    try {
      // Spróbuj parsować jako pełną datę
      final birthDate = DateFormat('yyyy-MM-dd').parse(birthDateString);
      final today = DateTime.now();
      int age = today.year - birthDate.year;
      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }
      return age > 0 ? age : 0;
    } catch (e) {
      // Jeśli się nie uda, spróbuj parsować jako sam rok
      try {
        final birthYear = int.parse(birthDateString);
        if (birthYear > 1900 && birthYear < DateTime.now().year) {
          return DateTime.now().year - birthYear;
        }
      } catch (e2) {
        developer.log("Nie udało się sparsować birthDateString jako roku: '$birthDateString': $e2", name: 'USParliamentService');
      }
      developer.log("Błąd parsowania daty urodzenia '$birthDateString': $e", name: 'USParliamentService');
      return 0;
    }
  }

@override
  VoidCallback? getInterpellationTapAction(BuildContext context, InterpellationPreview interp) {
    if (interp.id.isNotEmpty) {
      return () async {
        final parliamentId = context.read<ParliamentManager>().activeServiceId;
        final path = '/$parliamentId/legislations/${interp.id}';
        if (kIsWeb) {
          final fullUrl = Uri.parse(Uri.base.origin + path);
          await launchUrl(fullUrl, webOnlyWindowName: '_blank');
        } else {
          context.push(path);
        }
      };
    }
    return null;
  }
  
  @override
  String getTenureTitle(BuildContext context, MP mp) {
    final l10n = AppLocalizations.of(context)!;
    final totalYears = calculateTotalTenureInYears(mp);
    return totalYears > 0 
      ? l10n.parliamentaryTenureSectionTitle(totalYears) 
      : l10n.parliamentaryTenureTitle;
  }
  
String _getOrdinalSuffix(int n) {
    if (n >= 11 && n <= 13) {
      return 'th';
    }
    switch (n % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

@override
  MPDetailSection? getMPTenureDetails(BuildContext context, MP mp) {
    final l10n = AppLocalizations.of(context)!;
    if (mp.termsUS.isEmpty) {
      return null;
    }
    final sortedTerms = List<ParliamentaryTermUS>.from(mp.termsUS)..sort((a, b) => b.term.compareTo(a.term));
      final items = sortedTerms.map((termInfo) {
      final termNumber = termInfo.term;
      final ordinalTerm = '$termNumber${_getOrdinalSuffix(termNumber)}';
      final String duration;
      if (termNumber == _latestTerm) {
        duration = l10n.termCurrently;
      } else {
        duration = _termDurations[termNumber] ?? '';
      }
      final role = translateUSRole(context, termInfo.memberType);
      final label = '$ordinalTerm US Congress $duration: $role';
      return MPDetailItem(label: label);
    }).toList();
    if (items.isEmpty) {
      return null;
    }
    return MPDetailSection(
      title: getTenureTitle(context, mp),
      items: items,
    );
  }

  @override
  MPDetailSection? getMPPersonalDetails(BuildContext context, MP mp) {
    return null;
  }
  @override
  List<MPActivityTab> getMPActivityTabs(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      MPActivityTab(title: l10n.votingsTab, type: 'votings'),
      MPActivityTab(title: l10n.sponsorshipsTab, type: 'sponsorships'),
    ];
  }

@override
  Future<HomeScreenData> getHomeScreenData(BuildContext context, {bool forceRefresh = false}) async {
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    await initializationDone;
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w USParliamentService");
    
    // CACHE READ
    if (!forceRefresh) {
      final cachedData = await _cache.getHomeScreenData(langCode, termToUse);
      if (cachedData != null) return cachedData;
    }
    
    try {
      final resultData = await _apiService.callFunction(
        'us_getHomeScreenData',
        params: {
          'lang': langCode,
          'term': termToUse.toString(),
        },
      );
      final homeData = HomeScreenData.fromJson(resultData);
      
      // CACHE SAVE
      await _cache.saveHomeScreenData(homeData, langCode, termToUse);
      
      return homeData;
    } catch (e) {
      developer.log('Błąd sieciowy. Próba fallback offline.', name: 'USParliamentService');
      
      // FALLBACK CACHE
      final cachedFallback = await _cache.getHomeScreenData(langCode, termToUse, ignoreTimestamp: true);
      if (cachedFallback != null) return cachedFallback;
      
      throw Exception('Błąd sieci i brak danych w cache: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getLegislations(
      BuildContext context, {
      int limit = 20, String? lastVisibleId, bool forceRefresh = false,
      String? searchQuery, String? status, List<String>? documentType,
      bool? active, String? category, String? sortBy, String? processStartDateAfter,
  }) async {
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w USParliamentService");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    
    if (searchQuery != null && searchQuery.isNotEmpty) {
      final int offset = 0;
      final searchResult = await _trySearchFromAPI(
        type: 'legislations', country: 'us', langCode: langCode,
        searchQuery: searchQuery, term: termToUse, limit: 50, offset: offset,
      );
      if (searchResult == null || searchResult['results'] == null) {
        return {'legislations': [], 'nextCursor': null};
      }
      return {'legislations': searchResult['results'], 'nextCursor': null};
    } else {
      try {
        // CACHE READ
        if (!forceRefresh) {
          final cachedData = await _cache.getLegislationsCursor(
            langCode, limit, lastVisibleId, 
            status: status, documentType: documentType, category: category, sortBy: sortBy, processStartDateAfter: processStartDateAfter, term: termToUse
          );
          if (cachedData != null) return cachedData;
        }
        
        final params = {
          'limit': limit, 'lang': langCode, 'term': termToUse.toString(),
          if (lastVisibleId != null) 'lastVisibleDocId': lastVisibleId,
          if (category != null && category.isNotEmpty) 'category': category,
          if (status != null && status.isNotEmpty) 'status': status,
          if (documentType != null && documentType.isNotEmpty) 'documentType': documentType.join(','),
          if (sortBy != null && sortBy.isNotEmpty) 'sortBy': sortBy,
          if (processStartDateAfter != null && processStartDateAfter.isNotEmpty) 'processStartDateAfter': processStartDateAfter,
        };
        developer.log('Wywołanie API us_getLegislations z parametrami: $params', name: 'USParliamentService');
        final resultData = await _apiService.callFunction('us_getLegislations', params: params);
        
        // CACHE SAVE
        await _cache.saveLegislationsCursor(
          resultData, langCode, limit, lastVisibleId, 
          status: status, documentType: documentType, category: category, sortBy: sortBy, processStartDateAfter: processStartDateAfter, term: termToUse
        );
        
        return resultData;
      } catch (e) {
        developer.log('Błąd w getLegislations (filtr), próba odczytu z cache: $e', name: 'USParliamentService');
        
        // CACHE FALLBACK
        final cachedData = await _cache.getLegislationsCursor(
            langCode, limit, lastVisibleId, 
            status: status, documentType: documentType, category: category, sortBy: sortBy, processStartDateAfter: processStartDateAfter, term: termToUse
        );
        if (cachedData != null) return cachedData;
        rethrow;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> getCivicProjects(
    BuildContext context, {
    int limit = 20, String? lastVisibleId, bool forceRefresh = false,
    String? category, String? sortBy,
  }) async {
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    
    try {
      // CACHE READ
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

      developer.log('Wywołanie API us_getCivicProjects z parametrami: $params', name: 'USParliamentService');
      final resultData = await _apiService.callFunction('us_getCivicProjects', params: params);
      
      // CACHE SAVE
      await _cache.saveCivicProjects(resultData, langCode, limit, lastVisibleId, category, sortBy);
      return resultData;

    } catch (e) {
      developer.log('Błąd w getCivicProjects, próba odczytu z cache: $e', name: 'USParliamentService');
      // CACHE FALLBACK
      final cachedData = await _cache.getCivicProjects(langCode, limit, lastVisibleId, category, sortBy);
      if (cachedData != null) return cachedData;
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getMPs(
      BuildContext context, {
      required int limit, String? lastVisibleId, bool forceRefresh = false,
      String? searchQuery, String? club, String? sortBy,
  }) async {
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w USParliamentService");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      final int offset = 0;
      final searchResult = await _trySearchFromAPI(
        type: 'deputies', country: 'us', langCode: langCode,
        searchQuery: searchQuery, term: termToUse, limit: 50, offset: offset,
      );
      if (searchResult == null || searchResult['results'] == null) {
        return {'deputies': [], 'nextCursor': null};
      }
      return {'deputies': searchResult['results'], 'nextCursor': null};
    } else {
      try {
        // CACHE READ
        if (!forceRefresh) {
          final cachedData = await _cache.getMPsCursor(langCode, limit, lastVisibleId, term: termToUse, club: club, sortBy: sortBy);
          if (cachedData != null) return cachedData;
        }
        
        final params = {
          'limit': limit, 'lang': langCode, 'term': termToUse.toString(),
          if (lastVisibleId != null) 'lastVisibleDocId': lastVisibleId,
          if (club != null) 'club': club,
          if (sortBy != null) 'sortBy': sortBy,
        };
        final resultData = await _apiService.callFunction('us_getDeputies', params: params);
        
        // CACHE SAVE
        await _cache.saveMPsCursor(resultData, langCode, limit, lastVisibleId, term: termToUse, club: club, sortBy: sortBy);
        
        return resultData;
      } catch (e) {
        developer.log('Błąd w getMPs (filtr), próba odczytu z cache: $e', name: 'USParliamentService');
        // CACHE FALLBACK
        final cachedData = await _cache.getMPsCursor(langCode, limit, lastVisibleId, term: termToUse, club: club, sortBy: sortBy);
        if (cachedData != null) return cachedData;
        rethrow;
      }
    }
  }
	
 @override
  Future<Legislation?> getLegislationDetails(BuildContext context, String legislationId, {bool forceRefresh = false, String? documentType}) async {
    developer.log('SERVICE: Szczegóły ID: $legislationId, forceRefresh: $forceRefresh, type: $documentType', name: 'USParliamentService');
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    final backendType = (documentType == 'civic') ? 'civic' : 'bill';
    try {
      // CACHE READ
      if (!forceRefresh) {
        final cachedBill = await _cache.getLegislationDetails(legislationId, langCode);
        if (cachedBill != null) return cachedBill;
      }
      
      final data = await _apiService.callFunction(
        'us_getDetails',
        params: {'type': backendType, 'id': legislationId, 'lang': langCode},
      );
      final bill = Legislation.fromJson(data);
      
      // CACHE SAVE
      await _cache.saveLegislationDetails(bill, langCode);
      return bill;
    } catch (e) {
      developer.log('Błąd sieciowy w getLegislationDetails, próba odczytu z cache: $e', name: 'USParliamentService');
      // CACHE FALLBACK
      return await _cache.getLegislationDetails(legislationId, langCode);
    }
  }
	
  @override
  Future<MP?> getMPData(
    BuildContext context, String mpId, 
    {bool forceRefresh = false, String? dataType, Map<String, dynamic>? params}
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w USParliamentService");
    try {
      // CACHE READ
      if (!forceRefresh) {
        MP? cachedMP = await _cache.getMPDetails(mpId, lang: langCode, dataType: dataType, params: params, term: termToUse);
        if (cachedMP != null) return cachedMP;
      }
      
      MP? mp = await _tryFetchMPDataFromAPI(l10n, langCode, mpId, termToUse, dataType: dataType, params: params);
      if (mp != null) {
        // CACHE SAVE
        await _cache.saveMPDetails(mp, lang: langCode, dataType: dataType, params: params, term: termToUse);
        return mp;
      }
      // CACHE FALLBACK
      return await _cache.getMPDetails(mpId, lang: langCode, dataType: dataType, params: params, term: termToUse);
    } catch (e) {
      developer.log('Błąd w getMPData: $e', name: 'USParliamentService');
      return await _cache.getMPDetails(mpId, lang: langCode, dataType: dataType, params: params, term: termToUse);
    }
  }

  @override
  Future<MP?> getMPDetails(BuildContext context, String mpId, {bool forceRefresh = false, String? dataType, Map<String, dynamic>? params}) async {
    developer.log('SERVICE: Rozpoczynam pobieranie szczegółów posła (callable). ID: $mpId', name: 'USParliamentService');
    try {
      final data = await _apiService.callFunction(
        'us_getDetails',
        params: {
          'type': 'deputy',
          'id': mpId,
        },
      );
      return MP.fromJson(data);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable us_getDetails (deputy) (${e.code}): ${e.message}', name: 'USParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieciowy w getMPDetails: $e', name: 'USParliamentService');
      return null;
    }
  }

  Future<MP?> _tryFetchMPDataFromAPI(
    AppLocalizations l10n, String langCode, String mpId, int term, 
    {String? dataType, Map<String, dynamic>? params}
  ) async {
    final effectiveDataType = (dataType == 'interpellations') ? 'sponsorships' : dataType;
    final Map<String, dynamic> callableParams = {
      'id': mpId, 'lang': langCode, 'term': term.toString(),
      if (effectiveDataType != null) 'dataType': effectiveDataType,
    };
    if (params != null) callableParams.addAll(params);
    developer.log('Wywoływanie funkcji callable us_getDeputyDetails z parametrami: $callableParams', name: 'USParliamentService');
    try {
      final responseJson = await _apiService.callFunction('us_getDeputyDetails', params: callableParams);
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
        final sponsorshipsProcessed = sponsorshipsRaw.map((s) {
          if (s['sponsorshipType'] == 'sponsor') {
            s['tag'] = l10n.sponsorshipTypeSponsor;
          } else if (s['sponsorshipType'] == 'cosponsor') {
            s['tag'] = l10n.sponsorshipTypeCosponsor;
          }
          return s;
        }).toList();
        responseJson['interpellationsPreview'] = sponsorshipsProcessed;
      }
      responseJson['id'] = mpId;
      return MP.fromJson(responseJson);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable us_getDeputyDetails ($mpId, ${e.code}): ${e.message}', name: 'USParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieci lub inny podczas pobierania szczegółów posła $mpId: $e', name: 'USParliamentService', error: e);
      return null;
    }
  }

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
    developer.log('Wywoływanie funkcji callable search z parametrami: $params', name: 'USParliamentService');
    try {
      return await _apiService.callFunction('search', params: params);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable search (typ: $type, ${e.code}): ${e.message}', name: 'USParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieci w _trySearchFromAPI: $e', name: 'USParliamentService');
      return null;
    }
  }
	
@override
	Future<void> clearCache() async {
		await _cache.clearAll();
	}

  @override
  MissingDataAction? getMissingDataAction(BuildContext context, Legislation legislation) {
    if (!legislation.noDocument) {
      return null;
    }

    final l10n = AppLocalizations.of(context)!;
    
    final userMessage = l10n.missingDataSourceUserMessage;
    final buttonText = l10n.missingDataSourceButton;
    final emailRecipient = "contactcenter@gpo.gov"; 
    final emailSubject = "Inquiry Regarding Missing Legislative Document: ${legislation.id}";

    final emailBody = """
To Whom It May Concern,

I am writing to report that the full text of a key legislative document is not available on https://api.congress.gov/.

Bill Number/ID: ${legislation.id}

This omission prevents the public from accessing critical information, hindering the principle of government transparency.

I request that you take action to publish this document on the appropriate official API to ensure it is accessible to all citizens.

Thank you for your attention to this matter.
""";

    return MissingDataAction(
      userMessage: userMessage,
      buttonText: buttonText,
      emailTemplate: EmailTemplate(
        recipient: emailRecipient,
        subject: emailSubject,
        body: emailBody,
      ),
    );
  }
}
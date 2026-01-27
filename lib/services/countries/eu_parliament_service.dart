import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/legislation.dart';
import '../../models/mp.dart';
import '../../models/parliament_source.dart';
import '../../models/home_screen_data.dart';
import '../../providers/language_provider.dart';
import '../../providers/translators.dart';
import '../parliament_service_interface.dart';
import '../api_service.dart';
import '../parliament_cache_manager.dart';

class EUParliamentService with ChangeNotifier implements ParliamentServiceInterface {
  final ApiService _apiService = ApiService();
  final String baseUrl = 'https://api.lustra.dev';

  final ParliamentCacheManager _cache = ParliamentCacheManager('ue');

  static const Map<int, String> _termDurations = {
    9: "(2019-2024)", 8: "(2014-2019)",
    7: "(2009-2014)", 6: "(2004-2009)", 5: "(1999-2004)",
  };

  static const Map<int, int> _termYears = { 
    6: 5, 7: 5, 8: 5,
    9: 5,
  };

  String _toRoman(int num) {
    if (num < 1 || num > 3999) return num.toString();
    const List<MapEntry<int, String>> romanMap = [
      MapEntry(1000, 'M'), MapEntry(900, 'CM'), MapEntry(500, 'D'), MapEntry(400, 'CD'),
      MapEntry(100, 'C'), MapEntry(90, 'XC'), MapEntry(50, 'L'), MapEntry(40, 'XL'),
      MapEntry(10, 'X'), MapEntry(9, 'IX'), MapEntry(5, 'V'), MapEntry(4, 'IV'), MapEntry(1, 'I'),
    ];
    String result = '';
    for (var entry in romanMap) {
      while (num >= entry.key) {
        result += entry.value;
        num -= entry.key;
      }
    }
    return result;
  }

  @override
  int calculateTotalTenureInYears(MP mp) {
    if (mp.parliamentaryHistory == null || mp.parliamentaryHistory!['terms'] is! List) {
      return 0;
    }
  
    final terms = (mp.parliamentaryHistory!['terms'] as List).map((term) {
      if (term is int) return term;
      if (term is String) return int.tryParse(term);
      return null;
    }).whereType<int>().toList();

    int totalYears = 0;
    for (var termNum in terms) {
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
  String get name => 'European Parliament';

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

  EUParliamentService();

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
  String get futureStatusId => 'Planned';

  @override
  String get processStatusId => 'In progress';

  @override
  Future<Map<String, String>> getLegislationFilterDocumentTypes(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    return {
      'all': l10n.filterStatusAll,
      // 'bill': l10n.docTypeBill,
      // 'resolution': l10n.docTypeResolution,
    };
  }

  @override
  List<String> get defaultDocumentTypeIds => [];
  
  @override
  DisplayableStatus getDisplayableStatusInfo(BuildContext context, String? status) {
        final String translatedLabel = translateEUStatus(context, status);
        final String lowerStatus = status?.toLowerCase() ?? '';
    const List<String> acceptedDisplayVariants = [
      "adopted",
    ];
    const List<String> rejectedDisplayVariants = [
      "withdrawn", "rejected"
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
    } else if (lowerStatus.startsWith('w procesie')) {
      return DisplayableStatus(
        label: translatedLabel,
        backgroundColor: Colors.orange.withAlpha(20),
        textColor: Colors.orange[800]!,
      );
    }

    return DisplayableStatus(
      label: translatedLabel,
      backgroundColor: Colors.grey.withAlpha(20),
      textColor: Colors.grey[800]!,
    );
  }

  @override
  String? getOfficialUrl(Legislation legislation) {
    return null;
  }

  @override
  String? getProcessUrl(Legislation legislation) {
    final idParts = legislation.id.split('-');
    if (idParts.length == 2) {
      final year = idParts[0];
      final numberStr = idParts[1];
      
      final numberAsInt = int.tryParse(numberStr);
      if (numberAsInt == null) {
        return null;
      }
      final formattedNumber = numberAsInt.toString();
      final procedureId = '${year}_$formattedNumber';
      return 'https://eur-lex.europa.eu/procedure/PL/$procedureId';
    }
    return null;
  }

  @override
  String get governmentApiUrl => 'https://data.europarl.europa.eu/';

  @override
  String get flagAssetPath => 'assets/flags/eu.svg';

  @override
  String? getHistoricalDataDisclaimer(BuildContext context) {
    return null;
  }

    @override
  String getVotingTitle(BuildContext context, Legislation legislation) {
    final l10n = AppLocalizations.of(context)!;
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
    switch (vote.toLowerCase()) {
      case 'For':
        return l10n.voteTypeFor;
      case 'Against':
        return l10n.voteTypeAgainst;
      case 'Abstained':
        return l10n.voteTypeAbstain;
      case 'Absent':
        return l10n.voteTypeAbsent;
      default:
        return vote;
    }
  }
  
  @override
  String? getVotingPdfUrl(Legislation legislation) {
    return null;
  }

  @override
    String translateStatus(BuildContext context, String? status) {
      return translateEUStatus(context, status);
    }

  @override
  Map<int, String> get termDurations => _termDurations;
	
	@override
	ParliamentSource get source => ParliamentSource.eu;

  @override
  String get citizenVoteFunctionName => 'ue_citizenVote';

@override
  Future<void> initialize() async {
    if (_initializationCompleter.isCompleted) {
      _initializationCompleter = Completer<void>();
    }
    developer.log('Inicjalizacja EUParliamentService...', name: 'EUParliamentService');
    _isLoading = true;
    notifyListeners();


    final cachedMeta = await _cache.getMetadata();
    final bool hasCache = cachedMeta != null;

    if (hasCache) {
      try {
        _latestTerm = cachedMeta['currentTerm'] as int?; 
        _currentTerm = cachedMeta['currentTerm'] as int?;
        _availableTerms = (cachedMeta['availableTerms'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];
        _clubFilters = (cachedMeta['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
        _clubFilters.sort();
        notifyListeners();
      } catch (e) {
         developer.log('Błąd parsowania cache metadanych PL', name: 'EUParliamentService');
      }
    }

    try {
      final data = await _apiService.callFunction('ue_getMetadata');
      // CACHE CLEANER
      _cache.cleanUp().catchError((e) {
      developer.log('Błąd podczas czyszczenia cache: $e', name: 'EUParliamentService');
      });
      
      await _cache.saveMetadata(data);
      
      _latestTerm = data['currentTerm'] as int?; 
      _currentTerm = data['currentTerm'] as int?;
      _availableTerms = (data['availableTerms'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];
      _clubFilters = (data['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
      _clubFilters.sort();
      developer.log('EUParliamentService zainicjalizowany (z sieci). Kadencja: $_currentTerm', name: 'EUParliamentService');
    } catch (e, stackTrace) {
      developer.log(
        'Błąd sieciowy podczas inicjalizacji EUParliamentService: ${e.toString()}', 
        name: 'EUParliamentService',
        error: e,
        stackTrace: stackTrace
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

  @override
  Future<void> changeTerm(int newTerm) async {
    if (_currentTerm == newTerm) return;
    _isLoading = true;
    notifyListeners();
    _currentTerm = newTerm;
    try {
      final data = await _apiService.callFunction(
        'ue_getMetadata',
        params: {
          'type': 'term_clubs',
          'term': newTerm,
        },
      );
      _clubFilters = (data['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
      _clubFilters.sort();
    } catch (e) {
       _clubFilters = [];
       developer.log('Błąd podczas zmiany kadencji: $e', name: 'EUParliamentService');
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
    List<String> previousClubs = [];
    if (mp.parliamentaryHistory != null && mp.parliamentaryHistory!['clubs'] is List) {
      List<dynamic> historyClubs = mp.parliamentaryHistory!['clubs'];
      if (historyClubs.length > 1) {
        previousClubs = historyClubs.sublist(1).map((club) => club.toString()).where((clubName) => clubName.isNotEmpty && clubName != mp.club).toList();
      }
    }
    String currentClubText = mp.club.isNotEmpty ? mp.club : l10n.unaffiliatedClub;
    String? formerlyText;
    if (previousClubs.isNotEmpty) {
      formerlyText = l10n.formerlyLabel(previousClubs.join(', '));
    }
    details.add(MPDetailItem(label: l10n.clubLabel(currentClubText), value: formerlyText));
    if (mp.profession.isNotEmpty) {
      details.add(MPDetailItem(label: l10n.professionLabel(mp.profession)));
    }
    details.add(MPDetailItem(label: l10n.districtLabel(mp.district, mp.districtNum)));
    details.add(MPDetailItem(label: l10n.votesObtainedLabel(NumberFormat.decimalPattern(l10n.localeName).format(mp.numberOfVotes))));
    details.add(MPDetailItem(label: getMandateStatusText(context, mp)));
    return details;
  }
  
  @override
  String getTenureTitle(BuildContext context, MP mp) {
    final l10n = AppLocalizations.of(context)!;
    final totalYears = calculateTotalTenureInYears(mp);
    return totalYears > 0 
      ? l10n.parliamentaryTenureSectionTitle(totalYears) 
      : l10n.parliamentaryTenureTitle;
  }
  
  @override
  MPDetailSection? getMPTenureDetails(BuildContext context, MP mp) {
    final l10n = AppLocalizations.of(context)!;
    List<int> terms = [];
    if (mp.parliamentaryHistory != null && mp.parliamentaryHistory!['terms'] is List) {
      terms = (mp.parliamentaryHistory!['terms'] as List)
          .map((term) => (term is String) ? int.tryParse(term) : term as int?)
          .whereType<int>()
          .toList();
      terms.sort((a, b) => b.compareTo(a));
    }
    if (terms.isEmpty) {
      return MPDetailSection(
        title: getTenureTitle(context, mp),
        items: [MPDetailItem(label: l10n.noTermData)]
      );
    }
    final items = terms.map((termNum) {
      final romanNumeral = _toRoman(termNum);
      final String duration;
      if (termNum == _latestTerm) {
        duration = l10n.termCurrently;
      } else {
        duration = termDurations[termNum] ?? l10n.unknownTermDuration;
      }
      return MPDetailItem(label: l10n.tenureTermItem(romanNumeral, duration));
    }).toList();
    return MPDetailSection(
      title: getTenureTitle(context, mp),
      items: items,
    );
  }

  @override
  MPDetailSection? getMPPersonalDetails(BuildContext context, MP mp) {
    final l10n = AppLocalizations.of(context)!;
    final items = <MPDetailItem>[];

    int calculateAge(String birthDateString) {
      if (birthDateString.isEmpty) return 0;
      try {
        final birthDate = DateFormat('yyyy-MM-dd').parse(birthDateString);
        final today = DateTime.now();
        int age = today.year - birthDate.year;
        if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
          age--;
        }
        return age > 0 ? age : 0;
      } catch (e) {
        return 0;
      }
    }

    if(mp.birthDate.isNotEmpty) {
      items.add(MPDetailItem(label: '${l10n.birthDateLabel}:', value: mp.birthDate));
      final int age = calculateAge(mp.birthDate);
      if (age > 0) {
        items.add(MPDetailItem(label: '${l10n.ageLabel}:', value: l10n.ageUnit(age)));
      }
    }
    if(mp.birthLocation.isNotEmpty) {
      items.add(MPDetailItem(label: '${l10n.birthPlaceLabel}:', value: mp.birthLocation));
    }
    if(mp.educationLevel.isNotEmpty) {
      items.add(MPDetailItem(label: '${l10n.educationLabel}:', value: mp.educationLevel));
    }
    if(mp.voivodeship.isNotEmpty) {
      items.add(MPDetailItem(label: '${l10n.voivodeshipLabel}:', value: mp.voivodeship));
    }

    if (items.isEmpty) return null;

    return MPDetailSection(
      title: l10n.personalDataSectionTitle,
      items: items,
    );
  }

  @override
  List<MPActivityTab> getMPActivityTabs(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      MPActivityTab(title: l10n.votingsTab, type: 'votings'),
      MPActivityTab(title: l10n.interpellationsTab, type: 'interpellations'),
    ];
  }

  @override
  VoidCallback? getInterpellationTapAction(BuildContext context, InterpellationPreview interp) {
    if (interp.contentUrl != null && interp.contentUrl!.isNotEmpty) {
      return () {
        final l10n = AppLocalizations.of(context)!;
        final scaffoldMessenger = ScaffoldMessenger.of(context);
        final Uri url = Uri.parse(interp.contentUrl!);
        canLaunchUrl(url).then((can) {
          if (can) {
            launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            if (scaffoldMessenger.mounted) {
               scaffoldMessenger.showSnackBar(
                SnackBar(content: Text(l10n.cannotOpenLinkSnackbar(interp.contentUrl!))),
              );
            }
          }
        });
      };
    }
    return null;
  }

  @override
  Future<HomeScreenData> getHomeScreenData(BuildContext context, {bool forceRefresh = false}) async {
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    await initializationDone;
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w EUParliamentService");
    
    if (!forceRefresh) {
      final cachedData = await _cache.getHomeScreenData(langCode, termToUse);
      if (cachedData != null) return cachedData;
    }
    
    try {
      final resultData = await _apiService.callFunction(
        'ue_getHomeScreenData',
        params: {
          'lang': langCode,
          'term': termToUse.toString(),
        },
      );
      final homeData = HomeScreenData.fromJson(resultData);
      
      await _cache.saveHomeScreenData(homeData, langCode, termToUse);
      
      return homeData;
    } catch (e) {
      developer.log('Błąd sieciowy. Próba fallback offline.', name: 'EUParliamentService');
      
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
    if (termToUse == null) throw Exception("Brak wybranej kadencji w EUParliamentService");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      final int offset = 0;
      final searchResult = await _trySearchFromAPI(
        type: 'legislations', country: 'ue', langCode: langCode,
        searchQuery: searchQuery, term: termToUse, limit: 50, offset: offset,
      );
      if (searchResult == null || searchResult['results'] == null) {
        return {'legislations': [], 'nextCursor': null};
      }
      return {'legislations': searchResult['results'], 'nextCursor': null};
    } else {
      try {
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
        final resultData = await _apiService.callFunction('ue_getLegislations', params: params);
        
        await _cache.saveLegislationsCursor(
          resultData, langCode, limit, lastVisibleId, 
          status: status, documentType: documentType, category: category, sortBy: sortBy, processStartDateAfter: processStartDateAfter, term: termToUse
        );
        
        return resultData;
      } catch (e) {
        developer.log('Błąd w getLegislations (filtr), próba odczytu z cache: $e', name: 'EUParliamentService');
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

      developer.log('Wywołanie API ue_getCivicProjects z parametrami: $params', name: 'EUParliamentService');
      final resultData = await _apiService.callFunction('ue_getCivicProjects', params: params);
      
      await _cache.saveCivicProjects(resultData, langCode, limit, lastVisibleId, category, sortBy);
      return resultData;

    } catch (e) {
      developer.log('Błąd w getCivicProjects, próba odczytu z cache: $e', name: 'UEParliamentService');
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
    if (termToUse == null) throw Exception("Brak wybranej kadencji w EUParliamentService");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      final int offset = 0;
      final searchResult = await _trySearchFromAPI(
        type: 'deputies', country: 'ue', langCode: langCode,
        searchQuery: searchQuery, term: termToUse, limit: 50, offset: offset,
      );
      if (searchResult == null || searchResult['results'] == null) {
        return {'deputies': [], 'nextCursor': null};
      }
      return {'deputies': searchResult['results'], 'nextCursor': null};
    } else {
      try {
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
        final resultData = await _apiService.callFunction('ue_getDeputies', params: params);
        
        await _cache.saveMPsCursor(resultData, langCode, limit, lastVisibleId, term: termToUse, club: club, sortBy: sortBy);
        
        return resultData;
      } catch (e) {
        developer.log('Błąd w getMPs (filtr), próba odczytu z cache: $e', name: 'EUParliamentService');
        final cachedData = await _cache.getMPsCursor(langCode, limit, lastVisibleId, term: termToUse, club: club, sortBy: sortBy);
        if (cachedData != null) return cachedData;
        rethrow;
      }
    }
  }
	
  @override
  Future<Legislation?> getLegislationDetails(BuildContext context, String legislationId, {bool forceRefresh = false, String? documentType}) async {
    developer.log('SERVICE: Szczegóły ID: $legislationId, forceRefresh: $forceRefresh, type: $documentType', name: 'EUParliamentService');
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    final backendType = (documentType == 'civic') ? 'civic' : 'bill';
    try {
      if (!forceRefresh) {
        final cachedBill = await _cache.getLegislationDetails(legislationId, langCode);
        if (cachedBill != null) return cachedBill;
      }
      
      final data = await _apiService.callFunction(
        'ue_getDetails',
        params: {'type': backendType, 'id': legislationId, 'lang': langCode},
      );
      final bill = Legislation.fromJson(data);
      
      await _cache.saveLegislationDetails(bill, langCode);
      
      return bill;
    } catch (e) {
      developer.log('Błąd sieciowy w getLegislationDetails, próba odczytu z cache: $e', name: 'EUParliamentService');

      return await _cache.getLegislationDetails(legislationId, langCode);
    }
  }
	
  @override
  Future<MP?> getMPData(
    BuildContext context, String mpId, 
    {bool forceRefresh = false, String? dataType, Map<String, dynamic>? params}
  ) async {
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w EUParliamentService");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
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
      developer.log('Błąd w getMPData: $e', name: 'EUParliamentService');
      return await _cache.getMPDetails(mpId, lang: langCode, dataType: dataType, params: params, term: termToUse);
    }
  }

@override
  Future<MP?> getMPDetails(BuildContext context, String mpId, {bool forceRefresh = false, String? dataType, Map<String, dynamic>? params}) async {
    developer.log('SERVICE: Rozpoczynam pobieranie szczegółów posła (callable). ID: $mpId', name: 'EUParliamentService');
    try {
      final data = await _apiService.callFunction(
        'ue_getDetails',
        params: {
          'type': 'deputy',
          'id': mpId,
        },
      );
      return MP.fromJson(data);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable ue_getDetails (deputy) (${e.code}): ${e.message}', name: 'EUParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieciowy w getMPDetails: $e', name: 'EUParliamentService');
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
    developer.log('Wywoływanie funkcji callable search z parametrami: $params', name: 'EUParliamentService');
    try {
      return await _apiService.callFunction('search', params: params);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable search (typ: $type, ${e.code}): ${e.message}', name: 'EUParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieci w _trySearchFromAPI: $e', name: 'EUParliamentService');
      return null;
    }
  }
	
  @override
	Future<void> clearCache() async {
		await _cache.clearAll();
	}

  Future<MP?> _tryFetchMPDataFromAPI(
    String langCode,
    String mpId,
    int term, {
    String? dataType,
    Map<String, dynamic>? params,
  }) async {
    final Map<String, dynamic> callableParams = {
      'id': mpId,
      'lang': langCode,
      'term': term.toString(),
      if (dataType != null) 'dataType': dataType,
    };
    if (params != null) {
      callableParams.addAll(params);
    }
    developer.log('Wywoływanie funkcji callable ue_getDeputyDetails z parametrami: $callableParams', name: 'EUParliamentService');
    try {
      final responseJson = await _apiService.callFunction('ue_getDeputyDetails', params: callableParams);
      responseJson['id'] = mpId;
      return MP.fromJson(responseJson);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable ue_getDeputyDetails ($mpId, ${e.code}): ${e.message}', name: 'EUParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieci lub inny podczas pobierania szczegółów posła $mpId: $e', name: 'EUParliamentService', error: e);
      return null;
    }
  }

@override
  MissingDataAction? getMissingDataAction(BuildContext context, Legislation legislation) {
    if (legislation.missingDataInfo == null) {
      return null;
    }
    final l10n = AppLocalizations.of(context)!;

    switch (legislation.missingDataInfo!.type) {
      case 'NO_SOURCE_DOCUMENT':
        final userMessage = l10n.missingDataSourceUserMessage;
        final buttonText = l10n.missingDataSourceButton;
  
final emailRecipient = "AskEP@europarl.europa.eu";
final emailSubject = "Application for Public Access to a Document - Procedure ${legislation.id}";

final emailBody = """
Dear Sir/Madam,

Under Regulation (EC) No 1049/2001 regarding public access to European Parliament, Council and Commission documents, I hereby apply for access to the full text of a legislative document which is not currently available in the public register.

Procedure file number/ID: ${legislation.id}
Title: ${legislation.title}

The omission of this document from public-facing platforms such as EUR-Lex or the Parliament's Legislative Observatory hinders the public's right to scrutinise the legislative process, a core principle of the Union's democratic functioning.

I request that this document be made publicly available in the official register. For the purposes of data processing and analysis, please ensure the document is provided in a machine-readable format (e.g., XML, HTML, or a text-based PDF).

Thank you for your attention to this matter.

Yours faithfully,
[Your Name]
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
      default:
        return null;
    }
  }
}
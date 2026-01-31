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


class PLParliamentService with ChangeNotifier implements ParliamentServiceInterface {
  final ApiService _apiService = ApiService();
  final String baseUrl = 'https://api.lustra.dev';

  final ParliamentCacheManager _cache = ParliamentCacheManager('pl');

  static const Map<int, String> _termDurations = {
    9: "(2019-2023)", 8: "(2015-2019)",
    7: "(2011-2015)", 6: "(2007-2011)", 5: "(2005-2007)",
    4: "(2001-2005)", 3: "(1997-2001)", 2: "(1993-1997)",
    1: "(1991-1993)",
  };

  static const Map<int, int> _termYears = { 
    1: 2, 2: 4, 3: 4, 4: 4,
    5: 2, 6: 4, 7: 4, 8: 4,
    9: 4,
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
    final terms = mp.termsUS.map((t) => t.term).toList();

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
  String get name => 'Sejm RP';

  @override
  String? getHistoricalDataDisclaimer(BuildContext context) {
  return AppLocalizations.of(context)!.plHistoricalDataDisclaimer;
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

  PLParliamentService();

  @override
  Future<Map<String, String>> getLegislationFilterStatuses(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    return {
      'all': l10n.filterStatusAll,
      'Przyjęte': l10n.filterStatusPassed,
      'Odrzucone': l10n.filterStatusRejected,
    };
  }

  @override
  String get futureStatusId => 'Nadchodzące głosowanie';

  @override
  String get processStatusId => 'W procesie';

  @override
  Future<Map<String, String>> getLegislationFilterDocumentTypes(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    return {
      'projekt ustawy': l10n.docTypeBill,
      'projekt uchwały': l10n.docTypeResolution,
    };
  }

  @override
  List<String> get defaultDocumentTypeIds => ['projekt ustawy', 'projekt uchwały'];
  
  @override
  DisplayableStatus getDisplayableStatusInfo(BuildContext context, String? status) {
    final String translatedLabel = translatePLStatus(context, status);
    final String lowerStatus = status?.toLowerCase() ?? '';
    const List<String> acceptedDisplayVariants = [
      "przekazano prezydentowi", "uchwalono", "w mocy", "uchwalono i przekazano do senatu", "podpisano przez prezydenta"
    ];
    const List<String> rejectedDisplayVariants = [
      "odrzucono", "veto prezydenta", "natychmiastowe odrzucenie", "odrzucono przez Senat"
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
    } else if (lowerStatus == 'zaplanowane' || lowerStatus == 'nadchodzące głosowanie') {
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
  String translateStatus(BuildContext context, String? status) {
    return translatePLStatus(context, status);
  }

  @override
  String get governmentApiUrl => 'https://api.sejm.gov.pl/';
  
  @override
  String get flagAssetPath => 'assets/flags/pl.svg';

  @override
  String getVotingTitle(BuildContext context, Legislation legislation) {
    final l10n = AppLocalizations.of(context)!;

    if (legislation.statusText?.toLowerCase().contains('wniosek o odrzucenie') ?? false) {
      return l10n.votingResultsPL1stReadingTitle;
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
    switch (vote.toLowerCase()) {
      case 'za':
        return l10n.voteTypeFor;
      case 'przeciw':
        return l10n.voteTypeAgainst;
      case 'wstrzymał się':
        return l10n.voteTypeAbstain;
      case 'nieobecny':
        return l10n.voteTypeAbsent;
      default:
        return vote;
    }
  }

  @override
  String? getOfficialUrl(Legislation legislation) {
    if (legislation.fullContentUrl != null && legislation.fullContentUrl!.isNotEmpty) {
      return legislation.fullContentUrl;
    }
    if (legislation.attachmentUrls != null && legislation.attachmentUrls!.isNotEmpty) {
      return legislation.attachmentUrls!.first;
    }
    return null;
  }

  @override
  String? getProcessUrl(Legislation legislation) {
    final idParts = legislation.id.split('_');
    if (idParts.length == 2) {
      final termNumber = idParts[0];
      final printNumber = idParts[1];
      return 'https://www.sejm.gov.pl/Sejm$termNumber.nsf/PrzebiegProc.xsp?nr=$printNumber';
    }
    return null;
  }

  @override
  String? getVotingPdfUrl(Legislation legislation) {
    if (legislation.meetingNumber != null && legislation.votingNumber != null) {
      final String term = "term${legislation.term}";
      return 'https://api.sejm.gov.pl/sejm/$term/votings/${legislation.meetingNumber}/${legislation.votingNumber}/pdf';
    }
    return null;
  }

    @override
  Map<int, String> get termDurations => _termDurations;
	
	@override
	ParliamentSource get source => ParliamentSource.pl;

  @override
  String get citizenVoteFunctionName => 'pl_citizenVote';

  @override
  Future<void> initialize() async {
    if (_initializationCompleter.isCompleted) {
      _initializationCompleter = Completer<void>();
    }
    developer.log('Inicjalizacja PLParliamentService...', name: 'PLParliamentService');
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
         developer.log('Błąd parsowania cache metadanych PL', name: 'PLParliamentService');
      }
    }

    try {
      final data = await _apiService.callFunction('pl_getMetadata');
      // CACHE CLEANER
      _cache.cleanUp().catchError((e) {
      developer.log('Błąd podczas czyszczenia cache: $e', name: 'PLParliamentService');
      });
      await _cache.saveMetadata(data);
      
      _latestTerm = data['currentTerm'] as int?; 
      _currentTerm = data['currentTerm'] as int?;
      _availableTerms = (data['availableTerms'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];
      _clubFilters = (data['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
      _clubFilters.sort();
      developer.log('PLParliamentService zainicjalizowany (z sieci). Kadencja: $_currentTerm', name: 'PLParliamentService');
    } catch (e, stackTrace) {
      developer.log(
        'Błąd sieciowy podczas inicjalizacji PLParliamentService: ${e.toString()}', 
        name: 'PLParliamentService',
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
        'pl_getMetadata',
        params: {
          'type': 'term_clubs',
          'term': newTerm,
        },
      );
      _clubFilters = (data['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
      _clubFilters.sort();
    } catch (e) {
       _clubFilters = [];
       developer.log('Błąd podczas zmiany kadencji: $e', name: 'PLParliamentService');
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
    if (mp.clubsUS.isNotEmpty) {
       final historyClubs = mp.clubsUS.map((c) => c.party).toList();
       
       if (historyClubs.length > 1) {
          previousClubs = historyClubs.sublist(1)
            .where((clubName) => clubName.isNotEmpty && clubName != mp.club)
            .toList();
       }
    } else if (mp.parliamentaryHistory != null && mp.parliamentaryHistory!['clubs'] is List) {
       List<dynamic> historyClubs = mp.parliamentaryHistory!['clubs'];
        if (historyClubs.length > 1 && historyClubs.first is String) {
          previousClubs = historyClubs.sublist(1).map((c) => c.toString()).where((c) => c.isNotEmpty && c != mp.club).toList();
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
    
    List<int> terms = mp.termsUS.map((t) => t.term).toList();
    terms.sort((a, b) => b.compareTo(a));

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
    if (termToUse == null) throw Exception("Brak wybranej kadencji w PLParliamentService");
    
    if (!forceRefresh) {
      final cachedData = await _cache.getHomeScreenData(langCode, termToUse);
      if (cachedData != null) return cachedData;
    }
    
    try {
      final resultData = await _apiService.callFunction(
        'pl_getHomeScreenData',
        params: {
          'lang': langCode,
          'term': termToUse.toString(),
        },
      );
      final homeData = HomeScreenData.fromJson(resultData);
      
      await _cache.saveHomeScreenData(homeData, langCode, termToUse);
      
      return homeData;
    } catch (e) {
      developer.log('Błąd sieciowy. Próba fallback offline.', name: 'PLParliamentService');
      
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
    if (termToUse == null) throw Exception("Brak wybranej kadencji w PLParliamentService");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      final int offset = 0;
      final searchResult = await _trySearchFromAPI(
        type: 'legislations', country: 'pl', langCode: langCode,
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
        final resultData = await _apiService.callFunction('pl_getLegislations', params: params);
        
        await _cache.saveLegislationsCursor(
          resultData, langCode, limit, lastVisibleId, 
          status: status, documentType: documentType, category: category, sortBy: sortBy, processStartDateAfter: processStartDateAfter, term: termToUse
        );
        
        return resultData;
      } catch (e) {
        developer.log('Błąd w getLegislations (filtr), próba odczytu z cache: $e', name: 'PLParliamentService');

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

      developer.log('Wywołanie API pl_getCivicProjects z parametrami: $params', name: 'PLParliamentService');
      final resultData = await _apiService.callFunction('pl_getCivicProjects', params: params);
      
      await _cache.saveCivicProjects(resultData, langCode, limit, lastVisibleId, category, sortBy);
      return resultData;

    } catch (e) {
      developer.log('Błąd w getCivicProjects, próba odczytu z cache: $e', name: 'PLParliamentService');
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
    if (termToUse == null) throw Exception("Brak wybranej kadencji w PLParliamentService");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      final int offset = 0;
      final searchResult = await _trySearchFromAPI(
        type: 'deputies', country: 'pl', langCode: langCode,
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
        final resultData = await _apiService.callFunction('pl_getDeputies', params: params);
        
        await _cache.saveMPsCursor(resultData, langCode, limit, lastVisibleId, term: termToUse, club: club, sortBy: sortBy);
        
        return resultData;
      } catch (e) {
        developer.log('Błąd w getMPs (filtr), próba odczytu z cache: $e', name: 'PLParliamentService');
        final cachedData = await _cache.getMPsCursor(langCode, limit, lastVisibleId, term: termToUse, club: club, sortBy: sortBy);
        if (cachedData != null) return cachedData;
        rethrow;
      }
    }
  }
	
  @override
  Future<Legislation?> getLegislationDetails(BuildContext context, String legislationId, {bool forceRefresh = false, String? documentType}) async {
  developer.log('SERVICE: Szczegóły ID: $legislationId, forceRefresh: $forceRefresh, type: $documentType', name: 'PLParliamentService');
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    final backendType = (documentType == 'civic') ? 'civic' : 'bill';
    try {

      if (!forceRefresh) {
        final cachedBill = await _cache.getLegislationDetails(legislationId, langCode);
        if (cachedBill != null) return cachedBill;
      }
      
      final data = await _apiService.callFunction(
        'pl_getDetails',
        params: {'type': backendType, 'id': legislationId, 'lang': langCode},
      );
      final bill = Legislation.fromJson(data);
      
      await _cache.saveLegislationDetails(bill, langCode);
      
      return bill;
    } catch (e) {
      developer.log('Błąd sieciowy w getLegislationDetails, próba odczytu z cache: $e', name: 'PLParliamentService');

      return await _cache.getLegislationDetails(legislationId, langCode);
    }
  }
	
@override
  Future<MP?> getMPData(
    BuildContext context, String mpId, 
    {bool forceRefresh = false, String? dataType, Map<String, dynamic>? params}
  ) async {
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w PLParliamentService");
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
      developer.log('Błąd w getMPData: $e', name: 'PLParliamentService');
      return await _cache.getMPDetails(mpId, lang: langCode, dataType: dataType, params: params, term: termToUse);
    }
  }

@override
  Future<MP?> getMPDetails(BuildContext context, String mpId, {bool forceRefresh = false, String? dataType, Map<String, dynamic>? params}) async {
    developer.log('SERVICE: Rozpoczynam pobieranie szczegółów posła (callable). ID: $mpId', name: 'PLParliamentService');
    try {
      final data = await _apiService.callFunction(
        'pl_getDetails',
        params: {
          'type': 'deputy',
          'id': mpId,
        },
      );
      return MP.fromJson(data);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable pl_getDetails (deputy) (${e.code}): ${e.message}', name: 'PLParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieciowy w getMPDetails: $e', name: 'PLParliamentService');
      return null;
    }
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
    developer.log('Wywoływanie funkcji callable pl_getDeputyDetails z parametrami: $callableParams', name: 'PLParliamentService');
    try {
      final responseJson = await _apiService.callFunction('pl_getDeputyDetails', params: callableParams);
      responseJson['id'] = mpId;
      return MP.fromJson(responseJson);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable pl_getDeputyDetails ($mpId, ${e.code}): ${e.message}', name: 'PLParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieci lub inny podczas pobierania szczegółów posła $mpId: $e', name: 'PLParliamentService', error: e);
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
    developer.log('Wywoływanie funkcji callable search z parametrami: $params', name: 'PLParliamentService');
    try {
      return await _apiService.callFunction('search', params: params);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable search (typ: $type, ${e.code}): ${e.message}', name: 'PLParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieci w _trySearchFromAPI: $e', name: 'PLParliamentService');
      return null;
    }
  }

	
  @override
    Future<void> clearCache() async {
      await _cache.clearAll();
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
        final emailRecipient = "listy@sejm.gov.pl";
        final emailSubject = "Wniosek o dostęp do informacji publicznej - ustawa ${legislation.id}";
        final emailBody = """
Szanowni Państwo,

Na podstawie art. 61 Konstytucji RP oraz Ustawy o dostępie do informacji publicznej, zwracam się z wnioskiem o udostępnienie pełnej treści dokumentu legislacyjnego:

Numer druku/ID: ${legislation.id}
Źródło: ${legislation.attachmentUrls}

Dokument ten nie jest obecnie dostępny publicznie w Państwa systemach teleinformatycznych, co uniemożliwia obywatelom zapoznanie się z jego treścią.

Proszę o udostępnienie informacji w systemie.

Z poważaniem,
[Imię i nazwisko]
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

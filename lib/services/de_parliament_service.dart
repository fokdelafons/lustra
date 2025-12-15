import 'dart:convert';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lustra/models/legislation.dart';
import 'package:lustra/models/mp.dart';
import 'package:lustra/models/parliament_source.dart';
import 'package:lustra/models/home_screen_data.dart';
import 'package:lustra/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'parliament_service_interface.dart';
import '../providers/translators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lustra/services/api_service.dart';

class DEParliamentService with ChangeNotifier implements ParliamentServiceInterface {
  final ApiService _apiService = ApiService();
  final String baseUrl = 'https://api.lustra.dev';

  SharedPreferences? _prefs;

  static const Map<int, String> _termDurations = {
    20: "(2021-2025)", 19: "(2017-2021)",
    18: "(2013-2017)",
  };

  static const Map<int, int> _termYears = { 
    20: 4, 19: 4, 18: 4,
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
  String get name => 'Deutscher Bundestag';

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

  DEParliamentService() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

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
  String get futureStatusId => 'planned';

  @override
  String get processStatusId => 'process';

  @override
  Future<Map<String, String>> getLegislationFilterDocumentTypes(BuildContext context) async {
    // final l10n = AppLocalizations.of(context)!;
    return {
      // 'all': l10n.filterStatusAll,
      // 'bill': l10n.docTypeBill,
      // 'resolution': l10n.docTypeResolution,
    };
  }

  @override
  List<String> get defaultDocumentTypeIds => [];
  
  @override
  DisplayableStatus getDisplayableStatusInfo(BuildContext context, String? status) {
    final String translatedLabel = translateDEStatus(context, status);
    final String lowerStatus = status?.toLowerCase() ?? '';
    const List<String> acceptedDisplayVariants = [
      "bundesrat hat zugestimmt",
      "verabschiedet",
      "verkündet"
    ];
    const List<String> rejectedDisplayVariants = [
      "abgelehnt",
      "bundesrat hat zustimmung versagt",
      "einbringung abgelehnt",
      "für erledigt erklärt",
      "erledigt durch ablauf der wahlperiode",
      "für mit dem grundgesetz unvereinbar erklärt",
      "zurückgezogen"
    ];
    const List<String> processDisplayVariants = [
      "durchgang im bundesrat abgeschlossen",
      "abgeschlossen",
      "abgeschlossen - ergebnis siehe vorgangsablauf",
      "beschlussempfehlung liegt vor",
      "dem bundesrat zugeleitet - noch nicht beraten",
      "den ausschüssen zugewiesen",
      "noch nicht beraten",
      "zusammengeführt mit... (siehe vorgangsablauf)",
      "überwiesen",
      "einbringung beschlossen",
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
  String get governmentApiUrl => 'https://dip.bundestag.de/';

  @override
  String get flagAssetPath => 'assets/flags/de.svg';

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
  String? getOfficialUrl(Legislation legislation) {
    return null;
  }

  @override
  String? getProcessUrl(Legislation legislation) {
    if (legislation.id.isEmpty) {
      return null;
    }
    final printNumber = legislation.id.split('_').last;
    if (printNumber.isNotEmpty) {
      return 'https://dip.bundestag.de/vorgang/id/$printNumber';
    }
    return null;
  }

  @override
  String? getVotingPdfUrl(Legislation legislation) {
    return null;
  }

  @override
  String translateStatus(BuildContext context, String? status) {
    return translateDEStatus(context, status);
  }

  @override
  Map<int, String> get termDurations => _termDurations;
	
	@override
	ParliamentSource get source => ParliamentSource.de;

  @override
  String get citizenVoteFunctionName => 'de_citizenVote';

@override
  Future<void> initialize() async {
    if (_initializationCompleter.isCompleted) {
      _initializationCompleter = Completer<void>();
    }
    developer.log('Inicjalizacja DEParliamentService...', name: 'DEParliamentService');
    _isLoading = true;
    notifyListeners();
    if (_prefs == null) {
      await _initPrefs();
    }
    final bool hasCache = await _loadMetadataFromCache();
    if (hasCache) {
      notifyListeners();
    }
    try {
      final data = await _apiService.callFunction('de_getMetadata');
      await _saveMetadataToCache(data);
      _latestTerm = data['currentTerm'] as int?; 
      _currentTerm = data['currentTerm'] as int?;
      _availableTerms = (data['availableTerms'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];
      _clubFilters = (data['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
      _clubFilters.sort();
      developer.log('DEParliamentService zainicjalizowany (z sieci). Kadencja: $_currentTerm', name: 'DEParliamentService');
    } catch (e, stackTrace) {
      developer.log(
        'Błąd sieciowy podczas inicjalizacji DEParliamentService: ${e.toString()}', 
        name: 'DEParliamentService',
        error: e,
        stackTrace: stackTrace
      );
      if (!hasCache) {
        if (!_initializationCompleter.isCompleted) {
          _initializationCompleter.completeError(e, stackTrace);
        }
        throw Exception('Brak połączenia z siecią i brak danych w cache. Nie można uruchomić aplikacji.');
      }
      developer.log('Używam danych z cache z powodu błędu sieci.', name: 'DEParliamentService');
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
        'de_getMetadata',
        params: {
          'type': 'term_clubs',
          'term': newTerm,
        },
      );
      _clubFilters = (data['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
      _clubFilters.sort();
    } catch (e) {
       _clubFilters = [];
       developer.log('Błąd podczas zmiany kadencji: $e', name: 'DEParliamentService');
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
  Future<Map<String, dynamic>> getLegislations(
      BuildContext context, {
      int limit = 20, String? lastVisibleId, bool forceRefresh = false,
      String? searchQuery, String? status, List<String>? documentType,
      bool? active, String? category, String? sortBy, String? processStartDateAfter,
  }) async {
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w DEParliamentService");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      final int offset = 0;
      final searchResult = await _trySearchFromAPI(
        type: 'legislations', country: 'de', langCode: langCode,
        searchQuery: searchQuery, term: termToUse, limit: 50, offset: offset,
      );
      if (searchResult == null || searchResult['results'] == null) {
        return {'legislations': [], 'nextCursor': null};
      }
      return {'legislations': searchResult['results'], 'nextCursor': null};
    } else {
      try {
        if (!forceRefresh) {
          final cachedData = await _getCachedBillsCursor(langCode, limit, lastVisibleId, status, documentType, category, sortBy, processStartDateAfter, term: termToUse);
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
        final resultData = await _apiService.callFunction('de_getLegislations', params: params);
        await _cacheBillsCursor(langCode, resultData, limit, lastVisibleId, status, documentType, category, sortBy, processStartDateAfter, term: termToUse);
        return resultData;
      } catch (e) {
        developer.log('Błąd w getLegislations (filtr), próba odczytu z cache: $e', name: 'DEParliamentService');
        final cachedData = await _getCachedBillsCursor(langCode, limit, lastVisibleId, status, documentType, category, sortBy, processStartDateAfter, term: termToUse);
        if (cachedData != null) return cachedData;
        rethrow;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> getMPs(
      BuildContext context, {
      required int limit, String? lastVisibleId, bool forceRefresh = false,
      String? searchQuery, String? club, String? sortBy,
  }) async {
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w DEParliamentService");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      final int offset = 0;
      final searchResult = await _trySearchFromAPI(
        type: 'deputies', country: 'de', langCode: langCode,
        searchQuery: searchQuery, term: termToUse, limit: 50, offset: offset,
      );
      if (searchResult == null || searchResult['results'] == null) {
        return {'deputies': [], 'nextCursor': null};
      }
      return {'deputies': searchResult['results'], 'nextCursor': null};
    } else {
      try {
        if (!forceRefresh) {
          final cachedData = await _getCachedMPsCursor(langCode, limit, lastVisibleId, term: termToUse, club: club, sortBy: sortBy);
          if (cachedData != null) return cachedData;
        }
        final params = {
          'limit': limit, 'lang': langCode, 'term': termToUse.toString(),
          if (lastVisibleId != null) 'lastVisibleDocId': lastVisibleId,
          if (club != null) 'club': club,
          if (sortBy != null) 'sortBy': sortBy,
        };
        final resultData = await _apiService.callFunction('de_getDeputies', params: params);
        await _cacheMPsCursor(langCode, resultData, limit, lastVisibleId, term: termToUse, club: club, sortBy: sortBy);
        return resultData;
      } catch (e) {
        developer.log('Błąd w getMPs (filtr), próba odczytu z cache: $e', name: 'DEParliamentService');
        final cachedData = await _getCachedMPsCursor(langCode, limit, lastVisibleId, term: termToUse, club: club, sortBy: sortBy);
        if (cachedData != null) return cachedData;
        rethrow;
      }
    }
  }
	
  @override
  Future<Legislation?> getLegislationDetails(BuildContext context, String legislationId, {bool forceRefresh = false}) async {
    developer.log('SERVICE: Rozpoczynam pobieranie szczegółów ustawy. ID: $legislationId, forceRefresh: $forceRefresh', name: 'DEParliamentService');
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    try {
      if (!forceRefresh) {
        final cachedBill = await _getCachedLegislationDetails(legislationId, langCode);
        if (cachedBill != null) return cachedBill;
      }
      final data = await _apiService.callFunction(
        'de_getDetails',
        params: {'type': 'bill', 'id': legislationId, 'lang': langCode},
      );
      final bill = Legislation.fromJson(data);
      await _cacheLegislationDetails(bill, langCode);
      return bill;
    } catch (e) {
      developer.log('Błąd sieciowy w getLegislationDetails, próba odczytu z cache: $e', name: 'DEParliamentService');
      return await _getCachedLegislationDetails(legislationId, langCode);
    }
  }
	
  @override
  Future<MP?> getMPData(
    BuildContext context, String mpId, 
    {bool forceRefresh = false, String? dataType, Map<String, dynamic>? params}
  ) async {
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w DEParliamentService");
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    try {
      if (!forceRefresh) {
        MP? cachedMP = await _getCachedMPDetails(mpId, langCode: langCode, dataType: dataType, params: params, term: termToUse);
        if (cachedMP != null) return cachedMP;
      }
      MP? mp = await _tryFetchMPDataFromAPI(langCode, mpId, termToUse, dataType: dataType, params: params);
      if (mp != null) {
        await _cacheMPDetails(mp, langCode: langCode, dataType: dataType, params: params, term: termToUse);
        return mp;
      }
      return await _getCachedMPDetails(mpId, langCode: langCode, dataType: dataType, params: params, term: termToUse);
    } catch (e) {
      developer.log('Błąd w getMPData: $e', name: 'DEParliamentService');
      return await _getCachedMPDetails(mpId, langCode: langCode, dataType: dataType, params: params, term: termToUse);
    }
  }

@override
  Future<MP?> getMPDetails(BuildContext context, String mpId, {bool forceRefresh = false, String? dataType, Map<String, dynamic>? params}) async {
    developer.log('SERVICE: Rozpoczynam pobieranie szczegółów posła (callable). ID: $mpId', name: 'DEParliamentService');
    try {
      final data = await _apiService.callFunction(
        'de_getDetails',
        params: {
          'type': 'deputy',
          'id': mpId,
        },
      );
      return MP.fromJson(data);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable de_getDetails (deputy) (${e.code}): ${e.message}', name: 'DEParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieciowy w getMPDetails: $e', name: 'DEParliamentService');
      return null;
    }
  }

@override
  Future<HomeScreenData> getHomeScreenData(BuildContext context, {bool forceRefresh = false}) async {
    final langCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    await initializationDone;
    final int? termToUse = _currentTerm;
    if (termToUse == null) throw Exception("Brak wybranej kadencji w DEParliamentService");

    try {
      final resultData = await _apiService.callFunction(
        'de_getHomeScreenData',
        params: {
          'lang': langCode,
          'term': termToUse.toString(),
        },
      );
      final homeData = HomeScreenData.fromJson(resultData);
      await _saveHomeScreenDataToCache(homeData, langCode, termToUse);
      return homeData;
    } catch (e) {
      developer.log('Błąd sieciowy podczas pobierania danych ekranu głównego: $e', name: 'DEParliamentService');
      final cachedData = await _loadHomeScreenDataFromCache(langCode, termToUse);
      if (cachedData != null) {
        return cachedData;
      } else {
        developer.log('Brak danych ekranu głównego w cache. Rzucam wyjątek.', name: 'DEParliamentService');
        throw Exception('Błąd sieci i brak danych w cache: $e');
      }
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
    developer.log('Wywoływanie funkcji callable search z parametrami: $params', name: 'DEParliamentService');
    try {
      return await _apiService.callFunction('search', params: params);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable search (typ: $type, ${e.code}): ${e.message}', name: 'DEParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieci w _trySearchFromAPI: $e', name: 'DEParliamentService');
      return null;
    }
  }

  @override
	Future<void> clearCache() async {
		try {
			final prefs = await SharedPreferences.getInstance();
			final allKeys = prefs.getKeys();
			final List<String> keysToRemove = allKeys.where((key) => 
				key.startsWith('de_cached_')
			).toList();
			keysToRemove.add('de_last_updated');
			developer.log('Znaleziono ${keysToRemove.length} kluczy do usunięcia dla Polski.', name: 'DEParliamentService');
			for (String key in keysToRemove) {
				if (allKeys.contains(key)) {
					await prefs.remove(key);
				}
			}
			developer.log('Cache wyczyszczony dla Polski', name: 'DEParliamentService');
		} catch (e) {
			developer.log('Błąd podczas czyszczenia cache: $e', name: 'DEParliamentService', error: e);
		}
	}

  String _generateCacheKeyForBillsCursor(
    String langCode, int limit, String? lastVisibleId, String? status,
    List<String>? documentType, String? category, String? sortBy, String? processStartDateAfter, {required int term}) {
    final docTypeString = documentType?.join(',') ?? 'none';
    final statusStr = status?.isNotEmpty == true ? status : 'none';
    final categoryStr = category?.isNotEmpty == true && category != 'Wszystkie' ? category : 'none';
    final cursorStr = lastVisibleId ?? 'firstPage';
    final sortStr = sortBy ?? 'popularity';
    final startDateStr = processStartDateAfter ?? 'none';
    return 'de_cached_bills_cursor_term_${term}_lang_${langCode}_lim_${limit}_cursor_${cursorStr}_stat_${statusStr}_type_${docTypeString}_cat_${categoryStr}_sort_${sortStr}_after_$startDateStr';
  }

    Future<void> _cacheBillsCursor(String langCode, Map<String, dynamic> data, int limit, String? lastVisibleId, String? status, List<String>? documentType, String? category, String? sortBy, String? processStartDateAfter, {required int term}) async {
    try {
      final key = _generateCacheKeyForBillsCursor(langCode, limit, lastVisibleId, status, documentType, category, sortBy, processStartDateAfter, term: term);
      final jsonString = json.encode(data);
      await _prefs?.setString(key, jsonString);
      await _prefs?.setString('${key}_timestamp', DateTime.now().toIso8601String());
    } catch (e) {
      developer.log('Błąd podczas zapisywania cache ustaw (kursor): $e', name: 'DEParliamentService');
    }
  }

Future<Map<String, dynamic>?> _getCachedBillsCursor(String langCode, int limit, String? lastVisibleId, String? status, List<String>? documentType, String? category, String? sortBy, String? processStartDateAfter, {required int term}) async {
    try {
      final key = _generateCacheKeyForBillsCursor(langCode, limit, lastVisibleId, status, documentType, category, sortBy, processStartDateAfter, term: term);
      final cachedJson = _prefs?.getString(key);
      final timestamp = _prefs?.getString('${key}_timestamp');
      final lastUpdatedStr = _prefs?.getString('de_last_updated');
      if (cachedJson == null || timestamp == null || lastUpdatedStr == null) return null;
      final cacheTime = DateTime.tryParse(timestamp);
      final lastUpdatedTime = _parseDate(lastUpdatedStr);
      if (cacheTime != null && lastUpdatedTime != null && cacheTime.isAfter(lastUpdatedTime)) {
        developer.log('Używam danych z cache (klucz: $key)', name: 'ParliamentServiceCache');
        return json.decode(cachedJson) as Map<String, dynamic>;
      }
      developer.log('Cache przeterminowany (klucz: $key)', name: 'ParliamentServiceCache');
      return null;
    } catch (e) {
      developer.log('Błąd podczas odczytu cache (kursor): $e', name: 'DEParliamentService');
      return null;
    }
  }

  String _generateCacheKeyForMPsCursor(String langCode, int limit, String? lastVisibleId, {required int term, String? club, String? sortBy}) {
    final clubKey = club ?? 'all';
    final sortKey = sortBy ?? 'popularity';
    final cursorStr = lastVisibleId ?? 'firstPage';
    return 'de_cached_mps_cursor_term_${term}_lang_${langCode}_lim_${limit}_cursor_${cursorStr}_club_${clubKey}_sort_$sortKey';
  }

  Future<void> _cacheMPsCursor(String langCode, Map<String, dynamic> data, int limit, String? lastVisibleId, {required int term, String? club, String? sortBy}) async {
    try {
      final key = _generateCacheKeyForMPsCursor(langCode, limit, lastVisibleId, term: term, club: club, sortBy: sortBy);
      final jsonString = json.encode(data);
      await _prefs?.setString(key, jsonString);
      await _prefs?.setString('${key}_timestamp', DateTime.now().toIso8601String());
    } catch (e) {
      developer.log('Błąd podczas zapisywania cache posłów (kursor): $e', name: 'DEParliamentService');
    }
  }

  Future<Map<String, dynamic>?> _getCachedMPsCursor(String langCode, int limit, String? lastVisibleId, {required int term, String? club, String? sortBy}) async {
    try {
      final key = _generateCacheKeyForMPsCursor(langCode, limit, lastVisibleId, term: term, club: club, sortBy: sortBy);
      final cachedJson = _prefs?.getString(key);
      final timestamp = _prefs?.getString('${key}_timestamp');
      final lastUpdatedStr = _prefs?.getString('de_last_updated');
      if (cachedJson == null || timestamp == null || lastUpdatedStr == null) return null;
      final cacheTime = DateTime.tryParse(timestamp);
      final lastUpdatedTime = _parseDate(lastUpdatedStr);
      if (cacheTime != null && lastUpdatedTime != null && cacheTime.isAfter(lastUpdatedTime)) {
        return json.decode(cachedJson) as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      developer.log('Błąd podczas odczytu cache posłów (kursor): $e', name: 'DEParliamentService');
      return null;
    }
  }

    Future<bool> _loadMetadataFromCache() async {
    final cachedJson = _prefs?.getString('de_metadata_cache');
    if (cachedJson == null) {
      developer.log('Brak metadanych w cache.', name: 'DEParliamentService');
      return false;
    }
    try {
      final data = json.decode(cachedJson) as Map<String, dynamic>;
      _currentTerm = data['currentTerm'] as int?;
      _latestTerm = data['currentTerm'] as int?;
      _availableTerms = (data['availableTerms'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];
      _clubFilters = (data['clubs'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
      _clubFilters.sort();
      developer.log('Załadowano metadane z cache. Kadencja: $_currentTerm', name: 'DEParliamentService');
      return true;
    } catch (e) {
      developer.log('Błąd podczas ładowania metadanych z cache: $e', name: 'DEParliamentService');
      return false;
    }
  }

  Future<void> _saveMetadataToCache(Map<String, dynamic> data) async {
    try {
      await _prefs?.setString('de_metadata_cache', json.encode(data));
      if (data['lastUpdated'] != null) {
        await _prefs?.setString('de_last_updated', data['lastUpdated'].toString());
      }
      developer.log('Zapisano metadane do cache.', name: 'DEParliamentService');
    } catch (e) {
      developer.log('Błąd podczas zapisywania metadanych do cache: $e', name: 'DEParliamentService');
    }
  }

  Future<void> _saveHomeScreenDataToCache(HomeScreenData data, String lang, int term) async {
    try {
      final key = 'de_cached_homescreen_term_${term}_lang_$lang';
      await _prefs?.setString(key, json.encode(data.toJson()));
      developer.log('Zapisano dane ekranu głównego do cache (klucz: $key)', name: 'DEParliamentService');
    } catch (e) {
      developer.log('Błąd podczas zapisywania cache ekranu głównego: $e', name: 'DEParliamentService');
    }
  }

  Future<HomeScreenData?> _loadHomeScreenDataFromCache(String lang, int term) async {
    try {
      final key = 'de_cached_homescreen_term_${term}_lang_$lang';
      final cachedJson = _prefs?.getString(key);
      if (cachedJson != null) {
        developer.log('Załadowano dane ekranu głównego z cache (klucz: $key)', name: 'DEParliamentService');
        return HomeScreenData.fromJson(json.decode(cachedJson) as Map<String, dynamic>);
      }
    } catch (e) {
      developer.log('Błąd podczas ładowania cache ekranu głównego: $e', name: 'DEParliamentService');
    }
    return null;
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
    developer.log('Wywoływanie funkcji callable de_getDeputyDetails z parametrami: $callableParams', name: 'DEParliamentService');
    try {
      final responseJson = await _apiService.callFunction('de_getDeputyDetails', params: callableParams);
      responseJson['id'] = mpId;
      return MP.fromJson(responseJson);
    } on FirebaseFunctionsException catch (e) {
      developer.log('Błąd funkcji callable de_getDeputyDetails ($mpId, ${e.code}): ${e.message}', name: 'DEParliamentService', error: e);
      return null;
    } catch (e) {
      developer.log('Błąd sieci lub inny podczas pobierania szczegółów posła $mpId: $e', name: 'DEParliamentService', error: e);
      return null;
    }
  }
	
String _generateCacheKeyForMPDetails(String mpId, {required String langCode, String? dataType, Map<String, dynamic>? params, required int term}) {
  String key = 'de_cached_mp_term_${term}_id_${mpId}_lang_$langCode'; 
  if (dataType != null) {
    key += '_data_$dataType';
  }
  if (params != null) {
    if (params.containsKey('startAfterDocId')) {
      key += '_after_${params['startAfterDocId']}';
    }
    if (params.containsKey('limit')) {
      key += '_limit_${params['limit']}';
    }
  }
  return key;
  }

Future<void> _cacheMPDetails(MP mp, {required String langCode, String? dataType, Map<String, dynamic>? params, required int term}) async {
		try {
			final prefs = await SharedPreferences.getInstance();
			final cacheKey = _generateCacheKeyForMPDetails(mp.id, langCode: langCode, dataType: dataType, params: params, term: term);
			final String mpJson = json.encode(mp.toJson());
			await prefs.setString(cacheKey, mpJson);
			await prefs.setString('${cacheKey}_timestamp', DateTime.now().toIso8601String());
			developer.log('Zapisano szczegóły posła do cache (klucz: $cacheKey)', name: 'DEParliamentService');
		} catch (e) {
			developer.log('Błąd podczas zapisywania cache szczegółów posła: $e', name: 'DEParliamentService', error: e);
		}
	}

String _generateCacheKeyForLegislationDetails(String legislationId, String langCode) {
  return 'de_cached_legislation_details_id_${legislationId}_lang_$langCode';
}

Future<void> _cacheLegislationDetails(Legislation bill, String langCode) async {
  try {
    final key = _generateCacheKeyForLegislationDetails(bill.id, langCode);
    final jsonString = json.encode(bill.toJson());
    await _prefs?.setString(key, jsonString);
    await _prefs?.setString('${key}_timestamp', DateTime.now().toIso8601String());
    developer.log('Zapisano szczegóły legislacji do cache (klucz: $key)', name: 'DEParliamentService');
  } catch (e) {
    developer.log('Błąd podczas zapisywania cache szczegółów legislacji: $e', name: 'DEParliamentService');
  }
}

Future<Legislation?> _getCachedLegislationDetails(String legislationId, String langCode) async {
  try {
    final key = _generateCacheKeyForLegislationDetails(legislationId, langCode);
    final cachedJson = _prefs?.getString(key);
    final timestamp = _prefs?.getString('${key}_timestamp');
    final lastUpdatedStr = _prefs?.getString('de_last_updated');

    if (cachedJson == null || timestamp == null || lastUpdatedStr == null) return null;

    final cacheTime = DateTime.tryParse(timestamp);
    final lastUpdatedTime = _parseDate(lastUpdatedStr);

    if (cacheTime != null && lastUpdatedTime != null && cacheTime.isAfter(lastUpdatedTime)) {
      developer.log('Używam szczegółów legislacji z cache (klucz: $key)', name: 'ParliamentServiceCache');
      return Legislation.fromJson(json.decode(cachedJson) as Map<String, dynamic>);
    }
    
    developer.log('Cache dla szczegółów legislacji przeterminowany (klucz: $key)', name: 'ParliamentServiceCache');
    return null;
  } catch (e) {
    developer.log('Błąd podczas odczytu cache szczegółów legislacji: $e', name: 'DEParliamentService');
    return null;
  }
}

  Future<MP?> _getCachedMPDetails(String mpId, {required String langCode, String? dataType, Map<String, dynamic>? params, required int term}) async {
		try {
			final prefs = await SharedPreferences.getInstance();
			final cacheKey = _generateCacheKeyForMPDetails(mpId, langCode: langCode, dataType: dataType, params: params, term: term);
			final String? cachedData = prefs.getString(cacheKey);
			final String? timestamp = prefs.getString('${cacheKey}_timestamp');
			final String? lastUpdatedStr = prefs.getString('de_last_updated');
			if (cachedData == null || timestamp == null || lastUpdatedStr == null) {
				developer.log('Brak szczegółów posła w cache dla klucza: $cacheKey', name: 'DEParliamentService');
				return null;
			}
  final DateTime? cacheTime = _parseDate(timestamp);
  final DateTime? lastUpdated = _parseDate(lastUpdatedStr);

  if (cacheTime == null || lastUpdated == null) {
    return null;
  }
			if (cacheTime.isAfter(lastUpdated)) {
				developer.log('Znaleziono aktualne szczegóły posła w cache dla klucza: $cacheKey', name: 'DEParliamentService');
				Map<String, dynamic> mpJson = json.decode(cachedData);
				return MP.fromJson(mpJson);
			}
			developer.log('Szczegóły posła w cache dla klucza: $cacheKey są nieaktualne.', name: 'DEParliamentService');
			return null;
		} catch (e) {
			developer.log('Błąd podczas odczytywania cache szczegółów posła: $e', name: 'DEParliamentService', error: e);
			return null;
		}
	}
    DateTime? _parseDate(String? dateString) {
    if (dateString == null) return null;
    final int? timestamp = int.tryParse(dateString);
    if (timestamp != null) {
        return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
    }
    return DateTime.tryParse(dateString);
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
final emailRecipient = "mail@bundestag.de";
final emailSubject = "Anfrage nach dem IFG: Fehlendes Gesetzesdokument - Drucksache Nr. ${legislation.id}";
final emailBody = """
Sehr geehrte Damen und Herren,

hiermit beantrage ich auf Grundlage des Informationsfreiheitsgesetzes (IFG) Zugang zum vollständigen Text eines Gesetzentwurfs, der derzeit nicht auf den offiziellen Plattformen des Bundes zugänglich ist.

Drucksachennummer/ID: ${legislation.id}
Titel: ${legislation.title}

Das Fehlen dieses Dokuments auf bundestag.de oder im Dokumentations- und Informationssystem (DIP) hindert die Öffentlichkeit daran, wichtige Gesetzgebungsverfahren zu prüfen, was ein Grundprinzip der demokratischen Transparenz ist.

Ich bitte Sie, das vollständige Dokument auf der entsprechenden offiziellen Plattform öffentlich zugänglich zu machen. Für die Zwecke der Datenanalyse und Weiterverarbeitung stellen Sie bitte sicher, dass das Dokument in einem maschinenlesbaren Format (z.B. HTML, XML oder als textbasiertes PDF) bereitgestellt wird.

Mit freundlichen Grüßen,
[Ihr Name]
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
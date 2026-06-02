import 'dart:developer' as developer;

import 'package:lustra/l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/legislation.dart';
import '../../models/mp.dart';
import '../../models/parliament_source.dart';
import '../../providers/language_provider.dart';
import '../../providers/translators.dart';
import '../parliament_service_interface.dart';
import '../app_router.dart';
import '../parliament_manager.dart';
import 'base_parliament_api.dart';

class USParliamentService extends BaseParliamentApi implements ParliamentServiceInterface {
  USParliamentService() : super('us');

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
  Future<Map<String, String>> getLegislationFilterStatuses(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    return {
      'all': l10n.filterStatusAll,
      'Passed House': l10n.statusPassedHouse,
      'Passed Senate': l10n.statusPassedSenate,
      'Became Law': l10n.statusBecameLaw,
      'To President': l10n.statusToPresident,
      'Adopted': l10n.statusAdopted,
      'Vetoed': l10n.statusVetoed,
      'Failed': l10n.statusFailed,
      'Placed on Calendar': l10n.statusPlacedOnCalendar,
      'Introduced': l10n.statusIntroduced,
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
    } else if (lowerStatus == 'initiative') {
      return DisplayableStatus(
        label: translatedLabel,
        backgroundColor: Colors.teal.withAlpha(20),
        textColor: Colors.teal[800]!,
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
  Map<int, int> get termYears => _termYears;

	@override
	ParliamentSource get source => ParliamentSource.us;

    @override
  String get citizenVoteFunctionName => 'us_citizenVote';

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
VoidCallback? getSponsoredTapAction(BuildContext context, InterpellationPreview interp) {
  if (interp.id.isNotEmpty) {
        return () {
          final pManager = context.read<ParliamentManager>();
          final lang = context.read<LanguageProvider>().appLanguageCode;
          final parliamentId = pManager.activeServiceId;
          final term = pManager.currentTerm;
          final slug = ParliamentSource.getSlugById(parliamentId);
          
          // ARCHITECTURE: Functional equivalent of WebLink logic.
          // Uses custom smartNavigate (go for Web, push for Mobile) without breaking the VoidCallback signature.
          final logicalPath = '/$lang/$slug/$term/legislations/${interp.id}';
          
          context.smartNavigate(logicalPath);
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
      if (termNumber == latestTerm) {
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
  MissingDataAction? getMissingDataAction(BuildContext context, Legislation legislation) {
    if (!legislation.noDocument) {
      return null;
    }

    final l10n = AppLocalizations.of(context)!;
    
    final userMessage = l10n.missingDataSourceUserMessage;
    final buttonText = l10n.missingDataSourceButton;
    final emailRecipient = "policy@loc.gov";
    final emailSubject = "Inquiry Regarding Missing Legislative Document: ${legislation.id}";

    final emailBody = """
To Whom It May Concern,

I am writing to report that the full text of a key legislative document is not available on https://api.congress.gov/.

Bill Number/ID: ${legislation.id}

This omission prevents the public from accessing critical information, hindering the principle of government transparency.

I request that you take action to publish this document on the appropriate official API to ensure it is accessible to all citizens.

If this is not the correct department to address this matter, I kindly ask that you forward this message to the appropriate team.

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
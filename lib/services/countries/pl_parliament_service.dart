import 'package:lustra/l10n/app_localizations.dart';

import 'base_parliament_api.dart';
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


class PLParliamentService extends BaseParliamentApi implements ParliamentServiceInterface {
  PLParliamentService() : super('pl');

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

  @override
  String get name => 'Sejm RP';

  @override
  String? getHistoricalDataDisclaimer(BuildContext context) {
  return AppLocalizations.of(context)!.plHistoricalDataDisclaimer;
}

  @override
  Future<Map<String, String>> getLegislationFilterStatuses(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    return {
      'all': l10n.filterStatusAll,
      "W procesie": l10n.statusInProgress,
      "Uchwalono i przekazano do Senatu": l10n.statusPassedSejmToSenat,
      "Odrzucono": l10n.statusRejectedSejm,
      "Odrzucono przez Senat": l10n.statusRejectedBySenate,
      "Przekazano Prezydentowi": l10n.statusToPresident,
      "VETO Prezydenta": l10n.statusVetoPresident,
      "Skierowano do TK": l10n.statusToConstitutionalTribunal,
      "Podpisano przez Prezydenta": l10n.statusSignedByPresident,
      "W mocy": l10n.statusEnacted,
      "Uchwalono": l10n.statusAdoptedResolution,
      "Natychmiastowe odrzucenie": l10n.statusImmediateRejection,
      "Wycofano": l10n.statusWithdrawn,
      "Nadchodzące głosowanie": l10n.statusUpcoming,
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
  Map<int, int> get termYears => _termYears;
	
	@override
	ParliamentSource get source => ParliamentSource.pl;

  @override
  String get citizenVoteFunctionName => 'pl_citizenVote';

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
  List<MPDetailItem> getMPHeaderDetails(BuildContext context, MP mp) { // TODO: clubHistory doesnt work in PL?
    final l10n = AppLocalizations.of(context)!;
    final details = <MPDetailItem>[];
    
    List<String> previousClubs = [];
    if (mp.clubHistory.isNotEmpty) {
      if (mp.clubHistory.length > 1) {
        previousClubs = mp.clubHistory.sublist(1)
          .where((clubName) => clubName.isNotEmpty && clubName != mp.club)
          .toList();
      }
    } else if (mp.clubsUS.isNotEmpty) {
      final historyClubs = mp.clubsUS.map((c) => c.party).toList();
      if (historyClubs.length > 1) {
        previousClubs = historyClubs.sublist(1)
          .where((clubName) => clubName.isNotEmpty && clubName != mp.club)
          .toList();
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
      if (termNum == latestTerm) {
        duration = l10n.termCurrently;
      } else {
        duration = termDurations[termNum] ?? l10n.unknownTermDuration;
      }
      return MPDetailItem(label: l10n.tenureTermItemPL(romanNumeral, duration));
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
      MPActivityTab(title: l10n.sponsorshipsTab, type: 'sponsorships'),
    ];
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

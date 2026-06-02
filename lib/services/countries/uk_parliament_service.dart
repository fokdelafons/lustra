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

class UKParliamentService extends BaseParliamentApi implements ParliamentServiceInterface {
  UKParliamentService() : super('uk');

  static const Map<int, String> _termDurations = {
      58: "(2019-2024)", 57: "(2017-2019)",
      56: "(2015-2017)", 55: "(2010-2015)",
      54: "(2005-2010)", 53: "(2001-2005)",
      52: "(1997-2001)", 51: "(1992-1997)",
      50: "(1987-1992)",
    };

    static const Map<int, int> _termYears = { 
      58: 5, 57: 2, 56: 2, 55: 5,
      54: 5, 53: 4, 52: 4, 51: 5,
      50: 5,
    };

  int? _extractTermNumber(dynamic term) {
    if (term is int) return term;
    if (term is num) return term.toInt();
    if (term is String) return int.tryParse(term);
    if (term is Map) {
      final value = term['term'];
      if (value is int) return value;
      if (value is num) return value.toInt();
      if (value is String) return int.tryParse(value);
    }
    return null;
  }

  List<int> _extractTermNumbers(MP mp) {
    if (mp.parliamentaryHistory == null || mp.parliamentaryHistory!['terms'] is! List) {
      return [];
    }

    return (mp.parliamentaryHistory!['terms'] as List)
        .map(_extractTermNumber)
        .whereType<int>()
        .toSet()
        .toList();
  }

  @override
  int calculateTotalTenureInYears(MP mp) {
    final terms = _extractTermNumbers(mp);

    int totalYears = 0;
    for (var termNum in terms) {
      totalYears += _termYears[termNum] ?? 0;
    }
    return totalYears;
  }

  @override
  String get name => 'Parliament of the UK';

  @override
  String get governmentApiUrl => 'https://bills-api.parliament.uk/';

  @override
  String get flagAssetPath => 'assets/flags/gb.svg';

  @override
  String? getHistoricalDataDisclaimer(BuildContext context) {
    return null;
  }

@override
Future<Map<String, String>> getLegislationFilterStatuses(BuildContext context) async {
  final l10n = AppLocalizations.of(context)!;
  return {
    'all': l10n.filterStatusAll,
    '1st reading': l10n.statusUk1stReading,
    '2nd reading': l10n.statusUk2ndReading,
    '3rd reading': l10n.statusUk3rdReading,
    'Committee of the whole House': l10n.statusUkCommitteeWholeHouse,
    'Committee stage': l10n.statusUkCommitteeStage,
    'Consideration of Commons amendments and / or reasons': l10n.statusUkConsiderationCommonsAmendments,
    'Enacted (Approved)': l10n.statusUkEnactedApproved,
    'Enacted (Negative Procedure)': l10n.statusUkEnactedNegativeProcedure,
    'Lords Examiners': l10n.statusUkLordsExaminers,
    'Programme motion': l10n.statusUkProgrammeMotion,
    'Proposed (Draft Affirmative)': l10n.statusUkProposedDraftAffirmative,
    'Proposed (Draft Negative)': l10n.statusUkProposedDraftNegative,
    'Proposed (Enhanced Scrutiny)': l10n.statusUkProposedEnhancedScrutiny,
    'Proposed (Legislative Reform)': l10n.statusUkProposedLegislativeReform,
    'Proposed (Negative SI)': l10n.statusUkProposedNegativeSI,
    'Proposed (Remedial Order)': l10n.statusUkProposedRemedialOrder,
    'Report stage': l10n.statusUkReportStage,
    'Royal Assent': l10n.statusUkRoyalAssent,
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
    'bill': l10n.docTypeBill,
    'resolution': l10n.docTypeResolution,
  };
}

  @override
  List<String> get defaultDocumentTypeIds => [];
  
  @override
  DisplayableStatus getDisplayableStatusInfo(BuildContext context, String? status) {
    final String translatedLabel = translateUKStatus(context, status);
    final String lowerStatus = status?.toLowerCase() ?? '';
    const List<String> acceptedDisplayVariants = [
      "act of parliament",
      "royal assent",
      "enacted (approved)",
      "enacted (negative procedure)",
    ];
    const List<String> rejectedDisplayVariants = [
      "withdrawn",
      "rejected",
    ];
    const List<String> processDisplayVariants = [
      "1st reading",
      "2nd reading",
      "3rd reading",
      "committee stage",
      "commons examiners",
      "lords special public bill committee",
      "money resolution",
      'consideration of lords amendments',
      'consideration of lords message',
      "order of commitment discharged",
      "programme motion",
      "report stage",
      "second reading committee",
      "ways and means resolution"
      "proposed (draft affirmative)",
      "proposed (draft negative)",
      "proposed (enhanced scrutiny)",
      "proposed (legislative reform)",
      "proposed (negative si)",
      "proposed (remedial order)",
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
    } else if (lowerStatus == 'Placed on Calendar') {
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
      case 'yes':
        return l10n.voteTypeFor;
      case 'no':
        return l10n.voteTypeAgainst;
      case 'abstained':
        return l10n.voteTypeAbstain;
      case 'absent':
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
    return null;
  }

  @override
  String? getVotingPdfUrl(Legislation legislation) {
    return null;
  }

  @override
  String translateStatus(BuildContext context, String? status) {
    return translateUKStatus(context, status);
  }

	@override
  Map<int, String> get termDurations => _termDurations;

  @override
  Map<int, int> get termYears => _termYears;
	
	@override
	ParliamentSource get source => ParliamentSource.uk;

  @override
  String get citizenVoteFunctionName => 'uk_citizenVote';

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
    final terms = _extractTermNumbers(mp)..sort((a, b) => b.compareTo(a));
    if (terms.isEmpty) {
      return MPDetailSection(
        title: getTenureTitle(context, mp),
        items: [MPDetailItem(label: l10n.noTermData)]
      );
    }
    final items = terms.map((termNum) {
      final String duration;
      if (termNum == latestTerm) {
        duration = l10n.termCurrently;
      } else {
        duration = termDurations[termNum] ?? l10n.unknownTermDuration;
      }
      final role = mp.memberType.isNotEmpty ? mp.memberType : 'MP';
      return MPDetailItem(label: '$termNum $name $duration: $role');
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
  List<MPActivityTab> getMPActivityTabs(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      MPActivityTab(title: l10n.votingsTab, type: 'votings'),
      MPActivityTab(title: l10n.sponsorshipsTab, type: 'sponsorships'),
    ];
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
        final emailRecipient = "hcenquiries@parliament.uk"; 
        final emailSubject = "Public Information Request: Missing text of Bill ${legislation.id}";

        final emailBody = """
To Whom It May Concern,

I am writing to request access to the full text of a parliamentary bill which is not currently available on the official parliament.uk website. This request is made under the provisions of the Freedom of Information Act 2000.

Bill ID (term + printNumber): ${legislation.id}

The absence of this document from public-facing platforms prevents citizens from scrutinizing proposed legislation, which is a key principle of democratic transparency.

I request that you publish the full text of this bill on the parliament.uk website. For the purposes of data analysis and accessibility, please ensure the document is provided in a machine-readable format (such as HTML, XML, or a text-based PDF).

Thank you for your attention to this matter.


Sincerely,
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
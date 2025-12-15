import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String translatePLStatus(BuildContext context, String? backendStatus) {
  final l10n = AppLocalizations.of(context)!;
  if (backendStatus == null || backendStatus.isEmpty) {
    return l10n.noStatusInfo;
  }
  
  final Map<String, String> statusMap = {
    "W procesie": l10n.statusInProgress,
    "Uchwalono i przekazano do Senatu": l10n.statusPassedSejmToSenat,
    "Odrzucono": l10n.statusRejectedSejm,
    "Odrzucono przez Senat": l10n.statusRejectedBySenate,
    "Przekazano Prezydentowi": l10n.statusToPresident,
    "VETO Prezydenta": l10n.statusVetoPresident,
    "Skierowano do TK": l10n.statusToConstitutionalTribunal,
    "Podpisano przez Prezydenta": l10n.statusSignedByPresident,
    "W mocy": l10n.statusEnacted,
    "Przedawniono": l10n.statusExpired,
    "Uchwalono": l10n.statusAdoptedResolution,
    "Natychmiastowe odrzucenie": l10n.statusImmediateRejection,
    "Wycofano": l10n.statusWithdrawn,
    "Nadchodzące głosowanie": l10n.statusUpcoming,
  };
  return statusMap[backendStatus] ?? backendStatus;
}

String categoryLabelToApiKey(BuildContext context, String uiLabel) {
  final l10n = AppLocalizations.of(context)!;
  final Map<String, String> labelToApiKeyMap = {
    l10n.categoryHealth: 'Health',
    l10n.categoryFamily: 'Family',
    l10n.categoryTaxes: 'Taxes',
    l10n.categoryMigration: 'Migration',
    l10n.categoryLabor: 'Labor',
    l10n.categorySecurity: 'Security',
    l10n.categoryEducation: 'Education',
    l10n.categoryEnvironment: 'Environment',
    l10n.categoryCourtsAndLaw: 'Courts and Law',
    l10n.categoryTransport: 'Transport',
    l10n.categoryBenefits: 'Benefits',
    l10n.categoryRealEstate: 'Real Estate',
    l10n.categoryMediaAndCulture: 'Media and Culture',
    l10n.categoryLocalGovernment: 'Local Government',
    l10n.categoryAgriculture: 'Agriculture',
    l10n.categoryPublicInvestments: 'Public Investments',
    l10n.categoryInformatization: 'Informatization',
    l10n.categoryEconomy: 'Economy',
    l10n.categoryOther: 'Other',
  };
  return labelToApiKeyMap[uiLabel] ?? uiLabel;
}

String categoryApiKeyToLabel(BuildContext context, String apiKey) {
  final l10n = AppLocalizations.of(context)!;
  final Map<String, String> apiKeyToLabelMap = {
    'Health': l10n.categoryHealth,
    'Family': l10n.categoryFamily,
    'Taxes': l10n.categoryTaxes,
    'Migration': l10n.categoryMigration,
    'Labor': l10n.categoryLabor,
    'Security': l10n.categorySecurity,
    'Education': l10n.categoryEducation,
    'Environment': l10n.categoryEnvironment,
    'Courts and Law': l10n.categoryCourtsAndLaw,
    'Transport': l10n.categoryTransport,
    'Benefits': l10n.categoryBenefits,
    'Real Estate': l10n.categoryRealEstate,
    'Media and Culture': l10n.categoryMediaAndCulture,
    'Local Government': l10n.categoryLocalGovernment,
    'Agriculture': l10n.categoryAgriculture,
    'Public Investments': l10n.categoryPublicInvestments,
    'Informatization': l10n.categoryInformatization,
    'Economy': l10n.categoryEconomy,
    'Other': l10n.categoryOther,
  };
  return apiKeyToLabelMap[apiKey] ?? apiKey;
}

String translateUSStatus(BuildContext context, String? backendStatus) {
  final l10n = AppLocalizations.of(context)!;
  if (backendStatus == null || backendStatus.isEmpty) {
    return l10n.noStatusInfo;
  }
  final Map<String, String> statusMap = {
    "Introduced in House": l10n.statusIntroducedInHouse,
    "Reported to Senate": l10n.statusReportedToSenate,
    "Reported in House": l10n.statusReportedInHouse,
    "Referred in Senate": l10n.statusReferredInSenate,
    "Referred in House": l10n.statusReferredInHouse,
    "Reference Change Senate": l10n.statusReferenceChangeSenate,
    "Received in Senate": l10n.statusReceivedInSenate,
    "Placed on Calendar Senate": l10n.statusPlacedOnCalendarSenate,
    "Introduced in Senate": l10n.statusIntroducedInSenate,
    "Engrossed in House": l10n.statusEngrossedInHouse,
    "Agreed to Senate": l10n.statusAgreedToSenate,
    "Engrossed Amendment House": l10n.statusEngrossedAmendmentHouse,
    "Failed Passage Senate": l10n.statusFailedPassageSenate,
    "Laid on Table in House": l10n.statusLaidOnTableInHouse,
    "Private Law": l10n.statusPrivateLaw,
    "Public Law": l10n.statusPublicLaw,
    "Introduced": l10n.statusIntroduced,
    "Passed House": l10n.statusPassedHouse,
    "Passed Senate": l10n.statusPassedSenate,
    "Became Law": l10n.statusBecameLaw,
    "To President": l10n.statusToPresident,
    "Vetoed": l10n.statusVetoed,
    "Failed": l10n.statusFailed,
    "Placed on Calendar": l10n.statusPlacedOnCalendar,
    "Initiative": l10n.statusInitiative,
  };
  return statusMap[backendStatus] ?? backendStatus;
}

String translateUSRole(BuildContext context, String? backendRole) {
  final l10n = AppLocalizations.of(context)!;
  if (backendRole == null || backendRole.isEmpty) {
    return '';
  }
  final Map<String, String> roleMap = {
    "Representative": l10n.usRoleRepresentative,
    "Senator": l10n.usRoleSenator,
  };
  return roleMap[backendRole] ?? backendRole;
}

String translateEUStatus(BuildContext context, String? backendStatus) {
  final l10n = AppLocalizations.of(context)!;
  if (backendStatus == null || backendStatus.isEmpty) {
    return l10n.noStatusInfo;
  }
  final Map<String, String> statusMap = {
    "adopted": l10n.statusAdopted,
    "withdrawn": l10n.statusWithdrawn,
    "rejected": l10n.filterStatusRejected,
  };
  return statusMap[backendStatus.toLowerCase()] ?? backendStatus;
}

String translateDEStatus(BuildContext context, String? backendStatus) {
  final l10n = AppLocalizations.of(context)!;
  if (backendStatus == null || backendStatus.isEmpty) {
    return l10n.noStatusInfo;
  }
  final Map<String, String> statusMap = {
    "bundesrat hat zugestimmt": l10n.statusDeBundesratApproved,
    "verabschiedet": l10n.statusDeAdopted,
    "einbringung beschlossen": l10n.statusDeIntroductionApproved,
    "verkündet": l10n.statusDeAnnounced,
    "abgelehnt": l10n.statusDeRejected,
    "bundesrat hat zustimmung versagt": l10n.statusDeBundesratDenied,
    "einbringung abgelehnt": l10n.statusDeIntroductionRejected,
    "für erledigt erklärt": l10n.statusDeDeclaredCompleted,
    "erledigt durch ablauf der wahlperiode": l10n.statusDeCompletedByTermEnd,
    "für mit dem grundgesetz unvereinbar erklärt": l10n.statusDeDeclaredUnconstitutional,
    "zurückgezogen": l10n.statusDeWithdrawn,
    "durchgang im bundesrat abgeschlossen": l10n.statusDeBundesratProcessCompleted,
    "abgeschlossen": l10n.statusDeCompleted,
    "abgeschlossen - ergebnis siehe vorgangsablauf": l10n.statusDeCompletedSeeProcess,
    "beschlussempfehlung liegt vor": l10n.statusDeRecommendationAvailable,
    "dem bundesrat zugeleitet - noch nicht beraten": l10n.statusDeToBundesratNotDeliberated,
    "den ausschüssen zugewiesen": l10n.statusDeAssignedToCommittees,
    "noch nicht beraten": l10n.statusDeNotYetDeliberated,
    "zusammengeführt mit... (siehe vorgangsablauf)": l10n.statusDeMergedWith,
    "überwiesen": l10n.statusDeReferred,
  };
  return statusMap[backendStatus.toLowerCase()] ?? backendStatus;
}

String translateFRStatus(BuildContext context, String? backendStatus) {
  final l10n = AppLocalizations.of(context)!;
  if (backendStatus == null || backendStatus.isEmpty) {
    return l10n.noStatusInfo;
  }
  final Map<String, String> statusMap = {
    "loi_publiee": l10n.statusFrLawPublished,
    "ordonnance_publiee": l10n.statusFrOrdinancePublished,
    "résolution publiee": l10n.statusFrResolutionPublished,
    "decret publiee": l10n.statusFrDecreePublished,
    "décision": l10n.statusFrDecision,
    "rejeté": l10n.statusFrRejected,
    "prescrit": l10n.statusFrPrescribed,
    "proposition_loi": l10n.statusFrPropositionLoi,
    "projet_loi": l10n.statusFrProjetLoi
  };
  return statusMap[backendStatus.toLowerCase()] ?? backendStatus;
}

String translateUKStatus(BuildContext context, String? backendStatus) {
  final l10n = AppLocalizations.of(context)!;
  if (backendStatus == null || backendStatus.isEmpty) {
    return l10n.noStatusInfo;
  }
  final Map<String, String> statusMap = {
    "act of parliament": l10n.statusUkActOfParliament,
    "royal assent": l10n.statusUkRoyalAssent,
    "withdrawn": l10n.statusUkWithdrawn,
    "rejected": l10n.statusUkRejected,
    "1st reading": l10n.statusUk1stReading,
    "2nd reading": l10n.statusUk2ndReading,
    "3rd reading": l10n.statusUk3rdReading,
    "committee stage": l10n.statusUkCommitteeStage,
    "commons examiners": l10n.statusUkCommonsExaminers,
    "lords special public bill committee": l10n.statusUkLordsSpecialCommittee,
    "money resolution": l10n.statusUkMoneyResolution,
    "consideration of lords amendments": l10n.statusUkConsiderationLordsAmendments,
    "consideration of lords message": l10n.statusUkConsiderationLordsMessage,
    "order of commitment discharged": l10n.statusUkOrderOfCommitmentDischarged,
    "programme motion": l10n.statusUkProgrammeMotion,
    "report stage": l10n.statusUkReportStage,
    "second reading committee": l10n.statusUkSecondReadingCommittee,
    "ways and means resolution": l10n.statusUkWaysAndMeansResolution,
  };
  return statusMap[backendStatus.toLowerCase()] ?? backendStatus;
}
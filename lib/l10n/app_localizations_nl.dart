// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get errorFailedToLoadData => 'Fout bij het laden van de gegevens';

  @override
  String get errorNoData => 'Geen gegevens om weer te geven.';

  @override
  String get noData => 'Geen gegevens';

  @override
  String get noDate => 'Geen datum';

  @override
  String get shareAction => 'Delen';

  @override
  String get loginAction => 'Inloggen';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get settingsChangeLanguage => 'Taal wijzigen';

  @override
  String get settingsLogout => 'Uitloggen';

  @override
  String get tryAgainButton => 'Opnieuw proberen';

  @override
  String get moreButton => '... Meer';

  @override
  String get seeDetailsLink => 'Details bekijken ->';

  @override
  String get bottomNavHome => 'Start';

  @override
  String get bottomNavInfo => 'Informatie';

  @override
  String get bottomNavSupport => 'Ondersteunen';

  @override
  String get bottomNavFutureFeatures => 'Toekomstige functies';

  @override
  String termLabel(String termNumber) {
    return 'Zittingsperiode: $termNumber';
  }

  @override
  String termMenuItem(int termNumber, String termYears) {
    return 'Zittingsperiode $termNumber $termYears';
  }

  @override
  String get errorNoDataForTerm =>
      'Geen gegevens beschikbaar voor de geselecteerde zittingsperiode.';

  @override
  String get sectionPopularVotes => 'Populaire stemmingen';

  @override
  String get sectionUpcoming => 'Binnenkort';

  @override
  String get sectionLegislationInProcess => 'Wetgeving in behandeling';

  @override
  String get sectionMpProfiles => 'Profielen van afgevaardigden';

  @override
  String get buttonBrowseVotes => 'Stemmingenoverzicht';

  @override
  String get buttonScheduledMeetings => 'Geplande zittingen';

  @override
  String get buttonBillsInProgress => 'Wetten in behandeling';

  @override
  String get buttonAllMps => 'Alle afgevaardigden';

  @override
  String get buttonCheckProfile => 'Profiel bekijken';

  @override
  String get errorNoDeputiesData => 'Geen gegevens over afgevaardigden.';

  @override
  String get errorNoDataLastVote => 'Geen gegevens over de laatste stemming.';

  @override
  String get errorNoDataUpcomingVote =>
      'Geen gegevens over de aanstaande stemming.';

  @override
  String get errorNoSummaryLastVote =>
      'Geen samenvatting voor de laatste stemming.';

  @override
  String get errorNoSummaryUpcomingVote =>
      'Geen samenvatting voor de aanstaande stemming.';

  @override
  String get errorNoDataLegislationInProcess =>
      'Geen gegevens over wetgeving in behandeling.';

  @override
  String get errorNoSummaryLegislationInProcess =>
      'Geen samenvatting voor wetgeving in behandeling.';

  @override
  String get keyPoints => 'Kernpunten';

  @override
  String get noKeyPoints => 'Geen kernpunten';

  @override
  String get votingResultsTitle => 'STEMRESULTATEN';

  @override
  String get labelFor => 'Voor:';

  @override
  String get labelAgainst => 'Tegen:';

  @override
  String get labelAbstained => 'Onthoudingen:';

  @override
  String get noStatusInfo => 'Geen statusinformatie';

  @override
  String scheduledMeetingDate(String date) {
    return 'Geplande zitting: $date';
  }

  @override
  String get noScheduledMeetingDate => 'Geen geplande zittingsdatum';

  @override
  String processStartDate(String date) {
    return 'Start van het proces: $date';
  }

  @override
  String get noProcessStartDate => 'Geen startdatum van het proces';

  @override
  String mpDistrict(String districtNumber) {
    return 'Kiesdistrict: $districtNumber';
  }

  @override
  String get actionCollapse => 'Inklappen';

  @override
  String get actionExpand => 'Meer uitvouwen...';

  @override
  String get votingFor => 'Voor';

  @override
  String get votingAgainst => 'Tegen';

  @override
  String get votingAbstainShort => 'Onth.';

  @override
  String get citizenPollTitle => 'Burgerpeiling';

  @override
  String get pollTemporarilyUnavailable =>
      'Peiling tijdelijk niet beschikbaar. Probeer het later opnieuw.';

  @override
  String get errorDisplayingPollBar =>
      'Fout bij het weergeven van de peilingresultaten.';

  @override
  String get pollNoForAgainstVotes => 'Geen voor-/tegenstemmen';

  @override
  String get pollNoVotesCast => 'Geen stemmen uitgebracht';

  @override
  String pollTotalVotes(int count) {
    return 'Uitgebrachte stemmen: $count';
  }

  @override
  String get pollSupport => 'Ik steun';

  @override
  String get pollDontSupport => 'Ik steun niet';

  @override
  String get loginToVote => 'Inloggen om te stemmen';

  @override
  String get dialogChooseLanguage => 'Kies taal';

  @override
  String get dialogCancel => 'Annuleren';

  @override
  String get infoScreenTitle => 'Informatie';

  @override
  String get infoTitle1 => 'Politiek scheiden van de media';

  @override
  String get infoParagraph1 =>
      'Lustra is een applicatie om de politiek te volgen met behulp van officiële gegevens. Met AI-technologie worden samenvattingen van wetsvoorstellen en stemresultaten beknopt, duidelijk en onpartijdig gepresenteerd. Het volgen van de politiek kost geen moeite of tijd meer - slechts een paar klikken.';

  @override
  String get infoTitle2 => 'Gemeenschappelijke belangen boven verdeeldheid';

  @override
  String get infoParagraph2 =>
      'Als samenleving delen we gemeenschappelijke doelen zoals vrijheid, veiligheid en welvaart. Verschillen in opvattingen zijn een natuurlijk onderdeel van de democratie - ze vormen het debat en maken verschillende perspectieven mogelijk. Met toegang tot betrouwbare informatie kunnen we beter geïnformeerde beslissingen nemen en deelnemen aan het openbare leven op basis van feiten, niet op emoties of mediaverhalen.';

  @override
  String get infoTitle3 => 'Daden, geen woorden';

  @override
  String get infoParagraph3 =>
      'U hoeft niet langer op verkiezingsbeloften te vertrouwen - u kunt de stemgeschiedenis van individuele parlementsleden bekijken en hun beslissingen analyseren. Het profiel van elke politicus bevat een puntsgewijze lijst, wat een snelle en onafhankelijke beoordeling van hun staat van dienst mogelijk maakt. De volledige werkgeschiedenis wordt uitgebreid naarmate de applicatie zich ontwikkelt.';

  @override
  String get infoTitle4 => 'Mensen, geen partijen';

  @override
  String get infoParagraph4 =>
      'Parlementsleden moeten de belangen van hun kiezers in overweging nemen en niet alleen stemmen volgens de partijlijn. Het partijsysteem verdeelt de samenleving, maar alles kan met kleine stapjes worden veranderd. De eerste is het publieke bewustzijn. Gebruik de app, praat, deel stemmingen, neem deel aan peilingen en blijf op de hoogte. Politiek beïnvloedt bijna elk aspect van ons leven, dus er is geen reden waarom enkelen over alles zouden moeten beslissen.';

  @override
  String get linkHowTechnologyWorks => 'Hoe werkt de technologie?';

  @override
  String get linkTermsAndPrivacy => 'Voorwaarden en Privacybeleid';

  @override
  String get supportScreenTitle => 'Ondersteun het project';

  @override
  String get supportParagraph1 =>
      'Lustra is mijn persoonlijke pro bono project. De applicatie zal altijd gratis zijn, zonder betaalde functies, extensies, advertenties of beperkingen. Ik geloof dat iedereen onbeperkte toegang moet hebben tot toegankelijke informatie - zonder opiniërende commentaren of filters. Als u het eens bent met de missie, moedig ik u aan om deze te ondersteunen met een donatie van elk bedrag. Elke bijdrage, hoe klein ook, zal me helpen de app te onderhouden en verder te ontwikkelen.';

  @override
  String get buttonSupportFinancially => 'Financieel ondersteunen';

  @override
  String get supportThankYou =>
      'Bedankt voor uw vertrouwen en elke vorm van betrokkenheid';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Maker van de applicatie';

  @override
  String get leaderboardTitle => 'Topdonateurs (Afgelopen maand)';

  @override
  String get futureFeaturesScreenTitle => 'Toekomstige functies';

  @override
  String get futureFeaturesHeader => 'Geplande functionaliteiten';

  @override
  String get futureFeatureReferendum => 'Een referendum uitschrijven';

  @override
  String get futureFeatureSenate => 'Senaat en senatoren';

  @override
  String get futureFeatureCitizenInitiative =>
      'Burgerinitiatief - wetsvoorstellen';

  @override
  String get futureFeatureIndependentCandidates =>
      'Onafhankelijke kandidaten voor het parlement';

  @override
  String get futureFeaturePetitions => 'Petities aan het parlement';

  @override
  String get comingSoon => 'Binnenkort';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Afgerond - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Gegevens vernieuwen';

  @override
  String get advancedSearchHint => 'Geavanceerd zoeken...';

  @override
  String get filterTypeLabel => 'Type: ';

  @override
  String get filterStatusLabel => 'Status: ';

  @override
  String get allOption => 'Alle';

  @override
  String get errorFetchData =>
      'Gegevens konden niet worden opgehaald. Probeer het opnieuw.';

  @override
  String get emptyListFilterMessage =>
      'Geen wetsvoorstellen gevonden die aan de geselecteerde criteria voldoen.';

  @override
  String get emptyListDefaultMessage =>
      'Geen afgeronde wetsvoorstellen om weer te geven voor deze bron.';

  @override
  String get searchDialogTitle => 'Zoeken en filteren';

  @override
  String get searchDialogHint => 'Voer zoekterm in...';

  @override
  String get searchDialogTimePeriodLabel => 'Tijdsperiode';

  @override
  String get searchDialogSearchButton => 'Zoeken';

  @override
  String get searchDialogSelectDateRange => 'Selecteer bereik';

  @override
  String get searchDialogDateRangePickerHelp => 'Selecteer een datumbereik';

  @override
  String get searchDialogDateRangePickerCancel => 'ANNULEREN';

  @override
  String get searchDialogDateRangePickerConfirm => 'OK';

  @override
  String get searchDialogDateRangePickerSave => 'OPSLAAN';

  @override
  String get timePeriodLastWeek => 'Afgelopen week';

  @override
  String get timePeriodLastMonth => 'Afgelopen maand';

  @override
  String get timePeriodLast3Months => 'Afgelopen 3 maanden';

  @override
  String get timePeriodLastYear => 'Afgelopen jaar';

  @override
  String get timePeriodAll => 'Alle tijden';

  @override
  String get timePeriodCustom => 'Aangepast bereik';

  @override
  String get categoryAll => 'Alle';

  @override
  String get categoryHealth => 'Gezondheid';

  @override
  String get categoryFamily => 'Familie';

  @override
  String get categoryTaxes => 'Belastingen';

  @override
  String get categoryMigration => 'Migratie';

  @override
  String get categoryLabor => 'Arbeid';

  @override
  String get categorySecurity => 'Veiligheid';

  @override
  String get categoryEducation => 'Onderwijs';

  @override
  String get categoryEnvironment => 'Milieu';

  @override
  String get categoryCourtsAndLaw => 'Rechtbanken en wetgeving';

  @override
  String get categoryTransport => 'Transport';

  @override
  String get categoryBenefits => 'Uitkeringen';

  @override
  String get categoryRealEstate => 'Onroerend goed';

  @override
  String get categoryMediaAndCulture => 'Media en cultuur';

  @override
  String get categoryLocalGovernment => 'Lokale overheid';

  @override
  String get categoryAgriculture => 'Landbouw';

  @override
  String get categoryPublicInvestments => 'Openbare investeringen';

  @override
  String get categoryInformatization => 'Informatisering';

  @override
  String get categoryEconomy => 'Economie';

  @override
  String get categoryOther => 'Overig';

  @override
  String futureLegislationScreenTitle(String parliamentName) {
    return 'Aankomende wetsvoorstellen - $parliamentName';
  }

  @override
  String get searchDialogAdvancedTitle => 'Zoeken en filteren (Geavanceerd)';

  @override
  String get emptyListFilterMessageFuture =>
      'Geen aankomende wetsvoorstellen gevonden die aan de geselecteerde criteria voldoen.';

  @override
  String get emptyListDefaultMessageFuture =>
      'Geen geplande wetsvoorstellen om weer te geven voor deze bron.';

  @override
  String get noScheduledMeetings => 'Geen geplande zittingen';

  @override
  String get dateFormatError => 'Fout bij datumformattering';

  @override
  String get upcomingMeetings => 'Aankomende zittingen:';

  @override
  String get keyPointsTitle => 'Kernpunten:';

  @override
  String processLegislationScreenTitle(String parliamentName) {
    return 'Wetsvoorstellen in behandeling - $parliamentName';
  }

  @override
  String get searchHint => 'Zoeken...';

  @override
  String get emptyListFilterMessageProcess =>
      'Geen wetsvoorstellen in behandeling gevonden die aan de geselecteerde criteria voldoen.';

  @override
  String get emptyListDefaultMessageProcess =>
      'Geen actieve wetsvoorstellen in het wetgevingsproces voor deze bron.';

  @override
  String processStartDateCardLabel(String date) {
    return 'Start van het proces: $date';
  }

  @override
  String get upcomingMeetingsCardLabel => 'Aankomende zittingen:';

  @override
  String get detailsScreenTitle => 'LUSTRA';

  @override
  String get shareTooltip => 'Delen';

  @override
  String get keyPointsSectionTitle => 'Kernpunten:';

  @override
  String get officialContentButton => 'Officiële tekst';

  @override
  String get processPageButton => 'Procespagina';

  @override
  String get fullVotingResultsPDF => 'Volledige stemresultaten (PDF)';

  @override
  String get scheduledMeetingsSectionTitle => 'Geplande zittingen';

  @override
  String get additionalInfoSectionTitle => 'Aanvullende informatie';

  @override
  String printNumberLabel(String id) {
    return 'Drukstuknummer: $id';
  }

  @override
  String processStartDateLabel(String date) {
    return 'Startdatum proces: $date';
  }

  @override
  String votingDateLabel(String date) {
    return 'Stemdatum: $date';
  }

  @override
  String meetingNumberLabel(String number) {
    return 'Zitting nr.: $number';
  }

  @override
  String votingNumberLabel(String number) {
    return 'Stemming nr.: $number';
  }

  @override
  String get sourceLabel => 'Bron: https://api.sejm.gov.pl/';

  @override
  String summarizedByLabel(String modelName) {
    return 'Samengevat door: $modelName';
  }

  @override
  String promptUsedLabel(String prompt) {
    return 'Gebruikte prompt: $prompt';
  }

  @override
  String get reportErrorButton => 'Fout melden';

  @override
  String get noUrlAvailableSnackbar => 'Geen URL beschikbaar.';

  @override
  String cannotOpenLinkSnackbar(String url) {
    return 'Kon link niet openen: $url';
  }

  @override
  String get alreadyVotedSnackbar => 'Uw stem is al geregistreerd.';

  @override
  String get sharingFunctionNotImplementedSnackbar =>
      'Deelfunctie (nog te implementeren)';

  @override
  String get reportErrorFunctionNotImplementedSnackbar =>
      'Foutmeldingsfunctie (nog te implementeren)';

  @override
  String get loginScreenTitle => 'Inloggen';

  @override
  String get registrationScreenTitle => 'Registratie';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get passwordLabel => 'Wachtwoord';

  @override
  String get loginButton => 'Inloggen';

  @override
  String get registerButton => 'Registreren';

  @override
  String get orDivider => 'OF';

  @override
  String get continueWithGoogle => 'Doorgaan met Google';

  @override
  String get continueWithFacebook => 'Doorgaan met Facebook';

  @override
  String get promptToRegister => 'Geen account? Registreer';

  @override
  String get promptToLogin => 'Heeft u al een account? Log in';

  @override
  String get validatorInvalidEmail => 'Voer een geldig e-mailadres in.';

  @override
  String get validatorPasswordTooShort =>
      'Wachtwoord moet minimaal 6 tekens bevatten.';

  @override
  String get authErrorInvalidCredentials =>
      'Ongeldig e-mailadres of wachtwoord.';

  @override
  String get authErrorEmailInUse => 'Dit e-mailadres is al in gebruik.';

  @override
  String get authErrorWeakPassword => 'Het wachtwoord is te zwak.';

  @override
  String get authErrorDefault =>
      'Er is een fout opgetreden. Probeer het opnieuw.';

  @override
  String get authErrorUnexpected => 'Er is een onverwachte fout opgetreden.';

  @override
  String get authErrorGoogleFailed =>
      'Inloggen met Google is mislukt. Probeer het opnieuw.';

  @override
  String get authErrorFacebookFailed =>
      'Inloggen met Facebook is mislukt. Probeer het opnieuw.';

  @override
  String get authErrorAccountExists =>
      'Er bestaat al een account met dit e-mailadres. Log in met uw wachtwoord.';

  @override
  String mpScreenTitle(String parliamentName) {
    return 'Afgevaardigden - $parliamentName';
  }

  @override
  String get searchMPsHint => 'Zoek afgevaardigden...';

  @override
  String get allFilter => 'Alle';

  @override
  String get noMPsForSource =>
      'Geen afgevaardigden beschikbaar voor deze bron.';

  @override
  String get noMPsMatchFilter => 'Geen afgevaardigden voldoen aan de criteria.';

  @override
  String get attendanceLabelShort => 'Aanwezigheid';

  @override
  String get attendanceTooltipWarning =>
      'Aanwezigheid berekend op basis van een zittingsperiode met een klein aantal stemmingen.\nGegevens kunnen minder representatief zijn.';

  @override
  String get supportLabel => 'Steun: ';

  @override
  String get unaffiliatedClub => 'Niet-ingeschreven';

  @override
  String mpDetailsScreenTitle(String firstName, String lastName) {
    return '$firstName $lastName';
  }

  @override
  String get shareProfileTooltip => 'Profiel delen';

  @override
  String get socialPollSectionTitle => 'Sociale peiling';

  @override
  String get parliamentaryActivitySectionTitle => 'Parlementaire activiteit';

  @override
  String parliamentaryTenureSectionTitle(int years) {
    return 'Parlementaire zittingsduur: $years jaar';
  }

  @override
  String get parliamentaryTenureNoData =>
      'Parlementaire zittingsduur: Geen gegevens';

  @override
  String get tenureTooltip =>
      'Het aantal jaren is een geschatte waarde, berekend op basis van de onderstaande gegevens, zonder rekening te houden met het voortijdig aflopen van het parlementaire mandaat.';

  @override
  String tenureTermItem(String romanNumeral, String duration) {
    return '${romanNumeral}e zittingsperiode van de Sejm van de Republiek Polen $duration';
  }

  @override
  String get unknownTermDuration => 'Onbekende periode';

  @override
  String get noTermData =>
      'Geen gedetailleerde gegevens over zittingsperiodes.';

  @override
  String get plHistoricalDataDisclaimer =>
      'Let op: Historische gegevens voor de 1e en 2e zittingsperiode van de Sejm van de Republiek Polen zijn niet beschikbaar en niet opgenomen.';

  @override
  String get personalDataSectionTitle => 'Persoonlijke gegevens';

  @override
  String get contactSectionTitle => 'Contact';

  @override
  String get dataSourceLabel => 'Gegevensbron: Sejm RP API';

  @override
  String get mandateStatusActive => 'Mandaat van afgevaardigde: actief';

  @override
  String get mandateStatusFulfilled => 'Mandaat van afgevaardigde: vervuld';

  @override
  String get mandateStatusCancelled => 'Mandaat van afgevaardigde: geannuleerd';

  @override
  String get mandateStatusInactive => 'Mandaat van afgevaardigde: inactief';

  @override
  String get followingAddedSnackbar => 'Toegevoegd aan gevolgd';

  @override
  String get followingRemovedSnackbar => 'Verwijderd uit gevolgd';

  @override
  String clubLabel(String clubName) {
    return 'Fractie: $clubName';
  }

  @override
  String formerlyLabel(String clubs) {
    return ' (voorheen: $clubs)';
  }

  @override
  String professionLabel(String profession) {
    return 'Beroep: $profession';
  }

  @override
  String districtLabel(String districtName, int districtNum) {
    return 'Kiesdistrict: $districtName (nr. $districtNum)';
  }

  @override
  String votesObtainedLabel(String votes) {
    return 'Behaalde stemmen: $votes';
  }

  @override
  String get birthDateLabel => 'Geboortedatum';

  @override
  String get ageLabel => 'Leeftijd';

  @override
  String ageUnit(int age) {
    return '$age jaar';
  }

  @override
  String get birthPlaceLabel => 'Geboorteplaats';

  @override
  String get educationLabel => 'Opleiding';

  @override
  String get voivodeshipLabel => 'Woiwodschap';

  @override
  String get emailLabelWithColon => 'E-mail:';

  @override
  String get votingsTab => 'Recente stemmingen';

  @override
  String get interpellationsTab => 'Interpellaties';

  @override
  String get attendanceLabel => 'Algemene aanwezigheid bij stemmingen';

  @override
  String get attendanceTooltipBase =>
      'De schaal beoordeelt de mate van vervulling van de parlementaire basisplicht. De aangenomen bandbreedtes zijn gebaseerd op de aanname dat een hoge opkomst een maatstaf is voor verantwoordelijkheid jegens de kiezers.';

  @override
  String get attendanceTooltipPartialMandate =>
      '\n\nDe afgevaardigde bekleedde het mandaat voor een deel van de zittingsperiode. De aanwezigheid heeft betrekking op deze periode.';

  @override
  String get attendanceTooltipUnknownMandate =>
      '\n\nAanwezigheid berekend op basis van een zittingsperiode met een klein aantal stemmingen. Gegevens kunnen minder representatief zijn.';

  @override
  String get errorLoadVotings => 'Laden van stemgeschiedenis mislukt.';

  @override
  String get errorLoadInterpellations => 'Laden van interpellaties mislukt.';

  @override
  String get noVotingsData =>
      'Geen gegevens over belangrijke stemmingen om weer te geven.';

  @override
  String get noInterpellationsData => 'Geen gegevens.';

  @override
  String get loadVotingsButton => 'Probeer stemmingen te laden';

  @override
  String get loadMoreButton => 'Meer weergeven';

  @override
  String interpellationSentDate(String date) {
    return 'Datum van indiening: $date';
  }

  @override
  String get interpellationReplyFrom => 'Antwoord van: ';

  @override
  String cannotOpenReplyLink(String url) {
    return 'Kon antwoordlink niet openen: $url';
  }

  @override
  String get pollResultNoVotes => 'geen stemmen';

  @override
  String get pollResultOverwhelmingMajority => 'overweldigende meerderheid';

  @override
  String get pollResultMajority => 'meerderheid';

  @override
  String get pollResultMinority => 'minderheid';

  @override
  String get pollResultOverwhelmingMinority => 'overweldigende minderheid';

  @override
  String pollResultFormatted(String percentage, String description) {
    return '$percentage - $description';
  }

  @override
  String pollTotalVotesLabel(int count) {
    return 'Aantal uitgebrachte stemmen: $count';
  }

  @override
  String get pollVoteToAction => 'Breng uw stem uit om de resultaten te zien';

  @override
  String get voteTypeFor => 'Voor';

  @override
  String get voteTypeAgainst => 'Tegen';

  @override
  String get voteTypeAbstain => 'Onthouding';

  @override
  String get voteTypeAbsent => 'Afwezig';

  @override
  String get defaultPrompt => 'Prompt';

  @override
  String get statusInProgress => 'In behandeling';

  @override
  String get statusPassedSejmToSenat =>
      'Aangenomen en doorgestuurd naar de Senaat';

  @override
  String get statusRejectedSejm => 'Verworpen';

  @override
  String get statusRejectedBySenate => 'Verworpen door de Senaat';

  @override
  String get statusToPresident => 'Doorgestuurd naar de President';

  @override
  String get statusVetoPresident => 'VETO van de President';

  @override
  String get statusToConstitutionalTribunal =>
      'Verwezen naar het Constitutioneel Hof';

  @override
  String get statusSignedByPresident => 'Ondertekend door de President';

  @override
  String get statusEnacted => 'In werking getreden';

  @override
  String get statusExpired => 'Vervallen';

  @override
  String get statusAdoptedResolution => 'Aangenomen';

  @override
  String get statusRejectedResolution => 'Verworpen';

  @override
  String get statusImmediateRejection => 'Onmiddellijke verwerping';

  @override
  String get statusWithdrawn => 'Ingetrokken';

  @override
  String get filterStatusAll => 'Alle';

  @override
  String get filterStatusPassed => 'Aangenomen';

  @override
  String get filterStatusRejected => 'Verworpen';

  @override
  String get docTypeBill => 'Wetsontwerp';

  @override
  String get docTypeResolution => 'Resolutieontwerp';

  @override
  String get statusUpcoming => 'Gepland';

  @override
  String get statusIntroducedInHouse =>
      'Ingediend in het Huis van Afgevaardigden';

  @override
  String get statusReportedToSenate => 'Gerapporteerd aan de Senaat';

  @override
  String get statusReportedInHouse => 'Gerapporteerd in het Huis';

  @override
  String get statusReferredInSenate => 'Verwezen in de Senaat';

  @override
  String get statusReferredInHouse => 'Verwezen in het Huis';

  @override
  String get statusReferenceChangeSenate => 'Verwijzingswijziging in de Senaat';

  @override
  String get statusReceivedInSenate => 'Ontvangen in de Senaat';

  @override
  String get statusPlacedOnCalendarSenate =>
      'Op de kalender van de Senaat geplaatst';

  @override
  String get statusIntroducedInSenate => 'Ingediend in de Senaat';

  @override
  String get statusEngrossedInHouse => 'Definitief goedgekeurd in het Huis';

  @override
  String get statusAgreedToSenate => 'Goedgekeurd in de Senaat';

  @override
  String get statusEngrossedAmendmentHouse =>
      'Amendement goedgekeurd in het Huis';

  @override
  String get statusFailedPassageSenate => 'Verworpen in de Senaat';

  @override
  String get statusLaidOnTableInHouse => 'Terzijde gelegd in het Huis';

  @override
  String get statusPrivateLaw => 'Privéwet';

  @override
  String get statusPublicLaw => 'Publieke Wet';

  @override
  String get statusAdopted => 'Aangenomen';

  @override
  String get statusDeBundesratApproved => 'De Bundesrat heeft goedgekeurd';

  @override
  String get statusDeAdopted => 'Aangenomen';

  @override
  String get statusDeIntroductionApproved => 'Introductie goedgekeurd';

  @override
  String get statusDeAnnounced => 'Afgekondigd';

  @override
  String get statusDeRejected => 'Verworpen';

  @override
  String get statusDeBundesratDenied =>
      'De Bundesrat heeft toestemming geweigerd';

  @override
  String get statusDeIntroductionRejected => 'Introductie verworpen';

  @override
  String get statusDeDeclaredCompleted => 'Afgehandeld verklaard';

  @override
  String get statusDeCompletedByTermEnd =>
      'Afgehandeld door einde zittingsperiode';

  @override
  String get statusDeDeclaredUnconstitutional =>
      'Onverenigbaar met de Grondwet verklaard';

  @override
  String get statusDeWithdrawn => 'Ingetrokken';

  @override
  String get statusDeBundesratProcessCompleted =>
      'Proces in Bundesrat voltooid';

  @override
  String get statusDeCompleted => 'Voltooid';

  @override
  String get statusDeCompletedSeeProcess => 'Voltooid - zie procedure';

  @override
  String get statusDeRecommendationAvailable =>
      'Aanbeveling voor resolutie beschikbaar';

  @override
  String get statusDeToBundesratNotDeliberated =>
      'Doorgestuurd naar Bundesrat - nog niet behandeld';

  @override
  String get statusDeAssignedToCommittees => 'Toegewezen aan commissies';

  @override
  String get statusDeNotYetDeliberated => 'Nog niet behandeld';

  @override
  String get statusDeMergedWith => 'Samengevoegd met... (zie procedure)';

  @override
  String get statusDeReferred => 'Verwezen';

  @override
  String get statusFrLawPublished => 'Wet gepubliceerd';

  @override
  String get statusFrOrdinancePublished => 'Verordening gepubliceerd';

  @override
  String get statusFrResolutionPublished => 'Resolutie gepubliceerd';

  @override
  String get statusFrDecreePublished => 'Decreet gepubliceerd';

  @override
  String get statusFrDecision => 'Besluit';

  @override
  String get statusFrRejected => 'Verworpen';

  @override
  String get statusFrPrescribed => 'Voorgeschreven/Vervallen';

  @override
  String get statusFrPropositionLoi => 'Wetsvoorstel (parlementair)';

  @override
  String get statusFrProjetLoi => 'Wetsontwerp (regering)';

  @override
  String get statusUkActOfParliament => 'Parlementswet';

  @override
  String get statusUkRoyalAssent => 'Koninklijke bekrachtiging';

  @override
  String get statusUkWithdrawn => 'Ingetrokken';

  @override
  String get statusUkRejected => 'Verworpen';

  @override
  String get statusUk1stReading => '1e lezing';

  @override
  String get statusUk2ndReading => '2e lezing';

  @override
  String get statusUk3rdReading => '3e lezing';

  @override
  String get statusUkCommitteeStage => 'Commissiefase';

  @override
  String get statusUkCommonsExaminers => 'Examinatoren van het Lagerhuis';

  @override
  String get statusUkLordsSpecialCommittee =>
      'Speciale commissie van het Hogerhuis';

  @override
  String get statusUkMoneyResolution => 'Financiële resolutie';

  @override
  String get statusUkConsiderationLordsAmendments =>
      'Behandeling van amendementen van de Lords';

  @override
  String get statusUkConsiderationLordsMessage =>
      'Behandeling van bericht van de Lords';

  @override
  String get statusUkOrderOfCommitmentDischarged =>
      'Verwijzingsbevel ingetrokken';

  @override
  String get statusUkProgrammeMotion => 'Programmamotie';

  @override
  String get statusUkReportStage => 'Rapportfase';

  @override
  String get statusUkSecondReadingCommittee =>
      'Commissie voor de tweede lezing';

  @override
  String get statusUkWaysAndMeansResolution => 'Ways and Means-resolutie';

  @override
  String get errorCheckConnection => 'Controleer uw internetverbinding.';

  @override
  String get buttonRetry => 'Probeer opnieuw';

  @override
  String get shareAsPost => 'Delen als bericht (1:1)';

  @override
  String get shareAsStory => 'Delen als verhaal (16:9)';

  @override
  String get morePointsInApp =>
      '...volledige informatie is beschikbaar in de Lustra-app';

  @override
  String get pollVotingViaApp => 'Stemmen beschikbaar in de app!';

  @override
  String get supportPollTitle => 'Steunpeiling';

  @override
  String get termsCountLabel => 'Aantal termijnen';

  @override
  String get settingsNotificationsNewLaws => 'Meldingen over nieuwe wetgeving';

  @override
  String get settingsNotificationsVoteResults =>
      'Meldingen over stemresultaten';

  @override
  String get detailsButton => 'Details';

  @override
  String get errorNoVotingsDetails => 'GEEN GEDETAILLEERDE STEMGEGEVENS';

  @override
  String get clearText => 'Wissen';

  @override
  String get consideredOnLabel => 'In behandeling op:';

  @override
  String get legislationFooterAiDisclaimer =>
      'De bovenstaande samenvatting is gegenereerd door AI en is een bewerking van het originele overheidsdocument, met inachtneming van alle principes van onpartijdigheid en vrije informatie. Details van de gebruikte query en het schema vindt u op het informatietabblad.';

  @override
  String get legislationFooterModelUsed => 'Gebruikt model:';

  @override
  String get legislationFooterSourceData =>
      'Brongegevens zijn gratis beschikbaar in het overheidssysteem op:';

  @override
  String get appMotto =>
      '... oftewel onpartijdige wetgevingsinformatie zonder politieke kleuring.';

  @override
  String get acceptTermsPrefix => 'Ik accepteer de';

  @override
  String get termsAndConditions => 'Voorwaarden en het Privacybeleid';

  @override
  String get validatorAcceptTerms =>
      'U moet de voorwaarden accepteren om door te gaan.';

  @override
  String get joinSupportClubPrefix => 'Ik wil lid worden van de';

  @override
  String get supportClub => 'Lustra Support Club';

  @override
  String get supportClubDescription =>
      'U ontvangt speciale informatie over de ontwikkeling van het project en toekomstige initiatieven.';

  @override
  String get registrationFinishTitle => 'Registratie voltooien';

  @override
  String get welcomeMessage => 'Welkom!';

  @override
  String get finalStepMessage =>
      'Nog één laatste stap. Accepteer de voorwaarden om verder te gaan.';

  @override
  String get continueButton => 'Doorgaan';

  @override
  String get selectYourParliament => 'Selecteer uw parlement';

  @override
  String get validatorSelectParliament =>
      'Selecteer een parlement om door te gaan.';

  @override
  String get forgotPasswordButton => 'Wachtwoord vergeten?';

  @override
  String get passwordResetEmailSent =>
      'Er is een link om uw wachtwoord opnieuw in te stellen naar uw e-mailadres verzonden.';

  @override
  String get authErrorUserNotFound =>
      'Geen gebruiker gevonden met dit e-mailadres.';

  @override
  String get settingsDeleteAccount => 'Account verwijderen';

  @override
  String get errorDeleteAccount =>
      'Kan account niet verwijderen. Probeer het opnieuw.';

  @override
  String get dialogReauthenticateTitle => 'Bevestig uw identiteit';

  @override
  String get dialogConfirm => 'Bevestigen';

  @override
  String get dialogDeleteAccountTitle =>
      'Weet u zeker dat u uw account wilt verwijderen?';

  @override
  String get dialogDeleteAccountContent =>
      'Deze actie kan niet ongedaan worden gemaakt. Al uw gegevens, inclusief uw stemgeschiedenis, worden permanent verwijderd.';

  @override
  String get dialogDelete => 'Verwijderen';

  @override
  String get termsOfServiceContent =>
      '<b>Gebruiksvoorwaarden van de \"Lustra\" App</b>\n\nLaatst bijgewerkt: 10 augustus 2025\n\nHoi! Hier de maker van de Lustra app.\nIk ben blij dat je er bent. Ik heb Lustra gemaakt omdat ik geloof dat iedereen recht heeft op eenvoudige en transparante toegang tot informatie over hoe de wetten die ons leven beïnvloeden, tot stand komen.\n\nDit document bevat de gebruiksvoorwaarden – een soort overeenkomst tussen jou en mij. Ik heb het in eenvoudige taal geschreven, zodat je precies weet wat de regels van de app zijn. Lees het alsjeblieft rustig door. Door Lustra te gebruiken, bevestig je dat je deze regels accepteert.\n\n<b>1. Woordenlijst, oftewel over wie en wat we het hebben</b>\n•\t<b>Ik, mijn, mij</b> – dat ben ik, Jacek, de maker van de app, handelend onder de naam van het bedrijf FO&WO VENTURES SP. Z O.O. gevestigd in Wrocław.\n•\t<b>Jij, jouw, je</b> – dat ben jij, de persoon die de app gebruikt.\n•\t<b>App</b> of <b>Lustra</b> – de mobiele applicatie \"Lustra\" die je nu gebruikt.\n•\t<b>Account</b> – je persoonlijke account in de app, die je kunt aanmaken om extra functies te gebruiken.\n•\t<b>Voorwaarden</b> – dit document.\n\n<b>2. Waar gaat Lustra over? (Hoofdprincipes)</b>\n•\tLustra is een gratis app die tot doel heeft je toegankelijke informatie te verschaffen over wetgevingsprocessen in geselecteerde parlementen. Je vindt hier onder andere samenvattingen van wetsvoorstellen, stemresultaten en gegevens over parlementsleden.\n•\tJe moet minstens 16 jaar oud zijn om de app te gebruiken. Als je een Account aanmaakt, bevestig je dat je aan deze voorwaarde voldoet.\n•\tVoor het gebruik van de basisinformatiefuncties is het niet nodig om een Account aan te maken.\n\n<b>3. Je Account in de app</b>\n•\tJe kunt een Account aanmaken met je e-mailadres. Hiermee kun je extra functies gebruiken, zoals stemmen in peilingen of gepersonaliseerde meldingen ontvangen.\n•\tOnthoud alsjeblieft dat je maar één Account kunt hebben.\n•\tJe bent verantwoordelijk voor het geheimhouden van je wachtwoord en voor alles wat er op je Account gebeurt.\n\n<b>4. Hoe mag je de inhoud gebruiken? (Licentie)</b>\n•\tAlle brongegevens (bijv. volledige wetteksten, stemresultaten, gegevens van parlementsleden) zijn afkomstig van officiële, openbare bronnen en zijn openbare informatie.\n•\tDe content die ik creëer met mijn eigen systeem en AI-technologie (d.w.z. samenvattingen, vereenvoudigde titels, kernpunten) stel ik je vrij ter beschikking voor informatieve, educatieve en privédoeleinden. Je mag het lezen en delen als schermafbeeldingen.\n•\tIk vraag je met klem – kopieer deze gegevens niet machinaal (niet scrapen). Het creëren en onderhouden van dit systeem kost me tijd en geld. Om dit project te beschermen, verbieden de Voorwaarden je daarom om:\n\t\to\tAutomatisch een eigen database aan te leggen op basis van de in de app gegenereerde content.\n\t\to\tDe content van de app voor commerciële doeleinden te gebruiken.\n\t\to\tPogingen te doen om de beveiliging te doorbreken, de app te decompileren of de werking ervan te verstoren.\n•\tHeb je een idee om de data van Lustra op een interessante manier te gebruiken? Ik sta open voor samenwerking! Schrijf me op jacek@lustra.dev – ik praat er graag over.\n\n<b>5. Peilingen en betrouwbaarheid van gegevens</b>\n•\tEen van de functies van de app zijn peilingen waarin je je steun voor een bepaald wetsvoorstel kunt uitspreken. Om de resultaten van deze peilingen zo betrouwbaar mogelijk te maken, selecteer je in de instellingen het parlement van het land waarvan je staatsburger bent (indien beschikbaar in de lijst).\n\n<b>6. Mijn aansprakelijkheid (of liever het gebrek daaraan)</b>\n•\tIk lever de app \"zoals hij is\" (Engels: \"as is\"). Ik doe mijn uiterste best om de gegevens actueel en correct te houden, but ze zijn afkomstig van externe, overheids-API\'s, waarin fouten kunnen voorkomen. Daarom kan ik niet verantwoordelijk worden gehouden voor eventuele onnauwkeurigheden in de brongegevens.\n•\tLustra is een pro bono project dat ik met eigen middelen onderhoud. Ik zal mijn best doen om het ononderbroken te laten werken, maar ik moet een voorbehoud maken voor technische onderbrekingen. Ik behoud me ook het recht voor om de dienst te beëindigen, bijvoorbeeld als ik geen middelen meer heb om het te onderhouden.\n•\tDe inhoud in de app, met name die gegenereerd door AI, is voor informatieve en educatieve doeleinden. Het vormt geen juridisch advies.\n\n<b>7. Lustra Support Club</b>\n•\tJe kunt lid worden van de \"Lustra Support Club\" door afzonderlijke, vrijwillige toestemming te geven. Dit betekent dat ik je e-mails kan sturen over de ontwikkeling van de app, nieuwe functies, en ook om steun kan vragen in discussies over de toekomst van het project of om financiële hulp indien nodig. Meer details hierover vind je in het Privacybeleid.\n\n<b>8. Beëindiging van onze overeenkomst</b>\n•\tJij kunt deze op elk moment beëindigen. Gebruik gewoon de optie \"Account verwijderen\" in de instellingen van de app. Dit leidt tot de onomkeerbare verwijdering van je Account en de bijbehorende gegevens.\n•\tIk kan je Account blokkeren of verwijderen als je deze Voorwaarden op flagrante wijze schendt, bijvoorbeeld door te proberen de werking van de app te schaden.\n\n<b>9. Wijzigingen in de Voorwaarden</b>\n•\tDe wereld verandert, en de app dus ook. Ik behoud me het recht voor om deze Voorwaarden te wijzigen. Ik zal je van elke belangrijke wijziging van tevoren op de hoogte stellen, bijvoorbeeld via een bericht in de app. Voortgezet gebruik van Lustra na de invoering van de wijzigingen betekent acceptatie ervan.\n\n<b>10. Contact en slotbepalingen</b>\n•\tAls je vragen hebt, schrijf dan gerust naar: jacek@lustra.dev.\n•\tOp alle zaken die niet in deze Voorwaarden zijn geregeld, is het Poolse recht van toepassing.\n\nBedankt dat je er bent en helpt een transparante staat te creëren!';

  @override
  String get termsAndPrivacyTitle => 'Voorwaarden & Privacy';

  @override
  String get termsOfServiceTab => 'Voorwaarden';

  @override
  String get privacyPolicyTab => 'Privacy';

  @override
  String get privacyPolicyContent =>
      '<b>Privacybeleid van de \"Lustra\" App</b>\n\nLaatst bijgewerkt: 10 augustus 2025\n\nDit document is het Privacybeleid. Ik weet dat dergelijke teksten lang en ingewikkeld kunnen zijn, daarom heb ik mijn best gedaan om het eenvoudig te schrijven.\nJouw privacy en vertrouwen zijn mijn absolute prioriteit. In dit beleid leg ik uit welke gegevens ik verzamel, waarom ik dat doe en hoe ik ze bescherm.\n\n<b>1. Wie zorgt voor jouw gegevens? (Verwerkingsverantwoordelijke)</b>\nDe verwerkingsverantwoordelijke voor jouw persoonsgegevens ben ik, Jacek, handelend onder de firma FO&WO VENTURES SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ (ul. Wapienna 13/7, 50-518 Wrocław, NIP: 6343002817).\nAls je vragen hebt over je gegevens, schrijf me dan rechtstreeks op: jacek@lustra.dev.\n\n<b>2. Welke gegevens verzamel ik en waarom?</b>\nIk verzamel alleen gegevens die nodig zijn voor de werking van de app of waarvoor je afzonderlijke, vrijwillige toestemming geeft. Hier is een gedetailleerde lijst:\n•\t<b>Wanneer je een Account aanmaakt:</b>\n\to\t<b>Je e-mailadres:</b> Ik heb dit nodig om je Account aan te maken en veilig te beheren, je te laten inloggen en je wachtwoord te laten resetten als je het vergeet.\n\to\t<b>Unieke Gebruikers-ID (UID):</b> Dit is een willekeurige tekenreeks die automatisch wordt toegewezen door het Firebase-systeem, waardoor ik je gegevens veilig kan koppelen aan je Account.\n•\t<b>Wanneer je de functies van de app gebruikt (als ingelogde gebruiker):</b>\n\to\t<b>Je stemmen in peilingen (\"steun\" / \"tegen\"):</b> Ik sla deze op om geaggregeerde, volledig anonieme statistieken te maken over de steun voor individuele wetten, die je in de app ziet. Je individuele stem wordt nooit ergens openbaar weergegeven.\n\to\t<b>Je lijst met gevolgde wetgeving:</b> Ik bewaar deze zodat je er gemakkelijk toegang toe hebt en ik je (in de toekomst) meldingen kan sturen over hun voortgang.\n\to\t<b>Je gekozen parlement:</b> Ik sla deze informatie op zodat je kunt deelnemen aan de relevante peilingen en (in de toekomst) meldingen kunt ontvangen voor het juiste land.\n•\t<b>Wanneer je lid wordt van de Lustra Support Club (volledig vrijwillig):</b>\n\to\t<b>Informatie over je toestemming (waar/onwaar):</b> Ik sla dit op om te weten of je extra berichten van mij wilt ontvangen. Ik schrijf meer over de Club in sectie 5.\n•\t<b>Wanneer je een bug meldt:</b>\n\to\tAls je besluit een foutrapport over gegevens te sturen, sla ik de inhoud van je rapport op om het probleem te analyseren en op te lossen.\nWat ik <b>NIET</b> verzamel: Ik gebruik geen externe analysetools (zoals Google Analytics) om je activiteit in de app te volgen.\n\n<b>3. Aan wie vertrouw ik je gegevens toe? (Mijn technologiepartners)</b>\nOm Lustra te laten werken, maak ik gebruik van de diensten van vertrouwde technologiepartners aan wie ik de verwerking van sommige gegevens toevertrouw. Dit zijn:\n•\t<b>Google (als onderdeel van de Firebase-dienst):</b> Dit is de technologische ruggengraat van de hele app. Google levert mij de infrastructuur voor:\n\to\t<b>Authenticatie (Firebase Authentication):</b> Veilig inloggen en beheren van je Account.\n\to\t<b>Database (Cloud Firestore):</b> Opslag van gegevens die verband houden met je Account (bijv. stemmen in peilingen, lijst met gevolgde wetgeving).\n•\t<b>Google (als onderdeel van de Gemini AI-dienst):</b> Dit is de tool die ik gebruik om wetgevingsteksten te analyseren. Ik wil absoluut duidelijk zijn: ik stuur alleen openbaar beschikbare teksten van wetten en documenten naar de AI. Je persoonlijke gegevens (zoals e-mail of UID) worden daar nooit naartoe gestuurd.\nAlle gegevens worden opgeslagen op servers van Google binnen de Europese Economische Ruimte.\n\n<b>4. Hoe lang bewaar ik je gegevens?</b>\nKort en bondig: ik bewaar je gegevens zolang je een Account bij mij hebt. Als je besluit het te verwijderen, worden al je persoonsgegevens permanent gewist.\n\n<b>5. De Lustra Support Club – wat is dat?</b>\nDit is een speciale plek voor mensen die dichter bij het project willen staan. Deelname is volledig vrijwillig en vereist het aanvinken van een afzonderlijke toestemming. Als je lid wordt, ga je ermee akkoord dat ik je af en toe e-mails stuur over:\n•\tapp-ontwikkeling en geplande nieuwe functies,\n•\tspeciale evenementen, bijv. discussiepanels over de toekomst van Lustra,\n•\tandere, vergelijkbare missiegedreven projecten die ik in de toekomst zou kunnen opzetten,\n•\tverzoeken om financiële steun als het project in een moeilijke situatie terechtkomt.\nJe kunt je toestemming op elk moment intrekken in de instellingen van de app.\n\n<b>6. Jouw rechten – je hebt de volledige controle</b>\nDe AVG geeft je een reeks rechten, en ik wil dat je die gemakkelijk kunt uitoefenen. Je hebt het recht op:\n•\tToegang tot je gegevens: Weten welke gegevens ik over je bewaar.\n•\tRectificatie (correctie) van je gegevens.\n•\tWissing van je gegevens (recht om vergeten te worden): Dit kun je op elk moment doen via de optie \"Account verwijderen\" in de instellingen van de app.\n•\tBeperking van de verwerking van je gegevens.\n•\tGegevensoverdraagbaarheid.\n•\tBezwaar tegen de verwerking van je gegevens.\n•\tIntrekking van toestemming (bijv. voor lidmaatschap van de Lustra Support Club).\n•\tEen klacht indienen bij de Voorzitter van de Autoriteit voor de Bescherming van Persoonsgegevens (UODO) als je van mening bent dat ik je gegevens onrechtmatig verwerk.\nOm de meeste van deze rechten uit te oefenen, hoef je me alleen maar te schrijven op jacek@lustra.dev.\n\n<b>7. Beveiliging van je gegevens</b>\nIk neem beveiliging zeer serieus. Ik maak gebruik van de oplossingen van Google Firebase, die moderne beveiligingsnormen hanteren, inclusief gegevensversleuteling zowel tijdens de overdracht (SSL-protocol) als bij opslag op servers.\n\n<b>8. Gegevens van kinderen</b>\nZoals vermeld in de Gebruiksvoorwaarden, is de app bedoeld voor personen van 16 jaar en ouder. Ik verzamel of verwerk niet bewust gegevens van jongere personen.\n\n<b>9. Wijzigingen in dit beleid</b>\nIk kan dit beleid in de toekomst bijwerken. Ik zal je van belangrijke wijzigingen van tevoren informeren in de app.\n\nBedankt voor je vertrouwen.\nJacek';

  @override
  String get techPageTitle => 'Over technologie en onpartijdigheid';

  @override
  String get techPageIntro =>
      'Achter elke vereenvoudigde titel en samenvatting van een wet schuilt een taalmodel. Hier wil ik u in alle transparantie uitleggen hoe het werkt en hoe ik ervoor zorg dat de informatie die u ontvangt altijd zuiver en onpartijdig is.';

  @override
  String get techPageWhyAiTitle => 'Waarom gebruik ik AI?';

  @override
  String get techPageWhyAiBody =>
      'Wetteksten en parlementaire documenten zijn geschreven in ingewikkeld juridisch jargon. Zelfs het lezen en begrijpen van een korte wet is een uitdaging, zelfs voor een jurist.\n\nMijn doel was om een tool te creëren die deze hermetische taal vertaalt \'van juridisch naar menselijk\'. Het handmatig analyseren van honderden documenten per dag zou voor één persoon onmogelijk zijn. Daarom heb ik AI ingeschakeld - als een krachtig hulpmiddel voor tekstanalyse en vereenvoudiging, waarmee u snel en in een toegankelijke vorm informatie krijgt.';

  @override
  String get techPageWhatForTitle => 'Waarvoor gebruik ik AI precies?';

  @override
  String get techPageWhatForBody =>
      'Kunstmatige Intelligentie voert drie specifieke taken uit:\n  • Het vereenvoudigt officiële titels tot titels die direct zeggen waar het document over gaat.\n  • Het maakt korte samenvattingen van 2-3 zinnen die zich richten op de impact van de veranderingen op het dagelijks leven van burgers.\n  • Het haalt uit de wirwar van tekst een paar kernpunten, oftewel de belangrijkste veranderingen en oplossingen.\n\nAlle overige gegevens, zoals stemresultaten of informatie over parlementsleden, komen rechtstreeks van officiële, gouvernementele API\'s.';

  @override
  String get techPageBiasTitle =>
      'Hoe waarborg ik onpartijdigheid? Instructie voor de AI';

  @override
  String get techPageBiasBody =>
      'Dit is het belangrijkste onderdeel. De AI voert specifieke opdrachten uit. Deze opdrachten (in de informatica \'prompt\' genoemd) zijn een soort zeer precieze instructie die de basis vormt voor de onpartijdigheid van de hele applicatie.\n\nDit zijn de belangrijkste principes die ik in mijn AI-systeem heb ingebouwd:\n  • <b>Rol van neutrale expert:</b> Ik geef de AI de opdracht om de rol aan te nemen van een apolitieke juridische expert, wiens enige doel het is om te analyseren en uit te leggen, niet om te oordelen of te becommentariëren.\n  • <b>Alleen feiten, geen meningen:</b> De instructie verbiedt de AI expliciet om eigen meningen te uiten, te waarderen en taal te gebruiken die zou kunnen suggereren of een bepaalde verandering \'goed\' of \'slecht\' is. Het moet zich uitsluitend op feiten richten.\n  • <b>Perspectief van de gewone burger:</b> In plaats van een wet te analyseren vanuit het perspectief van een jurist, heeft de AI de taak om de vraag te beantwoorden: \'Wat betekent deze verandering voor mij, een gewone burger? Hoe zal het mijn financiën, gezondheid, rechten en plichten beïnvloeden?\'.';

  @override
  String get techPagePromiseTitle =>
      'Volledige, transparante instructie ter inzage';

  @override
  String get techPagePromiseBody =>
      'Geloof me niet op mijn woord. Hieronder vindt u de exacte inhoud van de instructie (prompt) die ik aan het AI-model (Google Gemini) doorgeef bij de analyse van elk document, waarbij ik ervoor zorg dat de creativiteitsparameters ook op 0 zijn ingesteld (zodat de AI niets verzint tijdens de analyse). Dit is het \'brein\' van de operatie.\n\n(Let op: Deze prompt zal in de loop van de tijd evolueren en worden verbeterd, zodat de kwaliteit van de samenvattingen steeds hoger wordt.)';

  @override
  String techPagePromptCode(Object DOCUMENT_TEXT, Object country) {
    return 'U bent een expert in het recht van $country die als taak heeft om wetsdocumenten, resoluties en andere wetgevende documenten te analyseren en daaruit op een toegankelijke manier informatie voor burgers voor te bereiden. Uw doel is om informatie zo te presenteren dat burgers zelf de impact van de wetgeving op hun leven kunnen beoordelen, zelfs zonder gespecialiseerde wetgevende kennis. Concentreer u op de feiten en de gevolgen van de ingevoerde wijzigingen en vermijd waardeoordelen en persoonlijke meningen. Alle juridische jargon is verboden. Presenteer de informatie op een duidelijke, beknopte en boeiende manier, zodat deze begrijpelijk is voor iemand zonder juridische opleiding. Vermijd lange, complexe zinnen. In plaats van te schrijven \'het project heeft tot doel de richtlijn betreffende afvalscheiding te implementeren...\', schrijft u \'Nieuwe regels voor afvalscheiding: gebruik van speciale zakken, enz....\'. Ga door met uw werk totdat u uw taak hebt opgelost. Als u niet zeker bent over de gegenereerde inhoud, analyseer het document dan opnieuw - ga niet gissen. Plan uw taak goed voordat u begint. Benadruk in de samenvatting en de kernpunten, indien mogelijk en gerechtvaardigd, welke concrete voordelen of gevolgen (positief of negatief) de wet heeft voor het dagelijks leven van burgers, hun rechten en plichten, hun persoonlijke financiën, hun veiligheid en andere belangrijke kwesties.\n\nUw antwoord MOET in JSON-formaat zijn - en de volgende sleutels bevatten.\nVoordat u het antwoord retourneert, controleer zorgvuldig of de volledige JSON-structuur 100% correct is, inclusief alle komma\'s, accolades, vierkante haken en aanhalingstekens. Onjuiste JSON is onaanvaardbaar en verhindert de verwerking van uw werk.\n\nAnalyseer de volgende tekst van het juridische document zorgvuldig. Dit is de inhoud op basis waarvan u de samenvatting en de kernpunten moet genereren:\n--- BEGIN DOCUMENT ---\n$DOCUMENT_TEXT\n--- EINDE DOCUMENT ---\n\nONTHOUD: Uw antwoord MOET uitsluitend een geldig JSON-object zijn. Voeg geen extra tekens, opmerkingen of tekst toe voor de \'OPEN_BRACE\'-tag of na de \'CLOSE_BRACE\'-tag. Het volledige antwoord moet als JSON kunnen worden geparseerd.\nVul op basis van het BOVENSTAANDE document de volgende JSON-structuur in:\nDit is de JSON-structuur die ik verwacht (vul deze met inhoud):\n__OPEN_BRACE__\n  \"ai_title\": \"Een nieuwe, korte titel voor de rechtshandeling in het Nederlands, die de essentie van de ingevoerde wijzigingen weergeeft (bijv. maximaal 10-12 woorden).\",\n  \"summary\": \"Een beknopte samenvatting van 2-3 zinnen van de inhoud van de rechtshandeling in het Nederlands, geschreven vanuit het perspectief van de impact op het dagelijks leven van burgers.\",\n  \"key_points\": [\n    \"Eerste korte punt in het Nederlands over de belangrijkste ingevoerde oplossingen of wijzigingen.\",\n    \"Tweede korte punt in het Nederlands...\"\n  ],\n \"category\": [\"Categoriseer het document standaard in één categorie, op basis van het domein dat het voornamelijk behandelt. Kies er maximaal 3 als het document ook BELANGRIJKE kwesties uit andere categorieën behandelt. U MOET categorieën UITSLUITEND uit de volgende lijst kiezen: Gezondheid, Onderwijs, Gezin, Belastingen, Werk, Veiligheid, Milieu, Rechtbanken en Recht, Vervoer, Uitkeringen, Onroerend goed, Media en Cultuur, Lokaal bestuur, Migratie, Landbouw, Openbare investeringen, Informatisering, Economie. Als het document beslist niet in een van deze past, MOET u \'Overig\' gebruiken. Als u \'Overig\' gebruikt, moet dit de ENIGE geselecteerde categorie zijn. Maak GEEN nieuwe categorieën aan. Het antwoord moet een array van strings zijn, bijv. [\\\"Belastingen\\\", \\\"Gezin\\\"].\", \"Tweede categorie (optioneel)\", \"Derde categorie (optioneel)\"]\n__CLOSE_BRACE__';
  }

  @override
  String get techPageFlawlessTitle => 'Is AI onfeilbaar?';

  @override
  String get techPageFlawlessBody =>
      'Natuurlijk niet. Zoals elke technologie kan het een fout maken of iets verkeerd interpreteren. Daarom vindt u in de applicatie een mechanisme om een fout in de gegevens te melden - elke dergelijke melding is voor mij uiterst waardevol en helpt me het systeem te verbeteren.\n\nMijn langetermijndoel is om deze technologie verder te ontwikkelen en zelfs een eigen, lokaal model zonder enige beperking te gebruiken om de precisie en onafhankelijkheid van de applicatie verder te vergroten.';

  @override
  String get techPageOutro =>
      'Bedankt voor uw vertrouwen. Ik hoop dat het gebruik van Lustra dankzij deze transparantie nog waardevoller voor u zal zijn.';

  @override
  String get votingResultsPL1stReadingTitle => 'STEMMING OVER VERWERPING';

  @override
  String get reportErrorDescription =>
      'Beschrijf kort de fout of wat er ontbreekt. Uw melding helpt ons de app te verbeteren.';

  @override
  String get reportErrorHint => 'Typ uw bericht...';

  @override
  String get reportErrorValidationEmpty => 'Het bericht mag niet leeg zijn.';

  @override
  String get reportErrorSuccess => 'Bedankt! Uw melding is verzonden.';

  @override
  String get actionCancel => 'Annuleren';

  @override
  String get actionSend => 'Verzenden';

  @override
  String get mustBeLoggedInToReport =>
      'U moet ingelogd zijn om een fout te melden.';

  @override
  String get reportErrorRateLimitExceeded =>
      'Meldingslimiet overschreden (10 per 24 uur).';

  @override
  String get supportQuickTitle => 'Snelle ondersteuning';

  @override
  String get supportPaymentsUnavailable =>
      'Betalingen zijn momenteel niet beschikbaar.';

  @override
  String get supportNoProducts => 'Geen ondersteuningsopties beschikbaar.';

  @override
  String get supportCampaignsTitle => 'Gerichte campagnes';

  @override
  String get supportCampaignsDescription =>
      'Ondersteun specifieke ontwikkelingsdoelen, bijv. het toevoegen van een nieuw parlement.';

  @override
  String get supportCampaignsButton =>
      'Bekijk actieve campagne (binnenkort beschikbaar)';

  @override
  String get forceUpdateTitle => 'Update Vereist';

  @override
  String get forceUpdateDescription =>
      'Er is een nieuwe versie van de app beschikbaar. Update de app naar de nieuwste versie om door te gaan.';

  @override
  String get forceUpdateButton => 'Nu bijwerken';

  @override
  String get deputies => 'Afgevaardigden';

  @override
  String get sortingLabel => 'Sorteer op: ';

  @override
  String get sortByPopularity => 'Populariteit';

  @override
  String get sortByAttendance => 'Aanwezigheid';

  @override
  String partyLabel(Object partyName) {
    return 'Partij: $partyName';
  }

  @override
  String districtLabelUS(Object districtName, String districtNum) {
    return '${districtNum}e district van $districtName';
  }

  @override
  String tenureTermItemUS(Object memberType, String termNumber) {
    return '${termNumber}e Congres ($memberType)';
  }

  @override
  String get birthYearLabel => 'Geboortejaar:';

  @override
  String get sponsorshipsTab => 'Sponsoringen';

  @override
  String get sponsorshipTypeSponsor => 'Indiener';

  @override
  String get sponsorshipTypeCosponsor => 'Mede-indiener';

  @override
  String get termCurrently => '(momenteel)';

  @override
  String get parliamentaryTenureTitle => 'Parlementaire ambtstermijn';

  @override
  String get usRoleRepresentative => 'Afgevaardigde';

  @override
  String get usRoleSenator => 'Senator';

  @override
  String shareLegislationText(Object deepLink) {
    return 'Bekijk de details van dit wetsvoorstel in de Lustra-app! $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Bekijk en beoordeel het werk van dit parlementslid in de Lustra-app! $deepLink';
  }

  @override
  String get clipboardCopySuccess =>
      'Link naar de app gekopieerd naar het klembord!';

  @override
  String get mandateInactive => 'MANDAAT INACTIEF';

  @override
  String get votingUnavailable => 'Stemming niet beschikbaar';

  @override
  String get historicalTerm => 'HISTORISCHE AMBTSTERMIJN';

  @override
  String get pollUnavailable => 'Peiling niet beschikbaar';

  @override
  String get billsLabel => 'Wetsvoorstellen';

  @override
  String get sponsorshipSublabel => '(Gesponsord/Mee-gesponsord)';

  @override
  String get missingDataWarningShare =>
      'Het brondocument voor dit wetsvoorstel ontbreekt. Help ons en dien binnen enkele seconden een officieel e-mailverzoek in voor publicatie via onze app!';

  @override
  String get missingDataSourceUserMessage =>
      'Het brondocument voor dit wetsvoorstel ontbreekt. Help ons door een officieel e-mailverzoek in te dienen voor publicatie en sluit u aan bij de groep mensen die geeft om informatietransparantie!';

  @override
  String get missingDataSourceButton => 'Verzoek document via e-mail';

  @override
  String get cannotOpenEmailApp =>
      'Kon de e-mailapp niet openen. Controleer of deze is geïnstalleerd en of er een account is geconfigureerd.';

  @override
  String get sortByFreshness => 'Nieuwste';

  @override
  String get pollPermissionDeniedError =>
      'Deze peiling is alleen beschikbaar voor gebruikers die aan dit parlement zijn toegewezen.';

  @override
  String get supportCampaignsButtonActive => 'Steun de campagne';

  @override
  String get supportCampaignsButtonInactive => 'Campagne inactief';
}

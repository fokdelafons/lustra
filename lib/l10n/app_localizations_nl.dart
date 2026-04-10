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
  String get sectionPopularVotes => 'Wetgevende stemmingen';

  @override
  String get sectionUpcoming => 'Geplande debatten';

  @override
  String get sectionLegislationInProcess => 'In behandeling';

  @override
  String get civicProjectsSectionTitle => 'Burgerinitiatieven';

  @override
  String get sectionMpProfiles => 'Populaire politici';

  @override
  String get votingSourceTooltip => 'Bekijk de stembron';

  @override
  String get legislationSponsorLabel => 'Sponsor';

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
  String get citizenPollTitle => 'Burgerwil';

  @override
  String get pollTemporarilyUnavailable =>
      'Peiling tijdelijk niet beschikbaar. Probeer het later opnieuw.';

  @override
  String get errorDisplayingPollBar =>
      'Fout bij het weergeven van de peilingresultaten.';

  @override
  String get pollNoForAgainstVotes => 'Geen voor-/tegenstemmen';

  @override
  String get pollNoVotesCast => 'Wees de eerste die stemt.';

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
  String get infoTitle1 => 'Burgers Boven Politiek';

  @override
  String get infoParagraph1 =>
      'Media informeren niet alleen – ze cureren de realiteit. Naar schatting 95% van de wetgeving verdwijnt in een \"zwart gat\" omdat het te complex is om advertenties te verkopen. Lustra omzeilt de tussenpersonen. Wij verwerken bureaucratische taal tot toegankelijke feiten, zodat je ziet wat de overheid werkelijk besluit, niet alleen waarover ze willen praten.';

  @override
  String get infoTitle2 => 'Feiten, Geen Marketing';

  @override
  String get infoParagraph2 =>
      'Politiek is vandaag de dag 80% marketing en 20% wetgeving. Wij scheiden die twee. We passen een proces van \"context-sterilisatie\" toe: we verwijderen emotionele taal en partijdige spin, zodat alleen de juridische feiten overblijven. Dit is geen \"ander standpunt\". Het is ruisonderdrukking, zodat jij je eigen mening kunt vormen bij de bron.';

  @override
  String get infoTitle3 => 'Macht Zonder Tussenpersonen';

  @override
  String get infoParagraph3 =>
      'Grote platforms optimaliseren content voor jouw woede, omdat dat je aan het scrollen houdt. Wij optimaliseren voor jouw inzicht. De hiërarchie van onderwerpen in de app hangt volledig af van de stemmen van de community. Jullie bepalen wat belangrijk is en nemen de macht terug van uitgevers en lobbyisten.';

  @override
  String get infoTitle4 => 'Architecten van Verandering';

  @override
  String get infoParagraph4 =>
      'Democratie is geen kijksport. We introduceren een mechanisme waarbij burgerinitiatieven op gelijke voet worden getoond met wetsvoorstellen van de overheid. We bieden de infrastructuur om van passieve toeschouwer naar Architect van Verandering te gaan – om echte steun op te bouwen voor zaken die ertoe doen. We tillen de democratie naar een nieuw niveau.';

  @override
  String get linkHowTechnologyWorks => 'Hoe werkt de technologie?';

  @override
  String get linkTermsAndPrivacy => 'Voorwaarden en Privacybeleid';

  @override
  String get supportScreenTitle => 'Publieke Infrastructuur';

  @override
  String get supportParagraph1 =>
      'Lustra is een digitale openbare voorziening. Maar vrijheid heeft een prijs. We hebben kapitaal afgewezen om 100% onpartijdigheid te garanderen, omdat we geloven dat dit de enige weg naar verandering is. Het onderhoud van infrastructuur en servers hangt volledig af van vrijwillige bijdragen. Het equivalent van \$10 financiert de toegang tot het platform voor enkele duizenden mensen per maand. Jouw steun garandeert de continuïteit van de missie.';

  @override
  String get buttonSupportFinancially => 'Steun ons';

  @override
  String get supportThankYou => 'Dank je. Je houdt het systeem in leven.';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Oprichter';

  @override
  String get futureFeaturesScreenTitle => 'Community Roadmap';

  @override
  String get futureFeaturesHeader => 'Jij Bepaalt de Richting';

  @override
  String get futureFeatureSenate => 'Senatoren Integratie';

  @override
  String get futureFeatureCitizenInitiative => 'Burgerreferenda';

  @override
  String get futureFeaturesDescription =>
      'Dit is geen gesloten verlanglijst. Lustra is infrastructuur in handen van burgers, dus we hebben allemaal invloed op de ontwikkeling. Sluit je aan bij de Civic Evolution community op Reddit, dien ideeën in en stem over de volgende functies. Laten we samen het volgende hoofdstuk van de democratie schrijven!';

  @override
  String get futureFeaturesVoteButton => 'Stem op Roadmap';

  @override
  String get comingSoon => 'Voorstel';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Afgerond - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Cache vernieuwen';

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
  String get lustraClubLabel => 'Lustra Club';

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
  String get mandateStatusActive => 'Mandaat: actief';

  @override
  String get mandateStatusFulfilled => 'Mandaat: vervuld';

  @override
  String get mandateStatusCancelled => 'Mandaat: geannuleerd';

  @override
  String get mandateStatusInactive => 'Mandaat: inactief';

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
  String get pollResultNoVotes => 'Wees de eerste die stemt.';

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
  String get votingResultsUSMotionToReferTitle => 'RESULTATEN: VERWIJZING';

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
      '...volledige informatie is beschikbaar in Lustra';

  @override
  String get civicRulesAction => 'Maak je project aan';

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
  String get termsAndPrivacyTitle => 'Grondwet & Privacy';

  @override
  String get termsOfServiceTab => 'Regels';

  @override
  String get privacyPolicyTab => 'Privacybeleid';

  @override
  String get termsOfServiceContent =>
      'LUSTRA GEMEENSCHAPSREGELS\nDatum: 6 december 2025\n\n1. OPERATOR EN MISSIE\nLustra is digitale publieke infrastructuur. De juridische operator (Bewaarder) is FO&WO VENTURES SP. Z O.O. (LLC). Het bedrijf fungeert als incubator: geen dividenden, geen externe investeerders, herinvestering in infrastructuur.\n\n2. CODE EN LICENTIE (SOURCE AVAILABLE)\nCode is gemeenschappelijk goed.\n• Model: Open Source (AGPLv3).\n• Toegestaan: Educatief, onderzoek, non-profit.\n• Verboden: Bedrijven mogen niet profiteren zonder toestemming.\n\n3. BESTUURSROADMAP\nDoel: decentralisatie.\n• Huidig: Oprichter (Jacek) is Hoofdarchitect.\n• Binnenkort: Burgerraad gekozen door gebruikers.\n• Doel: Mechanismen voor gemeenschapscontrole bij verraad van de missie.\n\n4. BURGERPROJECTEN\nWetsincubator.\n• Procedure: Indiening via formulier, formele verificatie.\n• CC0 Licentie: Je geeft het project vrij in het Publiek Domein.\n• Vrijheid van meningsuiting: We beoordelen geen meningen. We weigeren alleen strafrechtelijke schendingen.\n• Verificatie: Je moet burger zijn van het betreffende land.\n\n5. AI EN BRONNEN\n• AI Rol: Helpt navigeren maar kan fouten maken.\n• Bron: De uiteindelijke autoriteit is altijd de originele PDF.\n\n6. VEILIGHEID\n• Leeftijd: Gebruikers 16+.\n• Verboden: Aanvallen op infrastructuur en commerciële scraping.\n\n7. SLOTBEPALINGEN\nPools recht is van toepassing.';

  @override
  String get privacyPolicyContent =>
      'PRIVACYBELEID: MINIMALISATIE\nDatum: 6 december 2025\n\nWe handelen niet in jouw aandacht. Minimale verzameling.\n\n1. GEGEVENSBEHEERDER\nFO&WO VENTURES SP. Z O.O. Contact: jacek@lustra.dev\n\n2. WAT WE VERZAMELEN\n• Account (E-mail/UID): Nodig voor login.\n• Stemmen: Gekoppeld aan account tegen manipulatie (bots). Openbaar ALLEEN anonieme totalen.\n• Bewaartermijn: Stemgegevens bewaard gedurende zittingstermijn + 5 jaar (archief). Daarna geanonimiseerd.\n• Communicatie (Support Club): Met toestemming (instellingen) sturen we updates. Intrekken kan altijd.\n• Burgerprojecten: Inhoud is openbaar.\n\n3. WAT WE NIET DOEN\n• GEEN dataverkoop.\n• GEEN advertentie-tracking.\n• GEEN commerciële politieke profilering.\n\n4. INFRASTRUCTUUR & VEILIGHEID\n• Locatie: Google Cloud, Europe-West9 (Parijs).\n• Anti-Bot: Gebruik van Firebase App Check.\n• AI: Je privégegevens gaan NOOIT naar AI.\n\n5. KINDEREN\nDienst voor 16+. Geen gegevensverzameling van kinderen.\n\n6. VERWIJDERING\nKnop \"Account verwijderen\" in instellingen voor directe verwijdering.\n\n7. JOUW RECHTEN\nInzage, correctie, verwijdering, bezwaar. Contact: jacek@lustra.dev';

  @override
  String get techTitle => 'Lustra AI Protocol v1.1';

  @override
  String get techIntroTitle =>
      '1. COMPLETE WERKMETHODOLOGIE (LUSTRA AI PROTOCOL)';

  @override
  String get techIntroBody =>
      'Hieronder presenteren we de volledige pijplijn van AI-agenten die worden gebruikt voor het genereren van samenvattingen van juridische teksten en het detecteren van hallucinaties daarin. Het doel was om het \"wetgevende zwarte gat\" onschadelijk te maken en tegelijkertijd zoveel mogelijk objectiviteit te benaderen. We moeten echter benadrukken dat we niet geloven in totale neutraliteit. Elke datacompressie (samenvatting) is een vorm van keuze. In plaats van het \"monopolie op de waarheid\" van de media voor te wenden, hebben we één expliciete bias aangenomen – het \"burgerperspectief\" binnen context sterilization. Modellen worden geïnstrueerd om politiek theater te negeren en zich te concentreren op de portemonnee, vrijheden en plichten. Dit is een technische ontwerpbeslissing, geen politieke.';

  @override
  String get techDiagramTitle => '2. STROOMSCHEMA GENERALIZER-JUDGE-SURGEON';

  @override
  String get techDiagramIntro =>
      'Het systeem werkt in een verificatielus. We vertrouwen generatieve modellen niet – we vertrouwen controleprocessen en een iteratieve aanpak bij het uitbreiden van systemen.';

  @override
  String get techDiagramOutro =>
      'In de toekomst zijn we van plan het systeem uit te breiden met extra rollen, zoals een onderzoeksjournalist of een analist voor juridische risico\'s.';

  @override
  String get techPromptsTitle => '3. VOLLEDIGE INSTRUCTIES VOOR AGENTEN';

  @override
  String get techPromptsIntro =>
      'Hieronder staan de volledige prompts die de modellen ontvangen, samen met verklarende opmerkingen voor de lezer. Antwoorden worden direct in 8 talen geretourneerd voor volledige lokalisatie van Lustra, dus we hebben de hele JSON-antwoordstructuur weggelaten voor de leesbaarheid.';

  @override
  String get techGeneralizerTitle => 'A) Generalizer';

  @override
  String get techGeneralizerBody =>
      'Model: Gemini Flash (standaard) / Pro (voor <20k tokens)';

  @override
  String get techGeneralizerCode =>
      '// MODELINSTELLING\n// De roldefinitie is cruciaal. \"[country]\" is een variabele die het model stabiliseert.\n// Het perspectief van een burger van Oekraïne (land in oorlog) is voor modellen anders dan het perspectief van een burger van België (die bijvoorbeeld meer aandacht kan besteden aan bureaucratie).\n// Dit bepaalt de hele context voor de interpretatie van de \"belangrijkheid\" van een bepaling.\nJe bent een expert in het recht van [country], [...]\n\n// KERNMETHODOLOGIE\n// Dit is geen \"vriendelijk verzoek\". Het is een harde instructie om ruis te filteren.\n// Het model moet politiek negeren en zoeken naar impact op de portemonnee en het leven.\n[...] die als taak heeft documenten van wetten, resoluties en andere wetgevende documenten te analyseren en daaruit informatie op een toegankelijke manier voor burgers voor te bereiden. Jouw doel is om informatie zo te presenteren dat burgers zelf de impact van wetgeving op hun leven kunnen beoordelen, zelfs zonder specialistische wetgevende kennis. Focus op feiten en objectieve gevolgen van de ingevoerde wijzigingen, vermijd waardepalen en persoonlijke meningen. Elk juridisch jargon is verboden. Presenteer informatie op een duidelijke, beknopte en boeiende manier, zodat deze begrijpelijk is voor iemand zonder juridische opleiding. Vermijd lange, complexe zinnen. In plaats van te schrijven \"het ontwerp beoogt de wijziging van het belastingwetboek...\", schrijf \"Belastingwijzigingen: nieuwe verlichting en verplichtingen voor...\". Ga door met je werk totdat je je taak hebt opgelost. Als je niet zeker bent van de gegenereerde inhoud, analyseer het document dan opnieuw – gok niet. Plan je taak goed voordat je begint. Benadruk in de samenvatting en kernpunten, indien mogelijk en gerechtvaardigd, welke concrete voordelen of gevolgen (positief of negatief) de wet introduceert voor het dagelijks leven van burgers, hun rechten en plichten, persoonlijke financiën, veiligheid en andere belangrijke kwesties (bijv. categorische verboden en geboden of de belangrijkste concrete financiële en territoriale toewijzingen).\n// TECHNISCHE JSON-STRENGHEID\n// De backend-container is meedogenloos. Hij accepteert geen \"gebabbel\".\n// Het moet schone JSON zijn. Eén kommafout = fail en afwijzing van het geheel.\nVoordat je het antwoord retourneert, verifieer zorgvuldig of de hele JSON-structuur 100% correct is, inclusief alle komma\'s, accolades, vierkante haken en aanhalingstekens. Foute JSON is onacceptabel en voorkomt de verwerking van je werk.\nAnalyseer zorgvuldig de tekst van het juridische document hieronder.\nDit is de inhoud op basis waarvan je de samenvatting en kernpunten moet genereren:\n--- BEGIN DOCUMENT ---\n[DOCUMENT_TEXT]\n--- EINDE DOCUMENT --\n\n// OUTPUTSTRUCTUUR (voor 8 talen)\n// Moet perfect worden ingevuld. Elke sleutel wordt gevalideerd.\n// Als het model bijv. \"fr_summary\" overslaat -> gaat alles de prullenbak in.\nONTHOUD: Je antwoord MOET uitsluitend een geldig JSON-object zijn. Voeg geen extra tekens, opmerkingen of tekst toe voor de tag \'OPEN_BRACE\' of na de tag \'CLOSE_BRACE\'. Het hele antwoord moet parseerbaar zijn als JSON.\nOp basis van het BOVENSTAANDE document, vul de onderstaande JSON-structuur in: (...)';

  @override
  String get techJudgeTitle => 'B) Judge';

  @override
  String get techJudgeBody => 'Model: Flash Lite';

  @override
  String get techJudgeCode =>
      '// MODELINSTELLING\n// Dit is een eenvoudig heuristisch model, dus zijn rol moet ook eenvoudig zijn. Hij hoeft de wet niet te \"begrijpen\". Hij moet alleen twee datasets vergelijken. ÉÉN TAAK!\nROL: Fact Checker.\nTAAK: Vergelijk SOURCE (origineel) en SUMMARY (samenvatting voorbereid door een andere AI).\nJouw doel is het detecteren van \"VERZONNEN ENTITEITEN\" (Fabricated Entities) in de SUMMARY.\nSOURCE:\n[SOURCE_TEXT]\nSUMMARY TO EVALUATE:\nTitle: [AI_TITLE]\nSummary: [AI_SUMMARY]\nKey Points: [AI_KEY_POINTS]\n// EVALUATIEMETHODOLOGIE\n// We moesten starre regels definiëren, omdat Flash Lite verdwaalde bij abstractie, dus kreeg hij een checklist.\n// Concrete instructies verminderen de beslissingsruis van het model.\nEVALUATIEREGELS:\n1. Controleer alle GETALLEN, DATA en BEDRAGEN in de SUMMARY. Als er een ontbreekt in de SOURCE -> is_valid: false.\n2. Controleer alle NAMEN, ORGANISATIES en PLAATSEN in de SUMMARY. Als er een ontbreekt in de SOURCE -> is_valid: false.\n3. Controleer alle concrete JURIDISCHE ACTIES. Als dit mechanisme niet in de SOURCE zit -> is_valid: false.\n// UITZONDERING VOOR ABSTRACTIE\n// Dit is cruciaal. Abstracte concepten (bijv. \"toename van bureaucratie\") gaven vaak false positives.\n// We moesten ze uitsluiten van de beoordeling \"fabricated entity\", omdat de Rechter correcte logische conclusies afwees.\nBELANGRIJK: Abstracte begrippen (bijv. \"transparantie\", \"vertrouwen\") zijn toegestaan als conclusies.\n\n// OUTPUTSTRUCTUUR en opmaakvereisten voor het structureren van het antwoord.\nOUTPUT (JSON):\n(\n\"is_valid\": true/false,\n\"issue\": \"fabricated_entity\" / \"contradiction\" / \"none\"\n)\nOPMAAKVEREISTEN:\n1. Antwoord UITSLUITEND met een ruw JSON-object.\n2. Gebruik GEEN Markdown-codeblokken.\n3. Voeg GEEN inleidingen of uitleg toe voor of na de JSON.\n4. De JSON moet correct en klaar voor parsen zijn.';

  @override
  String get techSurgeonTitle => 'C) Surgeon';

  @override
  String get techSurgeonBody => 'Model: Gemini Pro';

  @override
  String get techSurgeonCode =>
      '// MODELINSTELLING\n// De Chirurg is er niet om te schrijven. Hij is er om de kanker (hallucinaties) weg te snijden.\n// Moet consistentie behouden met de \"Citizen Bias\" opgelegd door de Generalizer.\n// Om deze reden moeten we overschakelen naar agressieve grounding.\nJe bent een LEGISLATIVE SURGEON.\nJouw taak is de audit en reparatie van de samenvatting (JSON) wat betreft conformiteit met de brontekst (SOURCE).\n// MEGA BELANGRIJK. Hij mag geen informatie toevoegen. Als hij dat zou doen – verhogen we het risico op hallucinaties, en heeft hij geen rechter meer boven zich. Beter onvolledige samenvattingen dan onware.\nFUNDAMENTELE REGEL: \"NO NEW INFORMATION\" (geen nieuwe informatie).\nDe samenvatting mag alleen informatie transformeren die in de SOURCE staat (inkorten, vertalen, sommeren). Hij mag geen nieuwe informatie genereren die niet in de SOURCE staat.\n// VERIFICATIEPROCEDURE (WORKFLOW)\n// We dwingen het model tot een \"Zin-voor-Zin\" denkproces.\nVERIFICATIEPROCEDURE (voer uit voor elke zin in de JSON):\nVraag jezelf af: \"Kan ik in de SOURCE een concreet fragment aanwijzen dat deze bewering bevestigt?\"\nALS HET ANTWOORD \"JA\" IS:\nDe informatie is bevestigd door een citaat, synoniem of wiskundig resultaat uit data in de tekst.\nBESLISSING: Laat ongewijzigd.\nALS HET ANTWOORD \"NEE\" IS:\nDe informatie staat niet in de tekst (het is een hallucinatie, externe kennis van het model, overinterpretatie of onnodige extrapolatie).\nBESLISSING: Verwijder deze informatie of wijzig deze zodat deze gedekt is in de tekst.\nALS HET ANTWOORD \"DAT HANGT ERVAN AF\" IS:\nDe tekst is onduidelijk en de samenvatting \"gokt\" (bijv. door een concreet voorbeeld te geven voor een algemene term).\nBESLISSING: Speel op zeker. Verwijder het gokken. Gebruik terminologie uit de tekst.\n// RISICOCATEGORIEËN\n// Geschat op basis van eerdere fouten van de Generalizer.\n// We geven hem een \"wegenkaart\" van waar meestal de mijnen liggen.\nRISICOCATEGORIEËN (speciale aandacht):\nData (start geldigheid vs start financiering).\nGetallen (concrete bedragen moeten uit de tekst voortvloeien).\nSubjecten (wie doet wat).\nBereik (wat de wet dekt en wat niet).\n\nINPUT:\n--- SOURCE_TEXT START ---\n[SOURCE_TEXT]\n--- SOURCE_TEXT END ---\n\n--- FLAGGED_JSON START ---\n[FLAGGED_JSON]\n--- FLAGGED_JSON END ---\n\nOUTPUT:\nUitsluitend het gerepareerde JSON-object conform de structuur: (...)';

  @override
  String get techConclusionsTitle => '4. EMPIRISCHE CONCLUSIES';

  @override
  String get techConclusionsIntro =>
      'Naarmate het systeem zich ontwikkelde, was het noodzakelijk om beslissingen te nemen op basis van observaties en niet op basis van modelparameters. Dit leverde enkele vrij interessante inzichten op.';

  @override
  String get techConclusionATitle =>
      'A) Waarom een \"dommer\" model gebruiken?';

  @override
  String get techConclusionABody =>
      'Initiële tests op Pools recht, geaudit door Claude en ChatGPT, toonden aan dat Gemini Flash de beste samenvattingen genereerde. Vlak daarachter zat het Pro-model, dat soms een iets lagere beoordeling kreeg vanwege het trekken van vergaande conclusies of het weglaten van sommige details. Paradoxaal genoeg droeg het \"denken\" van het model bij aan een iets slechtere inhoudelijke kwaliteit. Conclusie? Wanneer Pro een korte en eenvoudige tekst krijgt, begint hij te filosoferen. Als gevolg daarvan kan hij sleutelfeiten weglaten die hij te voor de hand liggend vindt. Hij verliest ook veel vaker de JSON-structuur (vergeet de accolade te sluiten). Voor eenvoudige samenvattingen is de keuze duidelijk.';

  @override
  String get techConclusionBTitle => 'B) Waarvoor dan Pro?';

  @override
  String get techConclusionBBody =>
      'De problemen beginnen bij langere documenten. Hier gaat het Pro-model definitief aan kop, terwijl zwakkere modellen een veel grotere neiging tot hallucinaties hebben. Deze observaties worden ook bevestigd door wetenschappelijk onderzoek (Lost in the Middle). Dit dwingt de noodzaak af om bij langere documenten direct het Pro-model te gebruiken.';

  @override
  String get techConclusionCTitle => 'C) Effectiviteit';

  @override
  String get techConclusionCBody =>
      'Gebaseerd op empirische ervaringen (honderden proeven, verschillende parlementen), is de anti-hallucination rate >99%. Om de coëfficiënt met grotere precisie te schatten, zouden extra financiële uitgaven nodig zijn (duizenden of tienduizenden tests met de sterkste modellen van concurrerende AI-bedrijven). Men kan dit dus met een korreltje zout nemen. De meeste hallucinaties zijn kleine fouten, bijv. het gebruik van het woord \"mens\" in plaats van \"kamerlid\" in de samenvatting. Het grootste probleem van het systeem zijn dus niet zij, maar een te grote veralgemening. Soms creëert de Generalizer een correcte samenvatting, maar laat een kritiek punt weg dat zeer belangrijk is voor het publieke debat. Dit is echter een compromis dat het systeem op dit moment accepteert, gericht op de totale eliminatie van hallucinaties. Verveling is veiliger dan een leugen.';

  @override
  String get techFooterDate => 'Datum update Q1 2026';

  @override
  String get techFooterLicense => 'Open Source (AGPLv3)';

  @override
  String get techGraphSource => 'Legislation Source';

  @override
  String get techGraphDecisionLength => 'Lengte > 20k tokens?';

  @override
  String get techGraphNo => 'NEE';

  @override
  String get techGraphYes => 'JA';

  @override
  String get techGraphFlash => 'Flash (System 1)';

  @override
  String get techGraphPro => 'Pro (System 2)';

  @override
  String get techGraphJudge => 'The Judge (Flash Lite)';

  @override
  String get techGraphDecisionPass => 'Resultaat: Pass?';

  @override
  String get techGraphPublishFirestore => 'HTML Ready';

  @override
  String get techGraphNoRetry => 'NEE (Retry)';

  @override
  String get techGraphRepairLoop => 'Reparatielus';

  @override
  String get techGraphRetryFlash => '< 2 fouten: Flash';

  @override
  String get techGraphRetrySurgeon => '> 2 fouten: Surgeon';

  @override
  String get techGraphSurgeon => 'The Surgeon (Pro)';

  @override
  String get techGraphHtmlReady => 'HTML Ready';

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
    return 'Stemmen is een keuze. Maak de jouwe hier: $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Profiel en stemgedrag: $deepLink';
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

  @override
  String get authErrorAppleFailed =>
      'Inloggen met Apple is mislukt. Probeer opnieuw.';

  @override
  String get continueWithApple => 'Doorgaan met Apple';

  @override
  String get homeSearchHint => 'Voer een zoekterm in...';

  @override
  String get homeSearchButtonDeputies => 'Kamerleden';

  @override
  String get homeSearchButtonLegislations => 'Wetten';

  @override
  String get actionSeeAll => 'Alles bekijken';

  @override
  String get notificationsEnabledForOtherParliament =>
      'Actief voor een ander parlement';

  @override
  String get votingResultsUSMotionToTableTitle =>
      'RESULTATEN: MOTIE VAN VERWERPING';

  @override
  String get crowdfundingLabel =>
      'Steun Lustra om een onafhankelijke bron te blijven:';

  @override
  String get hashtagLaw => 'Wet';

  @override
  String get hashtagPolitician => 'Politicus';

  @override
  String get statusIntroduced => 'Ingediend';

  @override
  String get statusPassedHouse => 'Aangenomen in het Huis';

  @override
  String get statusPassedSenate => 'Aangenomen in de Senaat';

  @override
  String get statusBecameLaw => 'Werd wet';

  @override
  String get statusVetoed => 'Gevetood';

  @override
  String get statusFailed => 'Verworpen';

  @override
  String get statusPlacedOnCalendar => 'Geplaatst op kalender';

  @override
  String get actionBack => 'Terug';

  @override
  String get actionViewSourceJson => 'AI-werklogboeken voor dit document';

  @override
  String get manualEmailDialogTitle => 'Bericht handmatig verzenden';

  @override
  String get manualEmailDialogDescription =>
      'Geen e-mailclient gedetecteerd. Kopieer de onderstaande gegevens en verstuur ze zelf.';

  @override
  String get labelRecipient => 'Ontvanger';

  @override
  String get labelSubject => 'Onderwerp';

  @override
  String get labelBody => 'Berichtinhoud';

  @override
  String get actionCopy => 'Kopiëren';

  @override
  String get copiedToClipboard => 'Gekopieerd naar klembord';

  @override
  String get webBannerDownloadMessage =>
      'Om volledig gebruik te maken van alle mogelijkheden, download de app!';

  @override
  String get webBannerDownloadButton => 'Downloaden';

  @override
  String get supportStripeButton => 'Steunen (Stripe)';

  @override
  String get supportFounderMessage =>
      'Er zit geen groot bedrijf achter dit project, alleen ik en mijn laptop. Ik heb dit gebouwd omdat ik geloof dat dergelijke technologie moet bestaan en 100% onafhankelijk moet blijven van kapitaal, dat altijd het narratief dicteert. Dit is mijn geschenk aan de wereld.';

  @override
  String get civicProjectTitle => 'Burgerproject';

  @override
  String get drafterAuthRequired =>
      'Authenticatie vereist. Log eerst in bij Lustra.';

  @override
  String get drafterLaunchError => 'Kan Drafter Gateway niet starten:';

  @override
  String get drafterButtonTitle =>
      'GEBRUIK LUSTRA DRAFTER OM IN 5 MINUTEN EEN WET TE MAKEN VAN EEN IDEE';

  @override
  String get submitCivicProjectButton => 'Maak je project aan';

  @override
  String get civicThresholdCandidate => 'Ter herziening.';

  @override
  String get statusInitiative => 'Initiatief';

  @override
  String get civicTitle => 'Burgerprojecten';

  @override
  String get civicIncubatorTitle => 'Incubator Burgerprojecten';

  @override
  String get civicSubtitle => 'Samen de toekomst van de democratie ontwerpen.';

  @override
  String get civicSection1Title => '1. Programmaregels & Bestuur';

  @override
  String get civicSection1Intro =>
      'Lustra biedt burgers wetgevende infrastructuur. We behandelen uw ideeën met dezelfde ernst als wetsvoorstellen van de overheid. Om kwaliteit te waarborgen, gelden strikte regels:';

  @override
  String get civicProcessTitle => 'Het Proces';

  @override
  String get civicRuleSubmissionTitle => 'Indiening:';

  @override
  String get civicRuleSubmissionText =>
      'U dient een concept in via e-mail/formulier.';

  @override
  String get civicRuleReviewTitle => 'Formele Beoordeling (Mens):';

  @override
  String get civicRuleReviewText =>
      'We controleren naleving van de LDS-1 Standaard. We filteren strikt op haatzaaien, spam, duplicaten en niet-wetgevende inhoud.';

  @override
  String get civicRuleAiTitle => 'AI-Sterilisatie:';

  @override
  String get civicRuleAiText =>
      'Goedgekeurde concepten worden verwerkt door onze AI om emotioneel taalgebruik te verwijderen en feiten te extraheren.';

  @override
  String get civicRulePublicationTitle => 'Publicatie:';

  @override
  String get civicRulePublicationText =>
      'Het project krijgt een \"Burgerwetskaart\" in de app, visueel gelijk aan overheidswetgeving.';

  @override
  String get civicWarningTitle => 'Projectintegriteit';

  @override
  String get civicWarningText =>
      'De basistekst is onveranderlijk. Je kunt alleen amendementen toevoegen om de tekst te verfijnen zonder de oorspronkelijke kern te wijzigen. Alle wijzigingen zijn transparant en worden als bijlage toegevoegd.';

  @override
  String get civicPoliciesTitle => 'Kritieke Beleidslijnen';

  @override
  String get civicPolicyPublicDomainTitle => 'Publiek Domein (CC0):';

  @override
  String get civicPolicyPublicDomainText =>
      'Door een project in te dienen, doet u afstand van alle auteursrechten. De wet is van iedereen.';

  @override
  String get civicPolicyAstroturfingTitle => 'Anti-Astroturfing:';

  @override
  String get civicPolicyAstroturfingText =>
      'U moet verklaren of u een organisatie vertegenwoordigt. Verborgen lobbyen leidt tot een permanente verbanning.';

  @override
  String get civicPolicyAdPersonamTitle => 'Ad Personam:';

  @override
  String get civicPolicyAdPersonamText =>
      'Projecten gericht op specifieke individuen (smaad) worden onmiddellijk afgewezen.';

  @override
  String get civicPolicyTrashTitle => 'Geen Prullenbak:';

  @override
  String get civicPolicyTrashText =>
      'Lustra is geen forum. Concepten van lage kwaliteit, duplicaten en manifesten worden aan de poort geweigerd.';

  @override
  String get civicSection2Title => '2. Lustra Wetgevingsstandaard (LDS-1)';

  @override
  String get civicSection2Intro =>
      'Uw concept moet deze structuur volgen. Als het op een blogpost lijkt, wordt het afgewezen.';

  @override
  String get civicStructureTitle => 'Vereiste Structuur:';

  @override
  String get civicStructureTitleItem => 'Titel:';

  @override
  String get civicStructureTitleText => 'Beschrijvend en neutraal.';

  @override
  String get civicStructureArticlesItem => 'Artikelen:';

  @override
  String get civicStructureArticlesText =>
      'Tekst verdeeld in genummerde eenheden (Art. 1, Art. 2...) met specifieke mechanismen (verboden, mandaten).';

  @override
  String get civicStructureExposeItem => 'Memorie van Toelichting (Exposé):';

  @override
  String get civicStructureExposeText => 'Verplichte sectie die uitlegt:';

  @override
  String get civicExposePoint1 => '• (1) Diagnose van het probleem.';

  @override
  String get civicExposePoint2 => '• (2) Doel van de regeling.';

  @override
  String get civicExposePoint3 => '• (3) Verwachte maatschappelijke impact.';

  @override
  String get civicSection3Title => '3. Lustra Gereedheidsscore';

  @override
  String get civicSection3Intro =>
      'We beoordelen uw politieke opvattingen niet. We beoordelen de kwaliteit van de constructie. Onze AI analyseert elk concept op een schaal van 0-100:';

  @override
  String get civicScoreStructureTitle => 'Structuur (30 ptn):';

  @override
  String get civicScoreStructureText =>
      'Correcte juridische opmaak en nauwkeurig taalgebruik.';

  @override
  String get civicScoreExposeTitle => 'Volledigheid Exposé (30 ptn):';

  @override
  String get civicScoreExposeText =>
      'Duidelijkheid van de probleem/oplossing definitie.';

  @override
  String get civicScoreLogicTitle => 'Interne Logica (20 ptn):';

  @override
  String get civicScoreLogicText => 'Afwezigheid van tegenstrijdigheden.';

  @override
  String get civicScoreImpactTitle => 'Impactanalyse (20 ptn):';

  @override
  String get civicScoreImpactText =>
      'Haalbaarheid en identificatie van getroffen groepen.';

  @override
  String get civicThresholdsTitle => 'Drempels:';

  @override
  String get civicThresholdRejected => 'Afgewezen / Geretourneerd.';

  @override
  String get civicThresholdReady => 'Prioritaire publicatie.';

  @override
  String get civicSection4Title =>
      '4. Toolkit voor Makers (Kopiëren & Plakken)';

  @override
  String get civicSection4Intro =>
      'Gebruik dit sjabloon om ervoor te zorgen dat uw project voldoet aan de LDS-1 Standaard.';

  @override
  String get civicTemplateCode =>
      'TITEL: [Voeg Hier Beschrijvende Titel In]\n\nPREAMBULE: [Optioneel: Erkennende dat...]\n\nHOOFDSTUK I: ALGEMENE BEPALINGEN\nArt. 1. Het doel van deze Wet is [Voeg Doel In].\nArt. 2. Deze Wet is van toepassing op [Voeg Reikwijdte In].\n\nHOOFDSTUK II: [HOOFDMECHANISME / VERBODEN]\nArt. 3. \n1. Het is verboden om [Actie].\n2. Entiteiten zijn verplicht om [Actie].\n\nHOOFDSTUK III: SANCTIES & SLOTBEPALINGEN\nArt. X. Overtreding van Art. 3 wordt bestraft met [Sanctie].\nArt. Y. Deze Wet treedt in werking op [Datum].\n\n---\nMEMORIE VAN TOELICHTING (EXPOSÉ)\n\n1. HET PROBLEEM\n[Beschrijf de huidige situatie en waarom deze faalt.]\n\n2. HET DOEL\n[Leg uit wat deze wet oplost en hoe.]\n\n3. VERWACHTE IMPACT\n[Beschrijf de sociale, economische of juridische gevolgen.]';

  @override
  String get civicSubmitButton => 'CONCEPT INDIENEN (E-MAIL)';

  @override
  String get civicFooterCopyright =>
      '© 2025 Lustra Initiatief.\nInfrastructuur voor het Burgerlijke Tijdperk.';

  @override
  String civicEmailSubject(Object parliamentName) {
    return '[LDS-1 Inzending] Projecttitel - $parliamentName';
  }

  @override
  String get civicEmailBodyPlaceholder =>
      '[PLAK UW SJABLOON HIER]\n\nAuteur / Organisatie:\nContactinfo:\n';

  @override
  String get civicEmailDialogTitle => 'E-mailclient Niet Gevonden';

  @override
  String get civicEmailDialogIntro =>
      'Kopieer de details hieronder en verstuur handmatig:';

  @override
  String get civicEmailDialogRecipient => 'Ontvanger';

  @override
  String get civicEmailDialogSubject => 'Onderwerp';

  @override
  String get civicEmailDialogBody => 'Inhoud';

  @override
  String get civicCopiedToClipboard => 'Gekopieerd naar klembord';

  @override
  String get civicTemplateCopied => 'Sjabloon gekopieerd!';

  @override
  String get supportMegaTitle => 'Burgereigendom';

  @override
  String get verificationRequiredTitle => 'Verificatie vereist';

  @override
  String get verificationRequiredContent =>
      'Om uw stem in de ranglijst mee te tellen, moeten we bevestigen dat u een mens bent.\n\nControleer uw inbox (inclusief SPAM-map).';

  @override
  String get verificationResendLink => 'Link opnieuw verzenden';

  @override
  String get verificationLinkSentSuccess => 'Link opnieuw verzonden!';

  @override
  String get verificationAlreadyConfirmed => 'Ik heb bevestigd';

  @override
  String get verificationSuccessVotingUnlocked => 'Bedankt! U kunt nu stemmen.';

  @override
  String get verificationStillNotVerified =>
      'Nog geen bevestiging gevonden. Probeer het zo nog eens.';

  @override
  String get cancel => 'Annuleren';

  @override
  String get pollVoteSignificance => 'Jouw stem is pas het begin.';

  @override
  String get pollShareImpact =>
      'Algoritmes leggen ons vaak het zwijgen op. Jouw ene keer delen bereikt gemiddeld 50-300 mensen. Help ons de sociale media bubbel te doorbreken.';

  @override
  String get pollShareAction => 'Deel en versterk de stem van de burgers';

  @override
  String get listRefreshed => 'Lijst vernieuwd!';

  @override
  String get errorNoDataReturned => 'Geen gegevens geretourneerd';

  @override
  String get errorMustBeLoggedInToSubscribe =>
      'Je moet ingelogd zijn om je te abonneren.';

  @override
  String get subscribedToList => 'Geabonneerd op lijst!';

  @override
  String get unsubscribedFromList => 'Abonnement opgezegd.';

  @override
  String get errorListRemovedByOwner => 'Lijst verwijderd door de eigenaar...';

  @override
  String get errorFailedToUpdateSubscription =>
      'Abonnement kon niet worden bijgewerkt.';

  @override
  String get notificationSentCooldownActive =>
      'Melding naar abonnees verzonden!...';

  @override
  String get errorCooldownActiveNotification =>
      'Afkoelperiode actief. Je kunt verzenden in...';

  @override
  String get errorFailedToSendNotification =>
      'Melding kon niet worden verzonden.';

  @override
  String get nameYourCuratorList => 'Geef je Auteurslijst een naam';

  @override
  String get hintCuratorListExample => 'bijv. Mijn economisch beleid';

  @override
  String listCreatedSuccess(String text) {
    return 'Lijst \'$text\' aangemaakt!';
  }

  @override
  String get errorFailedToCreateList => 'Lijst kon niet worden aangemaakt.';

  @override
  String get actionCreate => 'Aanmaken';

  @override
  String get unnamedList => 'Naamloze lijst';

  @override
  String get tooltipEditList => 'Lijst bewerken';

  @override
  String get addDescriptionHint => 'Voeg een beschrijving toe...';

  @override
  String subscribersCount(int subs) {
    return '$subs abonnees';
  }

  @override
  String get actionShareList => 'Lijst delen';

  @override
  String get actionSupportCreator => 'Steun de maker';

  @override
  String availableInHours(int hoursLeft) {
    return 'Beschikbaar over ${hoursLeft}u';
  }

  @override
  String get actionNotifySubscribers => 'Abonnees op de hoogte brengen';

  @override
  String get actionSubscribed => 'Geabonneerd';

  @override
  String get actionSubscribe => 'Abonneren';

  @override
  String get tooltipReportList => 'Lijst rapporteren';

  @override
  String get tooltipDeleteList => 'Lijst verwijderen';

  @override
  String get draftYourCivicProject => 'Stel uw eigen burgerproject op';

  @override
  String get draftCivicProjectDescription =>
      'Zet uw ideeën om in echte wetsvoorstellen en verzamel steun. Lustra is klaar voor uw beleid.';

  @override
  String get createYourOwnList => 'Maak uw eigen lijst';

  @override
  String get createYourOwnListDescription =>
      'Word een curator. Selecteer belangrijke wetsvoorstellen, nodig volgers uit en stuur meldingen naar hun apparaten om ze op de hoogte te houden van wijzigingen in uw wetgevingslijst of burgerprojecten.';

  @override
  String get editListDetails => 'Lijstdetails bewerken';

  @override
  String get listNameLabel => 'Naam van de lijst';

  @override
  String get descriptionOptionalLabel => 'Beschrijving (Optioneel)';

  @override
  String get supportCreatorOptionalLabel => 'Steun de maker (Optioneel)';

  @override
  String providerUsernameLabel(String provider) {
    return '$provider gebruikersnaam';
  }

  @override
  String get listUpdatedSuccess => 'Lijst bijgewerkt!';

  @override
  String get errorFailedToUpdate => 'Bijwerken mislukt.';

  @override
  String get actionSave => 'Opslaan';

  @override
  String get deleteListDialogTitle => 'Lijst verwijderen?';

  @override
  String get deleteListDialogBody =>
      'Deze actie kan niet ongedaan worden gemaakt...';

  @override
  String get listDeletedSuccess => 'Lijst verwijderd.';

  @override
  String get errorFailedToDelete => 'Verwijderen mislukt.';

  @override
  String get actionDelete => 'Verwijderen';

  @override
  String get syncingCuratedFeed => 'AUTEURSLIJST SYNCHRONISEREN...';

  @override
  String get actionTryAgain => 'Opnieuw proberen';

  @override
  String get tooltipSetAsListCover => 'Instellen als omslagfoto';

  @override
  String get coverUpdatedSuccess => 'Omslagfoto bijgewerkt!';

  @override
  String get errorUpdatingCover => 'Fout bij bijwerken omslagfoto.';

  @override
  String get loaderLoadingProfile => 'PROFIEL LADEN...';

  @override
  String get loaderRetrievingVoteLogs => 'STEMREGISTERS OPHALEN...';

  @override
  String get loaderLoadingRecentVotes => 'RECENTE STEMMINGEN LADEN...';

  @override
  String get loaderFetchingData => 'GEGEVENS OPHALEN...';

  @override
  String get loaderLoadingTrackedBills => 'GEVOLGDE WETTEN LADEN...';

  @override
  String get emptyTrackedBills => 'Je volgt nog geen wetten.';

  @override
  String get notificationsMobileOnly =>
      'Meldingen alleen beschikbaar in de app.';

  @override
  String get titleYourTrackedBills => 'Gevolgde Wetten';

  @override
  String get buttonSeeAllTracked => 'Bekijk alles';

  @override
  String get titleNameYourList => 'Geef je lijst een naam';

  @override
  String get hintEgMySocialPolicies => 'bijv. Mijn sociale beleid';

  @override
  String snackbarListCreated(String text) {
    return 'Lijst \'$text\' aangemaakt!';
  }

  @override
  String get snackbarFailedToCreateList => 'Mislukt om lijst te maken.';

  @override
  String get buttonCreate => 'Aanmaken';

  @override
  String get titleRenameYourList => 'Lijst hernoemen';

  @override
  String get snackbarListRenamed => 'Lijst hernoemd!';

  @override
  String get snackbarFailedToRenameList => 'Hernoemen mislukt.';

  @override
  String get buttonSave => 'Opslaan';

  @override
  String get titleYourLists => 'Jouw Lijsten';

  @override
  String get emptyNoListsYet => 'Je hebt nog geen lijsten.';

  @override
  String get tooltipRename => 'Hernoemen';

  @override
  String get snackbarErrorUpdatingList => 'Fout bij bijwerken.';

  @override
  String get tooltipShareList => 'Lijst delen';

  @override
  String get buttonCreateNewList => 'Nieuwe Lijst Aanmaken';

  @override
  String get errorLimitOf3ListsReached => 'Limiet van 3 lijsten bereikt.';

  @override
  String get snackbarFailedToDelete => 'Verwijderen mislukt.';

  @override
  String get loaderFetchingMirrorParliamentData =>
      'GEGEVENS SPIEGELPARLEMENT OPHALEN...';

  @override
  String get loaderSecuringSafeChannel => 'VERBINDING VERSLEUTELEN...';

  @override
  String get snackbarAddedToList => 'Toegevoegd aan je lijst.';

  @override
  String get snackbarRemovedFromList => 'Verwijderd uit je lijst.';

  @override
  String get loaderLoadingData => 'GEGEVENS LADEN...';

  @override
  String get buttonAddToList => 'Toevoegen aan lijst';

  @override
  String get previousStatusLabel => 'Voorheen:';

  @override
  String get statusLabel => 'Status:';

  @override
  String get loaderEstablishingConnection => 'VERBINDING MAKEN...';

  @override
  String get loaderFetchingInitiatives => 'INITIATIEVEN OPHALEN...';

  @override
  String get loaderLoadingMoreInitiatives => 'MEER INITIATIEVEN LADEN...';

  @override
  String get loaderLoadingMore => 'MEER LADEN...';

  @override
  String get errorMustBeLoggedInToTrack =>
      'Log in om te volgen. Maak een account aan.';

  @override
  String get loaderLoadingYourTrackedList => 'JE VOLGLIJST LADEN...';

  @override
  String get emptyNotTrackingAnything => 'Je volgt nog niets.';

  @override
  String get loaderLoadingLegislativeData => 'WETGEVENDE GEGEVENS LADEN...';

  @override
  String get loaderAuthorizing => 'AUTORISEREN...';

  @override
  String get loaderLoading => 'LADEN...';

  @override
  String get snackbarLinkCopied => 'Link gekopieerd naar klembord!';

  @override
  String get civicWillRecord => 'REGISTER VAN BURGERWIL';

  @override
  String totalVotesRecorded(String totalVotes) {
    return '$totalVotes GEREGISTREERDE STEMMEN';
  }

  @override
  String get recordYourPositionForAudit =>
      'Registreer je standpunt voor de audit.';

  @override
  String get privateList => 'Privé Lijst';

  @override
  String get loaderLoadingCuratedFeed => 'AUTEURSLIJST LADEN...';

  @override
  String get buttonOpenFullList => 'Volledige lijst openen';

  @override
  String get filtersLabel => 'Filters';

  @override
  String get statusFilterLabel => 'Status';

  @override
  String get onlyWithSourceTextLabel => 'Alleen met brontekst';

  @override
  String get trackedBillsTitle => 'Gevolgde Wetten';

  @override
  String get curatedListTitle => 'Privé Lijst';

  @override
  String get loaderLoadingProfiles => 'PROFIELEN LADEN...';

  @override
  String get loaderLoadingMoreProfiles => 'MEER PROFIELEN LADEN...';

  @override
  String get loaderInitializingMirrorParliament =>
      'SPIEGELPARLEMENT INITIALISEREN...';

  @override
  String get loaderSyncingVectors => 'VECTOREN SYNCHRONISEREN...';

  @override
  String get reportIncludeDiagnosticsTitle => 'Voeg systeemdiagnostiek toe';

  @override
  String get reportIncludeDiagnosticsSubtitle =>
      'Voegt actieve status toe (Parlement, Termijn, Doel) om ons te helpen de fout op te lossen.';

  @override
  String get loaderSendingReport => 'RAPPORT VERZENDEN...';

  @override
  String primaryParliamentLabel(String parliament) {
    return 'Primair: $parliament';
  }

  @override
  String get buttonCreateAnotherList => 'Nog een lijst maken';

  @override
  String get buttonCreateTrackingList => 'Volglijst maken';

  @override
  String get errorMissingListId => 'Fout: Lijst ID ontbreekt';

  @override
  String get actionTracked => 'Gevolgd';

  @override
  String get actionTrack => 'Volgen';

  @override
  String pollSupportPercent(String percent) {
    return 'VOOR $percent%';
  }

  @override
  String get pollSyncing => 'SYNCHRONISEREN...';

  @override
  String pollOpposePercent(String percent) {
    return 'TEGEN $percent%';
  }

  @override
  String get pollPositionRecorded => 'STANDPUNT GEREGISTREERD';

  @override
  String get pollRestrictedToCitizens => 'BEPERKT TOT BURGERS';

  @override
  String yourListsForCountry(String countryName) {
    return 'Jouw Lijsten ($countryName)';
  }

  @override
  String get bottomNavGetInvolved => 'Doe Mee';

  @override
  String get errorLaunchUrl => 'Kan link niet openen';

  @override
  String get infoTechTitle => 'Hoe de Technologie Werkt';

  @override
  String get infoTechSubtitle =>
      'Lees over onze architectuur, datasterilisatie en civic tech-principes.';

  @override
  String get infoGovTitle => 'Transparantie & Bestuur';

  @override
  String get infoGovSubtitle =>
      'Wie dit bouwt, wie het betaalt en waar we naartoe gaan.';

  @override
  String get infoPrivacyTitle => 'Grondwet & Privacy';

  @override
  String get infoPrivacySubtitle =>
      'Radicale transparantie. Welke gegevens we verzamelen en waarom.';

  @override
  String get manualTitle => 'Open Burgerhandboek';

  @override
  String get manualSubtitle =>
      'Leer hoe je de regie in de democratie terugneemt.';

  @override
  String get howToActTitle => 'Hoe te handelen met Lustra';

  @override
  String get actAuditTitle => 'Burger Audit';

  @override
  String get actAuditSubtitle =>
      'Stem op wetten om de onderwerphiërarchie vorm te geven en laat tastbaar bewijs van de Burgerwil achter. Laat de media het gesprek niet meer sturen.';

  @override
  String get actWatchlistTitle => 'Gecureerde Volglijsten';

  @override
  String get actWatchlistSubtitle =>
      'Maak aangepaste lijsten van wetsvoorstellen om abonnees te verzamelen en bewustzijn te creëren. Gebruik sociale media als lobbykracht.';

  @override
  String get actDraftTitle => 'Stel Burgerwetten Op';

  @override
  String get actDraftSubtitle =>
      'Dien je eigen initiatieven in bij Lustra. De samenleving heeft behoefte aan nieuwe ideeën die niet door kapitaal worden tegengehouden.';

  @override
  String get joinCommunityTitle => 'Word lid van de Community';

  @override
  String get subscribedLists => 'Geabonneerd';

  @override
  String get snackbarAddedToListWebPromo =>
      'Toegevoegd! Download de app om pushmeldingen over dit wetsvoorstel te ontvangen.';

  @override
  String get aboutGovAppBar => 'Governance';

  @override
  String get aboutGovTitle => 'Transparantie & Governance';

  @override
  String get aboutGovSubtitle =>
      'Wie dit bouwt, wie het betaalt en waar we heen gaan.';

  @override
  String get aboutGovFounderName => 'Jacek (Fons)';

  @override
  String get aboutGovFounderBadge => 'SOLO-ARCHITECT / OPRICHTER';

  @override
  String get aboutGovFounderP1 =>
      'Ik ben geen politicus, advocaat of academicus. Ik heb geen formele geloofsbrieven. 18 maanden geleden werkte ik als schoonmaker. Ik was heel 2025 werkloos en bouwde dit systeem vanaf de grond af op een laptop uit 2016.';

  @override
  String get aboutGovFounderP2 =>
      'Waarom? Omdat ik gefrustreerd was dat miljardairs en grote bedrijven betere datatools hebben dan burgers. Ik was gefrustreerd door de drempels die burgers weghouden van de wet en de narratiefoorlogen die door de media worden gevoerd, waardoor mensen ofwel vervreemden van de politiek, ofwel gedwongen worden een kamp te kiezen. Ik heb mezelf alles aangeleerd om een Spiegelparlement (Mirror Parliament) te bouwen. Ik geloof niet in online petities; ik geloof in keiharde, op data gebaseerde transparantie en toegankelijkheid. En dat de democratie een update nodig heeft.';

  @override
  String get aboutGovFounderP3 =>
      'Je vraagt je misschien af: \"Waarom zou ik je vertrouwen?\" Vertrouw niemand, vooral niet in de politiek - begin met auditen.';

  @override
  String get aboutGovSec1Title => '1. Financiering & Infrastructuur';

  @override
  String get aboutGovSec1Intro =>
      'Er is geen VC (durfkapitaal). Er is geen zwart geld. Er is geen crypto. Momenteel is deze operatie volledig uit eigen middelen gefinancierd (bootstrapped).';

  @override
  String get aboutGovSec1Bullet1Title => 'Infrastructuur:';

  @override
  String get aboutGovSec1Bullet1Text =>
      'Gedekt door een subsidie van \$2.000 in de vorm van credits van het Google For Startups-programma. We hebben momenteel nog ongeveer \$1.200 over, wat ons een serverlooptijd (runway) van ongeveer 12 maanden geeft.';

  @override
  String get aboutGovSec1Bullet2Title => 'Levensonderhoud:';

  @override
  String get aboutGovSec1Bullet2Text =>
      'Volledig ondersteund door mijn persoonlijke spaargeld, mijn verloofde en mijn familie.';

  @override
  String get aboutGovSec1Bullet3Title => 'Tech Stack:';

  @override
  String get aboutGovSec1Bullet3Text =>
      'Alleen gebouwd (Flutter, Firebase, Vertex AI-pijplijn, Node.js) om de operationele kosten dicht bij nul te houden.';

  @override
  String get aboutGovSec2Title => '2. Huidige Rechtsvorm & De Transitie';

  @override
  String get aboutGovSec2P1 =>
      'Lustra incubeert momenteel onder mijn oude Poolse BV (FO&WO VENTURES SP. Z O.O.). Dit is een juridische noodzaak. Om in de Apple/Google App Stores te publiceren en de Google Startup-credits te ontvangen, is een geregistreerd bedrijf met een DUNS-nummer vereist. Ik kan de juridische kosten om een stichting op te richten nog niet betalen (meer dan \$500 opstartkosten en maandelijkse boekhouding), dus gebruik ik de meest efficiënte (lean) opzet mogelijk.';

  @override
  String get aboutGovSec2BoxTitle => 'De Roadmap naar Non-Profit:';

  @override
  String get aboutGovSec2BoxText =>
      'Zodra we financiële liquiditeit en een kritische massa (ca. 100k maandelijkse gebruikers) bereiken, ben ik van plan een formele Non-Profit Organisatie op te richten en alle intellectuele eigendommen en infrastructuur daarnaartoe over te dragen.';

  @override
  String get aboutGovSec2P2 =>
      'Het uiteindelijke doel is een democratische bestuursstructuur (governance). Beslissingen zullen worden genomen door een bestuur dat is gekozen door de community. Mijn rol zal strikt beperkt blijven tot het technisch onderhoud van de backend. Ik zie geen andere toekomst voor Lustra dan een non-profit operatie met volledige transparantie van alle financiële documenten.';

  @override
  String get aboutGovSec3Title => '3. Veiligheid & Broncode';

  @override
  String get aboutGovSec3Bullet1Title => 'Authenticatie:';

  @override
  String get aboutGovSec3Bullet1Text =>
      'We raken je wachtwoorden niet aan. We gebruiken Google/Apple Auth omdat hun beveiligingsinfrastructuur superieur is. We slaan alleen een geanonimiseerde User-ID en je Vote-ID op om botfarms te voorkomen.';

  @override
  String get aboutGovSec3Bullet2Title =>
      'Broncode Beschikbaar (Source Available):';

  @override
  String get aboutGovSec3Bullet2Text =>
      'De core-repositories zijn openbaar onder de Open Source (AGPLv3) License. Het is beschermd tegen het klonen door bedrijven, maar de data-adapters, AI-systeemprompts en logica zijn volledig zichtbaar voor audits.';

  @override
  String get aboutGovSec3BoxTitle => 'We hebben hulp nodig.';

  @override
  String get aboutGovSec3BoxText =>
      'Ik ben één gast met een oude laptop die alles doet. Als je een ontwikkelaar, journalist of burger bent die wil helpen bij het opzetten van lokale cellen in jouw land — neem contact op.';

  @override
  String get aboutGovSec3Contact => 'Contact: jacek@lustra.dev';

  @override
  String get aboutGovSec3Github => 'GitHub-profiel';

  @override
  String get termsAppBar => 'Grondwet & Privacy';

  @override
  String get termsTitle => 'Grondwet & Privacy';

  @override
  String get termsLastUpdated => 'Laatst bijgewerkt: 12 maart 2026';

  @override
  String get termsAlertTitle =>
      'Radicale Transparantie: Wat we daadwerkelijk verzamelen';

  @override
  String get termsAlertP1 =>
      'Je denkt misschien: \"Ik ga mijn data niet aan willekeurige mensen geven.\" Daar zijn we het mee eens. Daarom willen we je privéleven niet. We willen alleen verifiëren dat je een echt mens bent dat op echte wetten stemt.';

  @override
  String get termsAlertP2 =>
      'Hier is de exacte datastructuur die we opslaan voor je gebruikersprofiel in onze Google Cloud Firestore-database. Geen verborgen velden. Geen tracking cookies.';

  @override
  String get termsAlertCode =>
      '[\n  \'uid\': \'0A21rfdsTs1F3kYsx3252352\', // Gegenereerd door Firebase Auth\n  \'email\': \'burger@example.com\', // Jouw enige Persoonsgegevens\n  \'createdAt\': \'February 15, 2026 at 8:23:31 PM UTC\',\n  \'marketingConsent\': true, // Voor projectupdates (optioneel)\n  \'primaryParliamentId\': \'Tweede Kamer der Staten-Generaal\'\n]';

  @override
  String get termsAlertH4 =>
      'Wacht, waar zijn mijn stemmen en gevolgde wetten?';

  @override
  String get termsAlertP3 =>
      'Om je privacy te beschermen en ervoor te zorgen dat onze database efficiënt schaalt, zijn je interacties gescheiden (sharded) van je hoofdprofiel:';

  @override
  String get termsAlertB1Title => 'Gevolgde Wetten:';

  @override
  String get termsAlertB1Text =>
      'Opgeslagen in een privé sub-collectie. Alleen jij (en je apparaat) kunnen de lijst opvragen van de wetten die je volgt.';

  @override
  String get termsAlertB2Title => 'Jouw Stemmen (Cryptografische Hashing):';

  @override
  String get termsAlertB2Text =>
      'Wanneer je stemt, koppelen we je UID NIET direct aan het openbare stemregister. In plaats daarvan genereert de server een cryptografische hash (bijv. a1b2c3d4...) met behulp van een geheime server-salt. Dit pseudonimiseert je stem sterk. Als een hacker de database steelt, kunnen ze niet zien wie waarop heeft gestemd. Hoewel het wiskundig gezien een eenrichtingsfunctie is, moet je in de geest van absolute transparantie weten dat de systeembeheerders (die de geheime salt bezitten) theoretisch een stem zouden kunnen verifiëren om het systeem te controleren op fraude of om te voldoen aan een geldig gerechtelijk bevel. Je stemmen zijn echter strikt gescheiden van je dagelijkse profiel en worden nooit publiekelijk weergegeven in combinatie met je identiteit.';

  @override
  String get termsAlertP4 =>
      'Dat is alles. De rest is anonieme analytics (Firebase Analytics) om bugs te verhelpen, en App Check om te voorkomen dat botfarms de stemmingen manipuleren. We verkopen geen data. We tonen geen advertenties.';

  @override
  String get termsTocTitle => 'Inhoudsopgave';

  @override
  String get termsPart1Title => 'Deel 1: Privacybeleid (Dataminimalisatie)';

  @override
  String get termsPart1Intro =>
      'Wij handelen niet in jouw aandacht. We verzamelen alleen wat technisch noodzakelijk is om een veilige burgerinfrastructuur te beheren.';

  @override
  String get termsP1S1Title => '1. Verwerkingsverantwoordelijke';

  @override
  String get termsP1S1Text =>
      'De juridische operator is tijdelijk FO&WO VENTURES SP. Z O.O. (BV), gevestigd in Wrocław, Polen. Contact: jacek@lustra.dev';

  @override
  String get termsP1S2Title => '2. Wat we verzamelen';

  @override
  String get termsP1S2B1Title => 'Account (E-mail/UID):';

  @override
  String get termsP1S2B1Text =>
      'Noodzakelijk voor veilig inloggen via Firebase Authentication.';

  @override
  String get termsP1S2B2Title => 'Stemmen & Peilingen (Geanonimiseerd):';

  @override
  String get termsP1S2B2Text =>
      'Jouw stemmen bouwen de statistieken op. Ze zijn uitsluitend aan je account gekoppeld om botfarms en dubbel stemmen te voorkomen. Publiekelijk worden je stemmen ALLEEN weergegeven als anonieme aggregaten (totalen). Het daadwerkelijke stemrecord wordt cryptografisch gehasht om je identiteit te scheiden van je politieke keuze.';

  @override
  String get termsP1S2B3Title => 'Gevolgde Wetten & Pushmeldingen:';

  @override
  String get termsP1S2B3Text =>
      'Als je ervoor kiest om een wet te volgen of je te abonneren op een Samengestelde Lijst (Watchlist), gebruiken we Firebase Cloud Messaging (FCM) Topics van Google. Hierdoor kunnen we je pushmeldingen sturen over statuswijzigingen zonder voortdurend je locatie of apparaatidentiteit te volgen.';

  @override
  String get termsP1S2B4Title => 'Bewaartermijn van stemmen:';

  @override
  String get termsP1S2B4Text =>
      'Stemgegevens worden bewaard voor de duur van de zittingstermijn van het parlement plus 5 jaar voor archiverings- en onderzoeksdoeleinden.';

  @override
  String get termsP1S2B5Title => 'Communicatie:';

  @override
  String get termsP1S2B5Text =>
      'Als je expliciet toestemming geeft, sturen we je projectupdates via e-mail. Je kunt deze toestemming op elk moment intrekken.';

  @override
  String get termsP1S2B6Title => 'Burgerprojecten:';

  @override
  String get termsP1S2B6Text =>
      'De inhoud van wetsvoorstellen die door jou worden ingediend, is volledig openbaar.';

  @override
  String get termsP1S2Highlight =>
      '3. WAT WE NIET DOEN:\n\n❌ Wij verkopen GEEN data aan databrokers.\n❌ Wij gebruiken GEEN advertentietracking.\n❌ Wij profileren je NIET politiek voor commerciële doeleinden.';

  @override
  String get termsP1S3Title => '4. Infrastructuur & Veiligheid';

  @override
  String get termsP1S3B1Title => 'Locatie:';

  @override
  String get termsP1S3B1Text =>
      'Data wordt veilig gehost op het Google Cloud Platform, Europe-West9 (Parijs).';

  @override
  String get termsP1S3B2Title => 'Anti-Bot:';

  @override
  String get termsP1S3B2Text =>
      'We gebruiken Firebase App Check om de authenticiteit van de app te verifiëren en geautomatiseerde manipulatie te voorkomen.';

  @override
  String get termsP1S3B3Title => 'AI Privacy:';

  @override
  String get termsP1S3B3Text =>
      'We sturen uitsluitend openbare overheidsdocumenten naar AI-modellen voor samenvattingen. Jouw privégegevens gaan NOOIT naar AI.';

  @override
  String get termsP1S4Title => '5. Kinderen & Account Verwijderen';

  @override
  String get termsP1S4P1 =>
      'De dienst is bedoeld voor gebruikers van 16+. We verzamelen niet bewust gegevens van kinderen.';

  @override
  String get termsP1S4P2 =>
      'Om je data te verwijderen: Gebruik de knop \"Account Verwijderen\" direct in de app-instellingen om je identificerende gegevens, e-mail en al je sub-collecties onmiddellijk van onze servers te wissen.';

  @override
  String get termsP1S5Title => '6. Jouw Rechten';

  @override
  String get termsP1S5Text =>
      'Onder de AVG (GDPR) heb je het recht op toegang, rectificatie, verwijdering en bezwaar tegen de verwerking van je gegevens. Neem contact met ons op via het hierboven vermelde e-mailadres.';

  @override
  String get termsPart2Title => 'Deel 2: Communityregels (Servicevoorwaarden)';

  @override
  String get termsP2S1Title => '1. Operator en Missie';

  @override
  String get termsP2S1Text =>
      'Lustra is een digitale publieke infrastructuur. Het bedrijf fungeert als een incubator: het keert geen dividenden uit, heeft geen externe investeerders en herinvesteert eventuele inkomsten direct terug in het onderhoud van de infrastructuur.';

  @override
  String get termsP2S2Title => '2. Code en Licentie (Source Available)';

  @override
  String get termsP2S2Intro =>
      'De code van Lustra is een gemeengoed dat wordt beschermd tegen exploitatie door bedrijven.';

  @override
  String get termsP2S2B1Title => 'Model:';

  @override
  String get termsP2S2B1Text => 'Open Source (AGPLv3)';

  @override
  String get termsP2S2B2Title => 'Toegestaan:';

  @override
  String get termsP2S2B2Text =>
      'Educatief, onderzoeks-, en non-profit/maatschappelijk gebruik.';

  @override
  String get termsP2S2B3Title => 'Verboden:';

  @override
  String get termsP2S2B3Text =>
      'Bedrijven mogen ons werk niet gebruiken of er profijt uit trekken zonder expliciete toestemming van de community.';

  @override
  String get termsP2S3Title => '3. Roadmap voor Governance';

  @override
  String get termsP2S3Intro =>
      'Ons langetermijndoel is volledige decentralisatie.';

  @override
  String get termsP2S3B1Title => 'Huidige staat:';

  @override
  String get termsP2S3B1Text => 'De Oprichter fungeert als Hoofdarchitect.';

  @override
  String get termsP2S3B2Title => 'Binnenkort:';

  @override
  String get termsP2S3B2Text =>
      'Oprichting van een Burgerraad (Civic Board), direct gekozen door de gebruikers.';

  @override
  String get termsP2S3B3Title => 'Doel:';

  @override
  String get termsP2S3B3Text =>
      'Implementatie van technische en juridische mechanismen zodat de community de controle over het platform kan overnemen in het geval van verraad aan de missie.';

  @override
  String get termsP2S4Title =>
      '4. Programma voor Burgerwetsvoorstellen (Wet-Incubator)';

  @override
  String get termsP2S4Intro =>
      'Wij bieden een ruimte voor burgers om de wetten te schrijven.';

  @override
  String get termsP2S4B1Title => 'Procedure:';

  @override
  String get termsP2S4B1Text =>
      'Concepten worden ingediend via een formulier en formeel geverifieerd door de Operator.';

  @override
  String get termsP2S4B2Title => 'Publiek Domein:';

  @override
  String get termsP2S4B2Text =>
      'Door een wetsvoorstel in te dienen, geef je het vrij onder de CC0-licentie (Publiek Domein). Het recht behoort aan iedereen toe.';

  @override
  String get termsP2S4B3Title => 'Vrijheid van Meningsuiting:';

  @override
  String get termsP2S4B3Text =>
      'Wij oordelen niet over meningen of politieke voorkeuren. We wijzen alleen projecten af die het strafrecht schenden of aanzetten tot geweld.';

  @override
  String get termsP2S4B4Title => 'Verificatie:';

  @override
  String get termsP2S4B4Text =>
      'Je moet staatsburger zijn van het land waar je een wetsvoorstel indient.';

  @override
  String get termsP2S5Title => '5. AI en Bronhiërarchie';

  @override
  String get termsP2S5Text =>
      'AI is een hulpmiddel, geen orakel. AI helpt bij het navigeren door complexe juridische taal, maar kan fouten maken. De ultieme autoriteit is ALTIJD het originele PDF/XML-document waarnaar onderaan elke samenvatting in de app wordt gelinkt.';

  @override
  String get termsP2S6Title => '6. Veiligheid & Slotbepalingen';

  @override
  String get termsP2S6Text =>
      'Aanvallen op de infrastructuur, DDoS en commerciële scraping zijn ten strengste verboden. Zaken die hierin niet zijn geregeld, vallen onder de Poolse wetgeving.';

  @override
  String get bpAppBar => 'Systeemarchitectuur';

  @override
  String get bpTitle =>
      'Hoe we Regie in de Democratie Terugpakken met het Spiegelparlement: Handboek voor Burgers';

  @override
  String get bpIntroBig =>
      'Het Grote Plaatje: Het huidige democratische systeem is een kapotte \"telefoon-game\" (doorfluistertje). We repareren het signaal door burgers via het Spiegelparlement (Lustra) direct aan te sluiten op het wetgevingsproces.';

  @override
  String get bpIntroSmall =>
      'Waarom het belangrijk is: Momenteel stemmen we maar eens in de paar jaar. Tussen verkiezingen door hebben we nul controle. Lustra geeft ons elke dag een \"stoel aan tafel\".';

  @override
  String get bpS1Title => '1. HET PROBLEEM: Een Doorbroken Keten';

  @override
  String get bpS1P1 => 'Informatie stroomt één kant op en raakt vervormd.';

  @override
  String get bpS1Code =>
      'Burgers kiezen politici\n   ↓\nPolitici vormen een Regering\n   ↓\nMedia interpreteren selectief regeringsacties\n   ↓\nBurgers krijgen feedback (vervormd)';

  @override
  String get bpS1Highlight =>
      'Resultaat: We weten door juridisch jargon en mediaruis niet wat er echt gebeurt.';

  @override
  String get bpS2Title => '2. OPLOSSING: De Informatiestroom Repareren';

  @override
  String get bpS2P1 =>
      'Lustra verwijdert de tussenpersonen. Het simuleert een echt machtscentrum waar je stem wordt vastgelegd over specifieke wetsvoorstellen, niet zomaar algemene peilingen.';

  @override
  String get bpS2FlowMedia => 'MEDIA (optionele waarnemer)';

  @override
  String get bpS2Flow1 => 'Burgers zien een conceptwet & beoordelen deze';

  @override
  String get bpS2Flow2 => 'Politici zien het resultaat van de burgerwil';

  @override
  String get bpS2Flow3 => 'Politici stemmen (gemonitord tegen de data)';

  @override
  String get bpS2Flow4 =>
      'Burgers controleren: Heeft de politicus naar de data geluisterd?';

  @override
  String get bpS2Flow5 =>
      'Burgers kiezen politici op basis van hun \"Gehoorzaamheidsscore\" (Obedience Score)';

  @override
  String get bpS2Flow6 => 'Er wordt een nieuwe Regering gevormd.';

  @override
  String get bpS2FlowLoop => 'CYCLUS HERHAALT ZICH';

  @override
  String get bpS3Title => '3. HOE HET WERKT';

  @override
  String get bpS3ATitle => 'Stap A: De Taalbarrière Slechten (Vertaling)';

  @override
  String get bpS3AP1 =>
      'De meeste wetten zijn saai en onleesbaar. Lustra repareert de Toegankelijkheidskloof.';

  @override
  String get bpS3AP2 =>
      'Voordeel: 20 seconden om de feiten te begrijpen. Geen jargon.';

  @override
  String get bpS3BTitle => 'Stap B: Kennisdistributie (De Fact Card)';

  @override
  String get bpS3BP1 =>
      'Lustra heeft geen miljoenen gebruikers nodig om te werken. Het is genoeg dat Jij er bent.';

  @override
  String get bpS3BList1Title => 'Jouw actie:';

  @override
  String get bpS3BList1Text =>
      'Je komt binnen, ziet een onderwerp en genereert met één klik een Fact Card.';

  @override
  String get bpS3BList2Title => 'Bereik:';

  @override
  String get bpS3BList2Text =>
      'Automatisch delen op je sociale media (FB, X, IG, etc.).';

  @override
  String get bpS3BList3Title => 'Effect:';

  @override
  String get bpS3BList3Text =>
      'Je vrienden krijgen een gefactcheckte \"kant-en-klare maaltijd\" zonder de app te hoeven hebben. Je wordt een onafhankelijke informatiebron.';

  @override
  String get bpS3BExample => 'Voorbeeld:';

  @override
  String get bpS3CTitle => 'Stap C: Regie Terugpakken (De Druk)';

  @override
  String get bpS3CP1 =>
      'Politici en bedrijven negeren \"internetstormen\" omdat ze chaotisch zijn, makkelijk te censureren en snel weer verdwijnen.';

  @override
  String get bpS3CList1Title => 'Oplossing:';

  @override
  String get bpS3CList1Text =>
      'Geverifieerde Sociale Peilingen. Je stem is gekoppeld aan een specifieke, officiële document-ID.';

  @override
  String get bpS3CList2Title => 'Verschil:';

  @override
  String get bpS3CList2Text =>
      'Dit zijn geen petities die verlopen. Dit zijn harde handtekeningen van geverifieerde accounts.';

  @override
  String get bpS3CP2 =>
      'Als 50.000 mensen tegen een wet stemmen, ontstaat er hard bewijs van een gebrek aan maatschappelijke steun. Dit kan niet worden \"toegedekt\" door een tv-narratief.';

  @override
  String get bpS4Title => '4. BURGEROFFENSIEF: Wij Schrijven de Wetten';

  @override
  String get bpS4P1 => 'Negeert de regering een probleem? Wij wachten niet.';

  @override
  String get bpS4List1Title => 'Burgerwetsvoorstellen:';

  @override
  String get bpS4List1Text =>
      'We maken onze eigen wetsvoorstellen en verzamelen digitale handtekeningen.';

  @override
  String get bpS4List2Title => 'De Valstrik:';

  @override
  String get bpS4List2Text =>
      'Als ze een populaire wet op technische gronden afwijzen, passen we amendementen toe en dienen we hem opnieuw in.';

  @override
  String get bpS4List3Title => 'De Keuze:';

  @override
  String get bpS4List3Text =>
      'Het negeren van een kant-en-klare, populaire oplossing bewijst kwade trouw. Het geeft de oppositie een gratis wapen om het electoraat over te nemen.';

  @override
  String get bpS4CtaTitle => 'Steun deze Burgerwetsvoorstellen NU!';

  @override
  String get bpS4CtaP1 =>
      'Klik hieronder om voorgestelde wetgeving te beoordelen en erop te stemmen:';

  @override
  String get bpS4Card1Title => 'Epstein-klasse Financieringsstop Wet';

  @override
  String get bpS4Card1Desc =>
      'Snijdt publieke financiering af voor figuren die betrokken zijn bij mensenhandel en mensenrechtenschendingen.';

  @override
  String get bpS4Card2Title => 'Amendement voor Ambtstermijnlimieten';

  @override
  String get bpS4Card2Desc =>
      'Stelt een strikte limiet in op de lengte van een carrière in het Parlement.';

  @override
  String get bpS4Card3Title => 'Wet op Parlementaire Ethiek';

  @override
  String get bpS4Card3Desc =>
      'Implementeert een verbod op aandelenhandel voor actieve parlementsleden.';

  @override
  String get bpS5Title => '5. EINDRESULTAAT: Politieke Zuivering';

  @override
  String get bpS5P1 =>
      'Geen verstoppertje meer. Het debat keert terug naar waar de mensen zijn: naar sociale media, maar dan met nieuwe regels. Dit is de vervulling van de oorspronkelijke belofte van het internet waar het systeem bang voor was: gedecentraliseerde controle over de macht.';

  @override
  String get bpS5P2 =>
      'Het Spiegelparlement doet het licht aan in een donkere kamer, we dwingen TRANSPARANTIE af. Een politicus kan niet liegen dat \"de mensen dit willen\" als de data iets anders laat zien. Nieuwe wetten dienen het algemeen publiek, niet het kapitaal.';

  @override
  String get bpS5P3 =>
      'We vragen politici niet om te veranderen. We creëren een systeem waarin liegen over publieke steun onmogelijk wordt. Dit is een datagestuurde democratie.';

  @override
  String get bpS5Highlight =>
      'Dit is een introductie tot directe democratie, gebaseerd op een bewuste, geïnformeerde stem en niet op emoties.';

  @override
  String get caAppBar => 'Burger-Audit';

  @override
  String get caTitle =>
      'Burger-Audit: Nieuw Systeem voor een Betere Democratie';

  @override
  String get caIntro =>
      'Niemand evalueert het wetgevingsproces behalve een paar mensen achter gesloten deuren en af en toe een onafhankelijke journalist die corruptie blootlegt. Als gevolg daarvan raakt wetgeving vaak losgekoppeld van de behoeften van de burger, waarbij politieke of zakelijke belangen prioriteit krijgen boven maatschappelijke aanpassing. Ons einddoel is simpel: een samenleving die stemt over daadwerkelijk beleid, in plaats van alleen maar individuele politici te kiezen in de hoop dat ze hun beloften nakomen. Het Spiegelparlement is gebouwd om deze overgang makkelijk en haalbaar te maken.';

  @override
  String get caS1Title => 'Hoe verschilt de Burger-Audit van Petities?';

  @override
  String get caS1PetitionsTitle => 'Traditionele Petities';

  @override
  String get caS1PetitionsText =>
      'Petities werken zelden vanwege hun vluchtige aard. Na het verzamelen van handtekeningen eindigt de campagne. Het is in wezen een beleefd verzoek aan een persoon met macht. Omdat dit tijdsgebonden campagnes zijn die afhankelijk zijn van een korte mediacyclus, kunnen politici ze makkelijk negeren. Ze wachten gewoon tot de media het narratief veranderen, en de petitie is vergeten.';

  @override
  String get caS1LustraTitle => 'Lustra Burgerwil';

  @override
  String get caS1LustraText =>
      'Wij vragen niet. In Lustra is je stem niet zomaar een handtekening - hij is permanent verankerd aan een harde, officiële wetgevings-ID. Het markeert jouw exacte standpunt over specifiek beleid. Al deze stemmen vormen samen de Burgerwil (Civic Will): een real-time meter die precies laat zien hoe burgers een project beoordelen, en zo de lus van de Burger-Audit sluit.';

  @override
  String get caS2Title => 'Waarom zou dit Politici Iets Schelen?';

  @override
  String get caS2Text =>
      'Omdat ze zich niet meer kunnen verstoppen.\n\nWe leggen elke officiële stemming in de regering vast en benchmarken deze direct met de Burgerwil. Ze kunnen niet meer liegen dat \"de mensen dit willen\" alleen omdat ze een slimme mediacampagne hebben gevoerd. Als ze stemmen over iets dat een lobbygroep ten goede komt in plaats van burgers, komen we daar direct achter. Hoe meer mensen Lustra gebruiken om deze hiaten bloot te leggen, hoe moeilijker het wordt voor politici om het narratief te manipuleren. We pakken de controle terug.';

  @override
  String get caS3Title => 'Het Mooiste Deel: Asymmetrische Macht';

  @override
  String get caS3P1 =>
      'We hebben traditionele media niet nodig zoals lobbyisten dat hebben. We hebben niet eens 5 miljoen gebruikers in de app nodig om de democratie te updaten. We hebben alleen jou nodig.\n\nJe hebt al bereik buiten Lustra: op Facebook, TikTok, X of elders. We kunnen van sociale media eindelijk iets zinvols maken. Eén gebruiker die een wet deelt, kan met vrijwel geen moeite gemakkelijk 100-1.000 weergaven genereren. Dat is een klein stadion aan mensen dat leert over een cruciaal stuk wetgeving of een burgerinitiatief.';

  @override
  String get caS3MathSubtitle => 'WISKUNDE VAN ASYMMETRISCHE OORLOGSVOERING';

  @override
  String get caS3P2 =>
      'Denk aan de wiskunde: een actieve zakelijke denktank of lobbygroep bestaat misschien uit 10-15 mensen met geld als enige hefboom om politieke gunsten te kopen. Jullie 10.000 geverifieerde stemmen van echte burgers kunnen hen overmeesteren. We kunnen precies doen wat lobbyisten doen, maar dan sneller, transparant en met overweldigende aantallen. De tijden zijn veranderd.';

  @override
  String get caS4Title => 'Wie Bepaalt de Feed? Jij.';

  @override
  String get caS4Text =>
      'Traditionele media en Big Tech algoritmes optimaliseren voor verontwaardiging om advertenties te verkopen. Het algoritme van Lustra is strikt democratisch. Wij hebben geen redacteuren die bepalen wat \"belangrijk\" is. Onze hoofdfeed evalueert automatisch de laatste 30 dagen aan wetgeving, isoleert de top 5 wetten met de hoogste burgerbetrokkenheid en roteert deze in de spotlight. Jullie stemmen bepalen de informatiehiërarchie. Jij beheert het algoritme.';

  @override
  String get caS5Title => 'Het Arsenaal: Hoe gebruik je \"Fact Cards\"';

  @override
  String get caS5Intro =>
      'Wetgeving is met opzet saai. Het is nooit bedoeld geweest voor het grote publiek. Daarom creëren de media er emotionele narratieven omheen om advertenties te verkopen. Jij kunt ook narratieven creëren - maar de jouwe zullen gebouwd zijn op ruwe, samengevatte, geverifieerde data.\n\nLustra produceert Fact Cards (Feitenkaarten). Elke keer dat je op \"Delen\" klikt, wordt er een strakke afbeelding gegenereerd op basis van officiële data. Op zichzelf is het slechts een feit. Op sociale media moeten feiten worden uitgelegd. Jij bent degene die het uitlegt. Hier is exact hoe je ze gebruikt om virale content met grote impact te creëren:';

  @override
  String get caS5A_Title => 'A/ De Hook (Creëer de Invalshoek)';

  @override
  String get caS5A_Text =>
      'De makkelijkste optie is meestal de meest herkenbare. Heb je een nieuwe Internetcensuurwet in de app gevonden? Maak het niet te ingewikkeld. Creëer een sterke kop (een \"hook\"), vertel de mensen precies hoe het hen raakt en drop de directe link naar Lustra zodat ze kunnen stemmen.';

  @override
  String get caS5B_Title => 'B/ Het Bewijs (Voor Essays & Threads)';

  @override
  String get caS5B_Text =>
      'Afbeeldingen zijn geweldige toevoegingen aan langere posts of threads. Wil je kritieke fouten in een wetsvoorstel aankaarten of de officiële samenvatting van de regering confronteren? Voeg de Fact Card toe als onweerlegbaar bewijs. Laat mensen de steriele data zelf in 15 seconden lezen.';

  @override
  String get caS5C_Title => 'C/ De Uitzending (TikTok/Reels)';

  @override
  String get caS5C_Text =>
      'Gebruik de afbeelding van de Fact Card met een \"green screen\"-effect op TikTok of Instagram. Zet de data van Lustra op de achtergrond en neem jezelf op terwijl je de kwestie uitlegt. Het is de perfecte, verifieerbare short-form content.';

  @override
  String get caS5D_Title => 'D/ Het Netwerk (Direct Messaging)';

  @override
  String get caS5D_Text =>
      'Klik simpelweg op delen en stuur de afbeelding rechtstreeks naar je vrienden en familiegroepen. Vertel ze duidelijk: \"Dit is wat er momenteel gaande is in de regering\", of \"Dit is waar de media nu over zwijgen.\"';

  @override
  String get caS5Outro =>
      'Contentproductie is makkelijk, en Lustra is je ontdekkingsmachine. Je bent niet zomaar een gebruiker. Je bent een early adopter van het nieuwe tijdperk van democratie vrij van corruptie. Je hebt dezelfde tools als een lobbyist – gebruik ze.';

  @override
  String get caSkepticTitle => 'Sceptisch over botfarms of dataprivacy?';

  @override
  String get caSkepticText =>
      'Goed. Vertrouw niet op onze woorden - audit ons systeem. Lees precies hoe we cryptografische hashing, Firebase App Check en de Open Source (AGPLv3) Licentie gebruiken om jouw identiteit en de integriteit van de Burgerwil te beschermen.';

  @override
  String get caSkepticBtnGov => 'Transparantie & Governance';

  @override
  String get caSkepticBtnPriv => 'Grondwet & Privacy';

  @override
  String get clAppBar => 'Watchlists';

  @override
  String get clTitle => 'Gecureerde Watchlists: Gedecentraliseerde Burgermedia';

  @override
  String get clIntro =>
      'Regeringen gebruiken de enorme hoeveelheid wetgeving als wapen. Ze nemen honderden pagina\'s aan complexe wetten aan, begraven controversiële wetgeving vaak achter saaie titels of sluizen ze via de \"achterdeur\" naar binnen terwijl de media afgeleid is door het nieuwste politieke schandaal. Burgers verliezen het grotere plaatje uit het oog omdat het fysiek onmogelijk is om alles alleen te monitoren.';

  @override
  String get clS1Title => 'Patroonherkenning & Massamobilisatie';

  @override
  String get clS1P1 =>
      'Met Gecureerde Watchlists kun je de chaos organiseren en als onafhankelijk informatieknooppunt optreden. Je kunt officiële regeringswetten mixen met basis burgerprojecten, ze groeperen op specifieke onderwerpen en anderen uitnodigen om zich te abonneren.';

  @override
  String get clS1P2 =>
      'Cruciaal is dat een Watchlist werkt als een vermenigvuldiger voor de Burger-Audit. Je verzamelt niet alleen steun voor één geïsoleerde wet. Door tot 80 items te groeperen, wordt je lijst een toegewijde, gefocuste feed voor je volgers. Ze kunnen je lijst openen en hun stem uitbrengen op meerdere wetten in één sessie, waardoor er massaal harde data en Burgerwil wordt gegenereerd voor een hele beleidssector.';

  @override
  String get clS2Title => 'Hoe gebruik je Watchlists als Wapen:';

  @override
  String get clS2A_Title => 'Overheidswaakhonden';

  @override
  String get clS2A_Text =>
      'Merk je dat de regering stilletjes een reeks techwetten probeert door te drukken die de privacy schenden? Groepeer ze in een \"Digitale Surveillance Watchlist\". Laat je abonnees de verborgen agenda zien die de media heeft gemist en laat ze op één plek tegen ze allemaal stemmen. Vraag ze om het te versterken door het te delen.';

  @override
  String get clS2B_Title => 'Platform voor Hervorming';

  @override
  String get clS2B_Text =>
      'Klaag niet alleen over de economie. Bouw een complete, uit meerdere wetten bestaande \"Economische Hervormingslijst\" die je eigen burgerprojecten mixt met officiële amendementen. Presenteer een volledig gestructureerd politiek platform.';

  @override
  String get clS2C_Title => 'In de Spotlight';

  @override
  String get clS2C_Text =>
      'Je kunt een specifieke wet als \"Favoriet\" op je lijst vastzetten om maximale burgeraandacht en stemkracht precies daarheen te leiden waar dat het hardst nodig is.';

  @override
  String get clS3Title =>
      'Het Mooiste Deel: Jij Bent de Eigenaar van de Uitzending';

  @override
  String get clS3Text =>
      'Social media algoritmes onderdrukken constant externe links om gebruikers te laten scrollen. Lustra omzeilt dit. Wanneer mensen zich abonneren op jouw Watchlist, omzeil je Big Tech volledig. Je krijgt een handmatige \"Push\"-knop. Eens in de 24 uur kun je een directe mobiele notificatie sturen naar al je abonnees, om ze te waarschuwen je lijst te checken omdat er een cruciale stemming plaatsvindt of een nieuwe wet is toegevoegd. Jij beheert de distributie.';

  @override
  String get clS4Title => 'De Creator Economy voor Democratie';

  @override
  String get clS4Text =>
      'Goede curatie is extreem waardevol. Het filteren van politieke ruis kost tijd en expertise. Daarom stelt Lustra je in staat om je persoonlijke Fooienpot (Tip Jar) direct aan je Watchlist te koppelen. Als jij het zware werk doet om de regering te monitoren en het publiek voor te lichten, kunnen je abonnees je inspanningen direct financieren. Wij pakken geen commissie.';

  @override
  String get clS5Title => 'Implementatie: Hoe te Beginnen';

  @override
  String get clS5Intro =>
      'Dit is geen passieve feature. Je moet het actief opbouwen. Hier is de exacte instructie om je eerste Watchlist uit te rollen:';

  @override
  String get clStep1Title => 'Stap 1: Initialiseren';

  @override
  String get clStep1Text =>
      'Navigeer naar het hoofdscherm en klik op het Tandwiel-icoon (Instellingen) in de bovenhoek. Selecteer de optie om je eerste Watchlist te maken. Geef het een duidelijke titel.';

  @override
  String get clStep2Title => 'Stap 2: Curator Modus';

  @override
  String get clStep2Text =>
      'Zodra je lijst is geïnitialiseerd, geeft het systeem je de status van Curator. Blader nu door de hoofdfeed. In het detailscherm van elke wet of burgerproject verschijnt een nieuwe knop \"Aan lijst toevoegen\". Klik erop om die specifieke wet direct in je lijst te injecteren.';

  @override
  String get clStep3Title => 'Stap 3: Feed Injectie';

  @override
  String get clStep3Text =>
      'Je Watchlist overspoelt de hoofdfeed niet. In plaats daarvan fungeert de ene wet die je als \"Favoriet\" hebt geselecteerd als je ambassadeur. Deze ene kaart wordt direct geïnjecteerd in de dagelijkse feed van je abonnees, naadloos verweven met officiële overheidswetgeving. Het wordt met exact dezelfde prioriteit weergegeven als officiële overheidswetten. We plaatsen burgerlijk toezicht op gelijke voet met de staat.';

  @override
  String get clLimitsTitle => 'SYSTEEMLIMIETEN (SIGNAAL BOVEN RUIS)';

  @override
  String get clLimit1Label => 'AUTEURSVERMELDING';

  @override
  String get clLimit1Desc =>
      'Max actieve lijsten per regering (Je kunt ze op elk moment verwijderen en nieuwe uitrollen).';

  @override
  String get clLimit2Label => 'CAPACITEIT';

  @override
  String get clLimit2Desc =>
      'Max wetten per lijst (Meer dan genoeg om een patroon bloot te leggen, strikt genoeg om informatie-overload te voorkomen).';

  @override
  String get clLimit3Label => 'ABONNEMENTEN';

  @override
  String get clLimit3Desc =>
      'Max lijsten die je kunt volgen van andere creators.';

  @override
  String get clOutro =>
      'Lustra is geen sociaal netwerk dat gratis algoritmisch bereik genereert voor jouw lijst. Watchlists werken alleen op uitnodiging. Je moet je unieke link extern delen. Haal je publiek van X, YouTube, TikTok of je nieuwsbrief. Wij geven je geen volgers; wij geven je de infrastructuur om je bestaande volgers om te zetten in een geverifieerde, stemmende burgerkracht - en een manier om direct gefinancierd te worden voor je harde werk. Stop met je publiek om \"likes\" te vragen. Geef ze een tool om in actie te komen.';

  @override
  String get supportFundTitle => 'Fase 1: Oprichting Non-Profit Entiteit';

  @override
  String get supportFundDesc =>
      'Om de Lustra Foundation officieel op te richten, het intellectueel eigendom te beschermen en de juridische opstartkosten te dekken, moeten we startkapitaal verzamelen. Help ons dit systeem voor altijd onafhankelijk te maken.';

  @override
  String get supportFundDisclaimer =>
      'Datatransparantie: Vanwege verschillende betalingsgateways en infrastructuurkosten wordt deze voortgangsbalk handmatig bijgewerkt door de oprichter (max. één keer per week).';

  @override
  String get actionSyncViaQr => 'Toon QR-code';

  @override
  String get actionHideQr => 'Verberg QR-code';

  @override
  String get promoGuestTrackBills =>
      'Volg wetgeving en ontvang meldingen over nieuwe stemmingen en wetten.';

  @override
  String get promoGetAppForNotifications =>
      'Download de mobiele app voor betere prestaties en meldingen over uw gevolgde wetsvoorstellen.';
}

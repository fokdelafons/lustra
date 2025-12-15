// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get errorFailedToLoadData => 'Fehler beim Laden der Daten';

  @override
  String get errorNoData => 'Keine Daten zum Anzeigen.';

  @override
  String get noData => 'Keine Daten';

  @override
  String get noDate => 'Kein Datum';

  @override
  String get shareAction => 'Teilen';

  @override
  String get loginAction => 'Anmelden';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsChangeLanguage => 'Sprache ändern';

  @override
  String get settingsLogout => 'Abmelden';

  @override
  String get tryAgainButton => 'Erneut versuchen';

  @override
  String get moreButton => '... Mehr';

  @override
  String get seeDetailsLink => 'Details ansehen ->';

  @override
  String get bottomNavHome => 'Startseite';

  @override
  String get bottomNavInfo => 'Informationen';

  @override
  String get bottomNavSupport => 'Unterstützen';

  @override
  String get bottomNavFutureFeatures => 'Zukünftige Funktionen';

  @override
  String termLabel(String termNumber) {
    return 'Amtszeit: $termNumber';
  }

  @override
  String termMenuItem(int termNumber, String termYears) {
    return 'Amtszeit $termNumber $termYears';
  }

  @override
  String get errorNoDataForTerm =>
      'Für die ausgewählte Amtszeit sind keine Daten verfügbar.';

  @override
  String get sectionPopularVotes => 'Beliebte Abstimmungen';

  @override
  String get sectionUpcoming => 'Demnächst';

  @override
  String get sectionLegislationInProcess => 'Gesetzgebung im Gange';

  @override
  String get sectionMpProfiles => 'Abgeordnetenprofile';

  @override
  String get buttonBrowseVotes => 'Abstimmungs-Browser';

  @override
  String get buttonScheduledMeetings => 'Geplante Sitzungen';

  @override
  String get buttonBillsInProgress => 'Laufende Gesetze';

  @override
  String get buttonAllMps => 'Alle Abgeordneten';

  @override
  String get buttonCheckProfile => 'Profil ansehen';

  @override
  String get errorNoDeputiesData => 'Keine Daten über Abgeordnete.';

  @override
  String get errorNoDataLastVote => 'Keine Daten über die letzte Abstimmung.';

  @override
  String get errorNoDataUpcomingVote =>
      'Keine Daten über die bevorstehende Abstimmung.';

  @override
  String get errorNoSummaryLastVote =>
      'Keine Zusammenfassung für die letzte Abstimmung.';

  @override
  String get errorNoSummaryUpcomingVote =>
      'Keine Zusammenfassung für die bevorstehende Abstimmung.';

  @override
  String get errorNoDataLegislationInProcess =>
      'Keine Daten über laufende Gesetzgebung.';

  @override
  String get errorNoSummaryLegislationInProcess =>
      'Keine Zusammenfassung für laufende Gesetzgebung.';

  @override
  String get keyPoints => 'Wichtige Punkte';

  @override
  String get noKeyPoints => 'Keine wichtigen Punkte';

  @override
  String get votingResultsTitle => 'ABSTIMMUNGS­ERGEBNISSE';

  @override
  String get labelFor => 'Dafür:';

  @override
  String get labelAgainst => 'Dagegen:';

  @override
  String get labelAbstained => 'Enthaltungen:';

  @override
  String get noStatusInfo => 'Keine Statusinformationen';

  @override
  String scheduledMeetingDate(String date) {
    return 'Geplante Sitzung: $date';
  }

  @override
  String get noScheduledMeetingDate => 'Kein geplantes Sitzungsdatum';

  @override
  String processStartDate(String date) {
    return 'Beginn des Verfahrens: $date';
  }

  @override
  String get noProcessStartDate => 'Kein Startdatum des Verfahrens';

  @override
  String mpDistrict(String districtNumber) {
    return 'Wahlkreis: $districtNumber';
  }

  @override
  String get actionCollapse => 'Einklappen';

  @override
  String get actionExpand => 'Mehr anzeigen...';

  @override
  String get votingFor => 'Dafür';

  @override
  String get votingAgainst => 'Dagegen';

  @override
  String get votingAbstainShort => 'Enth.';

  @override
  String get citizenPollTitle => 'Bürgerumfrage';

  @override
  String get pollTemporarilyUnavailable =>
      'Umfrage vorübergehend nicht verfügbar. Bitte versuchen Sie es später erneut.';

  @override
  String get errorDisplayingPollBar =>
      'Fehler bei der Anzeige der Umfrageergebnisse.';

  @override
  String get pollNoForAgainstVotes => 'Keine Dafür-/Dagegen-Stimmen';

  @override
  String get pollNoVotesCast => 'Keine Stimmen abgegeben';

  @override
  String pollTotalVotes(int count) {
    return 'Abgegebene Stimmen: $count';
  }

  @override
  String get pollSupport => 'Ich unterstütze';

  @override
  String get pollDontSupport => 'Ich unterstütze nicht';

  @override
  String get loginToVote => 'Zum Abstimmen anmelden';

  @override
  String get dialogChooseLanguage => 'Sprache wählen';

  @override
  String get dialogCancel => 'Abbrechen';

  @override
  String get infoScreenTitle => 'Informationen';

  @override
  String get infoTitle1 => 'Politik von den Medien trennen';

  @override
  String get infoParagraph1 =>
      'Lustra ist eine Anwendung zur Verfolgung der Politik anhand offizieller Daten. Mit KI-Technologie werden Zusammenfassungen von Gesetzen und Abstimmungsergebnissen prägnant, klar und unparteiisch dargestellt. Die Politik zu verfolgen erfordert keinen Aufwand oder Zeit mehr - nur ein paar Klicks.';

  @override
  String get infoTitle2 => 'Gemeinsame Interessen über Spaltungen hinweg';

  @override
  String get infoParagraph2 =>
      'Als Gesellschaft teilen wir gemeinsame Ziele wie Freiheit, Sicherheit und Wohlstand. Meinungsverschiedenheiten sind ein natürlicher Teil der Demokratie - sie gestalten die Debatte und ermöglichen unterschiedliche Perspektiven. Mit Zugang zu verlässlichen Informationen können wir fundiertere Entscheidungen treffen und am öffentlichen Leben auf der Grundlage von Fakten teilnehmen, nicht von Emotionen oder Medienerzählungen.';

  @override
  String get infoTitle3 => 'Taten, nicht Worte';

  @override
  String get infoParagraph3 =>
      'Sie müssen sich nicht mehr auf Wahlversprechen verlassen - Sie können die Abstimmungshistorie einzelner Abgeordneter einsehen und ihre Entscheidungen analysieren. Das Profil jedes Politikers enthält eine Aufzählung, die eine schnelle und unabhängige Bewertung seiner Bilanz ermöglicht. Die vollständige Arbeitshistorie wird mit der Entwicklung der Anwendung erweitert.';

  @override
  String get infoTitle4 => 'Menschen, nicht Parteien';

  @override
  String get infoParagraph4 =>
      'Abgeordnete sollten die Interessen ihrer Wähler berücksichtigen und nicht nur nach Parteilinie abstimmen. Das Parteiensystem spaltet die Gesellschaft, aber alles kann in kleinen Schritten geändert werden. Der erste ist das öffentliche Bewusstsein. Nutzen Sie die App, sprechen Sie, teilen Sie Abstimmungen, nehmen Sie an Umfragen teil und bleiben Sie informiert. Politik betrifft fast jeden Aspekt unseres Lebens, daher gibt es keinen Grund, dass die Wenigen über alles entscheiden.';

  @override
  String get linkHowTechnologyWorks => 'Wie funktioniert die Technologie?';

  @override
  String get linkTermsAndPrivacy => 'AGB und Datenschutzrichtlinie';

  @override
  String get supportScreenTitle => 'Das Projekt unterstützen';

  @override
  String get supportParagraph1 =>
      'Lustra ist mein persönliches Pro-Bono-Projekt. Die Anwendung wird immer kostenlos sein, ohne kostenpflichtige Funktionen, Erweiterungen, Anzeigen oder Einschränkungen. Ich glaube, jeder sollte uneingeschränkten Zugang zu zugänglichen Informationen haben - ohne meinungsbildende Kommentare oder Filter. Wenn Sie mit der Mission einverstanden sind, ermutige ich Sie, sie mit einer Spende in beliebiger Höhe zu unterstützen. Jeder Beitrag, egal wie klein, hilft mir, die App zu pflegen und weiterzuentwickeln.';

  @override
  String get buttonSupportFinancially => 'Finanziell unterstützen';

  @override
  String get supportThankYou =>
      'Danke für Ihr Vertrauen und jede Form des Engagements';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Anwendungsersteller';

  @override
  String get leaderboardTitle => 'Top-Spender (Letzter Monat)';

  @override
  String get futureFeaturesScreenTitle => 'Zukünftige Funktionen';

  @override
  String get futureFeaturesHeader => 'Geplante Funktionalitäten';

  @override
  String get futureFeatureReferendum => 'Einberufung eines Referendums';

  @override
  String get futureFeatureSenate => 'Senat und Senatoren';

  @override
  String get futureFeatureCitizenInitiative =>
      'Bürgerinitiative - Gesetzesentwürfe';

  @override
  String get futureFeatureIndependentCandidates =>
      'Unabhängige Kandidaten für das Parlament';

  @override
  String get futureFeaturePetitions => 'Petitionen an das Parlament';

  @override
  String get comingSoon => 'Demnächst';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Abgeschlossen - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Daten aktualisieren';

  @override
  String get advancedSearchHint => 'Erweiterte Suche...';

  @override
  String get filterTypeLabel => 'Typ: ';

  @override
  String get filterStatusLabel => 'Status: ';

  @override
  String get allOption => 'Alle';

  @override
  String get errorFetchData =>
      'Daten konnten nicht abgerufen werden. Bitte versuchen Sie es erneut.';

  @override
  String get emptyListFilterMessage =>
      'Keine Gesetze gefunden, die den ausgewählten Kriterien entsprechen.';

  @override
  String get emptyListDefaultMessage =>
      'Für diese Quelle sind keine abgeschlossenen Gesetze anzuzeigen.';

  @override
  String get searchDialogTitle => 'Suchen und Filtern';

  @override
  String get searchDialogHint => 'Suchbegriff eingeben...';

  @override
  String get searchDialogTimePeriodLabel => 'Zeitraum';

  @override
  String get searchDialogSearchButton => 'Suchen';

  @override
  String get searchDialogSelectDateRange => 'Bereich auswählen';

  @override
  String get searchDialogDateRangePickerHelp =>
      'Wählen Sie einen Datumsbereich';

  @override
  String get searchDialogDateRangePickerCancel => 'ABBRECHEN';

  @override
  String get searchDialogDateRangePickerConfirm => 'OK';

  @override
  String get searchDialogDateRangePickerSave => 'SPEICHERN';

  @override
  String get timePeriodLastWeek => 'Letzte Woche';

  @override
  String get timePeriodLastMonth => 'Letzter Monat';

  @override
  String get timePeriodLast3Months => 'Letzte 3 Monate';

  @override
  String get timePeriodLastYear => 'Letztes Jahr';

  @override
  String get timePeriodAll => 'Gesamter Zeitraum';

  @override
  String get timePeriodCustom => 'Benutzerdefinierter Bereich';

  @override
  String get categoryAll => 'Alle';

  @override
  String get categoryHealth => 'Gesundheit';

  @override
  String get categoryFamily => 'Familie';

  @override
  String get categoryTaxes => 'Steuern';

  @override
  String get categoryMigration => 'Migration';

  @override
  String get categoryLabor => 'Arbeit';

  @override
  String get categorySecurity => 'Sicherheit';

  @override
  String get categoryEducation => 'Bildung';

  @override
  String get categoryEnvironment => 'Umwelt';

  @override
  String get categoryCourtsAndLaw => 'Gerichte und Recht';

  @override
  String get categoryTransport => 'Verkehr';

  @override
  String get categoryBenefits => 'Sozialleistungen';

  @override
  String get categoryRealEstate => 'Immobilien';

  @override
  String get categoryMediaAndCulture => 'Medien und Kultur';

  @override
  String get categoryLocalGovernment => 'Lokale Verwaltung';

  @override
  String get categoryAgriculture => 'Landwirtschaft';

  @override
  String get categoryPublicInvestments => 'Öffentliche Investitionen';

  @override
  String get categoryInformatization => 'Informatisierung';

  @override
  String get categoryEconomy => 'Wirtschaft';

  @override
  String get categoryOther => 'Andere';

  @override
  String futureLegislationScreenTitle(String parliamentName) {
    return 'Bevorstehende Gesetze - $parliamentName';
  }

  @override
  String get searchDialogAdvancedTitle => 'Suchen und Filtern (Erweitert)';

  @override
  String get emptyListFilterMessageFuture =>
      'Keine bevorstehenden Gesetze gefunden, die den ausgewählten Kriterien entsprechen.';

  @override
  String get emptyListDefaultMessageFuture =>
      'Für diese Quelle sind keine geplanten Gesetze anzuzeigen.';

  @override
  String get noScheduledMeetings => 'Keine geplanten Sitzungen';

  @override
  String get dateFormatError => 'Fehler bei der Datumsformatierung';

  @override
  String get upcomingMeetings => 'Bevorstehende Sitzungen:';

  @override
  String get keyPointsTitle => 'Wichtige Punkte:';

  @override
  String processLegislationScreenTitle(String parliamentName) {
    return 'Gesetze im Verfahren - $parliamentName';
  }

  @override
  String get searchHint => 'Suchen...';

  @override
  String get emptyListFilterMessageProcess =>
      'Keine Gesetze im Verfahren gefunden, die den ausgewählten Kriterien entsprechen.';

  @override
  String get emptyListDefaultMessageProcess =>
      'Für diese Quelle gibt es keine aktiven Gesetze im Gesetzgebungsverfahren.';

  @override
  String processStartDateCardLabel(String date) {
    return 'Beginn des Verfahrens: $date';
  }

  @override
  String get upcomingMeetingsCardLabel => 'Nächste Sitzungen:';

  @override
  String get detailsScreenTitle => 'LUSTRA';

  @override
  String get shareTooltip => 'Teilen';

  @override
  String get keyPointsSectionTitle => 'Wichtige Punkte:';

  @override
  String get officialContentButton => 'Offizieller Text';

  @override
  String get processPageButton => 'Verfahrensseite';

  @override
  String get fullVotingResultsPDF => 'Vollständige Abstimmungsergebnisse (PDF)';

  @override
  String get scheduledMeetingsSectionTitle => 'Geplante Sitzungen';

  @override
  String get additionalInfoSectionTitle => 'Zusätzliche Informationen';

  @override
  String printNumberLabel(String id) {
    return 'Drucksache Nr.: $id';
  }

  @override
  String processStartDateLabel(String date) {
    return 'Startdatum des Verfahrens: $date';
  }

  @override
  String votingDateLabel(String date) {
    return 'Abstimmungsdatum: $date';
  }

  @override
  String meetingNumberLabel(String number) {
    return 'Sitzung Nr.: $number';
  }

  @override
  String votingNumberLabel(String number) {
    return 'Abstimmung Nr.: $number';
  }

  @override
  String get sourceLabel => 'Quelle: https://api.sejm.gov.pl/';

  @override
  String summarizedByLabel(String modelName) {
    return 'Zusammengefasst von: $modelName';
  }

  @override
  String promptUsedLabel(String prompt) {
    return 'Verwendeter Prompt: $prompt';
  }

  @override
  String get reportErrorButton => 'Fehler melden';

  @override
  String get noUrlAvailableSnackbar => 'Keine URL verfügbar.';

  @override
  String cannotOpenLinkSnackbar(String url) {
    return 'Link konnte nicht geöffnet werden: $url';
  }

  @override
  String get alreadyVotedSnackbar => 'Ihre Stimme wurde bereits registriert.';

  @override
  String get sharingFunctionNotImplementedSnackbar =>
      'Teilen-Funktion (zu implementieren)';

  @override
  String get reportErrorFunctionNotImplementedSnackbar =>
      'Fehlermeldungsfunktion (zu implementieren)';

  @override
  String get loginScreenTitle => 'Anmelden';

  @override
  String get registrationScreenTitle => 'Registrierung';

  @override
  String get emailLabel => 'E-Mail';

  @override
  String get passwordLabel => 'Passwort';

  @override
  String get loginButton => 'Anmelden';

  @override
  String get registerButton => 'Registrieren';

  @override
  String get orDivider => 'ODER';

  @override
  String get continueWithGoogle => 'Mit Google fortfahren';

  @override
  String get continueWithFacebook => 'Mit Facebook fortfahren';

  @override
  String get promptToRegister => 'Kein Konto? Registrieren';

  @override
  String get promptToLogin => 'Bereits ein Konto? Anmelden';

  @override
  String get validatorInvalidEmail =>
      'Bitte geben Sie eine gültige E-Mail-Adresse ein.';

  @override
  String get validatorPasswordTooShort =>
      'Das Passwort muss mindestens 6 Zeichen lang sein.';

  @override
  String get authErrorInvalidCredentials =>
      'Ungültige E-Mail oder ungültiges Passwort.';

  @override
  String get authErrorEmailInUse =>
      'Diese E-Mail-Adresse wird bereits verwendet.';

  @override
  String get authErrorWeakPassword => 'Das Passwort ist zu schwach.';

  @override
  String get authErrorDefault =>
      'Ein Fehler ist aufgetreten. Bitte versuchen Sie es erneut.';

  @override
  String get authErrorUnexpected => 'Ein unerwarteter Fehler ist aufgetreten.';

  @override
  String get authErrorGoogleFailed =>
      'Google-Anmeldung fehlgeschlagen. Bitte versuchen Sie es erneut.';

  @override
  String get authErrorFacebookFailed =>
      'Facebook-Anmeldung fehlgeschlagen. Bitte versuchen Sie es erneut.';

  @override
  String get authErrorAccountExists =>
      'Ein Konto mit dieser E-Mail existiert bereits. Bitte melden Sie sich mit Ihrem Passwort an.';

  @override
  String mpScreenTitle(String parliamentName) {
    return 'Abgeordnete - $parliamentName';
  }

  @override
  String get searchMPsHint => 'Abgeordnete suchen...';

  @override
  String get allFilter => 'Alle';

  @override
  String get noMPsForSource =>
      'Für diese Quelle sind keine Abgeordneten verfügbar.';

  @override
  String get noMPsMatchFilter =>
      'Keine Abgeordneten entsprechen den Kriterien.';

  @override
  String get attendanceLabelShort => 'Anwesenheit';

  @override
  String get attendanceTooltipWarning =>
      'Anwesenheit berechnet auf Basis einer Amtszeit mit wenigen Abstimmungen.\nDaten können weniger repräsentativ sein.';

  @override
  String get supportLabel => 'Unterstützung: ';

  @override
  String get unaffiliatedClub => 'Fraktionslos';

  @override
  String mpDetailsScreenTitle(String firstName, String lastName) {
    return '$firstName $lastName';
  }

  @override
  String get shareProfileTooltip => 'Profil teilen';

  @override
  String get socialPollSectionTitle => 'Soziale Umfrage';

  @override
  String get parliamentaryActivitySectionTitle => 'Parlamentarische Aktivität';

  @override
  String parliamentaryTenureSectionTitle(int years) {
    return 'Parlamentarische Dienstzeit: $years Jahre';
  }

  @override
  String get parliamentaryTenureNoData =>
      'Parlamentarische Dienstzeit: Keine Daten';

  @override
  String get tenureTooltip =>
      'Die Anzahl der Jahre ist ein ungefährer Wert, der auf der Grundlage der nachstehenden Daten berechnet wird, ohne das vorzeitige Erlöschen des parlamentarischen Mandats zu berücksichtigen.';

  @override
  String tenureTermItem(String romanNumeral, String duration) {
    return '$romanNumeral. Amtszeit des Sejm der Republik Polen $duration';
  }

  @override
  String get unknownTermDuration => 'Unbekannter Zeitraum';

  @override
  String get noTermData => 'Keine detaillierten Daten zu den Amtszeiten.';

  @override
  String get plHistoricalDataDisclaimer =>
      'Hinweis: Historische Daten für die 1. und 2. Amtszeit des Sejm der Republik Polen sind nicht verfügbar und nicht enthalten.';

  @override
  String get personalDataSectionTitle => 'Persönliche Daten';

  @override
  String get contactSectionTitle => 'Kontakt';

  @override
  String get dataSourceLabel => 'Datenquelle: Sejm RP API';

  @override
  String get mandateStatusActive => 'Abgeordnetenmandat: aktiv';

  @override
  String get mandateStatusFulfilled => 'Abgeordnetenmandat: erfüllt';

  @override
  String get mandateStatusCancelled => 'Abgeordnetenmandat: annulliert';

  @override
  String get mandateStatusInactive => 'Abgeordnetenmandat: inaktiv';

  @override
  String get followingAddedSnackbar => 'Zu den gefolgten hinzugefügt';

  @override
  String get followingRemovedSnackbar => 'Aus den gefolgten entfernt';

  @override
  String clubLabel(String clubName) {
    return 'Fraktion: $clubName';
  }

  @override
  String formerlyLabel(String clubs) {
    return ' (früher: $clubs)';
  }

  @override
  String professionLabel(String profession) {
    return 'Beruf: $profession';
  }

  @override
  String districtLabel(String districtName, int districtNum) {
    return 'Wahlkreis: $districtName (Nr. $districtNum)';
  }

  @override
  String votesObtainedLabel(String votes) {
    return 'Erhaltene Stimmen: $votes';
  }

  @override
  String get birthDateLabel => 'Geburtsdatum';

  @override
  String get ageLabel => 'Alter';

  @override
  String ageUnit(int age) {
    return '$age Jahre';
  }

  @override
  String get birthPlaceLabel => 'Geburtsort';

  @override
  String get educationLabel => 'Ausbildung';

  @override
  String get voivodeshipLabel => 'Woiwodschaft';

  @override
  String get emailLabelWithColon => 'E-Mail:';

  @override
  String get votingsTab => 'Letzte Abstimmungen';

  @override
  String get interpellationsTab => 'Interpellationen';

  @override
  String get attendanceLabel => 'Gesamtanwesenheit bei Abstimmungen';

  @override
  String get attendanceTooltipBase =>
      'Die Skala bewertet die Erfüllung der grundlegenden parlamentarischen Pflicht. Die angenommenen Bereiche basieren auf der Annahme, dass eine hohe Anwesenheit ein Maß für die Verantwortung gegenüber den Wählern ist.';

  @override
  String get attendanceTooltipPartialMandate =>
      '\n\nDer Abgeordnete hatte das Mandat für einen Teil der Amtszeit inne. Die Anwesenheit bezieht sich auf diesen Zeitraum.';

  @override
  String get attendanceTooltipUnknownMandate =>
      '\n\nAnwesenheit berechnet auf der Grundlage einer Amtszeit mit einer geringen Anzahl von Abstimmungen. Daten können weniger repräsentativ sein.';

  @override
  String get errorLoadVotings => 'Fehler beim Laden der Abstimmungshistorie.';

  @override
  String get errorLoadInterpellations =>
      'Fehler beim Laden der Interpellationen.';

  @override
  String get noVotingsData =>
      'Keine Daten zu wichtigen Abstimmungen zum Anzeigen.';

  @override
  String get noInterpellationsData => 'Keine Daten.';

  @override
  String get loadVotingsButton => 'Versuchen, Abstimmungen zu laden';

  @override
  String get loadMoreButton => 'Mehr anzeigen';

  @override
  String interpellationSentDate(String date) {
    return 'Einreichungsdatum: $date';
  }

  @override
  String get interpellationReplyFrom => 'Antwort von: ';

  @override
  String cannotOpenReplyLink(String url) {
    return 'Antwortlink konnte nicht geöffnet werden: $url';
  }

  @override
  String get pollResultNoVotes => 'keine Stimmen';

  @override
  String get pollResultOverwhelmingMajority => 'überwältigende Mehrheit';

  @override
  String get pollResultMajority => 'Mehrheit';

  @override
  String get pollResultMinority => 'Minderheit';

  @override
  String get pollResultOverwhelmingMinority => 'überwältigende Minderheit';

  @override
  String pollResultFormatted(String percentage, String description) {
    return '$percentage - $description';
  }

  @override
  String pollTotalVotesLabel(int count) {
    return 'Anzahl der abgegebenen Stimmen: $count';
  }

  @override
  String get pollVoteToAction => 'Stimme ab, um die Ergebnisse zu sehen';

  @override
  String get voteTypeFor => 'Dafür';

  @override
  String get voteTypeAgainst => 'Dagegen';

  @override
  String get voteTypeAbstain => 'Enthaltung';

  @override
  String get voteTypeAbsent => 'Abwesend';

  @override
  String get defaultPrompt => 'Prompt';

  @override
  String get statusInProgress => 'In Bearbeitung';

  @override
  String get statusPassedSejmToSenat =>
      'Angenommen und an den Senat weitergeleitet';

  @override
  String get statusRejectedSejm => 'Abgelehnt';

  @override
  String get statusRejectedBySenate => 'Vom Senat abgelehnt';

  @override
  String get statusToPresident => 'Dem Präsidenten übermittelt';

  @override
  String get statusVetoPresident => 'VETO des Präsidenten';

  @override
  String get statusToConstitutionalTribunal =>
      'Dem Verfassungsgericht vorgelegt';

  @override
  String get statusSignedByPresident => 'Vom Präsidenten unterzeichnet';

  @override
  String get statusEnacted => 'In Kraft getreten';

  @override
  String get statusExpired => 'Verfallen';

  @override
  String get statusAdoptedResolution => 'Angenommen';

  @override
  String get statusRejectedResolution => 'Abgelehnt';

  @override
  String get statusImmediateRejection => 'Sofortige Ablehnung';

  @override
  String get statusWithdrawn => 'Zurückgezogen';

  @override
  String get filterStatusAll => 'Alle';

  @override
  String get filterStatusPassed => 'Angenommen';

  @override
  String get filterStatusRejected => 'Abgelehnt';

  @override
  String get docTypeBill => 'Gesetzesentwurf';

  @override
  String get docTypeResolution => 'Beschlussentwurf';

  @override
  String get statusUpcoming => 'Geplant';

  @override
  String get statusIntroducedInHouse => 'Im Repräsentantenhaus eingebracht';

  @override
  String get statusReportedToSenate => 'An den Senat berichtet';

  @override
  String get statusReportedInHouse => 'Im Repräsentantenhaus berichtet';

  @override
  String get statusReferredInSenate => 'Im Senat überwiesen';

  @override
  String get statusReferredInHouse => 'Im Repräsentantenhaus überwiesen';

  @override
  String get statusReferenceChangeSenate => 'Überweisungsänderung im Senat';

  @override
  String get statusReceivedInSenate => 'Im Senat eingegangen';

  @override
  String get statusPlacedOnCalendarSenate =>
      'Auf die Tagesordnung des Senats gesetzt';

  @override
  String get statusIntroducedInSenate => 'Im Senat eingebracht';

  @override
  String get statusEngrossedInHouse =>
      'Endgültig im Repräsentantenhaus verabschiedet';

  @override
  String get statusAgreedToSenate => 'Im Senat zugestimmt';

  @override
  String get statusEngrossedAmendmentHouse =>
      'Änderungsantrag im Repräsentantenhaus angenommen';

  @override
  String get statusFailedPassageSenate => 'Im Senat gescheitert';

  @override
  String get statusLaidOnTableInHouse => 'Im Repräsentantenhaus zurückgestellt';

  @override
  String get statusPrivateLaw => 'Privatgesetz';

  @override
  String get statusPublicLaw => 'Öffentliches Gesetz';

  @override
  String get statusAdopted => 'Angenommen';

  @override
  String get statusDeBundesratApproved => 'Bundesrat hat zugestimmt';

  @override
  String get statusDeAdopted => 'Verabschiedet';

  @override
  String get statusDeIntroductionApproved => 'Einbringung beschlossen';

  @override
  String get statusDeAnnounced => 'Verkündet';

  @override
  String get statusDeRejected => 'Abgelehnt';

  @override
  String get statusDeBundesratDenied => 'Bundesrat hat Zustimmung versagt';

  @override
  String get statusDeIntroductionRejected => 'Einbringung abgelehnt';

  @override
  String get statusDeDeclaredCompleted => 'Für erledigt erklärt';

  @override
  String get statusDeCompletedByTermEnd =>
      'Erledigt durch Ablauf der Wahlperiode';

  @override
  String get statusDeDeclaredUnconstitutional =>
      'Für mit dem Grundgesetz unvereinbar erklärt';

  @override
  String get statusDeWithdrawn => 'Zurückgezogen';

  @override
  String get statusDeBundesratProcessCompleted =>
      'Durchgang im Bundesrat abgeschlossen';

  @override
  String get statusDeCompleted => 'Abgeschlossen';

  @override
  String get statusDeCompletedSeeProcess =>
      'Abgeschlossen - Ergebnis siehe Vorgangsablauf';

  @override
  String get statusDeRecommendationAvailable => 'Beschlussempfehlung liegt vor';

  @override
  String get statusDeToBundesratNotDeliberated =>
      'Dem Bundesrat zugeleitet - Noch nicht beraten';

  @override
  String get statusDeAssignedToCommittees => 'Den Ausschüssen zugewiesen';

  @override
  String get statusDeNotYetDeliberated => 'Noch nicht beraten';

  @override
  String get statusDeMergedWith =>
      'Zusammengeführt mit... (siehe Vorgangsablauf)';

  @override
  String get statusDeReferred => 'Überwiesen';

  @override
  String get statusFrLawPublished => 'Gesetz veröffentlicht';

  @override
  String get statusFrOrdinancePublished => 'Verordnung veröffentlicht';

  @override
  String get statusFrResolutionPublished => 'Resolution veröffentlicht';

  @override
  String get statusFrDecreePublished => 'Dekret veröffentlicht';

  @override
  String get statusFrDecision => 'Entscheidung';

  @override
  String get statusFrRejected => 'Abgelehnt';

  @override
  String get statusFrPrescribed => 'Verjährt';

  @override
  String get statusFrPropositionLoi => 'Gesetzesinitiative (Parlament)';

  @override
  String get statusFrProjetLoi => 'Gesetzesentwurf (Regierung)';

  @override
  String get statusUkActOfParliament => 'Gesetz des Parlaments';

  @override
  String get statusUkRoyalAssent => 'Königliche Zustimmung';

  @override
  String get statusUkWithdrawn => 'Zurückgezogen';

  @override
  String get statusUkRejected => 'Abgelehnt';

  @override
  String get statusUk1stReading => '1. Lesung';

  @override
  String get statusUk2ndReading => '2. Lesung';

  @override
  String get statusUk3rdReading => '3. Lesung';

  @override
  String get statusUkCommitteeStage => 'Ausschussphase';

  @override
  String get statusUkCommonsExaminers => 'Prüfer des Unterhauses';

  @override
  String get statusUkLordsSpecialCommittee => 'Sonderausschuss des Oberhauses';

  @override
  String get statusUkMoneyResolution => 'Finanzresolution';

  @override
  String get statusUkConsiderationLordsAmendments =>
      'Prüfung der Änderungen der Lords';

  @override
  String get statusUkConsiderationLordsMessage =>
      'Prüfung der Nachricht der Lords';

  @override
  String get statusUkOrderOfCommitmentDischarged =>
      'Überweisungsbeschluss aufgehoben';

  @override
  String get statusUkProgrammeMotion => 'Programmantrag';

  @override
  String get statusUkReportStage => 'Berichtsphase';

  @override
  String get statusUkSecondReadingCommittee =>
      'Ausschuss für die zweite Lesung';

  @override
  String get statusUkWaysAndMeansResolution => 'Haushaltsresolution';

  @override
  String get errorCheckConnection =>
      'Bitte überprüfen Sie Ihre Internetverbindung.';

  @override
  String get buttonRetry => 'Erneut versuchen';

  @override
  String get shareAsPost => 'Als Beitrag teilen';

  @override
  String get shareAsStory => 'Als Story teilen';

  @override
  String get morePointsInApp =>
      '...vollständige Informationen sind in der Lustra-App verfügbar';

  @override
  String get pollVotingViaApp => 'Abstimmung in der App verfügbar!';

  @override
  String get supportPollTitle => 'Unterstützungsumfrage';

  @override
  String get termsCountLabel => 'Anzahl der Amtszeiten';

  @override
  String get settingsNotificationsNewLaws =>
      'Benachrichtigungen über neue Gesetze';

  @override
  String get settingsNotificationsVoteResults =>
      'Benachrichtigungen über Abstimmungsergebnisse';

  @override
  String get detailsButton => 'Details';

  @override
  String get errorNoVotingsDetails => 'KEINE DETAILLIERTEN ABSTIMMUNGSDATEN';

  @override
  String get clearText => 'Löschen';

  @override
  String get consideredOnLabel => 'In Prüfung am:';

  @override
  String get legislationFooterAiDisclaimer =>
      'Die obige Zusammenfassung wurde von einer KI erstellt und ist eine Bearbeitung des ursprünglichen Regierungsdokuments unter Achtung aller Grundsätze der Unparteilichkeit und freien Information. Details zur verwendeten Abfrage und deren Schema finden Sie im Informations-Tab.';

  @override
  String get legislationFooterModelUsed => 'Verwendetes Modell:';

  @override
  String get legislationFooterSourceData =>
      'Die Quelldaten sind kostenlos im Regierungssystem unter folgender Adresse verfügbar:';

  @override
  String get appMotto =>
      '... also unparteiische legislative Informationen ohne politische Färbung.';

  @override
  String get acceptTermsPrefix => 'Ich akzeptiere die';

  @override
  String get termsAndConditions => 'AGB und Datenschutzrichtlinie';

  @override
  String get validatorAcceptTerms =>
      'Sie müssen die Bedingungen akzeptieren, um fortzufahren.';

  @override
  String get joinSupportClubPrefix => 'Ich möchte dem';

  @override
  String get supportClub => 'Lustra-Unterstützerklub beitreten';

  @override
  String get supportClubDescription =>
      'Sie erhalten spezielle Informationen über die Entwicklung des Projekts und zukünftige Initiativen.';

  @override
  String get registrationFinishTitle => 'Registrierung abschließen';

  @override
  String get welcomeMessage => 'Willkommen!';

  @override
  String get finalStepMessage =>
      'Nur noch ein letzter Schritt. Bitte akzeptieren Sie die Bedingungen, um fortzufahren.';

  @override
  String get continueButton => 'Weiter';

  @override
  String get selectYourParliament => 'Wählen Sie Ihr Parlament';

  @override
  String get validatorSelectParliament =>
      'Bitte wählen Sie ein Parlament aus, um fortzufahren.';

  @override
  String get forgotPasswordButton => 'Passwort vergessen?';

  @override
  String get passwordResetEmailSent =>
      'Ein Link zum Zurücksetzen des Passworts wurde an Ihre E-Mail-Adresse gesendet.';

  @override
  String get authErrorUserNotFound =>
      'Kein Benutzer mit dieser E-Mail-Adresse gefunden.';

  @override
  String get settingsDeleteAccount => 'Konto löschen';

  @override
  String get errorDeleteAccount =>
      'Konto konnte nicht gelöscht werden. Bitte versuchen Sie es erneut.';

  @override
  String get dialogReauthenticateTitle => 'Bestätigen Sie Ihre Identität';

  @override
  String get dialogConfirm => 'Bestätigen';

  @override
  String get dialogDeleteAccountTitle =>
      'Sind Sie sicher, dass Sie Ihr Konto löschen möchten?';

  @override
  String get dialogDeleteAccountContent =>
      'Diese Aktion kann nicht rückgängig gemacht werden. Alle Ihre Daten, einschließlich Ihrer Abstimmungshistorie, werden dauerhaft gelöscht.';

  @override
  String get dialogDelete => 'Löschen';

  @override
  String get termsOfServiceContent =>
      '<b>Nutzungsbedingungen der „Lustra“-App</b>\n\nZuletzt aktualisiert: 10. August 2025\n\nHallo! Hier ist der Entwickler der Lustra-App.\nIch freue mich, dass Sie hier sind. Ich habe Lustra entwickelt, weil ich glaube, dass jeder von uns einen einfachen und transparenten Zugang zu Informationen darüber verdient, wie die Gesetze, die unser Leben beeinflussen, entstehen.\n\nDieses Dokument sind die Nutzungsbedingungen – eine Art Vertrag zwischen Ihnen und mir. Ich habe es in einfacher Sprache verfasst, damit Sie genau wissen, nach welchen Regeln die App funktioniert. Bitte lesen Sie es in Ruhe durch. Durch die Nutzung von Lustra bestätigen Sie, dass Sie diese Regeln akzeptieren.\n\n<b>1. Glossar, also worum und um wen es geht</b>\n•\t<b>Ich, mein, mir</b> – das bin ich, Jacek, der Entwickler der App, tätig im Rahmen der Firma FO&WO VENTURES SP. Z O.O. mit Sitz in Wrocław.\n•\t<b>Sie, Ihr, Ihnen</b> – das sind Sie, die Person, die die App nutzt.\n•\t<b>App</b> oder <b>Lustra</b> – die mobile Anwendung „Lustra“, die Sie gerade nutzen.\n•\t<b>Konto</b> – Ihr persönliches Konto in der App, das Sie erstellen können, um zusätzliche Funktionen zu nutzen.\n•\t<b>Bedingungen</b> – eben dieses Dokument.\n\n<b>2. Worum geht es bei Lustra? (Grundprinzipien)</b>\n•\tLustra ist eine kostenlose App, die Ihnen zugängliche Informationen über Gesetzgebungsprozesse in ausgewählten Parlamenten liefern soll. Hier finden Sie u.a. Zusammenfassungen von Gesetzesentwürfen, Abstimmungsergebnisse und Daten zu Abgeordneten.\n•\tUm die App nutzen zu können, müssen Sie mindestens 16 Jahre alt sein. Wenn Sie ein Konto erstellen, bestätigen Sie, dass Sie diese Bedingung erfüllen.\n•\tDie Nutzung der grundlegenden Informationsfunktionen erfordert kein Konto.\n\n<b>3. Ihr Konto in der App</b>\n•\tSie können ein Konto unter Verwendung Ihrer E-Mail-Adresse erstellen. Dies ermöglicht Ihnen die Nutzung zusätzlicher Funktionen wie die Teilnahme an Umfragen oder den Erhalt personalisierter Benachrichtigungen.\n•\tBitte denken Sie daran, dass Sie nur ein Konto haben können.\n•\tSie sind dafür verantwortlich, Ihr Passwort geheim zu halten und für alles, was auf Ihrem Konto geschieht.\n\n<b>4. Wie können Sie die Inhalte nutzen? (Lizenz)</b>\n•\tAlle Quelldaten (z. B. vollständige Gesetzestexte, Abstimmungsergebnisse, Abgeordnetendaten) stammen aus offiziellen, öffentlichen Quellen und sind öffentliche Informationen.\n•\tDie Inhalte, die ich mit meinem proprietären System und meiner KI-Technologie erstelle (d. h. Zusammenfassungen, vereinfachte Titel, Kernpunkte), stelle ich Ihnen zur freien Nutzung für informative, bildende und private Zwecke zur Verfügung. Sie können sie lesen und als Screenshots teilen.\n•\tIch bitte Sie herzlich – kopieren Sie diese Daten nicht maschinell (scrapen Sie sie nicht). Die Erstellung und Wartung dieses Systems kostet mich Zeit und Geld. Um dieses Projekt zu schützen, verbieten Ihnen die Bedingungen daher:\n\t\to\tDas automatische Herunterladen und Erstellen einer eigenen Datenbank auf der Grundlage der in der App generierten Inhalte.\n\t\to\tDie Nutzung der Inhalte der App für kommerzielle Zwecke.\n\t\to\tVersuche, Sicherheitsvorkehrungen zu umgehen, die App zu dekompilieren oder ihren Betrieb zu stören.\n•\tHaben Sie eine Idee, wie man die Daten von Lustra auf interessante Weise nutzen könnte? Ich bin offen für eine Zusammenarbeit! Schreiben Sie mir an jacek@lustra.dev – ich spreche gerne darüber.\n\n<b>5. Umfragen und Datengenauigkeit</b>\n•\tEine der Funktionen der App sind Umfragen, in denen Sie Ihre Unterstützung für ein bestimmtes Gesetz ausdrücken können. Damit die Ergebnisse dieser Umfragen so zuverlässig wie möglich sind, wählen Sie bitte in den Einstellungen das Parlament des Landes aus, dessen Staatsbürger Sie sind (sofern es in der Liste verfügbar ist).\n\n<b>6. Meine Haftung (oder vielmehr deren Fehlen)</b>\n•\tIch stelle die App „wie sie ist“ (engl. „as is“) zur Verfügung. Ich bemühe mich nach Kräften, die Daten aktuell und korrekt zu halten, aber sie stammen von externen, staatlichen APIs, bei denen Fehler auftreten können. Daher kann ich keine Verantwortung für eventuelle Ungenauigkeiten in den Quelldaten übernehmen.\n•\tLustra ist ein Pro-Bono-Projekt, das ich aus eigenen Mitteln unterhalte. Ich werde mein Bestes tun, um es ununterbrochen am Laufen zu halten, muss mir aber vorbehalten, dass technische Pausen auftreten können. Ich behalte mir auch das Recht vor, den Dienst zu beenden, wenn mir z. B. die Mittel für den Unterhalt ausgehen.\n•\tDie Inhalte in der App, insbesondere die von der KI generierten, dienen Informations- und Bildungszwecken. Sie stellen keine Rechtsberatung dar.\n\n<b>7. Lustra-Unterstützerclub</b>\n•\tSie können dem „Lustra-Unterstützerclub“ beitreten, indem Sie eine separate, freiwillige Zustimmung erteilen. Das bedeutet, dass ich Ihnen E-Mails über die Entwicklung der App, neue Funktionen senden und auch um Unterstützung bei Diskussionen über die Zukunft des Projekts oder um finanzielle Hilfe bitten kann, falls erforderlich. Weitere Einzelheiten dazu finden Sie in der Datenschutzerklärung.\n\n<b>8. Beendigung unserer Vereinbarung</b>\n•\tSie können sie jederzeit beenden. Nutzen Sie einfach die Option „Konto löschen“ in den App-Einstellungen. Dies führt zur dauerhaften Löschung Ihres Kontos und der damit verbundenen Daten.\n•\tIch kann Ihr Konto sperren oder löschen, wenn Sie in grober Weise gegen diese Bedingungen verstoßen, z. B. indem Sie versuchen, den Betrieb der App zu schädigen.\n\n<b>9. Änderungen der Bedingungen</b>\n•\tDie Welt verändert sich, und die App wird es auch. Ich behalte mir das Recht vor, diese Bedingungen zu ändern. Über jede wichtige Änderung werde ich Sie im Voraus informieren, z. B. durch eine Nachricht in der App. Die fortgesetzte Nutzung von Lustra nach Einführung der Änderungen bedeutet deren Annahme.\n\n<b>10. Kontakt und Schlussbestimmungen</b>\n•\tWenn Sie Fragen haben, schreiben Sie einfach an: jacek@lustra.dev.\n•\tIn allen Angelegenheiten, die nicht durch diese Bedingungen geregelt sind, gilt polnisches Recht.\n\nVielen Dank, dass Sie hier sind und helfen, einen transparenten Staat zu schaffen!';

  @override
  String get termsAndPrivacyTitle => 'AGB & Datenschutz';

  @override
  String get termsOfServiceTab => 'AGB';

  @override
  String get privacyPolicyTab => 'Datenschutz';

  @override
  String get privacyPolicyContent =>
      '<b>Datenschutzerklärung der „Lustra“-App</b>\n\nZuletzt aktualisiert: 10. August 2025\n\nDieses Dokument ist die Datenschutzerklärung. Ich weiß, dass solche Texte lang und kompliziert sein können, deshalb habe ich mein Bestes getan, um es einfach zu schreiben.\nIhre Privatsphäre und Ihr Vertrauen haben für mich oberste Priorität. In dieser Erklärung erläutere ich, welche Daten ich erhebe, warum ich das tue und wie ich sie schütze.\n\n<b>1. Wer kümmert sich um Ihre Daten? (Datenverantwortlicher)</b>\nDer Verantwortliche für Ihre personenbezogenen Daten bin ich, Jacek, handelnd im Rahmen der Firma FO&WO VENTURES SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ (ul. Wapienna 13/7, 50-518 Wrocław, NIP: 6343002817).\nWenn Sie Fragen zu Ihren Daten haben, schreiben Sie mir direkt an: jacek@lustra.dev.\n\n<b>2. Welche Daten erhebe ich und warum?</b>\nIch erhebe nur Daten, die für den Betrieb der App notwendig sind oder für die Sie eine separate, freiwillige Einwilligung erteilen. Hier ist eine detaillierte Liste:\n•\t<b>Wenn Sie ein Konto erstellen:</b>\n\to\t<b>Ihre E-Mail-Adresse:</b> Ich benötige sie, um Ihr Konto zu erstellen und sicher zu führen, Ihnen die Anmeldung zu ermöglichen und Ihnen das Zurücksetzen des Passworts zu gestatten, falls Sie es vergessen.\n\to\t<b>Eindeutige Benutzer-ID (UID):</b> Dies ist eine zufällige Zeichenfolge, die automatisch vom Firebase-System vergeben wird und es mir ermöglicht, Ihre Daten sicher mit Ihrem Konto zu verknüpfen.\n•\t<b>Wenn Sie die Funktionen der App nutzen (als eingeloggter Benutzer):</b>\n\to\t<b>Ihre Stimmen in Umfragen („unterstütze“ / „lehne ab“):</b> Ich speichere sie, um aggregierte, vollständig anonyme Statistiken zur Unterstützung einzelner Gesetze zu erstellen, die Sie in der App sehen. Ihre individuelle Stimme wird niemals öffentlich angezeigt.\n\to\t<b>Ihre Liste der beobachteten Gesetze:</b> Ich speichere sie, damit Sie leichten Zugriff darauf haben und ich Ihnen (in Zukunft) Benachrichtigungen über deren Fortschritt senden kann.\n\to\t<b>Ihr gewähltes Parlament:</b> Ich speichere diese Information, damit Sie an den entsprechenden Umfragen teilnehmen und (in Zukunft) Benachrichtigungen für das richtige Land erhalten können.\n•\t<b>Wenn Sie dem Lustra-Unterstützerclub beitreten (völlig freiwillig):</b>\n\to\t<b>Information über Ihre Einwilligung (wahr/falsch):</b> Ich speichere sie, um zu wissen, ob Sie zusätzliche Nachrichten von mir erhalten möchten. Mehr über den Club schreibe ich in Abschnitt 5.\n•\t<b>Wenn Sie einen Fehler melden:</b>\n\to\tWenn Sie sich entscheiden, einen Datenfehlerbericht zu senden, speichere ich den Inhalt Ihrer Meldung, um das Problem zu analysieren und zu beheben.\nWas ich <b>NICHT</b> erhebe: Ich verwende keine externen Analysetools (wie Google Analytics), um Ihre Aktivitäten in der App zu verfolgen.\n\n<b>3. Wem vertraue ich Ihre Daten an? (Meine Technologiepartner)</b>\nDamit Lustra funktionieren kann, nutze ich die Dienste vertrauenswürdiger Technologiepartner, denen ich die Verarbeitung einiger Daten anvertraue. Dies sind:\n•\t<b>Google (im Rahmen des Firebase-Dienstes):</b> Dies ist das technologische Rückgrat der gesamten App. Google stellt mir die Infrastruktur zur Verfügung für:\n\to\t<b>Authentifizierung (Firebase Authentication):</b> Sichere Anmeldung und Verwaltung Ihres Kontos.\n\to\t<b>Datenbank (Cloud Firestore):</b> Speicherung von Daten, die mit Ihrem Konto verknüpft sind (z. B. Umfragestimmen, Liste der beobachteten Gesetze).\n•\t<b>Google (im Rahmen des Gemini AI-Dienstes):</b> Dies ist das Werkzeug, das ich zur Analyse von Gesetzestexten verwende. Ich möchte absolut klarstellen: Ich sende ausschließlich öffentlich verfügbare Texte von Gesetzen und Dokumenten an die KI. Ihre personenbezogenen Daten (wie E-Mail oder UID) werden niemals dorthin gesendet.\nAlle Daten werden auf Google-Servern innerhalb des Europäischen Wirtschaftsraums gespeichert.\n\n<b>4. Wie lange speichere ich Ihre Daten?</b>\nKurz und einfach: Ich speichere Ihre Daten so lange, wie Sie ein Konto bei mir haben. Wenn Sie sich entscheiden, es zu löschen, werden alle Ihre personenbezogenen Daten unwiderruflich gelöscht.\n\n<b>5. Der Lustra-Unterstützerclub – was ist das?</b>\nDies ist ein besonderer Ort für Leute, die näher am Projekt sein möchten. Der Beitritt ist völlig freiwillig und erfordert die Kennzeichnung einer separaten Einwilligung. Wenn Sie beitreten, stimmen Sie zu, dass ich Ihnen gelegentlich E-Mails sende über:\n•\tApp-Entwicklung und geplante neue Funktionen,\n•\tbesondere Veranstaltungen, z. B. Diskussionsrunden über die Zukunft von Lustra,\n•\tandere, ähnliche missionsgetriebene Projekte, die ich in Zukunft erstellen könnte,\n•\tBitten um finanzielle Unterstützung, falls sich das Projekt in einer schwierigen Lage befindet.\nSie können Ihre Einwilligung jederzeit in den App-Einstellungen widerrufen.\n\n<b>6. Ihre Rechte – Sie haben die volle Kontrolle</b>\nDie DSGVO gibt Ihnen eine Reihe von Rechten, und ich möchte, dass Sie diese einfach ausüben können. Sie haben das Recht auf:\n•\tAuskunft über Ihre Daten: Zu wissen, welche Daten ich über Sie speichere.\n•\tBerichtigung (Korrektur) Ihrer Daten.\n•\tLöschung Ihrer Daten (Recht auf Vergessenwerden): Sie können dies jederzeit über die Option „Konto löschen“ in den App-Einstellungen tun.\n•\tEinschränkung der Verarbeitung Ihrer Daten.\n•\tDatenübertragbarkeit.\n•\tWiderspruch gegen die Datenverarbeitung.\n•\tWiderruf der Einwilligung (z. B. für die Mitgliedschaft im Lustra-Unterstützerclub).\n•\tBeschwerde bei dem Präsidenten des Amtes für den Schutz personenbezogener Daten (UODO), wenn Sie der Meinung sind, dass ich Ihre Daten rechtswidrig verarbeite.\nUm die meisten dieser Rechte auszuüben, schreiben Sie mir einfach an jacek@lustra.dev.\n\n<b>7. Sicherheit Ihrer Daten</b>\nIch nehme Sicherheit sehr ernst. Ich nutze die von Google Firebase bereitgestellten Lösungen, die moderne Sicherheitsstandards anwenden, einschließlich der Verschlüsselung von Daten sowohl bei der Übertragung (SSL-Protokoll) als auch bei der Speicherung auf Servern.\n\n<b>8. Daten von Kindern</b>\nWie in den Nutzungsbedingungen erwähnt, ist die App für Personen ab 16 Jahren bestimmt. Ich erhebe oder verarbeite wissentlich keine Daten von jüngeren Personen.\n\n<b>9. Änderungen dieser Richtlinie</b>\nIch kann diese Richtlinie in Zukunft aktualisieren. Über wesentliche Änderungen werde ich Sie im Voraus in der App informieren.\n\nVielen Dank für Ihr Vertrauen.\nJacek';

  @override
  String get techPageTitle => 'Über Technologie und Unparteilichkeit';

  @override
  String get techPageIntro =>
      'Hinter jedem vereinfachten Titel und jeder Zusammenfassung eines Gesetzes steht ein Sprachmodell. Hier möchte ich Ihnen in voller Transparenz erklären, wie es funktioniert und wie ich sicherstelle, dass die Informationen, die Sie erhalten, immer unverfälscht und unparteiisch sind.';

  @override
  String get techPageWhyAiTitle => 'Warum verwende ich KI?';

  @override
  String get techPageWhyAiBody =>
      'Gesetzestexte und parlamentarische Dokumente sind in einem komplizierten juristischen Jargon verfasst. Selbst ein kurzes Gesetz zu lesen und zu verstehen, ist eine Herausforderung, sogar für einen Juristen.\n\nMein Ziel war es, ein Werkzeug zu schaffen, das diese hermetische Sprache „vom Juristischen ins Menschliche“ übersetzt. Hunderte von Dokumenten täglich manuell zu analysieren, wäre für eine einzelne Person unmöglich. Deshalb habe ich zur KI gegriffen – als leistungsstarkes Werkzeug zur Textanalyse und -vereinfachung, das es ermöglicht, Ihnen Informationen schnell und in verständlicher Form zu liefern.';

  @override
  String get techPageWhatForTitle => 'Wofür genau verwende ich KI?';

  @override
  String get techPageWhatForBody =>
      'Die Künstliche Intelligenz erfüllt drei spezifische Aufgaben:\n  • Sie vereinfacht offizielle Titel zu solchen, die sofort aussagen, worum es in dem Dokument geht.\n  • Sie erstellt kurze, 2-3 Sätze lange Zusammenfassungen, die sich auf die Auswirkungen der Änderungen auf das tägliche Leben der Bürger konzentrieren.\n  • Sie extrahiert aus dem Textdickicht einige Kernpunkte, also die wichtigsten Änderungen und Lösungen.\n\nAlle übrigen Daten, wie Abstimmungsergebnisse oder Informationen über Abgeordnete, stammen direkt aus offiziellen, staatlichen APIs.';

  @override
  String get techPageBiasTitle =>
      'Wie gewährleiste ich Unparteilichkeit? Anweisungen für die KI';

  @override
  String get techPageBiasBody =>
      'Das ist der wichtigste Teil. Die KI führt spezifische Befehle aus. Diese Befehle (in der Informatik als „Prompt“ bezeichnet) sind eine Art sehr präzise Anweisung, die das Fundament für die Unparteilichkeit der gesamten Anwendung bildet.\n\nHier sind die Schlüsselprinzipien, die ich in mein KI-System eingegeben habe:\n  • <b>Rolle eines neutralen Experten:</b> Ich weise die KI an, die Rolle eines unpolitischen Rechtsexperten einzunehmen, dessen einziges Ziel die Analyse und Erklärung ist, nicht die Bewertung oder Kommentierung.\n  • <b>Nur Fakten, keine Meinungen:</b> Die Anweisung verbietet der KI ausdrücklich, eigene Meinungen zu äußern, zu werten und eine Sprache zu verwenden, die suggerieren könnte, ob eine bestimmte Änderung „gut“ oder „schlecht“ ist. Sie soll sich ausschließlich auf Fakten konzentrieren.\n  • <b>Perspektive des einfachen Bürgers:</b> Anstatt ein Gesetz aus der Perspektive eines Juristen zu analysieren, hat die KI die Aufgabe, die Frage zu beantworten: „Was bedeutet diese Änderung für mich, einen normalen Bürger? Wie wird sie meine Finanzen, meine Gesundheit, meine Rechte und Pflichten beeinflussen?“.';

  @override
  String get techPagePromiseTitle =>
      'Vollständige, transparente Anweisungen zur Einsicht';

  @override
  String get techPagePromiseBody =>
      'Verlassen Sie sich nicht nur auf mein Wort. Unten finden Sie den genauen Inhalt der Anweisung (des Prompts), die ich dem KI-Modell (Google Gemini) bei der Analyse jedes Dokuments übergebe. Dabei stelle ich sicher, dass auch die Kreativitätsparameter auf 0 gesetzt sind (damit die KI bei der Analyse nichts erfindet). Das ist das „Gehirn“ der Operation.\n\n(Hinweis: Dieser Prompt wird im Laufe der Zeit weiterentwickelt und verbessert, um die Qualität der Zusammenfassungen stetig zu steigern.)';

  @override
  String techPagePromptCode(Object DOCUMENT_TEXT, Object country) {
    return 'Du bist ein Experte für das Recht von $country, dessen Aufgabe es ist, Gesetzesdokumente, Beschlüsse und andere legislative Dokumente zu analysieren und daraus Informationen in verständlicher Form für die Bürger aufzubereiten. Dein Ziel ist es, Informationen so darzustellen, dass die Bürger die Auswirkungen der Gesetzgebung auf ihr Leben selbst bewerten können, auch ohne juristisches Fachwissen. Konzentriere dich auf Fakten und die Konsequenzen der eingeführten Änderungen und vermeide Bewertungen und persönliche Meinungen. Jeglicher juristischer Jargon ist verboten. Präsentiere die Informationen klar, prägnant und ansprechend, sodass sie für eine Person ohne juristische Ausbildung verständlich sind. Vermeide lange, komplexe Sätze. Anstatt zu schreiben „der Entwurf zielt darauf ab, die Richtlinie bezüglich der Abfalltrennung umzusetzen...“, schreibe „Neue Regeln für die Mülltrennung: Verwendung spezieller Säcke, etc....“. Setze deine Arbeit fort, bis du deine Aufgabe gelöst hast. Wenn du dir über den generierten Inhalt unsicher bist, analysiere das Dokument erneut – rate nicht. Plane deine Aufgabe gut, bevor du beginnst. Hebe in der Zusammenfassung und den Kernpunkten, wenn möglich und gerechtfertigt, hervor, welche konkreten Vorteile oder Konsequenzen (positiv oder negativ) das Gesetz für das tägliche Leben der Bürger, ihre Rechte und Pflichten, ihre persönlichen Finanzen, ihre Sicherheit und andere wichtige Aspekte mit sich bringt.\n\nDeine Antwort MUSS im JSON-Format sein - und die folgenden Schlüssel enthalten.\nBevor du die Antwort zurückgibst, überprüfe sorgfältig, ob die gesamte JSON-Struktur zu 100% korrekt ist, einschließlich aller Kommas, geschweiften und eckigen Klammern sowie Anführungszeichen. Fehlerhaftes JSON ist inakzeptabel und verhindert die Verarbeitung deiner Arbeit.\n\nAnalysiere den folgenden juristischen Dokumententext sorgfältig. Dies ist der Inhalt, auf dessen Grundlage du die Zusammenfassung und die Kernpunkte erstellen sollst:\n--- ANFANG DES DOKUMENTS ---\n$DOCUMENT_TEXT\n--- ENDE DES DOKUMENTS ---\n\nDENK DARAN: Deine Antwort MUSS ausschließlich ein gültiges JSON-Objekt sein. Füge keine zusätzlichen Zeichen, Kommentare oder Text vor dem \'OPEN_BRACE\'-Tag oder nach dem \'CLOSE_BRACE\'-Tag hinzu. Die gesamte Antwort muss als JSON parsbar sein.\nFülle auf der Grundlage des OBENSTEHENDEN Dokuments die folgende JSON-Struktur aus:\nDies ist die JSON-Struktur, die ich erwarte (fülle sie mit Inhalt):\n__OPEN_BRACE__\n  \"ai_title\": \"Ein neuer, kurzer Titel für das Rechtsdokument auf Deutsch, der den Kern der eingeführten Änderungen erfasst (z. B. maximal 10-12 Wörter).\",\n  \"summary\": \"Eine 2-3 Sätze lange, prägnante Zusammenfassung des Inhalts des Rechtsdokuments auf Deutsch, geschrieben aus der Perspektive der Auswirkungen auf das tägliche Leben der Bürger.\",\n  \"key_points\": [\n    \"Erster kurzer Punkt auf Deutsch zu den wichtigsten eingeführten Lösungen oder Änderungen.\",\n    \"Zweiter kurzer Punkt auf Deutsch...\"\n  ],\n \"category\": [\"Kategorisiere das Dokument standardmäßig in eine Kategorie, basierend auf dem Hauptthema. Wähle bis zu 3, wenn das Dokument auch BEDEUTENDE Aspekte aus anderen Kategorien behandelt. Du MUSST Kategorien AUSSCHLIESSLICH aus der folgenden Liste wählen: Gesundheit, Bildung, Familie, Steuern, Arbeit, Sicherheit, Umwelt, Gerichte und Recht, Verkehr, Sozialleistungen, Immobilien, Medien und Kultur, Selbstverwaltung, Migration, Landwirtschaft, Öffentliche Investitionen, Digitalisierung, Wirtschaft. Wenn das Dokument eindeutig zu keiner von ihnen passt, MUSST du \'Andere\' verwenden. Wenn du \'Andere\' verwendest, sollte dies die EINZIGE gewählte Kategorie sein. Erstelle KEINE neuen Kategorien. Die Antwort muss ein Array von Strings sein, z. B. [\\\"Steuern\\\", \\\"Familie\\\"].\", \"Zweite Kategorie (optional)\", \"Dritte Kategorie (optional)\"]\n__CLOSE_BRACE__';
  }

  @override
  String get techPageFlawlessTitle => 'Ist KI unfehlbar?';

  @override
  String get techPageFlawlessBody =>
      'Natürlich nicht. Wie jede Technologie kann sie Fehler machen oder etwas falsch interpretieren. Deshalb finden Sie in der Anwendung einen Mechanismus, mit dem Sie einen Datenfehler melden können – jede solche Meldung ist für mich äußerst wertvoll und hilft mir, das System zu verbessern.\n\nMein langfristiges Ziel ist die Weiterentwicklung dieser Technologie und sogar der Betrieb eines eigenen, lokalen Modells ohne jegliche Einschränkungen, um die Präzision und Unabhängigkeit der Anwendung weiter zu erhöhen.';

  @override
  String get techPageOutro =>
      'Vielen Dank für Ihr Vertrauen. Ich hoffe, dass die Nutzung von Lustra dank dieser Transparenz für Sie noch wertvoller wird.';

  @override
  String get votingResultsPL1stReadingTitle => 'ABSTIMMUNG ÜBER DIE ABLEHNUNG';

  @override
  String get reportErrorDescription =>
      'Beschreiben Sie kurz den Fehler oder was fehlt. Ihre Meldung hilft uns, die App zu verbessern.';

  @override
  String get reportErrorHint => 'Geben Sie Ihre Nachricht ein...';

  @override
  String get reportErrorValidationEmpty =>
      'Die Nachricht darf nicht leer sein.';

  @override
  String get reportErrorSuccess => 'Vielen Dank! Ihre Meldung wurde gesendet.';

  @override
  String get actionCancel => 'Abbrechen';

  @override
  String get actionSend => 'Senden';

  @override
  String get mustBeLoggedInToReport =>
      'Sie müssen angemeldet sein, um einen Fehler zu melden.';

  @override
  String get reportErrorRateLimitExceeded =>
      'Meldelimit überschritten (10 pro 24 Stunden).';

  @override
  String get supportQuickTitle => 'Schnelle Unterstützung';

  @override
  String get supportPaymentsUnavailable =>
      'Zahlungen sind derzeit nicht verfügbar.';

  @override
  String get supportNoProducts => 'Keine Unterstützungsoptionen verfügbar.';

  @override
  String get supportCampaignsTitle => 'Gezielte Kampagnen';

  @override
  String get supportCampaignsDescription =>
      'Unterstützen Sie spezifische Entwicklungsziele, z.B. das Hinzufügen eines neuen Parlaments.';

  @override
  String get supportCampaignsButton =>
      'Aktive Kampagne ansehen (bald verfügbar)';

  @override
  String get forceUpdateTitle => 'Update erforderlich';

  @override
  String get forceUpdateDescription =>
      'Eine neue Version der App ist verfügbar. Um fortzufahren, aktualisieren Sie die App bitte auf die neueste Version.';

  @override
  String get forceUpdateButton => 'Jetzt aktualisieren';

  @override
  String get deputies => 'Abgeordnete';

  @override
  String get sortingLabel => 'Sortieren nach: ';

  @override
  String get sortByPopularity => 'Popularität';

  @override
  String get sortByAttendance => 'Anwesenheit';

  @override
  String partyLabel(Object partyName) {
    return 'Partei: $partyName';
  }

  @override
  String districtLabelUS(Object districtName, String districtNum) {
    return '$districtNum. Wahlbezirk von $districtName';
  }

  @override
  String tenureTermItemUS(Object memberType, String termNumber) {
    return '$termNumber. Kongress ($memberType)';
  }

  @override
  String get birthYearLabel => 'Geburtsjahr:';

  @override
  String get sponsorshipsTab => 'Gesponserte Gesetze';

  @override
  String get sponsorshipTypeSponsor => 'Sponsor';

  @override
  String get sponsorshipTypeCosponsor => 'Mitunterstützer';

  @override
  String get termCurrently => '(aktuell)';

  @override
  String get parliamentaryTenureTitle => 'Amtszeit im Parlament';

  @override
  String get usRoleRepresentative => 'Abgeordneter';

  @override
  String get usRoleSenator => 'Senator';

  @override
  String shareLegislationText(Object deepLink) {
    return 'Details zu diesem Gesetzentwurf in der Lustra-App ansehen! $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Die Arbeit dieses Abgeordneten in der Lustra-App ansehen und bewerten! $deepLink';
  }

  @override
  String get clipboardCopySuccess => 'App-Link in die Zwischenablage kopiert!';

  @override
  String get mandateInactive => 'MANDAT INAKTIV';

  @override
  String get votingUnavailable => 'Abstimmung nicht verfügbar';

  @override
  String get historicalTerm => 'HISTORISCHE WAHLPERIODE';

  @override
  String get pollUnavailable => 'Umfrage nicht verfügbar';

  @override
  String get billsLabel => 'Gesetzentwürfe';

  @override
  String get sponsorshipSublabel => '(Gesponsert/Mitgesponsert)';

  @override
  String get missingDataWarningShare =>
      'Das Quelldokument für diesen Gesetzentwurf fehlt. Helfen Sie uns und stellen Sie über unsere App in Sekundenschnelle einen offiziellen E-Mail-Antrag auf Veröffentlichung!';

  @override
  String get missingDataSourceUserMessage =>
      'Das Quelldokument für diesen Gesetzentwurf fehlt. Helfen Sie uns, indem Sie einen offiziellen E-Mail-Antrag auf Veröffentlichung stellen, und schließen Sie sich dem Kreis derer an, die für Informationstransparenz sorgen!';

  @override
  String get missingDataSourceButton => 'E-Mail-Antrag für Dokument stellen';

  @override
  String get cannotOpenEmailApp =>
      'E-Mail-Anwendung konnte nicht geöffnet werden. Prüfen Sie, ob sie installiert und ein Konto konfiguriert ist.';

  @override
  String get sortByFreshness => 'Neueste';

  @override
  String get pollPermissionDeniedError =>
      'Diese Abstimmung ist nur für Benutzer verfügbar, die diesem Parlament zugewiesen sind.';

  @override
  String get supportCampaignsButtonActive => 'Kampagne unterstützen';

  @override
  String get supportCampaignsButtonInactive => 'Kampagne inaktiv';
}

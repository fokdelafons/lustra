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
  String get sectionPopularVotes => 'Legislative Abstimmungen';

  @override
  String get sectionUpcoming => 'Geplante Debatten';

  @override
  String get sectionLegislationInProcess => 'In Bearbeitung';

  @override
  String get civicProjectsSectionTitle => 'Bürgerinitiativen';

  @override
  String get sectionMpProfiles => 'Beliebte Politiker';

  @override
  String get votingSourceTooltip => 'Abstimmungsquelle anzeigen';

  @override
  String get legislationSponsorLabel => 'Sponsor';

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
  String get citizenPollTitle => 'Bürgerwille';

  @override
  String get pollTemporarilyUnavailable =>
      'Umfrage vorübergehend nicht verfügbar. Bitte versuchen Sie es später erneut.';

  @override
  String get errorDisplayingPollBar =>
      'Fehler bei der Anzeige der Umfrageergebnisse.';

  @override
  String get pollNoForAgainstVotes => 'Keine Dafür-/Dagegen-Stimmen';

  @override
  String get pollNoVotesCast => 'Sei der Erste, der seine Stimme abgibt.';

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
  String get infoTitle1 => 'Bürger über Politik';

  @override
  String get infoParagraph1 =>
      'Medien informieren nicht nur – sie kuratieren die Realität. Schätzungsweise 95% der Gesetzgebung verschwinden in einem \"schwarzen Loch\", weil sie zu komplex sind, um Werbung zu verkaufen. Lustra umgeht die Mittelsmänner. Wir verarbeiten bürokratische Sprache in verständliche Fakten und zeigen Ihnen, was wirklich beschlossen wird, nicht nur, worüber man sprechen will.';

  @override
  String get infoTitle2 => 'Fakten statt Marketing';

  @override
  String get infoParagraph2 =>
      'Politik ist heute 80% Marketing und 20% Gesetz. Wir trennen beides. Wir wenden einen Prozess der \"Kontext-Sterilisierung\" an: Wir entfernen emotionale Sprache und parteipolitische Färbung und lassen nur die juristischen Fakten übrig. Dies ist kein \"anderer Blickwinkel\". Es ist Rauschunterdrückung, die es Ihnen ermöglicht, sich eine eigene Meinung an der Quelle zu bilden.';

  @override
  String get infoTitle3 => 'Macht ohne Mittelsmänner';

  @override
  String get infoParagraph3 =>
      'Große Plattformen optimieren Inhalte auf Ihre Empörung, weil das Ihre Aufmerksamkeit bindet. Wir optimieren auf Ihr Wissen. Die Hierarchie der Themen in der App hängt ausschließlich von den Stimmen der Community ab. Sie entscheiden, was wichtig ist, und holen sich die Macht von Verlegern und Lobbyisten zurück.';

  @override
  String get infoTitle4 => 'Architekten des Wandels';

  @override
  String get infoParagraph4 =>
      'Demokratie ist kein Zuschauersport. Wir führen einen Mechanismus ein, bei dem Bürgerinitiativen gleichberechtigt neben Regierungsentwürfen präsentiert werden. Wir bieten die Infrastruktur, um vom passiven Beobachter zum Architekten des Wandels zu werden – um echte Unterstützung für wichtige Themen aufzubauen. Wir heben die Demokratie auf eine neue Ebene.';

  @override
  String get linkHowTechnologyWorks => 'Wie funktioniert die Technologie?';

  @override
  String get linkTermsAndPrivacy => 'AGB und Datenschutzrichtlinie';

  @override
  String get supportScreenTitle => 'Öffentliche Infrastruktur';

  @override
  String get supportParagraph1 =>
      'Lustra ist eine digitale öffentliche Dienstleistung. Aber Freiheit hat ihren Preis. Wir haben Kapital abgelehnt, um 100% Unparteilichkeit zu garantieren, da wir glauben, dass dies der einzige Weg zur Veränderung ist. Die Wartung der Infrastruktur und Server hängt allein von freiwilligen Beiträgen ab. Der Gegenwert von 10\$ finanziert den Zugang zur Plattform für mehrere tausend Menschen monatlich. Deine Unterstützung garantiert die Kontinuität der Mission.';

  @override
  String get buttonSupportFinancially => 'Unterstützen';

  @override
  String get supportThankYou => 'Danke. Du hältst das System am Leben.';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Gründer';

  @override
  String get futureFeaturesScreenTitle => 'Community-Roadmap';

  @override
  String get futureFeaturesHeader => 'Du bestimmst die Richtung';

  @override
  String get futureFeatureSenate => 'Senatoren-Integration';

  @override
  String get futureFeatureCitizenInitiative => 'Bürgerentscheide';

  @override
  String get futureFeaturesDescription =>
      'Dies ist keine geschlossene Wunschliste. Lustra ist eine Infrastruktur, die den Bürgern gehört, daher haben wir alle Einfluss auf die Entwicklung. Tritt der Civic Evolution Community auf Reddit bei, reiche Ideen ein und stimme über die nächsten Funktionen ab. Lass uns gemeinsam das nächste Kapitel der Demokratie schreiben!';

  @override
  String get futureFeaturesVoteButton => 'Über Roadmap abstimmen';

  @override
  String get comingSoon => 'Vorschlag';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Legislative - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Cache aktualisieren';

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
  String get lustraClubLabel => 'Lustra-Club';

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
  String get mandateStatusActive => 'Mandat: aktiv';

  @override
  String get mandateStatusFulfilled => 'Mandat: erfüllt';

  @override
  String get mandateStatusCancelled => 'Mandat: annulliert';

  @override
  String get mandateStatusInactive => 'Mandat: inaktiv';

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
  String get pollResultNoVotes => 'Sei der Erste, der seine Stimme abgibt.';

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
  String get votingResultsUSMotionToReferTitle => 'ERGEBNIS: VERWEISUNG';

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
      '...vollständige Informationen sind in Lustra verfügbar';

  @override
  String get civicRulesAction => 'Erstellen Sie Ihr Projekt';

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
  String get termsAndPrivacyTitle => 'Verfassung & Datenschutz';

  @override
  String get termsOfServiceTab => 'Regeln';

  @override
  String get privacyPolicyTab => 'Datenschutz';

  @override
  String get termsOfServiceContent =>
      'LUSTRA COMMUNITY REGELN\nDatum: 6. Dezember 2025\n\n1. BETREIBER UND MISSION\nLustra ist eine digitale öffentliche Infrastruktur. Rechtlicher Betreiber (Verwalter) ist FO&WO VENTURES SP. Z O.O. (LLC). Das Unternehmen fungiert als Inkubator: keine Dividenden, keine externen Investoren, Reinvestition in Infrastruktur.\n\n2. CODE UND LIZENZ (SOURCE AVAILABLE)\nCode ist Gemeingut.\n• Modell: Open Source (AGPLv3).\n• Erlaubt: Bildung, Forschung, Non-Profit.\n• Verboten: Konzerne dürfen ohne Zustimmung nicht profitieren.\n\n3. GOVERNANCE-ROADMAP\nZiel: Dezentralisierung.\n• Aktuell: Gründer (Jacek) als Leitender Architekt.\n• Bald: Bürgerrat, gewählt von Nutzern.\n• Ziel: Mechanismen zur Übernahme durch die Community bei Verrat der Mission.\n\n4. BÜRGERPROJEKTE\nGesetzes-Inkubator.\n• Ablauf: Einreichung per Formular, formale Prüfung.\n• Lizenz CC0: Du gibst das Projekt in die Gemeinfreiheit.\n• Meinungsfreiheit: Wir beurteilen keine Meinungen. Wir lehnen nur Strafrechtsverstöße ab.\n• Verifizierung: Du musst Bürger des jeweiligen Landes sein.\n\n5. KI UND QUELLEN\n• KI-Rolle: Hilft bei Navigation, kann Fehler machen.\n• Quelle: Letzte Instanz ist immer das Original-PDF.\n\n6. SICHERHEIT\n• Alter: Nutzer 16+.\n• Verboten: Angriffe auf Infrastruktur und kommerzielles Scraping.\n\n7. SCHLUSSBESTIMMUNGEN\nEs gilt polnisches Recht.';

  @override
  String get privacyPolicyContent =>
      'DATENSCHUTZERKLÄRUNG: MINIMIERUNG\nDatum: 6. Dezember 2025\n\nWir handeln nicht mit deiner Aufmerksamkeit. Minimale Datensammlung.\n\n1. VERANTWORTLICHER\nFO&WO VENTURES SP. Z O.O. Kontakt: jacek@lustra.dev\n\n2. WAS WIR SAMMELN\n• Konto (E-Mail/UID): Notwendig für Login.\n• Stimmen: Verknüpft mit Konto gegen Manipulation (Bots). Öffentlich NUR anonyme Summen.\n• Speicherdauer: Abstimmungsdaten werden für die Legislaturperiode + 5 Jahre gespeichert (Archiv). Danach anonymisiert.\n• Kommunikation (Support Club): Mit deiner Zustimmung (Einstellungen) senden wir Updates. Widerruf jederzeit möglich.\n• Bürgerprojekte: Inhalt ist öffentlich.\n\n3. WAS WIR NICHT TUN\n• KEIN Datenverkauf.\n• KEIN Werbe-Tracking.\n• KEINE kommerzielle politische Profilierung.\n\n4. INFRASTRUKTUR & SICHERHEIT\n• Standort: Google Cloud, Europe-West9 (Paris).\n• Anti-Bot: Nutzung von Firebase App Check.\n• KI: Deine privaten Daten gehen NIEMALS an die KI.\n\n5. KINDER\nDienst für 16+. Keine Datensammlung von Kindern.\n\n6. LÖSCHUNG\nButton \"Konto löschen\" in Einstellungen für sofortige Entfernung.\n\n7. DEINE RECHTE\nZugriff, Berichtigung, Löschung, Widerspruch. Kontakt: jacek@lustra.dev';

  @override
  String get techTitle => 'Lustra AI Protocol v1.1';

  @override
  String get techIntroTitle =>
      '1. KOMPLETTE ARBEITSMETHODIK (LUSTRA AI PROTOCOL)';

  @override
  String get techIntroBody =>
      'Nachfolgend stellen wir die vollständige Pipeline der KI-Agenten vor, die zur Generierung von Zusammenfassungen juristischer Texte und zur Erkennung von Halluzinationen in diesen verwendet wird. Ziel war es, das „legislative schwarze Loch“ zu entschärfen und gleichzeitig ein Höchstmaß an Objektivität zu erreichen. Wir betonen jedoch, dass wir nicht an völlige Neutralität glauben. Jede Datenkomprimierung (Zusammenfassung) ist eine Form der Auswahl. Anstatt das „Wahrheitsmonopol“ der Medien vorzutäuschen, haben wir einen expliziten Bias angenommen – die „Bürgerperspektive“ im Rahmen der context sterilization. Die Modelle werden angewiesen, das politische Theater zu ignorieren und sich auf den Geldbeutel, Freiheiten und Pflichten zu konzentrieren. Dies ist eine technische Designentscheidung, keine politische.';

  @override
  String get techDiagramTitle => '2. ABLAUFDIAGRAMM GENERALIZER-JUDGE-SURGEON';

  @override
  String get techDiagramIntro =>
      'Das System arbeitet in einer Verifikationsschleife. Wir vertrauen generativen Modellen nicht – wir vertrauen Überprüfungsprozessen und einem iterativen Ansatz beim Systemausbau.';

  @override
  String get techDiagramOutro =>
      'Für die Zukunft planen wir, das System um weitere Rollen zu erweitern, wie etwa einen investigativen Journalisten oder einen Analysten für rechtliche Risiken.';

  @override
  String get techPromptsTitle => '3. VOLLSTÄNDIGE ANWEISUNGEN FÜR AGENTEN';

  @override
  String get techPromptsIntro =>
      'Unten finden Sie die vollständigen Prompts, die die Modelle erhalten, zusammen mit erklärenden Kommentaren für den Leser. Die Antworten werden für die vollständige Lokalisierung von Lustra sofort in 8 Sprachen zurückgegeben, daher haben wir die gesamte JSON-Antwortstruktur der Lesbarkeit halber weggelassen.';

  @override
  String get techGeneralizerTitle => 'A) Generalizer';

  @override
  String get techGeneralizerBody =>
      'Modell: Gemini Flash (Standard) / Pro (für <20k Token)';

  @override
  String get techGeneralizerCode =>
      '// MODELLEINSTELLUNG\n// Die Rollendefinition ist kritisch. \"[country]\" ist eine Variable, die das Modell stabilisiert.\n// Die Perspektive eines Bürgers der Ukraine (ein Land im Krieg) ist für die Modelle anders als die Perspektive eines Bürgers von Belgien (der vielleicht mehr auf Bürokratie achtet).\n// Dies setzt den gesamten Kontext für die Interpretation der \"Wichtigkeit\" einer Vorschrift.\nSie sind ein Experte für das Recht von [country], [...]\n\n// KERNMETHODIK\n// Das ist keine \"sanfte Bitte\". Es ist eine harte Anweisung zum Filtern von Rauschen.\n// Das Modell soll Politik ignorieren und nach Auswirkungen auf Geldbeutel und Leben suchen.\n[...] dessen Aufgabe es ist, Gesetzesdokumente, Beschlüsse und andere legislative Dokumente zu analysieren und daraus Informationen auf verständliche Weise für Bürger aufzubereiten. Ihr Ziel ist es, Informationen so darzustellen, dass Bürger die Auswirkungen der Gesetzgebung auf ihr Leben selbst beurteilen können, auch ohne juristisches Fachwissen. Konzentrieren Sie sich auf Fakten und objektive Auswirkungen der eingeführten Änderungen und vermeiden Sie Wertungen und persönliche Meinungen. Jeglicher juristischer Jargon ist verboten. Präsentieren Sie Informationen klar, prägnant und ansprechend, sodass sie für eine Person ohne juristische Ausbildung verständlich sind. Vermeiden Sie lange, komplexe Sätze. Anstatt zu schreiben „Der Entwurf zielt auf eine Novellierung der Abgabenordnung ab...“, schreiben Sie „Steueränderungen: neue Erleichterungen und Pflichten für...“. Setzen Sie Ihre Arbeit fort, bis Sie Ihre Aufgabe gelöst haben. Wenn Sie sich bezüglich des generierten Inhalts unsicher sind, analysieren Sie das Dokument erneut – raten Sie nicht. Planen Sie Ihre Aufgabe gut, bevor Sie beginnen. Heben Sie in der Zusammenfassung und den Kernpunkten, wenn möglich und gerechtfertigt, hervor, welche konkreten Vorteile oder Auswirkungen (positiv oder negativ) das Gesetz für das tägliche Leben der Bürger, ihre Rechte und Pflichten, persönlichen Finanzen, Sicherheit und andere wichtige Fragen (z. B. kategorische Verbote und Gebote oder wichtigste konkrete finanzielle und territoriale Zuweisungen) mit sich bringt.\n// TECHNISCHE JSON-STRENGE\n// Der Backend-Container ist gnadenlos. Er akzeptiert kein „Gerede“.\n// Es muss sauberes JSON sein. Ein Kommafehler = Fail und Ablehnung des Ganzen.\nBevor Sie die Antwort zurückgeben, überprüfen Sie sorgfältig, ob die gesamte JSON-Struktur zu 100% korrekt ist, einschließlich aller Kommas, geschweiften Klammern, eckigen Klammern und Anführungszeichen. Fehlerhaftes JSON ist inakzeptabel und verhindert die Verarbeitung Ihrer Arbeit.\nAnalysieren Sie den Text des Rechtsdokuments unten sorgfältig.\nDies ist der Inhalt, auf dessen Grundlage Sie die Zusammenfassung und die Kernpunkte generieren sollen:\n--- DOKUMENTENBEGINN ---\n[DOCUMENT_TEXT]\n--- DOKUMENTENENDE --\n\n// OUTPUT-STRUKTUR (für 8 Sprachen)\n// Muss perfekt ausgefüllt werden. Jeder Schlüssel wird validiert.\n// Wenn das Modell z.B. \"fr_summary\" auslässt -> landet alles im Müll.\nDENKEN SIE DARAN: Ihre Antwort MUSS ausschließlich ein gültiges JSON-Objekt sein. Fügen Sie keine zusätzlichen Zeichen, Kommentare oder Texte vor dem Tag \'OPEN_BRACE\' oder nach dem Tag \'CLOSE_BRACE\' hinzu. Die gesamte Antwort muss als JSON parsbar sein.\nFüllen Sie basierend auf dem OBIGEN Dokument die folgende JSON-Struktur aus: (...)';

  @override
  String get techJudgeTitle => 'B) Judge';

  @override
  String get techJudgeBody => 'Modell: Flash Lite';

  @override
  String get techJudgeCode =>
      '// MODELLEINSTELLUNG\n// Dies ist ein einfaches heuristisches Modell, daher muss seine Rolle auch einfach sein. Es soll das Gesetz nicht \"verstehen\". Es soll nur zwei Datensätze vergleichen. EINE AUFGABE!\nROLE: Fact Checker.\nAUFGABE: Vergleiche SOURCE (Original) und SUMMARY (Zusammenfassung erstellt durch eine andere KI).\nIhr Ziel ist es, \"ERFUNDENE ENTITÄTEN\" (Fabricated Entities) in der SUMMARY zu erkennen.\nSOURCE:\n[SOURCE_TEXT]\nSUMMARY TO EVALUATE:\nTitle: [AI_TITLE]\nSummary: [AI_SUMMARY]\nKey Points: [AI_KEY_POINTS]\n// BEWERTUNGSMETHODIK\n// Wir mussten starre Regeln definieren, da Flash Lite bei Abstraktion den Faden verlor, also bekam er eine Checkliste.\n// Konkrete Anweisungen reduzieren das Entscheidungsrauschen des Modells.\nBEWERTUNGSREGELN:\n1. Überprüfen Sie alle ZAHLEN, DATEN und BETRÄGE in der SUMMARY. Wenn eines in der SOURCE fehlt -> is_valid: false.\n2. Überprüfen Sie alle NAMEN, ORGANISATIONEN und ORTE in der SUMMARY. Wenn einer in der SOURCE fehlt -> is_valid: false.\n3. Überprüfen Sie alle konkreten RECHTLICHEN HANDLUNGEN. Wenn dieser Mechanismus nicht in der SOURCE vorhanden ist -> is_valid: false.\n// AUSNAHME FÜR ABSTRAKTION\n// Das ist entscheidend. Abstrakte Konzepte (z.B. \"Anstieg der Bürokratie\") ergaben oft False Positives.\n// Wir mussten sie von der Bewertung als \"fabricated entity\" ausschließen, da der Richter korrekte logische Schlussfolgerungen ablehnte.\nWICHTIG: Abstrakte Begriffe (z.B. \"Transparenz\", \"Vertrauen\") sind als Schlussfolgerungen zulässig.\n\n// OUTPUT-STRUKTUR und Formatierungsanforderungen zur Strukturierung der Antwort.\nOUTPUT (JSON):\n(\n\"is_valid\": true/false,\n\"issue\": \"fabricated_entity\" / \"contradiction\" / \"none\"\n)\nFORMATIERUNGSANFORDERUNGEN:\n1. Antworten Sie AUSSCHLIESSLICH mit einem rohen JSON-Objekt.\n2. Verwenden Sie KEINE Markdown-Codeblöcke.\n3. Fügen Sie KEINE Einleitungen oder Erklärungen vor oder nach dem JSON hinzu.\n4. Das JSON muss korrekt und bereit zum Parsen sein.';

  @override
  String get techSurgeonTitle => 'C) Surgeon';

  @override
  String get techSurgeonBody => 'Modell: Gemini Pro';

  @override
  String get techSurgeonCode =>
      '// MODELLEINSTELLUNG\n// Der Chirurg ist nicht zum Schreiben da. Er ist dazu da, den Krebs (Halluzinationen) herauszuschneiden.\n// Muss die Konsistenz mit dem vom Generalizer auferlegten \"Citizen Bias\" wahren.\n// Aus diesem Grund müssen wir auf aggressives Grounding umsteigen.\nSie sind ein LEGISLATIVE SURGEON.\nIhre Aufgabe ist das Audit und die Reparatur der Zusammenfassung (JSON) hinsichtlich der Übereinstimmung mit dem Quelltext (SOURCE).\n// MEGA WICHTIG. Er darf keine Informationen hinzufügen. Wenn er das täte – erhöhen wir das Risiko von Halluzinationen, und er hat keinen Richter mehr über sich. Besser unvollständige Zusammenfassungen als unwahre.\nGRUNDREGEL: \"NO NEW INFORMATION\" (keine neuen Informationen).\nDie Zusammenfassung darf nur Informationen transformieren, die in der SOURCE enthalten sind (kürzen, übersetzen, summieren). Sie darf keine neuen Informationen generieren, die nicht in der SOURCE stehen.\n// VERIFIKATIONSPROZEDUR (WORKFLOW)\n// Wir zwingen dem Modell einen \"Satz-für-Satz\"-Denkprozess auf.\nVERIFIKATIONSPROZEDUR (führen Sie dies für jeden Satz im JSON aus):\nFragen Sie sich: \"Kann ich im SOURCE einen konkreten Abschnitt nennen, der diese Aussage bestätigt?\"\nWENN DIE ANTWORT \"JA\" LAUTET:\nDie Information ist durch ein Zitat, ein Synonym oder ein mathematisches Ergebnis aus Daten im Text bestätigt.\nENTSCHEIDUNG: Unverändert lassen.\nWENN DIE ANTWORT \"NEIN\" LAUTET:\nDie Information steht nicht im Text (es ist eine Halluzination, externes Wissen des Modells, Überinterpretation oder unnötige Extrapolation).\nENTSCHEIDUNG: Entfernen Sie diese Information oder ändern Sie sie so, dass sie im Text abgedeckt ist.\nWENN DIE ANTWORT \"ES KOMMT DARAUF AN\" LAUTET:\nDer Text ist unklar und die Zusammenfassung \"rät\" (z.B. durch Nennung eines konkreten Beispiels für einen allgemeinen Begriff).\nENTSCHEIDUNG: Gehen Sie auf Nummer sicher. Entfernen Sie das Raten. Verwenden Sie die Terminologie aus dem Text.\n// RISIKOKATEGORIEN\n// Geschätzt auf Basis früherer Fehler des Generalizers.\n// Wir geben ihm eine \"Straßenkarte\", wo meistens die Minen liegen.\nRISIKOKATEGORIEN (besondere Aufmerksamkeit):\nDaten (Gültigkeitsbeginn vs. Finanzierungsbeginn).\nZahlen (konkrete Beträge müssen sich aus dem Text ergeben).\nSubjekte (wer macht was).\nUmfang (was das Gesetz abdeckt und was nicht).\n\nINPUT:\n--- SOURCE_TEXT START ---\n[SOURCE_TEXT]\n--- SOURCE_TEXT END ---\n\n--- FLAGGED_JSON START ---\n[FLAGGED_JSON]\n--- FLAGGED_JSON END ---\n\nOUTPUT:\nAusschließlich das reparierte JSON-Objekt gemäß Struktur: (...)';

  @override
  String get techConclusionsTitle => '4. EMPIRISCHE SCHLUSSFOLGERUNGEN';

  @override
  String get techConclusionsIntro =>
      'Mit der Weiterentwicklung des Systems war es notwendig, Entscheidungen auf der Grundlage von Beobachtungen statt Modellparametern zu treffen. Daraus ergaben sich einige recht interessante Erkenntnisse.';

  @override
  String get techConclusionATitle =>
      'A) Warum ein „dümmeres“ Modell verwenden?';

  @override
  String get techConclusionABody =>
      'Anfängliche Tests mit polnischem Recht, die von Claude und ChatGPT auditiert wurden, zeigten, dass Gemini Flash die besten Zusammenfassungen generierte. Dicht gefolgt vom Pro-Modell, das manchmal eine etwas schlechtere Bewertung erhielt, weil es weitgehende Schlussfolgerungen zog oder einige Kleinigkeiten ausließ. Paradoxerweise trug das „Denken“ des Modells zu einer etwas schlechteren inhaltlichen Qualität bei. Fazit? Wenn Pro einen kurzen und einfachen Text erhält, fängt es an zu philosophieren. Im Ergebnis kann es Schlüsselfakten auslassen, die es für zu offensichtlich hält. Viel häufiger verliert es auch die JSON-Struktur (vergisst, die Klammer zu schließen). Bei einfachen Zusammenfassungen ist die Wahl offensichtlich.';

  @override
  String get techConclusionBTitle => 'B) Wozu dann Pro?';

  @override
  String get techConclusionBBody =>
      'Die Schwierigkeiten beginnen bei längeren Dokumenten. Hier liegt das Pro-Modell definitiv vorn, während schwächere Modelle eine viel größere Tendenz zu Halluzinationen haben. Diese Beobachtungen werden auch durch wissenschaftliche Studien (Lost in the Middle) bestätigt. Dies erzwingt die Notwendigkeit, bei längeren Dokumenten sofort das Pro-Modell einzusetzen.';

  @override
  String get techConclusionCTitle => 'C) Effektivität';

  @override
  String get techConclusionCBody =>
      'Basierend auf empirischen Erfahrungen (Hunderte von Versuchen, verschiedene Parlamente) liegt die Anti-Hallucination-Rate bei >99%. Um den Koeffizienten präziser zu schätzen, wären zusätzliche finanzielle Aufwendungen erforderlich (Tausende oder Zehntausende von Tests mit den stärksten Modellen konkurrierender KI-Firmen). Man kann dies daher mit Vorsicht genießen. Die meisten Halluzinationen sind kleine Fehler, z.B. die Verwendung des Wortes „Mensch“ anstelle von „Abgeordneter“ in der Zusammenfassung. Das Hauptproblem des Systems sind also nicht sie, sondern eine zu starke Verallgemeinerung. Manchmal erstellt der Generalizer eine korrekte Zusammenfassung, lässt aber einen kritischen Punkt aus, der für die öffentliche Debatte sehr wichtig ist. Dies ist jedoch ein Kompromiss, den das System derzeit eingeht, fokussiert auf die vollständige Eliminierung von Halluzinationen. Langeweile ist sicherer als eine Lüge.';

  @override
  String get techFooterDate => 'Aktualisierungsdatum Q1 2026';

  @override
  String get techFooterLicense => 'Open Source License (AGPLv3)';

  @override
  String get techGraphSource => 'Legislation Source';

  @override
  String get techGraphDecisionLength => 'Länge > 20k Token?';

  @override
  String get techGraphNo => 'NEIN';

  @override
  String get techGraphYes => 'JA';

  @override
  String get techGraphFlash => 'Flash (System 1)';

  @override
  String get techGraphPro => 'Pro (System 2)';

  @override
  String get techGraphJudge => 'The Judge (Flash Lite)';

  @override
  String get techGraphDecisionPass => 'Ergebnis: Pass?';

  @override
  String get techGraphPublishFirestore => 'HTML Ready';

  @override
  String get techGraphNoRetry => 'NEIN (Retry)';

  @override
  String get techGraphRepairLoop => 'Reparaturschleife';

  @override
  String get techGraphRetryFlash => '< 2 Fehler: Flash';

  @override
  String get techGraphRetrySurgeon => '> 2 Fehler: Surgeon';

  @override
  String get techGraphSurgeon => 'The Surgeon (Pro)';

  @override
  String get techGraphHtmlReady => 'HTML Ready';

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
    return 'Abstimmen ist eine Entscheidung. Treffe deine eigene hier: $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Profil und Abstimmungsverhalten: $deepLink';
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

  @override
  String get authErrorAppleFailed =>
      'Apple-Anmeldung fehlgeschlagen. Bitte versuchen Sie es erneut.';

  @override
  String get continueWithApple => 'Mit Apple fortfahren';

  @override
  String get homeSearchHint => 'Geben Sie einen Begriff ein...';

  @override
  String get homeSearchButtonDeputies => 'Abgeordnete';

  @override
  String get homeSearchButtonLegislations => 'Gesetze';

  @override
  String get actionSeeAll => 'Alle anzeigen';

  @override
  String get notificationsEnabledForOtherParliament =>
      'Für ein anderes Parlament aktiv';

  @override
  String get votingResultsUSMotionToTableTitle =>
      'ERGEBNISSE: ANTRAG AUF ABLEHNUNG';

  @override
  String get crowdfundingLabel =>
      'Unterstütze Lustra dabei, eine unabhängige Quelle zu bleiben:';

  @override
  String get hashtagLaw => 'Gesetz';

  @override
  String get hashtagPolitician => 'Politiker';

  @override
  String get statusIntroduced => 'Eingebracht';

  @override
  String get statusPassedHouse => 'Im Repräsentantenhaus verabschiedet';

  @override
  String get statusPassedSenate => 'Im Senat verabschiedet';

  @override
  String get statusBecameLaw => 'Wurde Gesetz';

  @override
  String get statusVetoed => 'Veto eingelegt';

  @override
  String get statusFailed => 'Gescheitert';

  @override
  String get statusPlacedOnCalendar => 'Im Kalender platziert';

  @override
  String get actionBack => 'Zurück';

  @override
  String get actionViewSourceJson => 'KI-Arbeitsprotokolle für dieses Dokument';

  @override
  String get manualEmailDialogTitle => 'Nachricht manuell senden';

  @override
  String get manualEmailDialogDescription =>
      'Kein E-Mail-Client erkannt. Kopieren Sie die untenstehenden Daten und senden Sie sie selbst.';

  @override
  String get labelRecipient => 'Empfänger';

  @override
  String get labelSubject => 'Betreff';

  @override
  String get labelBody => 'Nachrichtentext';

  @override
  String get actionCopy => 'Kopieren';

  @override
  String get copiedToClipboard => 'In die Zwischenablage kopiert';

  @override
  String get webBannerDownloadMessage =>
      'Um alle Funktionen nutzen zu können, laden Sie die App herunter!';

  @override
  String get webBannerDownloadButton => 'Herunterladen';

  @override
  String get supportStripeButton => 'Unterstützen (Stripe)';

  @override
  String get supportFounderMessage =>
      'Hinter diesem Projekt steht kein großer Konzern, nur ich und mein Laptop. Ich habe das gebaut, weil ich glaube, dass solche Technologie existieren muss und zu 100% unabhängig vom Kapital bleiben muss, das immer das Narrativ diktiert. Das ist mein Geschenk an die Welt.';

  @override
  String get civicProjectTitle => 'Bürgerprojekt';

  @override
  String get drafterAuthRequired =>
      'Authentifizierung erforderlich. Bitte melden Sie sich zuerst bei Lustra an.';

  @override
  String get drafterLaunchError => 'Fehler beim Starten des Drafter-Gateways:';

  @override
  String get drafterButtonTitle =>
      'VERWENDEN SIE LUSTRA DRAFTER, UM IN 5 MINUTEN EIN GESETZ AUS EINER IDEE ZU ERSTELLEN';

  @override
  String get submitCivicProjectButton => 'Erstellen Sie Ihr Projekt';

  @override
  String get civicThresholdCandidate => 'Überarbeitungsbedürftig.';

  @override
  String get statusInitiative => 'Initiative';

  @override
  String get civicTitle => 'Projets Citoyens';

  @override
  String get civicIncubatorTitle => 'Incubateur de Projets Citoyens';

  @override
  String get civicSubtitle => 'Dessiner l\'avenir de la démocratie, ensemble.';

  @override
  String get civicSection1Title => '1. Règles du Programme & Gouvernance';

  @override
  String get civicSection1Intro =>
      'Lustra fournit aux citoyens une infrastructure législative. Nous traitons vos idées avec le même sérieux que les projets de loi gouvernementaux. Pour garantir la qualité, des règles strictes s\'appliquent :';

  @override
  String get civicProcessTitle => 'Le Processus';

  @override
  String get civicRuleSubmissionTitle => 'Soumission :';

  @override
  String get civicRuleSubmissionText =>
      'Vous soumettez un projet par email/formulaire.';

  @override
  String get civicRuleReviewTitle => 'Examen Formel (Humain) :';

  @override
  String get civicRuleReviewText =>
      'Nous vérifions la conformité avec la norme LDS-1. Nous filtrons strictement les discours de haine, le spam, les doublons et le contenu non législatif.';

  @override
  String get civicRuleAiTitle => 'Stérilisation IA :';

  @override
  String get civicRuleAiText =>
      'Les projets approuvés sont traités par notre IA pour supprimer le langage émotionnel et extraire les faits essentiels.';

  @override
  String get civicRulePublicationTitle => 'Publication :';

  @override
  String get civicRulePublicationText =>
      'Le projet reçoit une « Carte de Loi Citoyenne » dans l\'application, visuellement égale à la législation gouvernementale.';

  @override
  String get civicWarningTitle => 'Projektintegrität';

  @override
  String get civicWarningText =>
      'Der Haupttext ist dauerhaft. Du kannst nur Ergänzungen (Amendments) hinzufügen, um den Entwurf zu verbessern, ohne die Kernidee zu ändern. Alle Änderungen sind transparent und werden als Anhänge geführt.';

  @override
  String get civicPoliciesTitle => 'Politiques Critiques';

  @override
  String get civicPolicyPublicDomainTitle => 'Domaine Public (CC0) :';

  @override
  String get civicPolicyPublicDomainText =>
      'En soumettant un projet, vous renoncez à tout droit d\'auteur. La loi appartient à tous.';

  @override
  String get civicPolicyAstroturfingTitle => 'Anti-Astroturfing :';

  @override
  String get civicPolicyAstroturfingText =>
      'Vous devez déclarer si vous représentez une organisation. Le lobbying caché entraîne un bannissement permanent.';

  @override
  String get civicPolicyAdPersonamTitle => 'Ad Personam :';

  @override
  String get civicPolicyAdPersonamText =>
      'Les projets visant des individus spécifiques (diffamation) sont rejetés immédiatement.';

  @override
  String get civicPolicyTrashTitle => 'Pas de Poubelle :';

  @override
  String get civicPolicyTrashText =>
      'Lustra n\'est pas un forum. Les brouillons de mauvaise qualité, les doublons et les manifestes sont rejetés à l\'entrée.';

  @override
  String get civicSection2Title => '2. Standard Législatif Lustra (LDS-1)';

  @override
  String get civicSection2Intro =>
      'Votre projet doit suivre cette structure. S\'il ressemble à un article de blog, il sera rejeté.';

  @override
  String get civicStructureTitle => 'Structure Requise :';

  @override
  String get civicStructureTitleItem => 'Titre :';

  @override
  String get civicStructureTitleText => 'Descriptif et neutre.';

  @override
  String get civicStructureArticlesItem => 'Articles :';

  @override
  String get civicStructureArticlesText =>
      'Texte divisé en unités numérotées (Art. 1, Art. 2...) contenant des mécanismes spécifiques (interdictions, mandats).';

  @override
  String get civicStructureExposeItem => 'Exposé des Motifs :';

  @override
  String get civicStructureExposeText => 'Section obligatoire expliquant :';

  @override
  String get civicExposePoint1 => '• (1) Diagnostic du problème.';

  @override
  String get civicExposePoint2 => '• (2) Objectif de la régulation.';

  @override
  String get civicExposePoint3 => '• (3) Impact social attendu.';

  @override
  String get civicSection3Title => '3. Score de Préparation Lustra';

  @override
  String get civicSection3Intro =>
      'Nous ne jugeons pas vos opinions politiques. Nous jugeons la qualité de la construction. Notre IA analyse chaque projet sur une échelle de 0 à 100 :';

  @override
  String get civicScoreStructureTitle => 'Structure (30 pts) :';

  @override
  String get civicScoreStructureText =>
      'Formatage juridique correct et langage précis.';

  @override
  String get civicScoreExposeTitle => 'Exhaustivité de l\'Exposé (30 pts) :';

  @override
  String get civicScoreExposeText =>
      'Clarté de la définition du problème/solution.';

  @override
  String get civicScoreLogicTitle => 'Logique Interne (20 pts) :';

  @override
  String get civicScoreLogicText => 'Absence de contradictions.';

  @override
  String get civicScoreImpactTitle => 'Analyse d\'Impact (20 pts) :';

  @override
  String get civicScoreImpactText =>
      'Faisabilité et identification des groupes concernés.';

  @override
  String get civicThresholdsTitle => 'Seuils :';

  @override
  String get civicThresholdRejected => 'Rejeté / Renvoyé.';

  @override
  String get civicThresholdReady => 'Publication prioritaire.';

  @override
  String get civicSection4Title =>
      '4. Boîte à Outils du Créateur (Copier-Coller)';

  @override
  String get civicSection4Intro =>
      'Utilisez ce modèle pour vous assurer que votre projet respecte la norme LDS-1.';

  @override
  String get civicTemplateCode =>
      'TITRE : [Insérer un titre descriptif ici]\n\nPRÉAMBULE : [Optionnel : Reconnaissant que...]\n\nCHAPITRE I : DISPOSITIONS GÉNÉRALES\nArt. 1. L\'objectif de cette Loi est [Insérer l\'objectif].\nArt. 2. Cette Loi s\'applique à [Insérer le champ d\'application].\n\nCHAPITRE II : [MÉCANISME PRINCIPAL / INTERDICTIONS]\nArt. 3. \n1. Il est interdit de [Action].\n2. Les entités sont tenues de [Action].\n\nCHAPITRE III : SANCTIONS & DISPOSITIONS FINALES\nArt. X. La violation de l\'Art. 3 est punie par [Sanction].\nArt. Y. Cette Loi entre en vigueur le [Date].\n\n---\nEXPOSÉ DES MOTIFS\n\n1. LE PROBLÈME\n[Décrivez la situation actuelle et pourquoi elle échoue.]\n\n2. L\'OBJECTIF\n[Expliquez ce que cette loi corrige et comment.]\n\n3. IMPACT ATTENDU\n[Décrivez les conséquences sociales, économiques ou juridiques.]';

  @override
  String get civicSubmitButton => 'SOUMETTRE LE PROJET (EMAIL)';

  @override
  String get civicFooterCopyright =>
      '© 2025 Initiative Lustra.\nInfrastructure pour l\'Âge Civique.';

  @override
  String civicEmailSubject(Object parliamentName) {
    return '[Soumission LDS-1] Titre du Projet - $parliamentName';
  }

  @override
  String get civicEmailBodyPlaceholder =>
      '[COLLEZ VOTRE MODÈLE ICI]\n\nAuteur / Organisation :\nInfo Contact :\n';

  @override
  String get civicEmailDialogTitle => 'Client Email Non Trouvé';

  @override
  String get civicEmailDialogIntro =>
      'Veuillez copier les détails ci-dessous et envoyer manuellement :';

  @override
  String get civicEmailDialogRecipient => 'Destinataire';

  @override
  String get civicEmailDialogSubject => 'Sujet';

  @override
  String get civicEmailDialogBody => 'Corps';

  @override
  String get civicCopiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get civicTemplateCopied => 'Modèle copié !';

  @override
  String get supportMegaTitle => 'Bürgereigentum';

  @override
  String get verificationRequiredTitle => 'Verifizierung erforderlich';

  @override
  String get verificationRequiredContent =>
      'Um Ihre Stimme im Ranking zu zählen, müssen wir bestätigen, dass Sie ein Mensch sind.\n\nBitte überprüfen Sie Ihren Posteingang (auch den SPAM-Ordner).';

  @override
  String get verificationResendLink => 'Link erneut senden';

  @override
  String get verificationLinkSentSuccess => 'Link erneut gesendet!';

  @override
  String get verificationAlreadyConfirmed => 'Ich habe bestätigt';

  @override
  String get verificationSuccessVotingUnlocked =>
      'Danke! Sie können jetzt abstimmen.';

  @override
  String get verificationStillNotVerified =>
      'Bestätigung noch nicht gefunden. Bitte versuchen Sie es gleich noch einmal.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get pollVoteSignificance => 'Deine Stimme ist erst der Anfang.';

  @override
  String get pollShareImpact =>
      'Algorithmen bringen uns oft zum Schweigen. Dein einmaliges Teilen erreicht im Schnitt 50-300 Personen. Hilf uns, die Social-Media-Blase zu durchbrechen.';

  @override
  String get pollShareAction => 'Teilen und die Stimme der Bürger stärken';

  @override
  String get listRefreshed => 'Liste aktualisiert!';

  @override
  String get errorNoDataReturned => 'Keine Daten zurückgegeben';

  @override
  String get errorMustBeLoggedInToSubscribe =>
      'Du musst angemeldet sein, um zu abonnieren.';

  @override
  String get subscribedToList => 'Liste abonniert!';

  @override
  String get unsubscribedFromList => 'Abonnement beendet.';

  @override
  String get errorListRemovedByOwner =>
      'Liste wurde vom Eigentümer entfernt...';

  @override
  String get errorFailedToUpdateSubscription =>
      'Abonnement konnte nicht aktualisiert werden.';

  @override
  String get notificationSentCooldownActive =>
      'Benachrichtigung an Abonnenten gesendet!...';

  @override
  String get errorCooldownActiveNotification =>
      'Sperrfrist aktiv. Du kannst senden...';

  @override
  String get errorFailedToSendNotification =>
      'Benachrichtigung konnte nicht gesendet werden.';

  @override
  String get nameYourCuratorList => 'Benenne deine Autorenliste';

  @override
  String get hintCuratorListExample => 'z.B. Meine Wirtschaftspolitik';

  @override
  String listCreatedSuccess(String text) {
    return 'Liste \'$text\' erstellt!';
  }

  @override
  String get errorFailedToCreateList => 'Liste konnte nicht erstellt werden.';

  @override
  String get actionCreate => 'Erstellen';

  @override
  String get unnamedList => 'Unbenannte Liste';

  @override
  String get tooltipEditList => 'Liste bearbeiten';

  @override
  String get addDescriptionHint => 'Füge eine Beschreibung hinzu...';

  @override
  String subscribersCount(int subs) {
    return '$subs Abonnenten';
  }

  @override
  String get actionShareList => 'Liste teilen';

  @override
  String get actionSupportCreator => 'Ersteller unterstützen';

  @override
  String availableInHours(int hoursLeft) {
    return 'Verfügbar in ${hoursLeft}h';
  }

  @override
  String get actionNotifySubscribers => 'Abonnenten benachrichtigen';

  @override
  String get actionSubscribed => 'Abonniert';

  @override
  String get actionSubscribe => 'Abonnieren';

  @override
  String get tooltipReportList => 'Liste melden';

  @override
  String get tooltipDeleteList => 'Liste löschen';

  @override
  String get draftYourCivicProject => 'Entwerfen Sie Ihr eigenes Bürgerprojekt';

  @override
  String get draftCivicProjectDescription =>
      'Verwandeln Sie Ihre Ideen in echte Gesetzentwürfe und sammeln Sie Unterstützung. Lustra ist bereit für Ihre Politik.';

  @override
  String get createYourOwnList => 'Erstellen Sie Ihre eigene Liste';

  @override
  String get createYourOwnListDescription =>
      'Werden Sie Kurator. Wählen Sie wichtige Gesetzentwürfe aus, laden Sie Follower ein und senden Sie Push-Benachrichtigungen auf deren Geräte, um sie über Änderungen in Ihrer Gesetzgebungsliste oder bei Bürgerprojekten auf dem Laufenden zu halten.';

  @override
  String get editListDetails => 'Listendetails bearbeiten';

  @override
  String get listNameLabel => 'Listenname';

  @override
  String get descriptionOptionalLabel => 'Beschreibung (Optional)';

  @override
  String get supportCreatorOptionalLabel => 'Ersteller unterstützen (Optional)';

  @override
  String providerUsernameLabel(String provider) {
    return '$provider Benutzername';
  }

  @override
  String get listUpdatedSuccess => 'Liste aktualisiert!';

  @override
  String get errorFailedToUpdate => 'Aktualisierung fehlgeschlagen.';

  @override
  String get actionSave => 'Speichern';

  @override
  String get deleteListDialogTitle => 'Liste löschen?';

  @override
  String get deleteListDialogBody =>
      'Diese Aktion kann nicht rückgängig gemacht werden...';

  @override
  String get listDeletedSuccess => 'Liste gelöscht.';

  @override
  String get errorFailedToDelete => 'Löschen fehlgeschlagen.';

  @override
  String get actionDelete => 'Löschen';

  @override
  String get syncingCuratedFeed => 'AUTORENLISTE WIRD SYNCHRONISIERT...';

  @override
  String get actionTryAgain => 'Erneut versuchen';

  @override
  String get tooltipSetAsListCover => 'Als Listen-Cover festlegen';

  @override
  String get coverUpdatedSuccess => 'Cover aktualisiert!';

  @override
  String get errorUpdatingCover => 'Fehler beim Aktualisieren des Covers.';

  @override
  String get loaderLoadingProfile => 'PROFIL WIRD GELADEN...';

  @override
  String get loaderRetrievingVoteLogs =>
      'ABSTIMMUNGSPROTOKOLLE WERDEN ABRUFEN...';

  @override
  String get loaderLoadingRecentVotes =>
      'LETZTE ABSTIMMUNGEN WERDEN GELADEN...';

  @override
  String get loaderFetchingData => 'DATEN WERDEN ABRUFEN...';

  @override
  String get loaderLoadingTrackedBills =>
      'BEOBACHTETE GESETZE WERDEN GELADEN...';

  @override
  String get emptyTrackedBills => 'Du beobachtest noch keine Gesetze.';

  @override
  String get notificationsMobileOnly =>
      'Benachrichtigungen sind nur in der mobilen App verfügbar.';

  @override
  String get titleYourTrackedBills => 'Beobachtete Gesetze';

  @override
  String get buttonSeeAllTracked => 'Alle Beobachteten ansehen';

  @override
  String get titleNameYourList => 'Benenne deine Liste';

  @override
  String get hintEgMySocialPolicies => 'z.B. Meine Sozialpolitik';

  @override
  String snackbarListCreated(String text) {
    return 'Liste \'$text\' erstellt!';
  }

  @override
  String get snackbarFailedToCreateList =>
      'Liste konnte nicht erstellt werden.';

  @override
  String get buttonCreate => 'Erstellen';

  @override
  String get titleRenameYourList => 'Liste umbenennen';

  @override
  String get snackbarListRenamed => 'Liste umbenannt!';

  @override
  String get snackbarFailedToRenameList => 'Umbenennen fehlgeschlagen.';

  @override
  String get buttonSave => 'Speichern';

  @override
  String get titleYourLists => 'Deine Listen';

  @override
  String get emptyNoListsYet => 'Du hast noch keine Listen.';

  @override
  String get tooltipRename => 'Umbenennen';

  @override
  String get snackbarErrorUpdatingList => 'Fehler beim Aktualisieren.';

  @override
  String get tooltipShareList => 'Liste teilen';

  @override
  String get buttonCreateNewList => 'Neue Liste erstellen';

  @override
  String get errorLimitOf3ListsReached => 'Limit von 3 Listen erreicht.';

  @override
  String get snackbarFailedToDelete => 'Löschen fehlgeschlagen.';

  @override
  String get loaderFetchingMirrorParliamentData =>
      'ABRUF DER SPIEGELPARLAMENT-DATEN...';

  @override
  String get loaderSecuringSafeChannel => 'VERBINDUNG WIRD VERSCHLÜSSELT...';

  @override
  String get snackbarAddedToList => 'Zur Liste hinzugefügt.';

  @override
  String get snackbarRemovedFromList => 'Von der Liste entfernt.';

  @override
  String get loaderLoadingData => 'DATEN WERDEN GELADEN...';

  @override
  String get buttonAddToList => 'Zur Liste hinzufügen';

  @override
  String get previousStatusLabel => 'Vorher:';

  @override
  String get statusLabel => 'Status:';

  @override
  String get loaderEstablishingConnection => 'VERBINDUNG WIRD HERGESTELLT...';

  @override
  String get loaderFetchingInitiatives => 'INITIATIVEN WERDEN ABRUFEN...';

  @override
  String get loaderLoadingMoreInitiatives =>
      'WEITERE INITIATIVEN WERDEN GELADEN...';

  @override
  String get loaderLoadingMore => 'MEHR LADEN...';

  @override
  String get errorMustBeLoggedInToTrack =>
      'Du musst angemeldet sein. Benachrichtigungen nur in der App. Erstelle ein Konto.';

  @override
  String get loaderLoadingYourTrackedList =>
      'DEINE BEOBACHTUNGSLISTE WIRD GELADEN...';

  @override
  String get emptyNotTrackingAnything => 'Du beobachtest noch nichts.';

  @override
  String get loaderLoadingLegislativeData =>
      'LEGISLATIVDATEN WERDEN GELADEN...';

  @override
  String get loaderAuthorizing => 'AUTORISIERUNG...';

  @override
  String get loaderLoading => 'LADEN...';

  @override
  String get snackbarLinkCopied => 'Link in die Zwischenablage kopiert!';

  @override
  String get civicWillRecord => 'REGISTER DES BÜRGERWILLENS';

  @override
  String totalVotesRecorded(String totalVotes) {
    return '$totalVotes ERFASSTE STIMMEN';
  }

  @override
  String get recordYourPositionForAudit => 'Standpunkt für das Audit erfassen.';

  @override
  String get privateList => 'Private Liste';

  @override
  String get loaderLoadingCuratedFeed => 'AUTORENLISTE WIRD GELADEN...';

  @override
  String get buttonOpenFullList => 'Gesamte Liste öffnen';

  @override
  String get filtersLabel => 'Filter';

  @override
  String get statusFilterLabel => 'Status';

  @override
  String get onlyWithSourceTextLabel => 'Nur mit Quelltext';

  @override
  String get trackedBillsTitle => 'Beobachtete Gesetze';

  @override
  String get curatedListTitle => 'Private Liste';

  @override
  String get loaderLoadingProfiles => 'PROFILE WERDEN GELADEN...';

  @override
  String get loaderLoadingMoreProfiles => 'WEITERE PROFILE WERDEN GELADEN...';

  @override
  String get loaderInitializingMirrorParliament =>
      'SPIEGELPARLAMENT WIRD INITIALISIERT...';

  @override
  String get loaderSyncingVectors => 'VEKTOREN WERDEN SYNCHRONISIERT...';

  @override
  String get reportIncludeDiagnosticsTitle => 'Systemdiagnose einschließen';

  @override
  String get reportIncludeDiagnosticsSubtitle =>
      'Fügt den aktiven Zustand (Parlament, Legislatur, Ziel) bei, um uns bei der Behebung zu helfen.';

  @override
  String get loaderSendingReport => 'BERICHT WIRD GESENDET...';

  @override
  String primaryParliamentLabel(String parliament) {
    return 'Primär: $parliament';
  }

  @override
  String get buttonCreateAnotherList => 'Weitere Liste erstellen';

  @override
  String get buttonCreateTrackingList => 'Beobachtungsliste erstellen';

  @override
  String get errorMissingListId => 'Fehler: Listen-ID fehlt';

  @override
  String get actionTracked => 'Beobachtet';

  @override
  String get actionTrack => 'Beobachten';

  @override
  String pollSupportPercent(String percent) {
    return 'DAFÜR $percent%';
  }

  @override
  String get pollSyncing => 'SYNCHRONISIERT...';

  @override
  String pollOpposePercent(String percent) {
    return 'DAGEGEN $percent%';
  }

  @override
  String get pollPositionRecorded => 'STANDPUNKT ERFASST';

  @override
  String get pollRestrictedToCitizens => 'NUR FÜR STAATSBÜRGER';

  @override
  String yourListsForCountry(String countryName) {
    return 'Deine Listen ($countryName)';
  }

  @override
  String get bottomNavGetInvolved => 'Aktiv werden';

  @override
  String get errorLaunchUrl => 'Link konnte nicht geöffnet werden';

  @override
  String get infoTechTitle => 'Wie die Technologie funktioniert';

  @override
  String get infoTechSubtitle =>
      'Erfahren Sie mehr über unsere Architektur, Datensterilisation und Civic-Tech-Prinzipien.';

  @override
  String get infoGovTitle => 'Transparenz & Governance';

  @override
  String get infoGovSubtitle =>
      'Wer dies baut, wer es bezahlt und wohin wir gehen.';

  @override
  String get infoPrivacyTitle => 'Verfassung & Datenschutz';

  @override
  String get infoPrivacySubtitle =>
      'Radikale Transparenz. Welche Daten wir sammeln und warum.';

  @override
  String get manualTitle => 'Offenes Bürgerhandbuch';

  @override
  String get manualSubtitle =>
      'Lernen Sie, wie Sie Handlungsfähigkeit in der Demokratie zurückgewinnen.';

  @override
  String get howToActTitle => 'Aktiv werden mit Lustra';

  @override
  String get actAuditTitle => 'Bürger-Audit';

  @override
  String get actAuditSubtitle =>
      'Stimmen Sie über Gesetze ab, um die Themenhierarchie zu prägen und einen soliden Beweis des Bürgerwillens zu hinterlassen. Lassen Sie nicht zu, dass die Medien die Diskussion steuern.';

  @override
  String get actWatchlistTitle => 'Kuratierte Beobachtungslisten';

  @override
  String get actWatchlistSubtitle =>
      'Erstellen Sie eigene Listen von offiziellen Gesetzentwürfen und Bürgerprojekten, um Abonnenten zu sammeln. Nutzen Sie soziale Medien als Lobbykraft.';

  @override
  String get actDraftTitle => 'Bürgergesetze entwerfen';

  @override
  String get actDraftSubtitle =>
      'Reichen Sie Ihre eigenen professionellen Initiativen direkt bei Lustra ein. Die Gesellschaft braucht neue Ideen, die nicht vom Kapital zurückgehalten werden.';

  @override
  String get joinCommunityTitle => 'Treten Sie der Community bei';

  @override
  String get subscribedLists => 'Abonniert';

  @override
  String get snackbarAddedToListWebPromo =>
      'Hinzugefügt! Lade die App herunter, um Push-Benachrichtigungen zu erhalten.';

  @override
  String get aboutGovAppBar => 'Governance';

  @override
  String get aboutGovTitle => 'Transparenz & Governance';

  @override
  String get aboutGovSubtitle =>
      'Wer das baut, wer dafür bezahlt und wohin wir steuern.';

  @override
  String get aboutGovFounderName => 'Jacek (Fons)';

  @override
  String get aboutGovFounderBadge => 'SOLO-ARCHITEKT / GRÜNDER';

  @override
  String get aboutGovFounderP1 =>
      'Ich bin kein Politiker, Anwalt oder Akademiker. Ich habe keine formellen Referenzen. Vor 18 Monaten arbeitete ich als Reinigungskraft. Das gesamte Jahr 2025 verbrachte ich arbeitslos und baute dieses System von Grund auf einem 2016er Laptop auf.';

  @override
  String get aboutGovFounderP2 =>
      'Warum? Weil es mich frustrierte, dass Milliardäre und Konzerne bessere Datenwerkzeuge haben als Bürger. Mich frustrierte die Ausgrenzung der Bürger vom Recht und die von den Medien geführten Narrativ-Kriege, die Menschen entweder von der Politik entfremden oder sie zwingen, ein Lager zu wählen. Ich habe mir alles selbst beigebracht, um ein Spiegelparlament (Mirror Parliament) zu bauen. Ich glaube nicht an Online-Petitionen; ich glaube an datengestützte, harte Transparenz und Zugänglichkeit. Und daran, dass die Demokratie ein Update braucht.';

  @override
  String get aboutGovFounderP3 =>
      'Du fragst dich vielleicht: \"Warum sollte ich dir vertrauen?\". Vertraue niemandem, besonders nicht in der Politik - fang an zu auditieren.';

  @override
  String get aboutGovSec1Title => '1. Finanzierung & Infrastruktur';

  @override
  String get aboutGovSec1Intro =>
      'Es gibt kein VC (Risikokapital). Es gibt kein Schwarzgeld. Es gibt kein Krypto. Aktuell ist diese Operation vollständig aus eigenen Mitteln finanziert (bootstrapped).';

  @override
  String get aboutGovSec1Bullet1Title => 'Infrastruktur:';

  @override
  String get aboutGovSec1Bullet1Text =>
      'Gedeckt durch ein Guthaben von 2.000 \$ aus dem Google For Startups Programm. Wir haben derzeit noch etwa 1.200 \$ übrig, was uns eine Server-Laufzeit von ca. 12 Monaten sichert.';

  @override
  String get aboutGovSec1Bullet2Title => 'Lebenshaltungskosten:';

  @override
  String get aboutGovSec1Bullet2Text =>
      'Vollständig finanziert durch meine persönlichen Ersparnisse, meine Verlobte und meine Familie.';

  @override
  String get aboutGovSec1Bullet3Title => 'Tech Stack:';

  @override
  String get aboutGovSec1Bullet3Text =>
      'Alleine gebaut (Flutter, Firebase, Vertex AI Pipeline, Node.js), um die Betriebskosten nahe Null zu halten.';

  @override
  String get aboutGovSec2Title => '2. Aktuelle Rechtsform & Der Übergang';

  @override
  String get aboutGovSec2P1 =>
      'Lustra inkubiert derzeit unter meiner alten polnischen GmbH (FO&WO VENTURES SP. Z O.O.). Das ist eine rechtliche Notwendigkeit. Um in den Apple/Google App Stores zu veröffentlichen und die Google Startup-Credits zu erhalten, ist ein registriertes Unternehmen mit einer DUNS-Nummer erforderlich. Ich kann mir die Anwaltskosten für die Gründung einer Stiftung noch nicht leisten (über 500 \$ Einrichtung und monatliche Buchhaltung), also nutze ich das schlankste mögliche Vehikel.';

  @override
  String get aboutGovSec2BoxTitle => 'Die Roadmap zur Non-Profit-Organisation:';

  @override
  String get aboutGovSec2BoxText =>
      'Sobald wir finanzielle Liquidität und die kritische Masse (ca. 100k monatliche Nutzer) erreichen, plane ich, eine formelle Non-Profit-Organisation zu gründen und das gesamte geistige Eigentum sowie die Infrastruktur dorthin zu übertragen.';

  @override
  String get aboutGovSec2P2 =>
      'Das ultimative Ziel ist eine demokratische Governance-Struktur. Entscheidungen werden von einem durch die Community gewählten Vorstand getroffen. Meine Rolle wird sich streng auf die technische Wartung des Backends beschränken. Ich sehe keine andere Zukunft für Lustra als eine Non-Profit-Operation mit voller Transparenz aller Finanzdokumente.';

  @override
  String get aboutGovSec3Title => '3. Sicherheit & Source Code';

  @override
  String get aboutGovSec3Bullet1Title => 'Authentifizierung:';

  @override
  String get aboutGovSec3Bullet1Text =>
      'Wir fassen deine Passwörter nicht an. Wir nutzen Google/Apple Auth, weil deren Sicherheitsinfrastruktur überlegen ist. Wir speichern nur eine anonymisierte User-ID und deine Vote-ID, um Bot-Farmen zu blockieren.';

  @override
  String get aboutGovSec3Bullet2Title =>
      'Quellcode Verfügbar (Source Available):';

  @override
  String get aboutGovSec3Bullet2Text =>
      'Die Kern-Repositories sind unter der Open Source License (AGPLv3) öffentlich zugänglich. Sie ist gegen Unternehmensklone geschützt, aber die Datenadapter, KI-System-Prompts und die Logik sind für Audits vollständig einsehbar.';

  @override
  String get aboutGovSec3BoxTitle => 'Wir brauchen Hilfe.';

  @override
  String get aboutGovSec3BoxText =>
      'Ich bin ein Typ mit einem alten Laptop, der alles macht. Wenn du Entwickler, Journalist oder Bürger bist und helfen willst, lokale Zellen in deinem Land aufzubauen – melde dich.';

  @override
  String get aboutGovSec3Contact => 'Kontakt: jacek@lustra.dev';

  @override
  String get aboutGovSec3Github => 'GitHub Profil';

  @override
  String get termsAppBar => 'Verfassung & Datenschutz';

  @override
  String get termsTitle => 'Verfassung & Datenschutz';

  @override
  String get termsLastUpdated => 'Zuletzt aktualisiert: 12. März 2026';

  @override
  String get termsAlertTitle =>
      'Radikale Transparenz: Was wir wirklich sammeln';

  @override
  String get termsAlertP1 =>
      'Du denkst dir vielleicht: \"Ich gebe doch nicht irgendwelchen Leuten meine Daten.\" Da stimmen wir zu. Deshalb wollen wir dein Privatleben nicht. Wir wollen nur verifizieren, dass du ein echter Mensch bist, der über echte Gesetze abstimmt.';

  @override
  String get termsAlertP2 =>
      'Hier ist die genaue Datenstruktur, die wir für dein Nutzerprofil in unserer Google Cloud Firestore-Datenbank speichern. Keine versteckten Felder. Keine Tracking-Cookies.';

  @override
  String get termsAlertCode =>
      '[\n  \'uid\': \'0A21rfdsTs1F3kYsx3252352\', // Generiert durch Firebase Auth\n  \'email\': \'buerger@example.com\', // Deine einzigen personenbezogenen Daten\n  \'createdAt\': \'February 15, 2026 at 8:23:31 PM UTC\',\n  \'marketingConsent\': true, // Für Projekt-Updates (optional)\n  \'primaryParliamentId\': \'Deutscher Bundestag\'\n]';

  @override
  String get termsAlertH4 =>
      'Moment, wo sind meine Abstimmungen und verfolgten Gesetze?';

  @override
  String get termsAlertP3 =>
      'Um deine Privatsphäre zu schützen und sicherzustellen, dass unsere Datenbank effizient skaliert, werden deine Interaktionen von deinem Hauptprofil isoliert (sharded):';

  @override
  String get termsAlertB1Title => 'Verfolgte Gesetze:';

  @override
  String get termsAlertB1Text =>
      'Gespeichert in einer privaten Sub-Collection. Nur du (und dein Gerät) können die Liste der von dir verfolgten Gesetze abfragen.';

  @override
  String get termsAlertB2Title => 'Deine Stimmen (Kryptografisches Hashing):';

  @override
  String get termsAlertB2Text =>
      'Wenn du abstimmst, verknüpfen wir deine UID NICHT direkt mit dem öffentlichen Abstimmungsregister. Stattdessen generiert der Server einen kryptografischen Hash (z. B. a1b2c3d4...) unter Verwendung eines geheimen Server-Salts. Dies pseudonymisiert deine Stimme stark. Wenn ein Hacker die Datenbank stiehlt, kann er nicht sehen, wer wofür gestimmt hat. Obwohl es sich mathematisch um eine Einwegfunktion handelt, solltest du im Sinne der absoluten Transparenz wissen, dass die Systemoperatoren (die den geheimen Salt besitzen) theoretisch eine Stimme verifizieren könnten, um das System auf Betrug zu prüfen oder einer gültigen gerichtlichen Anordnung nachzukommen. Deine Stimmen sind jedoch streng von deinem täglichen Profil getrennt und werden niemals öffentlich mit deiner Identität angezeigt.';

  @override
  String get termsAlertP4 =>
      'Das ist alles. Der Rest ist anonyme Analytik (Firebase Analytics) zur Fehlerbehebung und App Check, um Bot-Farmen daran zu hindern, die Abstimmungen zu manipulieren. Wir verkaufen keine Daten. Wir schalten keine Werbung.';

  @override
  String get termsTocTitle => 'Inhaltsverzeichnis';

  @override
  String get termsPart1Title =>
      'Teil 1: Datenschutzrichtlinie (Datenminimierung)';

  @override
  String get termsPart1Intro =>
      'Wir handeln nicht mit deiner Aufmerksamkeit. Wir sammeln nur das, was technisch notwendig ist, um eine sichere zivile Infrastruktur zu betreiben.';

  @override
  String get termsP1S1Title => '1. Verantwortliche Stelle';

  @override
  String get termsP1S1Text =>
      'Der rechtliche Betreiber ist vorübergehend FO&WO VENTURES SP. Z O.O. (GmbH) mit Sitz in Wrocław, Polen. Kontakt: jacek@lustra.dev';

  @override
  String get termsP1S2Title => '2. Was wir sammeln';

  @override
  String get termsP1S2B1Title => 'Konto (E-Mail/UID):';

  @override
  String get termsP1S2B1Text =>
      'Notwendig für den sicheren Login über Firebase Authentication.';

  @override
  String get termsP1S2B2Title => 'Abstimmungen & Umfragen (Anonymisiert):';

  @override
  String get termsP1S2B2Text =>
      'Deine Stimmen bilden die Statistiken. Sie sind rein zur Verhinderung von Bot-Farmen und doppelten Abstimmungen mit deinem Konto verknüpft. Öffentlich werden deine Stimmen NUR als anonyme Aggregate angezeigt. Der eigentliche Abstimmungsdatensatz wird kryptografisch gehasht, um deine Identität von deiner politischen Wahl zu trennen.';

  @override
  String get termsP1S2B3Title => 'Verfolgte Gesetze & Push-Benachrichtigungen:';

  @override
  String get termsP1S2B3Text =>
      'Wenn du dich entscheidest, ein Gesetz zu verfolgen oder eine Kuratierte Liste zu abonnieren, verwenden wir Firebase Cloud Messaging (FCM) Topics von Google. Dadurch können wir dir Push-Benachrichtigungen über Statusänderungen senden, ohne ständig deinen Standort oder deine Geräteidentität zu verfolgen.';

  @override
  String get termsP1S2B4Title => 'Aufbewahrung von Stimmen:';

  @override
  String get termsP1S2B4Text =>
      'Abstimmungsdaten werden für die Dauer der Legislaturperiode plus 5 Jahre zu Archivierungs- und Forschungszwecken gespeichert.';

  @override
  String get termsP1S2B5Title => 'Kommunikation:';

  @override
  String get termsP1S2B5Text =>
      'Wenn du ausdrücklich zustimmst, senden wir dir Projekt-Updates per E-Mail. Du kannst deine Zustimmung jederzeit widerrufen.';

  @override
  String get termsP1S2B6Title => 'Bürgerprojekte:';

  @override
  String get termsP1S2B6Text =>
      'Der Inhalt der von dir eingereichten Gesetzesentwürfe ist vollständig öffentlich.';

  @override
  String get termsP1S2Highlight =>
      '3. WAS WIR NICHT TUN:\n\n❌ Wir verkaufen KEINE Daten an Datenbroker.\n❌ Wir verwenden KEIN Werbe-Tracking.\n❌ Wir erstellen KEIN politisches Profil von dir für kommerzielle Zwecke.';

  @override
  String get termsP1S3Title => '4. Infrastruktur & Sicherheit';

  @override
  String get termsP1S3B1Title => 'Standort:';

  @override
  String get termsP1S3B1Text =>
      'Daten werden sicher auf der Google Cloud Platform, Europe-West9 (Paris) gehostet.';

  @override
  String get termsP1S3B2Title => 'Anti-Bot:';

  @override
  String get termsP1S3B2Text =>
      'Wir verwenden Firebase App Check, um die Authentizität der App zu überprüfen und automatisierte Manipulationen zu verhindern.';

  @override
  String get termsP1S3B3Title => 'KI-Datenschutz:';

  @override
  String get termsP1S3B3Text =>
      'Wir senden nur öffentliche Regierungsdokumente zur Zusammenfassung an KI-Modelle. Deine privaten Daten gelangen NIEMALS an die KI.';

  @override
  String get termsP1S4Title => '5. Kinder & Kontolöschung';

  @override
  String get termsP1S4P1 =>
      'Der Dienst ist für Nutzer ab 16 Jahren bestimmt. Wir sammeln nicht wissentlich Daten von Kindern.';

  @override
  String get termsP1S4P2 =>
      'Um deine Daten zu löschen: Verwende den Button \"Konto löschen\" direkt in den App-Einstellungen, um deine identifizierenden Daten, E-Mail und alle deine Sub-Collections sofort von unseren Servern zu entfernen.';

  @override
  String get termsP1S5Title => '6. Deine Rechte';

  @override
  String get termsP1S5Text =>
      'Gemäß DSGVO hast du das Recht auf Auskunft, Berichtigung, Löschung und Widerspruch gegen die Verarbeitung deiner Daten. Kontaktiere uns unter der oben angegebenen E-Mail-Adresse.';

  @override
  String get termsPart2Title =>
      'Teil 2: Community-Regeln (Nutzungsbedingungen)';

  @override
  String get termsP2S1Title => '1. Betreiber und Mission';

  @override
  String get termsP2S1Text =>
      'Lustra ist eine digitale öffentliche Infrastruktur. Das Unternehmen fungiert als Inkubator: Es zahlt keine Dividenden, hat keine externen Investoren und reinvestiert alle Einnahmen direkt wieder in die Aufrechterhaltung der Infrastruktur.';

  @override
  String get termsP2S2Title => '2. Code und Lizenz (Source Available)';

  @override
  String get termsP2S2Intro =>
      'Der Code von Lustra ist ein Gemeingut, das vor der Ausbeutung durch Konzerne geschützt ist.';

  @override
  String get termsP2S2B1Title => 'Modell:';

  @override
  String get termsP2S2B1Text => 'Open Source (AGPLv3) Lizenz.';

  @override
  String get termsP2S2B2Title => 'Erlaubt:';

  @override
  String get termsP2S2B2Text =>
      'Bildungs-, Forschungs- und Non-Profit-/zivile Nutzung.';

  @override
  String get termsP2S2B3Title => 'Verboten:';

  @override
  String get termsP2S2B3Text =>
      'Konzerne dürfen unsere Arbeit nicht ohne ausdrückliche Zustimmung der Community nutzen oder davon profitieren.';

  @override
  String get termsP2S3Title => '3. Governance Roadmap';

  @override
  String get termsP2S3Intro =>
      'Unser langfristiges Ziel ist die vollständige Dezentralisierung.';

  @override
  String get termsP2S3B1Title => 'Aktueller Stand:';

  @override
  String get termsP2S3B1Text => 'Der Gründer fungiert als Lead Architect.';

  @override
  String get termsP2S3B2Title => 'Bald:';

  @override
  String get termsP2S3B2Text =>
      'Gründung eines Bürgerrats (Civic Board), das direkt von den Nutzern gewählt wird.';

  @override
  String get termsP2S3B3Title => 'Ziel:';

  @override
  String get termsP2S3B3Text =>
      'Implementierung technischer und rechtlicher Mechanismen, damit die Community im Falle eines Verrats an der Mission die Kontrolle über die Plattform übernehmen kann.';

  @override
  String get termsP2S4Title =>
      '4. Programm für Bürgerentwürfe (Gesetzes-Inkubator)';

  @override
  String get termsP2S4Intro =>
      'Wir bieten einen Raum, in dem Bürger die Gesetze schreiben können.';

  @override
  String get termsP2S4B1Title => 'Verfahren:';

  @override
  String get termsP2S4B1Text =>
      'Entwürfe werden per Formular eingereicht und vom Betreiber formal geprüft.';

  @override
  String get termsP2S4B2Title => 'Gemeinfreiheit (Public Domain):';

  @override
  String get termsP2S4B2Text =>
      'Mit der Einreichung eines Entwurfs gibst du ihn unter der CC0-Lizenz (Public Domain) frei. Das Recht gehört allen.';

  @override
  String get termsP2S4B3Title => 'Meinungsfreiheit:';

  @override
  String get termsP2S4B3Text =>
      'Wir bewerten keine Meinungen oder politischen Neigungen. Wir lehnen nur Projekte ab, die gegen das Strafrecht verstoßen oder zur Gewalt aufstacheln.';

  @override
  String get termsP2S4B4Title => 'Verifizierung:';

  @override
  String get termsP2S4B4Text =>
      'Du musst Staatsbürger des Landes sein, in dem du einen Entwurf einreichst.';

  @override
  String get termsP2S5Title => '5. KI und Quellenhierarchie';

  @override
  String get termsP2S5Text =>
      'KI ist ein Werkzeug, kein Orakel. KI hilft beim Navigieren durch komplexe Rechtssprache, kann aber Fehler machen. Die höchste Autorität ist IMMER das originale PDF/XML-Dokument, das am Ende jeder Zusammenfassung in der App verlinkt ist.';

  @override
  String get termsP2S6Title => '6. Sicherheit & Schlussbestimmungen';

  @override
  String get termsP2S6Text =>
      'Angriffe auf die Infrastruktur, DDoS und kommerzielles Scraping sind strengstens untersagt. Angelegenheiten, die hierin nicht geregelt sind, unterliegen polnischem Recht.';

  @override
  String get bpAppBar => 'Systemarchitektur';

  @override
  String get bpTitle =>
      'Wie wir die Handlungsfähigkeit in der Demokratie mit dem Spiegelparlament zurückgewinnen: Handbuch für Bürger';

  @override
  String get bpIntroBig =>
      'Das große Ganze: Das aktuelle demokratische System ist eine kaputte \"Stille Post\". Wir reparieren das Signal, indem wir die Bürger über das Spiegelparlament (Lustra) direkt an den Gesetzgebungsprozess anschließen.';

  @override
  String get bpIntroSmall =>
      'Warum das wichtig ist: Derzeit wählen wir nur alle paar Jahre. Zwischen den Wahlen haben wir null Kontrolle. Lustra gibt uns jeden einzelnen Tag einen \"Platz am Tisch\".';

  @override
  String get bpS1Title => '1. DAS PROBLEM: Ein kaputter Kreislauf';

  @override
  String get bpS1P1 =>
      'Informationen fließen in eine Richtung und werden verzerrt.';

  @override
  String get bpS1Code =>
      'Bürger wählen Politiker\n   ↓\nPolitiker bilden eine Regierung\n   ↓\nMedien interpretieren Regierungsmaßnahmen selektiv\n   ↓\nBürger erhalten Feedback (verzerrt)';

  @override
  String get bpS1Highlight =>
      'Ergebnis: Wir wissen wegen juristischem Fachjargon und medialem Rauschen nicht, was wirklich passiert.';

  @override
  String get bpS2Title => '2. DIE LÖSUNG: Den Informationsfluss reparieren';

  @override
  String get bpS2P1 =>
      'Lustra schaltet die Mittelsmänner aus. Es simuliert ein echtes Machtzentrum, in dem deine Stimme zu spezifischen Gesetzentwürfen erfasst wird, nicht nur in allgemeinen Umfragen.';

  @override
  String get bpS2FlowMedia => 'MEDIEN (optionaler Beobachter)';

  @override
  String get bpS2Flow1 => 'Bürger sehen einen Gesetzentwurf & bewerten ihn';

  @override
  String get bpS2Flow2 => 'Politiker sehen das Ergebnis des Bürgerwillens';

  @override
  String get bpS2Flow3 => 'Politiker stimmen ab (überwacht anhand der Daten)';

  @override
  String get bpS2Flow4 =>
      'Bürger prüfen: Hat sich der Politiker an die Daten gehalten?';

  @override
  String get bpS2Flow5 =>
      'Bürger wählen Politiker basierend auf ihrem \"Gehorsams-Score\" (Obedience Score)';

  @override
  String get bpS2Flow6 => 'Eine neue Regierung wird gebildet.';

  @override
  String get bpS2FlowLoop => 'ZYKLUS WIEDERHOLT SICH';

  @override
  String get bpS3Title => '3. WIE ES FUNKTIONIERT';

  @override
  String get bpS3ATitle =>
      'Schritt A: Beseitigung der Sprachbarriere (Übersetzung)';

  @override
  String get bpS3AP1 =>
      'Die meisten Gesetze sind langweilig und unlesbar. Lustra schließt die Zugänglichkeitslücke.';

  @override
  String get bpS3AP2 =>
      'Vorteil: 20 Sekunden, um die Fakten zu verstehen. Kein Fachjargon.';

  @override
  String get bpS3BTitle => 'Schritt B: Wissensverteilung (Die Info-Karte)';

  @override
  String get bpS3BP1 =>
      'Lustra braucht keine Millionen von Nutzern, um zu funktionieren. Es reicht, dass Du da bist.';

  @override
  String get bpS3BList1Title => 'Deine Aktion:';

  @override
  String get bpS3BList1Text =>
      'Du gehst rein, siehst ein Thema und generierst mit einem Klick eine Info-Karte (Fact Card).';

  @override
  String get bpS3BList2Title => 'Reichweite:';

  @override
  String get bpS3BList2Text =>
      'Automatisches Teilen auf deinen Social-Media-Kanälen (FB, X, IG, etc.).';

  @override
  String get bpS3BList3Title => 'Effekt:';

  @override
  String get bpS3BList3Text =>
      'Deine Freunde erhalten ein faktengeprüftes \"Fertiggericht\", ohne die App zu benötigen. Du wirst zu einer unabhängigen Informationsquelle.';

  @override
  String get bpS3BExample => 'Beispiel:';

  @override
  String get bpS3CTitle =>
      'Schritt C: Handlungsfähigkeit zurückgewinnen (Der Druck)';

  @override
  String get bpS3CP1 =>
      'Politiker und Konzerne ignorieren \"Internet-Stürme\", weil sie chaotisch, leicht zu zensieren und schnell wieder verschwunden sind.';

  @override
  String get bpS3CList1Title => 'Lösung:';

  @override
  String get bpS3CList1Text =>
      'Verifizierte soziale Abstimmungen. Deine Stimme ist an eine spezifische, offizielle Dokumenten-ID geknüpft.';

  @override
  String get bpS3CList2Title => 'Unterschied:';

  @override
  String get bpS3CList2Text =>
      'Das sind keine Petitionen, die ablaufen. Das sind harte Unterschriften von verifizierten Konten.';

  @override
  String get bpS3CP2 =>
      'Wenn 50.000 Menschen gegen ein Gesetz stimmen, entsteht ein harter Beweis für mangelnde gesellschaftliche Unterstützung. Das kann nicht von einem TV-Narrativ \"vertuscht\" werden.';

  @override
  String get bpS4Title => '4. BÜRGEROFFENSIVE: Wir schreiben die Gesetze';

  @override
  String get bpS4P1 => 'Die Regierung ignoriert ein Problem? Wir warten nicht.';

  @override
  String get bpS4List1Title => 'Bürgerentwürfe:';

  @override
  String get bpS4List1Text =>
      'Wir schreiben unsere eigenen Gesetzesentwürfe und sammeln digitale Unterschriften.';

  @override
  String get bpS4List2Title => 'Die Falle:';

  @override
  String get bpS4List2Text =>
      'Wenn sie ein populäres Gesetz aus formalen Gründen ablehnen, bringen wir Änderungsanträge ein und reichen es erneut ein.';

  @override
  String get bpS4List3Title => 'Die Wahl:';

  @override
  String get bpS4List3Text =>
      'Eine fertige, populäre Lösung zu ignorieren, beweist bösen Willen. Es gibt der Opposition eine kostenlose Waffe, um die Wählerschaft zu übernehmen.';

  @override
  String get bpS4CtaTitle => 'Unterstütze diese Bürgerentwürfe JETZT!';

  @override
  String get bpS4CtaP1 =>
      'Klicke unten, um vorgeschlagene Gesetze zu prüfen und darüber abzustimmen:';

  @override
  String get bpS4Card1Title => 'Epstein-Klasse-Finanzierungsstopp-Gesetz';

  @override
  String get bpS4Card1Desc =>
      'Streicht öffentliche Gelder für Personen, die in Menschenhandel und Menschenrechtsverletzungen verwickelt sind.';

  @override
  String get bpS4Card2Title => 'Amtszeitbegrenzungs-Zusatzartikel';

  @override
  String get bpS4Card2Desc =>
      'Führt eine strikte Obergrenze für die Karrieredauer im Parlament ein.';

  @override
  String get bpS4Card3Title => 'Gesetz zur Parlamentarischen Ethik';

  @override
  String get bpS4Card3Desc =>
      'Implementiert ein Aktienhandelsverbot für aktive Parlamentsmitglieder.';

  @override
  String get bpS5Title => '5. ENDERGEBNIS: Politische Säuberung';

  @override
  String get bpS5P1 =>
      'Kein Verstecken mehr. Die Debatte kehrt dorthin zurück, wo die Menschen sind: in die sozialen Medien, aber mit neuen Regeln. Dies ist die Erfüllung des ursprünglichen Versprechens des Internets, das das System gefürchtet hat: dezentralisierte Kontrolle der Macht.';

  @override
  String get bpS5P2 =>
      'Das Spiegelparlament schaltet das Licht in einem dunklen Raum ein, wir erzwingen TRANSPARENZ. Ein Politiker kann nicht lügen, dass \"die Leute das wollen\", wenn die Daten etwas anderes zeigen. Neue Gesetze dienen der Allgemeinheit, nicht dem Kapital.';

  @override
  String get bpS5P3 =>
      'Wir bitten Politiker nicht, sich zu ändern. Wir schaffen ein System, in dem es unmöglich wird, über die öffentliche Unterstützung zu lügen. Das ist datengesteuerte Demokratie.';

  @override
  String get bpS5Highlight =>
      'Dies ist eine Einführung in die direkte Demokratie, basierend auf einer bewussten, informierten Stimme und nicht auf Emotionen.';

  @override
  String get caAppBar => 'Bürger-Audit';

  @override
  String get caTitle =>
      'Bürger-Audit: Neues System für eine bessere Demokratie';

  @override
  String get caIntro =>
      'Niemand bewertet den Gesetzgebungsprozess, abgesehen von ein paar Leuten hinter verschlossenen Türen und dem gelegentlichen unabhängigen Journalisten, der Korruption aufdeckt. Infolgedessen entkoppelt sich die Gesetzgebung häufig von den Bedürfnissen der Bürger und priorisiert politische oder unternehmerische Interessen über die gesellschaftliche Anpassung. Unser Endziel ist einfach: Eine Gesellschaft, die über tatsächliche Richtlinien abstimmt, nicht nur einzelne Politiker wählt und hofft, dass sie ihre Versprechen halten. Das Spiegelparlament wurde gebaut, um diesen Übergang einfach und erreichbar zu machen.';

  @override
  String get caS1Title =>
      'Wie unterscheidet sich das Bürger-Audit von Petitionen?';

  @override
  String get caS1PetitionsTitle => 'Traditionelle Petitionen';

  @override
  String get caS1PetitionsText =>
      'Petitionen funktionieren aufgrund ihrer flüchtigen Natur selten. Nach dem Sammeln der Unterschriften endet die Kampagne. Im Grunde ist es eine höfliche Bitte an eine Person an der Macht. Da es sich um zeitlich begrenzte Kampagnen handelt, die auf einem kurzen Medienzyklus beruhen, können Politiker sie leicht abtun. Sie warten einfach ab, bis die Medien das Narrativ wechseln, und die Petition ist vergessen.';

  @override
  String get caS1LustraTitle => 'Der Bürgerwille in Lustra';

  @override
  String get caS1LustraText =>
      'Wir bitten nicht. In Lustra ist deine Stimme nicht nur eine Unterschrift – sie ist dauerhaft mit einer harten, offiziellen Gesetzes-ID verankert. Sie markiert deine genaue Haltung zu einer bestimmten Richtlinie. Alle diese Stimmen verbinden sich zum Bürgerwillen (Civic Will): Ein Echtzeit-Messgerät, das genau zeigt, wie Bürger ein Projekt bewerten, und so den Kreislauf des Bürger-Audits schließt.';

  @override
  String get caS2Title => 'Warum sollte das Politiker interessieren?';

  @override
  String get caS2Text =>
      'Weil sie sich nicht mehr verstecken können.\n\nWir erfassen jede ihrer offiziellen Abstimmungen in der Regierung und vergleichen sie direkt mit dem Bürgerwillen. Sie können nicht länger lügen, dass \"die Leute das wollen\", nur weil sie eine clevere Medienkampagne gefahren haben. Wenn sie über etwas abstimmen, das einer Lobbygruppe statt den Bürgern nützt, erfahren wir das sofort. Je mehr Menschen Lustra nutzen, um diese Lücken aufzudecken, desto schwieriger wird es für Politiker, das Narrativ zu manipulieren. Wir erlangen die Kontrolle zurück.';

  @override
  String get caS3Title => 'Der beste Teil: Asymmetrische Macht';

  @override
  String get caS3P1 =>
      'Wir brauchen traditionelle Medien nicht in dem Maße wie Lobbyisten. Wir brauchen nicht einmal 5 Millionen Nutzer in der App, um die Demokratie upzudaten. Wir brauchen einfach Dich.\n\nDu hast bereits Reichweite außerhalb von Lustra: auf Facebook, TikTok, X oder woanders. Wir können soziale Medien endlich in etwas Sinnvolles verwandeln. Ein Nutzer, der ein Gesetz teilt, kann mit fast null Aufwand problemlos 100 bis 1.000 Aufrufe generieren. Das ist ein kleines Stadion voller Menschen, die über ein entscheidendes Gesetz oder eine Bürgerinitiative informiert werden.';

  @override
  String get caS3MathSubtitle => 'MATHEMATIK DER ASYMMETRISCHEN KRIEGSFÜHRUNG';

  @override
  String get caS3P2 =>
      'Denk an die Mathematik: Ein aktiver Unternehmens-Think-Tank oder eine Lobbygruppe besteht vielleicht aus 10-15 Personen, deren einziges Druckmittel Geld ist, um politische Gefälligkeiten zu kaufen. Eure 10.000 verifizierten Stimmen von echten Bürgern können sie überwältigen. Wir können genau das tun, was Lobbyisten tun, aber schneller, transparent und mit erdrückender Überzahl. Die Zeiten haben sich geändert.';

  @override
  String get caS4Title => 'Wer kontrolliert den Feed? Du.';

  @override
  String get caS4Text =>
      'Traditionelle Medien und Big-Tech-Algorithmen optimieren auf Empörung, um Werbung zu verkaufen. Der Algorithmus von Lustra ist streng demokratisch. Wir haben keine Redakteure, die entscheiden, was \"wichtig\" ist. Unser Haupt-Feed bewertet automatisch die Gesetzgebung der letzten 30 Tage, isoliert die Top-5-Gesetze mit dem höchsten bürgerschaftlichen Engagement und rückt sie ins Rampenlicht. Deine Stimmen diktieren die Informationshierarchie. Du kontrollierst den Algorithmus.';

  @override
  String get caS5Title => 'Das Arsenal: Wie man \"Faktenkarten\" nutzt';

  @override
  String get caS5Intro =>
      'Gesetzgebung ist absichtlich langweilig. Sie war nie für den Mainstream gedacht. Deshalb erschaffen die Medien emotionale Narrative darum herum, um Werbung zu verkaufen. Du kannst auch Narrative erschaffen – aber deine werden auf rohen, zusammengefassten, verifizierten Daten aufgebaut sein.\n\nLustra produziert Faktenkarten. Jedes Mal, wenn du auf \"Teilen\" klickst, wird ein sauberes Bild aus offiziellen Daten gerendert. Für sich genommen ist es nur ein Fakt. In den sozialen Medien müssen Fakten erklärt werden. Du bist der Erklärer. Hier ist genau beschrieben, wie du sie nutzen kannst, um virale, wirkungsvolle Inhalte zu erstellen:';

  @override
  String get caS5A_Title => 'A/ Der Aufhänger (Erschaffe den Blickwinkel)';

  @override
  String get caS5A_Text =>
      'Die einfachste Option ist meistens die nachvollziehbarste. Hast du in der App ein neues Internet-Zensur-Gesetz gefunden? Mach es nicht zu kompliziert. Schreibe eine starke Überschrift (einen \"Aufhänger\"), sag den Leuten genau, wie es sie betrifft, und poste den direkten Link zu Lustra, damit sie abstimmen können.';

  @override
  String get caS5B_Title => 'B/ Der Beweis (Für Essays & Threads)';

  @override
  String get caS5B_Text =>
      'Bilder sind großartige Ergänzungen zu längeren Posts oder Einstiegen. Willst du kritische Fehler in einem Gesetzentwurf aufzeigen oder die offizielle Zusammenfassung der Regierung konfrontieren? Füge die Faktenkarte als unwiderlegbaren Beweis bei. Lass die Leute die sterilen Daten selbst in 15 Sekunden lesen.';

  @override
  String get caS5C_Title => 'C/ Die Sendung (TikTok/Reels)';

  @override
  String get caS5C_Text =>
      'Nutze das Faktenkarten-Bild mit einem \"Green-Screen\"-Effekt auf TikTok oder Instagram. Lege die Lustra-Daten in den Hintergrund und nimm dich selbst auf, wie du das Problem erklärst. Das ist der perfekte, verifizierbare Kurzform-Content.';

  @override
  String get caS5D_Title => 'D/ Das Netzwerk (Direktnachrichten)';

  @override
  String get caS5D_Text =>
      'Klicke einfach auf Teilen und sende das Bild direkt an deine Freunde und Familiengruppen. Sag ihnen klar: \"Das ist es, was gerade in der Regierung vor sich geht\" oder \"Das ist es, worüber die Medien gerade schweigen.\"';

  @override
  String get caS5Outro =>
      'Die Produktion von Inhalten ist einfach, und Lustra ist deine Entdeckungsmaschine. Du bist nicht nur ein Nutzer. Du bist ein Early Adopter der neuen Ära der Demokratie ohne Korruption. Du hast die gleichen Werkzeuge wie ein Lobbyist – nutze sie.';

  @override
  String get caSkepticTitle => 'Skeptisch wegen Bot-Farmen oder Datenschutz?';

  @override
  String get caSkepticText =>
      'Gut so. Vertraue nicht auf unsere Worte – auditiere unser System. Lies genau nach, wie wir kryptografisches Hashing, Firebase App Check und die Open Source License (AGPLv3) verwenden, um deine Identität und die Integrität des Bürgerwillens zu schützen.';

  @override
  String get caSkepticBtnGov => 'Transparenz & Governance';

  @override
  String get caSkepticBtnPriv => 'Verfassung & Datenschutz';

  @override
  String get clAppBar => 'Watchlists';

  @override
  String get clTitle => 'Kuratierte Watchlists: Dezentrale Bürgermedien';

  @override
  String get clIntro =>
      'Regierungen nutzen die schiere Menge an Gesetzgebung als Waffe. Sie verabschieden Hunderte von Seiten komplexer Gesetze, begraben umstrittene Akte oft hinter langweiligen Titeln oder schleusen sie durch die \"Hintertür\" ein, während die Medien vom neuesten politischen Skandal abgelenkt sind. Die Bürger verlieren den Blick für das große Ganze, weil es physisch unmöglich ist, alles alleine zu überwachen.';

  @override
  String get clS1Title => 'Mustererkennung & Massenmobilisierung';

  @override
  String get clS1P1 =>
      'Kuratierte Watchlists ermöglichen es dir, das Chaos zu organisieren und als unabhängiger Informationsknoten zu agieren. Du kannst offizielle Regierungsentwürfe mit Basis-Bürgerprojekten mischen, sie nach bestimmten Themen gruppieren und andere einladen, sie zu abonnieren.';

  @override
  String get clS1P2 =>
      'Entscheidend ist, dass eine Watchlist als Multiplikator für das Bürger-Audit fungiert. Du sammelst nicht nur Unterstützung für ein einzelnes, isoliertes Gesetz. Indem du bis zu 80 Elemente gruppierst, wird deine Liste zu einem dedizierten, fokussierten Feed für deine Follower. Sie können deine Liste betreten und ihre Stimmen zu mehreren Gesetzen in einer Sitzung abgeben, wodurch in großem Maßstab harte Daten und Bürgerwille für einen gesamten Politikbereich generiert werden.';

  @override
  String get clS2Title => 'Wie man Watchlists als Waffe nutzt:';

  @override
  String get clS2A_Title => 'Regierungs-Watchdogs';

  @override
  String get clS2A_Text =>
      'Merkst du, dass die Regierung versucht, leise eine Reihe von technologiebezogenen Überwachungsgesetzen durchzuwinken? Gruppiere sie in eine \"Digitale Überwachungs-Watchlist\". Zeig deinen Abonnenten die versteckte Agenda, die die Medien verpasst haben, und lass sie an einem Ort gegen alle stimmen. Bitte sie, das Ganze durch Teilen zu verstärken.';

  @override
  String get clS2B_Title => 'Plattform für Reformen';

  @override
  String get clS2B_Text =>
      'Beschwere dich nicht nur über die Wirtschaft. Baue eine komplette, mehrere Gesetze umfassende \"Wirtschaftsreform-Liste\" auf, die deine eigenen Bürgerprojekte mit offiziellen Änderungsanträgen mischt. Präsentiere ein vollständig strukturiertes politisches Programm.';

  @override
  String get clS2C_Title => 'Das Rampenlicht';

  @override
  String get clS2C_Text =>
      'Du kannst ein bestimmtes Gesetz als \"Favorit\" in deiner Liste anheften, um maximale bürgerschaftliche Aufmerksamkeit und Stimmkraft genau dorthin zu lenken, wo sie am meisten gebraucht wird.';

  @override
  String get clS3Title => 'Der beste Teil: Dir gehört die Sendung';

  @override
  String get clS3Text =>
      'Social-Media-Algorithmen unterdrücken ständig externe Links, damit die Nutzer weiter scrollen. Lustra umgeht das. Wenn Leute deine Watchlist abonnieren, umgehst du Big Tech vollständig. Du erhältst einen manuellen \"Push\"-Button. Einmal alle 24 Stunden kannst du eine direkte mobile Benachrichtigung an alle deine Abonnenten auslösen und sie alarmieren, deine Liste zu checken, weil eine wichtige Abstimmung ansteht oder ein neues Gesetz hinzugefügt wurde. Du kontrollierst die Verteilung.';

  @override
  String get clS4Title => 'Die Creator Economy für die Demokratie';

  @override
  String get clS4Text =>
      'Gute Kuration ist extrem wertvoll. Das Filtern von politischem Rauschen kostet Zeit und Fachwissen. Deshalb erlaubt dir Lustra, dein persönliches Trinkgeldglas (Tip Jar) direkt an deine Watchlist anzuhängen. Wenn du die harte Arbeit leistest, die Regierung zu überwachen und die Öffentlichkeit aufzuklären, können deine Abonnenten deine Bemühungen direkt finanzieren. Wir nehmen keine Provision.';

  @override
  String get clS5Title => 'Einsatz: Wie man anfängt';

  @override
  String get clS5Intro =>
      'Dies ist kein passives Feature. Du musst es aktiv aufbauen. Hier ist die genaue Anleitung, wie du deine erste Watchlist bereitstellst:';

  @override
  String get clStep1Title => 'Schritt 1: Initialisieren';

  @override
  String get clStep1Text =>
      'Navigiere zum Hauptbildschirm und klicke auf das Zahnrad-Symbol (Einstellungen) in der oberen Ecke. Wähle die Option, um deine erste Watchlist zu erstellen. Gib ihr einen klaren Titel.';

  @override
  String get clStep2Title => 'Schritt 2: Kurator-Modus';

  @override
  String get clStep2Text =>
      'Sobald deine Liste initialisiert ist, gewährt dir das System den Kurator-Status. Durchsuche nun den Haupt-Feed. Auf dem Detailbildschirm jedes Gesetzes oder Bürgerprojekts erscheint ein neuer \"Zur Liste hinzufügen\"-Button. Klicke darauf, um dieses spezifische Gesetz direkt in deine Liste zu injizieren.';

  @override
  String get clStep3Title => 'Schritt 3: Feed-Injektion';

  @override
  String get clStep3Text =>
      'Deine Watchlist überflutet nicht den Haupt-Feed. Stattdessen fungiert das einzige Gesetz, das du als \"Favorit\" ausgewählt hast, als dein Botschafter. Diese einzelne Karte wird direkt in den täglichen Feed deiner Abonnenten injiziert und nahtlos in die offizielle Regierungsgesetzgebung eingewoben. Es wird mit genau derselben Priorität angezeigt wie offizielle Regierungsgesetze. Wir stellen die bürgerschaftliche Aufsicht auf die gleiche Stufe wie den Staat.';

  @override
  String get clLimitsTitle => 'SYSTEMGRENZEN (SIGNAL ÜBER RAUSCHEN)';

  @override
  String get clLimit1Label => 'AUTORENSCHAFT';

  @override
  String get clLimit1Desc =>
      'Maximale aktive Listen pro Regierung (Du kannst sie jederzeit löschen und neue bereitstellen).';

  @override
  String get clLimit2Label => 'KAPAZITÄT';

  @override
  String get clLimit2Desc =>
      'Maximale Gesetze pro Liste (Mehr als genug, um ein Muster aufzudecken, streng genug, um Informationsüberflutung zu verhindern).';

  @override
  String get clLimit3Label => 'ABONNEMENTS';

  @override
  String get clLimit3Desc =>
      'Maximale Listen, die du von anderen Creatorn beobachten kannst.';

  @override
  String get clOutro =>
      'Lustra ist kein soziales Netzwerk, das kostenlose algorithmische Reichweite für deine Liste generiert. Watchlists funktionieren nur auf Einladung. Du musst deinen einzigartigen Link extern teilen. Bringe dein Publikum von X, YouTube, TikTok oder deinem Newsletter mit. Wir geben dir keine Follower; wir geben dir die Infrastruktur, um deine bestehenden Follower in eine verifizierte, wählende bürgerschaftliche Kraft zu verwandeln – und einen Weg, direkt für deine harte Arbeit finanziert zu werden. Hör auf, dein Publikum um \"Likes\" zu bitten. Gib ihnen ein Werkzeug zum Handeln.';

  @override
  String get supportFundTitle =>
      'Phase 1: Gründung der Non-Profit-Organisation';

  @override
  String get supportFundDesc =>
      'Um die Lustra Foundation offiziell zu gründen, das geistige Eigentum zu schützen und die rechtlichen Gründungskosten zu decken, müssen wir Startkapital sammeln. Hilf uns, dieses System für immer unabhängig zu machen.';

  @override
  String get supportFundDisclaimer =>
      'Datentransparenz: Aufgrund verschiedener Zahlungs-Gateways und Infrastrukturkosten wird dieser Fortschrittsbalken manuell vom Gründer aktualisiert (max. einmal pro Woche).';
}

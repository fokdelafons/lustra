// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get errorFailedToLoadData => 'Błąd podczas ładowania danych';

  @override
  String get errorNoData => 'Brak danych do wyświetlenia.';

  @override
  String get noData => 'Brak danych';

  @override
  String get noDate => 'Brak daty';

  @override
  String get shareAction => 'Udostępnij';

  @override
  String get loginAction => 'Zaloguj';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get settingsChangeLanguage => 'Zmień język';

  @override
  String get settingsLogout => 'Wyloguj';

  @override
  String get tryAgainButton => 'Spróbuj ponownie';

  @override
  String get moreButton => '... Więcej';

  @override
  String get seeDetailsLink => 'Zobacz szczegóły ->';

  @override
  String get bottomNavHome => 'Strona główna';

  @override
  String get bottomNavInfo => 'Informacje';

  @override
  String get bottomNavSupport => 'Wesprzyj';

  @override
  String get bottomNavFutureFeatures => 'Przyszłe funkcje';

  @override
  String termLabel(String termNumber) {
    return 'Kadencja: $termNumber';
  }

  @override
  String termMenuItem(int termNumber, String termYears) {
    return 'Kadencja $termNumber $termYears';
  }

  @override
  String get errorNoDataForTerm =>
      'Brak danych do wyświetlenia dla wybranej kadencji.';

  @override
  String get sectionPopularVotes => 'Popularne głosowania';

  @override
  String get sectionUpcoming => 'Rozpatrywane wkrótce';

  @override
  String get sectionLegislationInProcess => 'Legislacja w procesie';

  @override
  String get sectionMpProfiles => 'Profile poselskie';

  @override
  String get buttonBrowseVotes => 'Przeglądarka głosowań';

  @override
  String get buttonScheduledMeetings => 'Zaplanowane posiedzenia';

  @override
  String get buttonBillsInProgress => 'Ustawy w trakcie prac';

  @override
  String get buttonAllMps => 'Wszyscy posłowie';

  @override
  String get buttonCheckProfile => 'Sprawdź profil';

  @override
  String get errorNoDeputiesData => 'Brak danych o posłach.';

  @override
  String get errorNoDataLastVote => 'Brak danych o ostatnim głosowaniu.';

  @override
  String get errorNoDataUpcomingVote =>
      'Brak danych o nadchodzącym głosowaniu.';

  @override
  String get errorNoSummaryLastVote =>
      'Brak podsumowania dla ostatniego głosowania.';

  @override
  String get errorNoSummaryUpcomingVote =>
      'Brak podsumowania dla nadchodzącego głosowania.';

  @override
  String get errorNoDataLegislationInProcess =>
      'Brak danych o legislacji w procesie.';

  @override
  String get errorNoSummaryLegislationInProcess =>
      'Brak podsumowania dla legislacji w procesie.';

  @override
  String get keyPoints => 'Kluczowe punkty';

  @override
  String get noKeyPoints => 'Brak kluczowych punktów';

  @override
  String get votingResultsTitle => 'WYNIKI GŁOSOWANIA';

  @override
  String get labelFor => 'Za:';

  @override
  String get labelAgainst => 'Przeciw:';

  @override
  String get labelAbstained => 'Wstrzymało się:';

  @override
  String get noStatusInfo => 'Brak informacji o statusie';

  @override
  String scheduledMeetingDate(String date) {
    return 'Planowane posiedzenie: $date';
  }

  @override
  String get noScheduledMeetingDate => 'Brak planowanej daty posiedzenia';

  @override
  String processStartDate(String date) {
    return 'Rozpoczęcie procesu: $date';
  }

  @override
  String get noProcessStartDate => 'Brak daty rozpoczęcia procesu';

  @override
  String mpDistrict(String districtNumber) {
    return 'Okręg: $districtNumber';
  }

  @override
  String get actionCollapse => 'Zwiń';

  @override
  String get actionExpand => 'Rozwiń więcej...';

  @override
  String get votingFor => 'Za';

  @override
  String get votingAgainst => 'Przeciw';

  @override
  String get votingAbstainShort => 'Wstrzym.';

  @override
  String get citizenPollTitle => 'Sondaż obywatelski';

  @override
  String get pollTemporarilyUnavailable =>
      'Sondaż chwilowo niedostępny. Spróbuj ponownie później.';

  @override
  String get errorDisplayingPollBar => 'Błąd wyświetlania wyników sondażu.';

  @override
  String get pollNoForAgainstVotes => 'Brak głosów Za/Przeciw';

  @override
  String get pollNoVotesCast => 'Brak oddanych głosów';

  @override
  String pollTotalVotes(int count) {
    return 'Oddanych głosów: $count';
  }

  @override
  String get pollSupport => 'Popieram';

  @override
  String get pollDontSupport => 'Nie popieram';

  @override
  String get loginToVote => 'Zaloguj się, aby zagłosować';

  @override
  String get dialogChooseLanguage => 'Wybierz język';

  @override
  String get dialogCancel => 'Anuluj';

  @override
  String get infoScreenTitle => 'Informacje';

  @override
  String get infoTitle1 => 'Rozszczepienie polityki z mediami';

  @override
  String get infoParagraph1 =>
      'Lustra to aplikacja umożliwiająca śledzenie polityki przy użyciu oficjalnych danych. Dzięki wykorzystaniu technologii AI, podsumowania ustaw oraz wyniki głosowań prezentowane są w sposób zwięzły, klarowny i bezstronny. Śledzenie świata polityki nie wymaga już żadnego wysiłku, ani nie jest czasochłonne - wystarczy kilka kliknięć.';

  @override
  String get infoTitle2 => 'Wspólne interesy ponad podziałami';

  @override
  String get infoParagraph2 =>
      'Wszyscy jako społeczeństwo mamy wspólne cele, jakim jest wolność, bezpieczeństwo czy dobrobyt. Różnice poglądów są naturalnym elementem demokracji - to one kształtują debatę i pozwalają dostrzegać różne perspektywy. Dzięki dostępowi do rzetelnych informacji, możemy podejmować bardziej świadome decyzje i uczestniczyć w życiu publicznym w sposób oparty na faktach, a nie na emocjach czy przekazach medialnych.';

  @override
  String get infoTitle3 => 'Czyny, nie słowa';

  @override
  String get infoParagraph3 =>
      'Nie musisz już ufać obietnicom wyborczym - możesz zapoznać się z historią głosowań poszczególnych posłów i analizować ich decyzje. Każdy profil polityka zawiera wypunktowane zestawienie, co umożliwia szybką i samodzielną ocenę jego dorobku. Kompletna historia pracy będzie rozszerzana w miarę rozwoju aplikacji.';

  @override
  String get infoTitle4 => 'Ludzie, nie partie';

  @override
  String get infoParagraph4 =>
      'Posłowie powinni uwzględniać interesy wyborców, a nie głosować, tak jak nakazuje ugrupowanie. System partyjny dzieli społeczeństwo, ale wszystko da się zmienić małymi krokami. Pierwszym jest świadomość społeczna. Korzystaj z aplikacji, rozmawiaj, udostępniaj głosowania, bierz udział w sondażach i bądź na bieżąco. Polityka wpływa na prawie każdy aspekt naszego życia, więc nie ma powodu, aby o wszystkim decydowali nieliczni.';

  @override
  String get linkHowTechnologyWorks => 'Jak działa technologia?';

  @override
  String get linkTermsAndPrivacy => 'Regulamin i polityka prywatności';

  @override
  String get supportScreenTitle => 'Wesprzyj projekt';

  @override
  String get supportParagraph1 =>
      'Lustra to mój osobisty projekt pro bono. Aplikacja zawsze będzie darmowa, bez płatnych funkcji, rozszerzeń, reklam czy ograniczeń. Wierzę, że każdy powinien mieć nieograniczony dostęp do przystępnej informacji - bez opiniotwórczych komentarzy czy filtrów. Jeżeli zgadzasz się z misją, zachęcam do wsparcia jakąkolwiek kwotą darowizny. Każda, nawet najmniejsza wpłata pomoże mi utrzymać aplikację i rozwinąć ją o dalsze funkcje.';

  @override
  String get buttonSupportFinancially => 'Wesprzyj finansowo';

  @override
  String get supportThankYou =>
      'Dziękuję za zaufanie i każdą formę zaangażowania';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Twórca aplikacji';

  @override
  String get leaderboardTitle => 'Najwięksi darczyńcy (Ostatni miesiąc)';

  @override
  String get futureFeaturesScreenTitle => 'Przyszłe funkcje';

  @override
  String get futureFeaturesHeader => 'Planowane funkcjonalności';

  @override
  String get futureFeatureReferendum => 'Zwołanie referendum';

  @override
  String get futureFeatureSenate => 'Senat i senatorzy';

  @override
  String get futureFeatureCitizenInitiative =>
      'Inicjatywa obywatelska – projekty ustaw';

  @override
  String get futureFeatureIndependentCandidates =>
      'Niezależne kandydatury do sejmu';

  @override
  String get futureFeaturePetitions => 'Petycje do sejmu';

  @override
  String get comingSoon => 'Wkrótce';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Zakończone - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Odśwież dane';

  @override
  String get advancedSearchHint => 'Zaawansowane wyszukiwanie...';

  @override
  String get filterTypeLabel => 'Typ: ';

  @override
  String get filterStatusLabel => 'Status: ';

  @override
  String get allOption => 'Wszystkie';

  @override
  String get errorFetchData => 'Nie udało się pobrać danych. Spróbuj ponownie.';

  @override
  String get emptyListFilterMessage =>
      'Brak ustaw spełniających wybrane kryteria filtrowania.';

  @override
  String get emptyListDefaultMessage =>
      'Brak zakończonych ustaw do wyświetlenia dla tego źródła.';

  @override
  String get searchDialogTitle => 'Wyszukaj i filtruj';

  @override
  String get searchDialogHint => 'Wpisz szukaną frazę...';

  @override
  String get searchDialogTimePeriodLabel => 'Okres czasu';

  @override
  String get searchDialogSearchButton => 'Wyszukaj';

  @override
  String get searchDialogSelectDateRange => 'Wybierz zakres';

  @override
  String get searchDialogDateRangePickerHelp => 'Wybierz zakres dat';

  @override
  String get searchDialogDateRangePickerCancel => 'Anuluj';

  @override
  String get searchDialogDateRangePickerConfirm => 'OK';

  @override
  String get searchDialogDateRangePickerSave => 'Zapisz';

  @override
  String get timePeriodLastWeek => 'Ostatni tydzień';

  @override
  String get timePeriodLastMonth => 'Ostatni miesiąc';

  @override
  String get timePeriodLast3Months => 'Ostatnie 3 miesiące';

  @override
  String get timePeriodLastYear => 'Ostatni rok';

  @override
  String get timePeriodAll => 'Wszystkie';

  @override
  String get timePeriodCustom => 'Własny zakres czasu';

  @override
  String get categoryAll => 'Wszystkie';

  @override
  String get categoryHealth => 'Zdrowie';

  @override
  String get categoryFamily => 'Rodzina';

  @override
  String get categoryTaxes => 'Podatki';

  @override
  String get categoryMigration => 'Migracja';

  @override
  String get categoryLabor => 'Praca';

  @override
  String get categorySecurity => 'Bezpieczeństwo';

  @override
  String get categoryEducation => 'Edukacja';

  @override
  String get categoryEnvironment => 'Środowisko';

  @override
  String get categoryCourtsAndLaw => 'Sądy i prawo';

  @override
  String get categoryTransport => 'Transport';

  @override
  String get categoryBenefits => 'Świadczenia';

  @override
  String get categoryRealEstate => 'Nieruchomości';

  @override
  String get categoryMediaAndCulture => 'Media i kultura';

  @override
  String get categoryLocalGovernment => 'Samorząd';

  @override
  String get categoryAgriculture => 'Rolnictwo';

  @override
  String get categoryPublicInvestments => 'Inwestycje publiczne';

  @override
  String get categoryInformatization => 'Informatyzacja';

  @override
  String get categoryEconomy => 'Gospodarka';

  @override
  String get categoryOther => 'Inne';

  @override
  String futureLegislationScreenTitle(String parliamentName) {
    return 'Nadchodzące ustawy - $parliamentName';
  }

  @override
  String get searchDialogAdvancedTitle => 'Wyszukaj i filtruj (Zaawansowane)';

  @override
  String get emptyListFilterMessageFuture =>
      'Brak nadchodzących ustaw spełniających wybrane kryteria filtrowania.';

  @override
  String get emptyListDefaultMessageFuture =>
      'Brak zaplanowanych ustaw do wyświetlenia dla tego źródła.';

  @override
  String get noScheduledMeetings => 'Brak zaplanowanych posiedzeń';

  @override
  String get dateFormatError => 'Błąd formatowania dat';

  @override
  String get upcomingMeetings => 'Nadchodzące posiedzenia:';

  @override
  String get keyPointsTitle => 'Kluczowe punkty:';

  @override
  String processLegislationScreenTitle(String parliamentName) {
    return 'Ustawy w procesie - $parliamentName';
  }

  @override
  String get searchHint => 'Szukaj...';

  @override
  String get emptyListFilterMessageProcess =>
      'Brak ustaw w procesie spełniających wybrane kryteria filtrowania.';

  @override
  String get emptyListDefaultMessageProcess =>
      'Brak aktywnych ustaw w procesie legislacyjnym dla tego źródła.';

  @override
  String processStartDateCardLabel(String date) {
    return 'Rozpoczęcie procesu: $date';
  }

  @override
  String get upcomingMeetingsCardLabel => 'Najbliższe posiedzenia:';

  @override
  String get detailsScreenTitle => 'LUSTRA';

  @override
  String get shareTooltip => 'Udostępnij';

  @override
  String get keyPointsSectionTitle => 'Kluczowe punkty:';

  @override
  String get officialContentButton => 'Oficjalna treść';

  @override
  String get processPageButton => 'Strona procesu';

  @override
  String get fullVotingResultsPDF => 'Pełne wyniki głosowania (PDF)';

  @override
  String get scheduledMeetingsSectionTitle => 'Zaplanowane posiedzenia';

  @override
  String get additionalInfoSectionTitle => 'Dodatkowe informacje';

  @override
  String printNumberLabel(String id) {
    return 'Numer druku: $id';
  }

  @override
  String processStartDateLabel(String date) {
    return 'Data rozpoczęcia procesu: $date';
  }

  @override
  String votingDateLabel(String date) {
    return 'Data głosowania: $date';
  }

  @override
  String meetingNumberLabel(String number) {
    return 'Nr posiedzenia: $number';
  }

  @override
  String votingNumberLabel(String number) {
    return 'Nr głosowania: $number';
  }

  @override
  String get sourceLabel => 'Źródło: https://api.sejm.gov.pl/';

  @override
  String summarizedByLabel(String modelName) {
    return 'Streszczone przez: $modelName';
  }

  @override
  String promptUsedLabel(String prompt) {
    return 'Użyty prompt: $prompt';
  }

  @override
  String get reportErrorButton => 'Zgłoś błąd';

  @override
  String get noUrlAvailableSnackbar => 'Brak dostępnego adresu URL.';

  @override
  String cannotOpenLinkSnackbar(String url) {
    return 'Nie można otworzyć linku: $url';
  }

  @override
  String get alreadyVotedSnackbar =>
      'Twój głos został już wcześniej zarejestrowany.';

  @override
  String get sharingFunctionNotImplementedSnackbar =>
      'Funkcja udostępniania (do implementacji)';

  @override
  String get reportErrorFunctionNotImplementedSnackbar =>
      'Funkcja zgłaszania błędu (do implementacji)';

  @override
  String get loginScreenTitle => 'Logowanie';

  @override
  String get registrationScreenTitle => 'Rejestracja';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Hasło';

  @override
  String get loginButton => 'Zaloguj się';

  @override
  String get registerButton => 'Zarejestruj się';

  @override
  String get orDivider => 'LUB';

  @override
  String get continueWithGoogle => 'Kontynuuj z Google';

  @override
  String get continueWithFacebook => 'Kontynuuj z Facebook';

  @override
  String get promptToRegister => 'Nie masz konta? Zarejestruj się';

  @override
  String get promptToLogin => 'Masz już konto? Zaloguj się';

  @override
  String get validatorInvalidEmail => 'Proszę podać prawidłowy adres email.';

  @override
  String get validatorPasswordTooShort =>
      'Hasło musi mieć co najmniej 6 znaków.';

  @override
  String get authErrorInvalidCredentials => 'Nieprawidłowy email lub hasło.';

  @override
  String get authErrorEmailInUse => 'Adres email jest już zajęty.';

  @override
  String get authErrorWeakPassword => 'Hasło jest zbyt słabe.';

  @override
  String get authErrorDefault => 'Wystąpił błąd. Spróbuj ponownie.';

  @override
  String get authErrorUnexpected => 'Wystąpił nieoczekiwany błąd.';

  @override
  String get authErrorGoogleFailed =>
      'Logowanie przez Google nie powiodło się. Spróbuj ponownie.';

  @override
  String get authErrorFacebookFailed =>
      'Logowanie przez Facebook nie powiodło się. Spróbuj ponownie.';

  @override
  String get authErrorAccountExists =>
      'Konto z tym adresem email już istnieje. Zaloguj się za pomocą hasła.';

  @override
  String mpScreenTitle(String parliamentName) {
    return 'Posłowie - $parliamentName';
  }

  @override
  String get searchMPsHint => 'Szukaj posłów...';

  @override
  String get allFilter => 'Wszyscy';

  @override
  String get noMPsForSource => 'Brak dostępnych posłów dla tego źródła.';

  @override
  String get noMPsMatchFilter => 'Brak posłów spełniających kryteria.';

  @override
  String get attendanceLabelShort => 'Frekwencja';

  @override
  String get attendanceTooltipWarning =>
      'Frekwencja obliczona na podstawie kadencji z niewielką liczbą głosowań.\nDane mogą być mniej reprezentatywne.';

  @override
  String get supportLabel => 'Poparcie: ';

  @override
  String get unaffiliatedClub => 'Niezrzeszony';

  @override
  String mpDetailsScreenTitle(String firstName, String lastName) {
    return '$firstName $lastName';
  }

  @override
  String get shareProfileTooltip => 'Udostępnij profil';

  @override
  String get socialPollSectionTitle => 'Sondaż społeczny';

  @override
  String get parliamentaryActivitySectionTitle => 'Aktywność parlamentarna';

  @override
  String parliamentaryTenureSectionTitle(int years) {
    return 'Staż parlamentarny: $years lat';
  }

  @override
  String get parliamentaryTenureNoData => 'Staż parlamentarny: Brak danych';

  @override
  String get tenureTooltip =>
      'Ilość lat jest wartością przybliżoną, obliczoną na podstawie poniższych danych, bez brania pod uwagę przedwczesnego wygaśnięcia mandatu poselskiego.';

  @override
  String tenureTermItem(String romanNumeral, String duration) {
    return '$romanNumeral kadencja Sejmu RP $duration';
  }

  @override
  String get unknownTermDuration => 'Nieznany okres';

  @override
  String get noTermData => 'Brak szczegółowych danych o kadencjach.';

  @override
  String get plHistoricalDataDisclaimer =>
      'Uwaga: Dane historyczne dla 1. i 2. kadencji Sejmu RP są niedostępne i nie są uwzględniane.';

  @override
  String get personalDataSectionTitle => 'Dane osobowe';

  @override
  String get contactSectionTitle => 'Kontakt';

  @override
  String get dataSourceLabel => 'Źródło danych: Sejm RP API';

  @override
  String get mandateStatusActive => 'Mandat posła: aktywny';

  @override
  String get mandateStatusFulfilled => 'Mandat posła: wykonany';

  @override
  String get mandateStatusCancelled => 'Mandat posła: anulowany';

  @override
  String get mandateStatusInactive => 'Mandat posła: nieaktywny';

  @override
  String get followingAddedSnackbar => 'Dodano do obserwowanych';

  @override
  String get followingRemovedSnackbar => 'Usunięto z obserwowanych';

  @override
  String clubLabel(String clubName) {
    return 'Klub: $clubName';
  }

  @override
  String formerlyLabel(String clubs) {
    return ' (dawniej: $clubs)';
  }

  @override
  String professionLabel(String profession) {
    return 'Zawód: $profession';
  }

  @override
  String districtLabel(String districtName, int districtNum) {
    return 'Okręg: $districtName (nr $districtNum)';
  }

  @override
  String votesObtainedLabel(String votes) {
    return 'Zdobyte głosy: $votes';
  }

  @override
  String get birthDateLabel => 'Data urodzenia';

  @override
  String get ageLabel => 'Wiek';

  @override
  String ageUnit(int age) {
    return '$age lat';
  }

  @override
  String get birthPlaceLabel => 'Miejsce urodzenia';

  @override
  String get educationLabel => 'Wykształcenie';

  @override
  String get voivodeshipLabel => 'Województwo';

  @override
  String get emailLabelWithColon => 'Email:';

  @override
  String get votingsTab => 'Ostatnie głosowania';

  @override
  String get interpellationsTab => 'Interpelacje';

  @override
  String get attendanceLabel => 'Ogólna frekwencja w głosowaniach';

  @override
  String get attendanceTooltipBase =>
      'Skala ocenia poziom realizacji podstawowego obowiązku parlamentarnego. Przyjęte przedziały opierają się na założeniu, że wysoka frekwencja jest miernikiem odpowiedzialności wobec wyborców.';

  @override
  String get attendanceTooltipPartialMandate =>
      '\n\nPoseł pełnił mandat przez część kadencji. Frekwencja odnosi się do tego okresu.';

  @override
  String get attendanceTooltipUnknownMandate =>
      '\n\nFrekwencja obliczona na podstawie kadencji z niewielką liczbą głosowań. Dane mogą być mniej reprezentatywne.';

  @override
  String get errorLoadVotings => 'Nie udało się załadować historii głosowań.';

  @override
  String get errorLoadInterpellations =>
      'Nie udało się załadować interpelacji.';

  @override
  String get noVotingsData =>
      'Brak danych o ważnych głosowaniach do wyświetlenia.';

  @override
  String get noInterpellationsData => 'Brak danych.';

  @override
  String get loadVotingsButton => 'Spróbuj załadować głosowania';

  @override
  String get loadMoreButton => 'Wyświetl więcej';

  @override
  String interpellationSentDate(String date) {
    return 'Data złożenia: $date';
  }

  @override
  String get interpellationReplyFrom => 'Odpowiedź od: ';

  @override
  String cannotOpenReplyLink(String url) {
    return 'Nie można otworzyć linku odpowiedzi: $url';
  }

  @override
  String get pollResultNoVotes => 'brak głosów';

  @override
  String get pollResultOverwhelmingMajority => 'zdecydowana większość';

  @override
  String get pollResultMajority => 'większość';

  @override
  String get pollResultMinority => 'mniejszość';

  @override
  String get pollResultOverwhelmingMinority => 'zdecydowana mniejszość';

  @override
  String pollResultFormatted(String percentage, String description) {
    return '$percentage - $description';
  }

  @override
  String pollTotalVotesLabel(int count) {
    return 'Liczba oddanych głosów: $count';
  }

  @override
  String get pollVoteToAction => 'Oddaj głos, aby zobaczyć wyniki';

  @override
  String get voteTypeFor => 'Za';

  @override
  String get voteTypeAgainst => 'Przeciw';

  @override
  String get voteTypeAbstain => 'Wstrzymał się';

  @override
  String get voteTypeAbsent => 'Nieobecny';

  @override
  String get defaultPrompt => 'Prompt ogólny';

  @override
  String get statusInProgress => 'W procesie';

  @override
  String get statusPassedSejmToSenat => 'Uchwalono i przekazano do Senatu';

  @override
  String get statusRejectedSejm => 'Odrzucono';

  @override
  String get statusRejectedBySenate => 'Odrzucono przez Senat';

  @override
  String get statusToPresident => 'Przekazano Prezydentowi';

  @override
  String get statusVetoPresident => 'VETO Prezydenta';

  @override
  String get statusToConstitutionalTribunal => 'Skierowano do TK';

  @override
  String get statusSignedByPresident => 'Podpisano przez Prezydenta';

  @override
  String get statusEnacted => 'W mocy';

  @override
  String get statusExpired => 'Przedawniono';

  @override
  String get statusAdoptedResolution => 'Uchwalono';

  @override
  String get statusRejectedResolution => 'Odrzucono';

  @override
  String get statusImmediateRejection => 'Natychmiastowe odrzucenie';

  @override
  String get statusWithdrawn => 'Wycofano';

  @override
  String get filterStatusAll => 'Wszystkie';

  @override
  String get filterStatusPassed => 'Przyjęte';

  @override
  String get filterStatusRejected => 'Odrzucone';

  @override
  String get docTypeBill => 'Projekt ustawy';

  @override
  String get docTypeResolution => 'Projekt uchwały';

  @override
  String get statusUpcoming => 'Zaplanowane';

  @override
  String get statusIntroducedInHouse => 'Złożono w Izbie Reprezentantów';

  @override
  String get statusReportedToSenate => 'Przekazano sprawozdanie do Senatu';

  @override
  String get statusReportedInHouse => 'Złożono sprawozdanie w Izbie';

  @override
  String get statusReferredInSenate => 'Skierowano w Senacie';

  @override
  String get statusReferredInHouse => 'Skierowano w Izbie';

  @override
  String get statusReferenceChangeSenate => 'Zmiana skierowania w Senacie';

  @override
  String get statusReceivedInSenate => 'Otrzymano w Senacie';

  @override
  String get statusPlacedOnCalendarSenate => 'Umieszczono w kalendarzu Senatu';

  @override
  String get statusIntroducedInSenate => 'Złożono w Senacie';

  @override
  String get statusEngrossedInHouse =>
      'Przyjęto w ostatecznym kształcie w Izbie';

  @override
  String get statusAgreedToSenate => 'Uzgodniono w Senacie';

  @override
  String get statusEngrossedAmendmentHouse => 'Przyjęto poprawkę w Izbie';

  @override
  String get statusFailedPassageSenate => 'Odrzucono w Senacie';

  @override
  String get statusLaidOnTableInHouse => 'Odłożono w Izbie Reprezentantów';

  @override
  String get statusPrivateLaw => 'Ustawa prywatna';

  @override
  String get statusPublicLaw => 'Ustawa publiczna';

  @override
  String get statusAdopted => 'Przyjęto';

  @override
  String get statusDeBundesratApproved => 'Bundesrat zatwierdził';

  @override
  String get statusDeAdopted => 'Przyjęto';

  @override
  String get statusDeIntroductionApproved => 'Wprowadzenie zatwierdzone';

  @override
  String get statusDeAnnounced => 'Ogłoszono';

  @override
  String get statusDeRejected => 'Odrzucono';

  @override
  String get statusDeBundesratDenied => 'Bundesrat odmówił zgody';

  @override
  String get statusDeIntroductionRejected => 'Wprowadzenie odrzucone';

  @override
  String get statusDeDeclaredCompleted => 'Uznano za zakończone';

  @override
  String get statusDeCompletedByTermEnd => 'Zakończono z końcem kadencji';

  @override
  String get statusDeDeclaredUnconstitutional =>
      'Uznano za niezgodne z Ustawą Zasadniczą';

  @override
  String get statusDeWithdrawn => 'Wycofano';

  @override
  String get statusDeBundesratProcessCompleted =>
      'Proces w Bundesracie zakończony';

  @override
  String get statusDeCompleted => 'Zakończono';

  @override
  String get statusDeCompletedSeeProcess => 'Zakończono - zobacz przebieg';

  @override
  String get statusDeRecommendationAvailable =>
      'Dostępna rekomendacja do uchwały';

  @override
  String get statusDeToBundesratNotDeliberated =>
      'Przekazano do Bundesratu - jeszcze nie rozpatrzono';

  @override
  String get statusDeAssignedToCommittees => 'Przypisano do komisji';

  @override
  String get statusDeNotYetDeliberated => 'Jeszcze nie rozpatrzono';

  @override
  String get statusDeMergedWith => 'Połączono z... (zobacz przebieg)';

  @override
  String get statusDeReferred => 'Skierowano';

  @override
  String get statusFrLawPublished => 'Ustawa opublikowana';

  @override
  String get statusFrOrdinancePublished => 'Rozporządzenie opublikowane';

  @override
  String get statusFrResolutionPublished => 'Rezolucja opublikowana';

  @override
  String get statusFrDecreePublished => 'Dekret opublikowany';

  @override
  String get statusFrDecision => 'Decyzja';

  @override
  String get statusFrRejected => 'Odrzucono';

  @override
  String get statusFrPrescribed => 'Przedawnione';

  @override
  String get statusFrPropositionLoi => 'Inicjatywa poselska';

  @override
  String get statusFrProjetLoi => 'Projekt rządowy';

  @override
  String get statusUkActOfParliament => 'Akt Parlamentu';

  @override
  String get statusUkRoyalAssent => 'Zgoda Królewska';

  @override
  String get statusUkWithdrawn => 'Wycofano';

  @override
  String get statusUkRejected => 'Odrzucono';

  @override
  String get statusUk1stReading => '1. czytanie';

  @override
  String get statusUk2ndReading => '2. czytanie';

  @override
  String get statusUk3rdReading => '3. czytanie';

  @override
  String get statusUkCommitteeStage => 'Etap komisji';

  @override
  String get statusUkCommonsExaminers => 'Egzaminatorzy Izby Gmin';

  @override
  String get statusUkLordsSpecialCommittee =>
      'Specjalna Komisja ds. Ustaw Publicznych Izby Lordów';

  @override
  String get statusUkMoneyResolution => 'Rezolucja finansowa';

  @override
  String get statusUkConsiderationLordsAmendments =>
      'Rozpatrzenie poprawek Lordów';

  @override
  String get statusUkConsiderationLordsMessage =>
      'Rozpatrzenie wiadomości od Lordów';

  @override
  String get statusUkOrderOfCommitmentDischarged =>
      'Zwolnienie z obowiązku skierowania do komisji';

  @override
  String get statusUkProgrammeMotion => 'Wniosek programowy';

  @override
  String get statusUkReportStage => 'Etap sprawozdawczy';

  @override
  String get statusUkSecondReadingCommittee => 'Komisja ds. drugiego czytania';

  @override
  String get statusUkWaysAndMeansResolution => 'Rezolucja budżetowa';

  @override
  String get errorCheckConnection => 'Sprawdź swoje połączenie z internetem.';

  @override
  String get buttonRetry => 'Spróbuj ponownie';

  @override
  String get shareAsPost => 'Udostępnij post (1:1)';

  @override
  String get shareAsStory => 'Udostępnij relację (16:9)';

  @override
  String get morePointsInApp =>
      '...pełne informacje są dostępne w aplikacji Lustra';

  @override
  String get pollVotingViaApp => 'Głosowanie otwarte w aplikacji!';

  @override
  String get supportPollTitle => 'Sondaż poparcia';

  @override
  String get termsCountLabel => 'Liczba kadencji';

  @override
  String get settingsNotificationsNewLaws =>
      'Powiadomienia o nowych legislacjach';

  @override
  String get settingsNotificationsVoteResults =>
      'Powiadomienia o wynikach głosowań';

  @override
  String get detailsButton => 'Szczegóły';

  @override
  String get errorNoVotingsDetails => 'BRAK SZCZEGÓŁOWYCH DANYCH O GŁOSOWANIU';

  @override
  String get clearText => 'Wyczyść';

  @override
  String get consideredOnLabel => 'Rozpatrywane:';

  @override
  String get legislationFooterAiDisclaimer =>
      'Powyższe streszczenie zostało wygenerowane przez AI i stanowi opracowanie oryginalnego dokumentu rządowego z poszanowaniem wszelkich zasad bezstronności i wolnej informacji. Szczegóły użytego zapytania i jego schemat znajdziesz w zakładce informacyjnej.';

  @override
  String get legislationFooterModelUsed => 'Użyty model:';

  @override
  String get legislationFooterSourceData =>
      'Dane źródłowe są dostępne bezpłatnie w systemie rządowym pod adresem:';

  @override
  String get appMotto =>
      '... czyli bezstronna informacja legislacyjna bez zabarwienia politycznego.';

  @override
  String get acceptTermsPrefix => 'Akceptuję';

  @override
  String get termsAndConditions => 'Regulamin i Politykę Prywatności';

  @override
  String get validatorAcceptTerms =>
      'Musisz zaakceptować regulamin, aby kontynuować.';

  @override
  String get joinSupportClubPrefix => 'Chcę dołączyć do';

  @override
  String get supportClub => 'Klubu Wsparcia Lustra';

  @override
  String get supportClubDescription =>
      'Otrzymasz specjalne informacje o rozwoju projektu i przyszłych inicjatywach.';

  @override
  String get registrationFinishTitle => 'Dokończ rejestrację';

  @override
  String get welcomeMessage => 'Witaj!';

  @override
  String get finalStepMessage =>
      'To już ostatni krok. Zaakceptuj regulamin, aby kontynuować.';

  @override
  String get continueButton => 'Kontynuuj';

  @override
  String get selectYourParliament => 'Wybierz swój parlament';

  @override
  String get validatorSelectParliament =>
      'Proszę wybrać parlament, aby kontynuować.';

  @override
  String get forgotPasswordButton => 'Nie pamiętasz hasła?';

  @override
  String get passwordResetEmailSent =>
      'Link do zresetowania hasła został wysłany na Twój e-mail.';

  @override
  String get authErrorUserNotFound =>
      'Nie znaleziono użytkownika z tym adresem e-mail.';

  @override
  String get settingsDeleteAccount => 'Usuń konto';

  @override
  String get errorDeleteAccount =>
      'Nie udało się usunąć konta. Spróbuj ponownie.';

  @override
  String get dialogReauthenticateTitle => 'Potwierdź swoją tożsamość';

  @override
  String get dialogConfirm => 'Potwierdź';

  @override
  String get dialogDeleteAccountTitle => 'Czy na pewno chcesz usunąć konto?';

  @override
  String get dialogDeleteAccountContent =>
      'Tej operacji nie można cofnąć. Wszystkie Twoje dane, w tym historia głosowań, zostaną trwale usunięte.';

  @override
  String get dialogDelete => 'Usuń';

  @override
  String get termsOfServiceContent =>
      '<b>Regulamin Aplikacji \"Lustra\"</b>\n\nData ostatniej aktualizacji: 10 sierpnia 2025\n\nCześć! Tutaj, twórca aplikacji Lustra.\nCieszę się, że tu jesteś. Stworzyłem Lustra, bo wierzę, że każdy z nas zasługuje na prosty i przejrzysty dostęp do informacji o tym, jak tworzone jest prawo, które wpływa na nasze życie.\n\nTen dokument to regulamin – rodzaj umowy między mną a Tobą. Napisałem go prostym językiem, żebyś dokładnie wiedział/a, na jakich zasadach działa aplikacja. Przeczytaj go proszę na spokojnie. Korzystając z Lustra, potwierdzasz, że akceptujesz te zasady.\n\n<b>1. Słowniczek, czyli o kim i o czym mowa</b>\n•\t<b>Ja, mój, mnie</b> – czyli ja, Jacek, twórca aplikacji, działający w ramach firmy FO&WO VENTURES SP. Z O.O. z siedzibą we Wrocławiu.\n•\t<b>Ty, Twój, Ciebie</b> – czyli Ty, osoba korzystająca z aplikacji.\n•\t<b>Aplikacja</b> lub <b>Lustra</b> – czyli aplikacja mobilna \"Lustra\", z której właśnie korzystasz.\n•\t<b>Konto</b> – Twoje osobiste konto w aplikacji, które możesz założyć, aby korzystać z dodatkowych funkcji.\n•\t<b>Regulamin</b> – ten właśnie dokument.\n\n<b>2. O co chodzi w Lustra? (Główne zasady)</b>\n•\tLustra to darmowa aplikacja, której celem jest dostarczanie Ci przystępnych informacji o procesach legislacyjnych w wybranych parlamentach. Znajdziesz tu m.in. streszczenia projektów ustaw, wyniki głosowań i dane o posłach.\n•\tAby korzystać z aplikacji, musisz mieć ukończone 16 lat. Jeśli zakładasz Konto, potwierdzasz, że spełniasz ten warunek.\n•\tKorzystanie z podstawowych funkcji informacyjnych nie wymaga zakładania Konta.\n\n<b>3. Twoje Konto w aplikacji</b>\n•\tMożesz założyć Konto, używając swojego adresu e-mail. Pozwoli Ci to na korzystanie z dodatkowych funkcji, takich jak głosowanie w sondach czy otrzymywanie spersonalizowanych powiadomień.\n•\tProszę, pamiętaj, że możesz mieć tylko jedno Konto.\n•\tJesteś odpowiedzialny/a za utrzymanie swojego hasła w tajemnicy i za wszystko, co dzieje się na Twoim Koncie.\n\n<b>4. Jak możesz korzystać z treści? (Licencja)</b>\n•\tWszystkie dane źródłowe (np. pełne teksty ustaw, wyniki głosowań, dane posłów) pochodzą z oficjalnych, publicznych źródeł i są informacją publiczną.\n•\tTreści, które tworzę za pomocą mojego autorskiego systemu i technologii AI (czyli streszczenia, uproszczone tytuły, kluczowe punkty) udostępniam Ci do swobodnego korzystania w celach informacyjnych, edukacyjnych i prywatnych. Możesz je czytać i udostępniać w formie zrzutów ekranu.\n•\tBardzo Cię proszę – nie kopiuj tych danych maszynowo (nie scrapuj ich). Stworzenie i utrzymanie tego systemu kosztuje mnie czas i pieniądze. Dlatego, aby chronić ten projekt, Regulamin zabrania Ci:\n\t\to\tAutomatycznego pobierania i tworzenia własnej bazy danych na podstawie treści wygenerowanych w aplikacji.\n\t\to\tWykorzystywania treści z aplikacji w celach komercyjnych.\n\t\to\tPrób łamania zabezpieczeń, dekompilacji aplikacji czy prób zakłócenia jej działania.\n•\tMasz pomysł na wykorzystanie danych z Lustra w ciekawy sposób? Jestem otwarty na współpracę! Napisz do mnie na jacek@lustra.dev – chętnie o tym porozmawiam.\n\n<b>5. Sondaże i rzetelność danych</b>\n•\tJedną z funkcji aplikacji są sondaże, w których możesz wyrazić swoje poparcie dla danej ustawy. Aby wyniki tych sondaży były jak najbardziej miarodajne, proszę, wybierz w ustawieniach parlament tego kraju, którego jesteś obywatelem (o ile jest dostępny na liście).\n\n<b>6. Moja odpowiedzialność (a raczej jej brak)</b>\n•\tDostarczam aplikację \"tak, jak jest\" (ang. \"as is\"). Dokładam wszelkich starań, aby dane były aktualne i poprawne, ale pochodzą one z zewnętrznych, rządowych API, w których mogą zdarzyć się błędy. Dlatego nie mogę ponosić odpowiedzialności za ewentualne nieścisłości w danych źródłowych.\n•\tLustra to projekt pro bono, który utrzymuję z własnych środków. Będę robił wszystko, co w mojej mocy, aby działała nieprzerwanie, ale muszę zastrzec, że mogą zdarzyć się przerwy techniczne. Zastrzegam też sobie prawo do zakończenia świadczenia usługi, jeśli np. skończą mi się środki na jej utrzymanie.\n•\tTreści w aplikacji, w szczególności te generowane przez AI, mają charakter informacyjny i edukacyjny. Nie stanowią one porady prawnej.\n\n<b>7. Klub Wsparcia Lustra</b>\n•\tMożesz dołączyć do \"Klubu Wsparcia Lustra\", wyrażając osobną, dobrowolną zgodę. Oznacza to, że będę mógł wysyłać Ci na maila informacje o rozwoju aplikacji, nowych funkcjach, a także prosić o wsparcie w dyskusji nad przyszłością projektu lub o pomoc finansową, gdyby była potrzebna. Szczegóły na ten temat znajdziesz w Polityce Prywatności.\n\n<b>8. Zakończenie naszej umowy</b>\n•\tTy możesz zakończyć ją w każdej chwili. Wystarczy, że skorzystasz z opcji \"Usuń konto\" w ustawieniach aplikacji. Spowoduje to nieodwracalne usunięcie Twojego Konta i powiązanych z nim danych.\n•\tJa mogę zablokować lub usunąć Twoje Konto, jeśli w rażący sposób naruszysz zasady tego Regulaminu, np. próbując zaszkodzić działaniu aplikacji.\n\n<b>9. Zmiany w Regulaminie</b>\n•\tŚwiat się zmienia, aplikacja też będzie. Zastrzegam sobie prawo do zmiany tego Regulaminu. O każdej ważnej zmianie poinformuję Cię z wyprzedzeniem, np. poprzez komunikat w aplikacji. Dalsze korzystanie z Lustra po wprowadzeniu zmian będzie oznaczało ich akceptację.\n\n<b>10. Kontakt i sprawy końcowe</b>\n•\tJeśli masz jakiekolwiek pytania, pisz śmiało na: jacek@lustra.dev.\n•\tWe wszystkich sprawach nieuregulowanych w tym Regulaminie zastosowanie ma prawo polskie.\n\nDzięki, że tu jesteś i pomagasz tworzyć transparentne państwo!';

  @override
  String get termsAndPrivacyTitle => 'Regulamin i Polityka Prywatności';

  @override
  String get termsOfServiceTab => 'Regulamin';

  @override
  String get privacyPolicyTab => 'Polityka Prywatności';

  @override
  String get privacyPolicyContent =>
      '<b>Polityka Prywatności Aplikacji \"Lustra\"</b>\n\nData ostatniej aktualizacji: 10 sierpnia 2025\n\nTen dokument to Polityka Prywatności. Wiem, że takie teksty bywają długie i skomplikowane, dlatego zrobiłem wszystko, co w mojej mocy, aby napisać go prosto.\nTwoja prywatność i zaufanie są dla mnie absolutnym priorytetem. W tej polityce wyjaśnię Ci, jakie dane zbieram, dlaczego to robię i jak je chronię.\n\n<b>1. Kto dba o Twoje dane? (Administrator Danych)</b>\nAdministratorem Twoich danych osobowych jestem ja, Jacek, działający w ramach firmy FO&WO VENTURES SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ (ul. Wapienna 13/7, 50-518 Wrocław, NIP: 6343002817).\nJeśli masz jakiekolwiek pytania dotyczące Twoich danych, napisz do mnie bezpośrednio na adres: jacek@lustra.dev.\n\n<b>2. Jakie dane zbieram i dlaczego?</b>\nZbieram tylko te dane, które są niezbędne do działania aplikacji lub na które wyrazisz osobną, dobrowolną zgodę. Oto szczegółowa lista:\n•\t<b>Gdy zakładasz Konto:</b>\n\to\t<b>Twój adres e-mail:</b> Potrzebuję go, aby założyć i bezpiecznie prowadzić Twoje Konto, umożliwić Ci logowanie i pozwolić na reset hasła, gdybyś go zapomniał/a.\n\to\t<b>Unikalny identyfikator użytkownika (UID):</b> Jest to losowy ciąg znaków nadawany automatycznie przez system Firebase, który pozwala mi bezpiecznie połączyć Twoje dane z Twoim Kontem.\n•\t<b>Gdy korzystasz z funkcji aplikacji (jako zalogowany użytkownik):</b>\n\to\t<b>Twoje głosy w sondach (\"popieram\" / \"nie popieram\"):</b> Zapisuję je, aby móc tworzyć zbiorcze, w pełni anonimowe statystyki poparcia dla poszczególnych ustaw, które widzisz w aplikacji. Twój indywidualny głos nigdy nie jest nigdzie publicznie pokazywany.\n\to\t<b>Lista obserwowanych przez Ciebie ustaw:</b> Przechowuję ją, abyś miał/a do niej łatwy dostęp i (w przyszłości) abym mógł wysyłać Ci powiadomienia o postępach w pracach nad nimi.\n\to\t<b>Twój wybrany parlament:</b> Zapisuję tę informację, abyś mógł/mogła brać udział w odpowiednich sondach i (w przyszłości) otrzymywać powiadomienia dotyczące właściwego kraju.\n•\t<b>Gdy dołączasz do Klubu Wsparcia Lustra (całkowicie dobrowolne):</b>\n\to\t<b>Informacja o Twojej zgodzie (prawda/fałsz):</b> Zapisuję ją, aby wiedzieć, czy chcesz otrzymywać ode mnie dodatkowe wiadomości. O Klubie piszę więcej w punkcie 5.\n•\t<b>Gdy zgłaszasz błąd:</b>\n\to\tJeśli zdecydujesz się wysłać raport o błędzie w danych, zapiszę treść Twojego zgłoszenia, aby móc przeanalizować i naprawić problem.\nCzego <b>NIE</b> zbieram: Nie używam żadnych zewnętrznych narzędzi analitycznych (jak Google Analytics) do śledzenia Twojej aktywności w aplikacji.\n\n<b>3. Komu powierzam Twoje dane? (Moi partnerzy technologiczni)</b>\nAby Lustra mogły działać, korzystam z usług zaufanych partnerów technologicznych, którym powierzam przetwarzanie niektórych danych. Są to:\n•\t<b>Google (w ramach usługi Firebase):</b> To kręgosłup technologiczny całej aplikacji. Google dostarcza mi infrastrukturę do:\n\to\t<b>Uwierzytelniania (Firebase Authentication):</b> Bezpieczne logowanie i zarządzanie Twoim Kontem.\n\to\t<b>Bazy danych (Cloud Firestore):</b> Przechowywanie danych związanych z Twoim Kontem (np. głosów w sondach, listy obserwowanych ustaw).\n•\t<b>Google (w ramach usługi Gemini AI):</b> To narzędzie, którego używam do analizy tekstów legislacyjnych. Chcę, żeby było to absolutnie jasne: do AI wysyłam wyłącznie publicznie dostępne teksty ustaw i dokumentów. Twoje dane osobowe (jak e-mail czy UID) nigdy nie są tam przesyłane.\nWszystkie dane są przechowywane na serwerach Google zlokalizowanych na terenie Europejskiego Obszaru Gospodarczego.\n\n<b>4. Jak długo przechowuję Twoje dane?</b>\nKrótko i prosto: przechowuję Twoje dane tak długo, jak długo masz u mnie Konto. Jeśli zdecydujesz się je usunąć, wszystkie Twoje dane osobowe zostaną bezpowrotnie skasowane.\n\n<b>5. Klub Wsparcia Lustra – co to takiego?</b>\nTo specjalne miejsce dla osób, które chcą być bliżej projektu. Dołączenie jest całkowicie dobrowolne i wymaga zaznaczenia osobnej zgody. Jeśli dołączysz, oznacza to, że zgadzasz się, abym od czasu do czasu wysyłał Ci na maila informacje o:\n•\trozwoju aplikacji i planowanych nowych funkcjach,\n•\tspecjalnych wydarzeniach, np. panelach dyskusyjnych o przyszłości Lustra,\n•\tinnych, podobnych projektach realizujących misję, które mogę stworzyć w przyszłości,\n•\tprośbach o wsparcie finansowe, gdyby projekt znalazł się w trudnej sytuacji.\nSwoją zgodę możesz wycofać w każdej chwili w ustawieniach aplikacji.\n\n<b>6. Twoje prawa – masz pełną kontrolę</b>\nRODO daje Ci szereg praw, a ja chcę, żebyś mógł/mogła z nich łatwo korzystać. Masz prawo do:\n•\tDostępu do swoich danych: Wiedzieć, jakie dane na Twój temat przechowuję.\n•\tSprostowania (poprawienia) swoich danych.\n•\tUsunięcia swoich danych (prawo do bycia zapomnianym): Możesz to zrobić w każdej chwili, korzystając z opcji \"Usuń konto\" w ustawieniach aplikacji.\n•\tOgraniczenia przetwarzania Twoich danych.\n•\tPrzenoszenia danych.\n•\tWniesienia sprzeciwu wobec przetwarzania danych.\n•\tWycofania zgody (np. na bycie w Klubie Wsparcia Lustra).\n•\tWniesienia skargi do Prezesa Urzędu Ochrony Danych Osobowych (UODO), jeśli uznasz, że przetwarzam Twoje dane niezgodnie z prawem.\nAby skorzystać z większości tych praw, wystarczy, że napiszesz do mnie na jacek@lustra.dev.\n\n<b>7. Bezpieczeństwo Twoich danych</b>\nBezpieczeństwo traktuję bardzo poważnie. Korzystam z rozwiązań dostarczanych przez Google Firebase, które stosują nowoczesne standardy zabezpieczeń, w tym szyfrowanie danych zarówno podczas ich przesyłania (protokół SSL), jak i przechowywania na serwerach.\n\n<b>8. Dane dzieci</b>\nJak wspomniałem w Regulaminie, aplikacja jest przeznaczona dla osób, które ukończyły 16 lat. Świadomie nie zbieram i nie przetwarzam danych osób młodszych.\n\n<b>9. Zmiany w tej polityce</b>\nMogę w przyszłości aktualizować tę politykę. O każdej istotnej zmianie poinformuję Cię z wyprzedzeniem w aplikacji.\n\nDziękuję za Twoje zaufanie.\nJacek';

  @override
  String get techPageTitle => 'O technologii i bezstronności';

  @override
  String get techPageIntro =>
      'Za każdym uproszczonym tytułem i streszczeniem ustawy stoi model językowy. W tym miejscu chcę Ci w pełni transparentnie wyjaśnić, jak on działa i jak dbam o to, by informacje, które otrzymujesz, były zawsze czyste i bezstronne.';

  @override
  String get techPageWhyAiTitle => 'Dlaczego używam AI?';

  @override
  String get techPageWhyAiBody =>
      'Teksty ustaw i dokumentów parlamentarnych są pisane skomplikowanym, prawniczym żargonem. Przeczytanie i zrozumienie nawet krótkiej ustawy jest wyzwaniem, nawet dla prawnika.\n\nMoim celem było stworzenie narzędzia, które przetłumaczy ten hermetyczny język \"z prawniczego na ludzki\". Ręczne analizowanie setek dokumentów dziennie byłoby niemożliwe dla jednej osoby. Dlatego właśnie sięgnąłem po AI – jako potężne narzędzie do analizy tekstu i jego upraszczania, które pozwala dostarczyć Ci informacje szybko i w przystępnej formie.';

  @override
  String get techPageWhatForTitle => 'Do czego dokładnie używam AI?';

  @override
  String get techPageWhatForBody =>
      'Sztuczna Inteligencja wykonuje trzy konkretne zadania:\n  • Upraszcza oficjalne tytuły na takie, które od razu mówią, o co chodzi w dokumencie.\n  • Tworzy krótkie, 2-3 zdaniowe streszczenia, które skupiają się na wpływie zmian na życie codzienne obywateli.\n  • Wyciąga z gąszczu tekstu kilka kluczowych punktów, czyli najważniejszych zmian i rozwiązań.\n\nWszystkie pozostałe dane, jak wyniki głosowań czy informacje o posłach, pochodzą bezpośrednio z oficjalnych, rządowych API.';

  @override
  String get techPageBiasTitle =>
      'Jak zapewniam bezstronność? Instrukcja dla AI';

  @override
  String get techPageBiasBody =>
      'To jest najważniejsza część. AI wykonuje konkretne polecenia. Te polecenia (w informatyce nazywane \"promptem\") to rodzaj bardzo precyzyjnej instrukcji, która jest fundamentem bezstronności całej aplikacji.\n\nOto kluczowe zasady, które wbiłem do mojego systemu AI:\n  • <b>Rola neutralnego eksperta:</b> Nakazuję AI, aby wcieliła się w rolę apolitycznego eksperta od prawa, którego jedynym celem jest analiza i wyjaśnianie, a nie ocenianie czy komentowanie.\n  • <b>Tylko fakty, żadnych opinii:</b> Instrukcja wyraźnie zabrania AI wyrażania własnych opinii, wartościowania i używania języka, który mógłby sugerować, czy dana zmiana jest \"dobra\" czy \"zła\". Ma skupić się wyłącznie na faktach.\n  • <b>Perspektywa zwykłego człowieka:</b> Zamiast analizować ustawę z perspektywy prawnika, AI ma za zadanie odpowiedzieć na pytanie: \"Co ta zmiana oznacza dla mnie, zwykłego obywatela? Jak wpłynie na moje finanse, zdrowie, prawa i obowiązki?\".';

  @override
  String get techPagePromiseTitle =>
      'Pełna, transparentna instrukcja do wglądu';

  @override
  String get techPagePromiseBody =>
      'Nie wierz na słowo. Poniżej znajduje się dokładna treść instrukcji (promptu), którą przekazuję modelowi AI (Google Gemini) przy analizie każdego dokumentu, upewniając się, że parametry kreatywności są także ustawione na 0 (aby  AI nie zmyślało przy analizie). To jest \"mózg\" operacji.\n\n(Uwaga: Ten prompt będzie z czasem ewoluował i ulepszany, aby jakość streszczeń była coraz wyższa.)';

  @override
  String techPagePromptCode(Object DOCUMENT_TEXT, Object country) {
    return 'Jesteś ekspertem od prawa $country, który ma za zadanie analizować dokumenty ustaw, uchwał oraz innych dokumentów legislacyjnych, a następnie przygotowywać z nich informacje w przystępny sposób dla obywateli. Twoim celem jest przedstawienie informacji tak, aby obywatele mogli sami ocenić wpływ legislacji na ich życie, nawet bez posiadania specjalistycznej wiedzy legislacyjnej. Skup się na faktach i konsekwencjach wprowadzanych zmian, unikając wartościowania i osobistych opinii. Wszelki żargon prawny jest zabroniony. Prezentuj informacje w jasny, zwięzły i angażujący sposób, tak aby były zrozumiałe dla osoby bez wykształcenia prawniczego. Unikaj długich, złożonych zdań. Zamiast pisać \"projekt ma na celu implementację dyrektywy odnośnie segregacji odpadów...\", napisz \"Nowe zasady segregacji śmieci: używanie specjalnych worków, etc....\". Kontynuuj swoją pracę, dopóki nie rozwiążesz swojego zadania. Jeśli nie masz pewności co do generowanej treści, przeanalizuj dokument ponownie – nie zgaduj. Rozplanuj dobrze swoje zadanie przed przystąpieniem do niego. W podsumowaniu i kluczowych punktach, jeśli to możliwe i uzasadnione, podkreśl, jakie konkretne korzyści lub konsekwencje (pozytywne lub negatywne) wprowadza ustawa dla życia codziennego obywateli, ich praw i obowiązków, finansów osobistych, bezpieczeństwa i innych ważnych kwestii.\n\nTwoja odpowiedź MUSI być w formacie JSON - i zawierać następujące klucze.\nZanim zwrócisz odpowiedź, dokładnie zweryfikuj, czy cała struktura JSON jest w 100% poprawna, włącznie ze wszystkimi przecinkami, nawiasami klamrowymi, kwadratowymi oraz cudzysłowami. Błędny JSON jest nieakceptowalny i uniemożliwi przetworzenie Twojej pracy.\n\nPrzeanalizuj dokładnie poniższy tekst dokumentu prawnego. To jest treść, na podstawie której masz wygenerować podsumowanie i kluczowe punkty:\n--- POCZĄTEK DOKUMENTU ---\n$DOCUMENT_TEXT\n--- KONIEC DOKUMENTU ---\n\nPAMIĘTAJ: Twoja odpowiedź MUSI być wyłącznie poprawnym obiektem JSON. Nie dodawaj żadnych dodatkowych znaków, komentarzy ani tekstu przed znacznikiem \'OPEN_BRACE\' ani po znaczniku \'CLOSE_BRACE\'. Cała odpowiedź musi być parsowalna jako JSON.\nNa podstawie POWYŻSZEGO dokumentu, wypełnij poniższą strukturę JSON:\nOto struktura JSON, której oczekuję (wypełnij ją treścią):\n__OPEN_BRACE__\n  \"ai_title\": \"Nowy, krótki tytuł dla aktu prawnego po polsku, oddający sedno wprowadzanych zmian (np. maksymalnie 10-12 słów).\",\n  \"summary\": \"2-3 zdania zwięzłego podsumowania treści aktu prawnego po polsku, napisane z perspektywy wpływu na życie codzienne obywateli.\",\n  \"key_points\": [\n    \"Pierwszy krótki punkt po polsku dotyczący najważniejszych wprowadzanych rozwiązań lub zmian.\",\n    \"Drugi krótki punkt po polsku...\"\n  ],\n \"category\": [\"Skategoryzuj dokument domyślnie do jednej kategorii, na podstawie dziedziny, której głównie dotyczy. Wybierz do 3, jeśli dokument porusza również ZNACZĄCE kwestie z innych kategorii. MUSISZ wybrać kategorie WYŁĄCZNIE z następującej listy: Zdrowie, Edukacja, Rodzina, Podatki, Praca, Bezpieczeństwo, Środowisko, Sądy i Prawo, Transport, Świadczenia, Nieruchomości, Media i Kultura, Samorząd, Migracja, Rolnictwo, Inwestycje Publiczne, Informatyzacja, Gospodarka. Jeśli dokument zdecydowanie nie pasuje do żadnej z nich, MUSISZ użyć \'Inne\'. Jeśli użyjesz \'Inne\', powinna to być JEDYNA wybrana kategoria. NIE twórz nowych kategorii. Odpowiedź musi być tablicą ciągów znaków, np. [\\\"Podatki\\\", \\\"Rodzina\\\"].\", \"Druga kategoria (opcjonalnie)\", \"Trzecia kategoria (opcjonalnie)\"]\n__CLOSE_BRACE__';
  }

  @override
  String get techPageFlawlessTitle => 'Czy AI jest nieomylna?';

  @override
  String get techPageFlawlessBody =>
      'Oczywiście, że nie. Jak każda technologia, może popełnić błąd lub coś źle zinterpretować. Dlatego w aplikacji znajdziesz mechanizm pozwalający zgłosić błąd w danych – każde takie zgłoszenie jest dla mnie niezwykle cenne i pomaga mi ulepszać system.\n\nMoim długoterminowym celem jest dalszy rozwój tej technologii, a nawet obsługa własnego, lokalnego modelu bez żadnych ograniczeń, aby jeszcze bardziej zwiększyć precyzję i niezależność aplikacji.';

  @override
  String get techPageOutro =>
      'Dziękuję za Twoje zaufanie. Mam nadzieję, że dzięki tej transparentności korzystanie z Lustra będzie dla Ciebie jeszcze bardziej wartościowe.';

  @override
  String get votingResultsPL1stReadingTitle => 'GŁOSOWANIE O ODRZUCENIE';

  @override
  String get reportErrorDescription =>
      'Opisz krótko, na czym polega błąd lub czego brakuje. Twoje zgłoszenie pomoże nam ulepszyć aplikację.';

  @override
  String get reportErrorHint => 'Wpisz swoją wiadomość...';

  @override
  String get reportErrorValidationEmpty => 'Wiadomość nie może być pusta.';

  @override
  String get reportErrorSuccess =>
      'Dziękujemy! Twoje zgłoszenie zostało wysłane.';

  @override
  String get actionCancel => 'Anuluj';

  @override
  String get actionSend => 'Wyślij';

  @override
  String get mustBeLoggedInToReport =>
      'Musisz być zalogowany, aby zgłosić błąd.';

  @override
  String get reportErrorRateLimitExceeded =>
      'Przekroczono limit zgłoszeń (10 na 24 godziny).';

  @override
  String get supportQuickTitle => 'Szybkie wsparcie';

  @override
  String get supportPaymentsUnavailable => 'Płatności są niedostępne.';

  @override
  String get supportNoProducts => 'Brak dostępnych opcji wsparcia.';

  @override
  String get supportCampaignsTitle => 'Kampanie celowe';

  @override
  String get supportCampaignsDescription =>
      'Wspieraj konkretne cele rozwojowe, np. dodanie nowego parlamentu.';

  @override
  String get supportCampaignsButton => 'Zobacz aktywną kampanię (wkrótce)';

  @override
  String get forceUpdateTitle => 'Wymagana aktualizacja';

  @override
  String get forceUpdateDescription =>
      'Dostępna jest nowa wersja aplikacji. Aby kontynuować, zaktualizuj aplikację do najnowszej wersji.';

  @override
  String get forceUpdateButton => 'Aktualizuj teraz';

  @override
  String get deputies => 'Posłowie';

  @override
  String get sortingLabel => 'Sortuj: ';

  @override
  String get sortByPopularity => 'Popularność';

  @override
  String get sortByAttendance => 'Frekwencja';

  @override
  String partyLabel(Object partyName) {
    return 'Partia: $partyName';
  }

  @override
  String districtLabelUS(Object districtName, String districtNum) {
    return '$districtNum. okręg wyborczy w stanie $districtName';
  }

  @override
  String tenureTermItemUS(Object memberType, String termNumber) {
    return '$termNumber. Kongres ($memberType)';
  }

  @override
  String get birthYearLabel => 'Rok urodzenia:';

  @override
  String get sponsorshipsTab => 'Sponsorowane';

  @override
  String get sponsorshipTypeSponsor => 'Sponsor';

  @override
  String get sponsorshipTypeCosponsor => 'Współsponsor';

  @override
  String get termCurrently => '(obecnie)';

  @override
  String get parliamentaryTenureTitle => 'Staż parlamentarny';

  @override
  String get usRoleRepresentative => 'Reprezentant';

  @override
  String get usRoleSenator => 'Senator';

  @override
  String shareLegislationText(Object deepLink) {
    return 'Zobacz szczegóły tej ustawy w aplikacji Lustra! $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Zobacz i oceń pracę posła w aplikacji Lustra! $deepLink';
  }

  @override
  String get clipboardCopySuccess => 'Link do aplikacji skopiowano do schowka!';

  @override
  String get mandateInactive => 'MANDAT ANULOWANY';

  @override
  String get votingUnavailable => 'Głosowanie niedostępne';

  @override
  String get historicalTerm => 'HISTORYCZNA KADENCJA';

  @override
  String get pollUnavailable => 'Sondaż niedostępny';

  @override
  String get billsLabel => 'Ustawy';

  @override
  String get sponsorshipSublabel => '(Sponsorowane/Współsponsorowane)';

  @override
  String get missingDataWarningShare =>
      'Brakuje dokumentu źródłowego dla tej ustawy. Pomóż nam i złóż oficjalny wniosek email o jego upublicznienie przez naszą aplikację w kilka sekund!';

  @override
  String get missingDataSourceUserMessage =>
      'Brakuje dokumentu źródłowego dla tej ustawy. Pomóż nam składający oficjalny wniosek email o jego upublicznienie i dołącz do grona osób dbających o przejrzystość informacji!';

  @override
  String get missingDataSourceButton => 'Złóż wniosek email o dokument';

  @override
  String get cannotOpenEmailApp =>
      'Nie udało się otworzyć aplikacji e-mail. Sprawdź, czy jest zainstalowana i czy masz w niej skonfigurowane konto pocztowe.';

  @override
  String get sortByFreshness => 'Najświeższe';

  @override
  String get pollPermissionDeniedError =>
      'Głosowanie jest dostępne tylko dla użytkowników przypisanych do tego parlamentu.';

  @override
  String get supportCampaignsButtonActive => 'Wesprzyj kampanię';

  @override
  String get supportCampaignsButtonInactive => 'Kampania nieaktywna';
}

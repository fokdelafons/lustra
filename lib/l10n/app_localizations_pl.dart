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
  String get sectionPopularVotes => 'Głosowania ustawowe';

  @override
  String get sectionUpcoming => 'Zaplanowane debaty';

  @override
  String get sectionLegislationInProcess => 'W procesie';

  @override
  String get civicProjectsSectionTitle => 'Inicjatywy obywatelskie';

  @override
  String get sectionMpProfiles => 'Popularni politycy';

  @override
  String get votingSourceTooltip => 'Zobacz źródło głosowania';

  @override
  String get legislationSponsorLabel => 'Wnioskodawca';

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
  String get citizenPollTitle => 'Wola Obywatelska';

  @override
  String get pollTemporarilyUnavailable =>
      'Sondaż chwilowo niedostępny. Spróbuj ponownie później.';

  @override
  String get errorDisplayingPollBar => 'Błąd wyświetlania wyników sondażu.';

  @override
  String get pollNoForAgainstVotes => 'Brak głosów Za/Przeciw';

  @override
  String get pollNoVotesCast => 'Bądź pierwszą osobą, która zagłosuje.';

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
  String get infoTitle1 => 'Obywatele ponad polityką';

  @override
  String get infoParagraph1 =>
      'Media nie informują – one kurują rzeczywistość. Szacuje się, że 95% legislacji znika w czarnej dziurze ciszy, bo jest zbyt skomplikowana lub nudna by sprzedać reklamy. Lustra omija pośredników. Przetwarzamy biurokratyczny język ustaw na zrozumiałe fakty, dając Ci wgląd w to, co rządzący uchwalają, a nie tylko w to, o czym chcą mówić.';

  @override
  String get infoTitle2 => 'Fakty, nie marketing';

  @override
  String get infoParagraph2 =>
      'Dzisiejsza polityka to w 80% marketing, a w 20% prawo. My oddzielamy jedno od drugiego. Stosujemy proces sterylizacji kontekstu: usuwamy emocjonalny język, partyjną nowomowę i opinie, zostawiając same fakty prawne. To nie jest inny punkt widzenia. To redukcja szumu, która pozwala Ci wyrobić własną opinię na podstawie źródła.';

  @override
  String get infoTitle3 => 'Władza bez pośredników';

  @override
  String get infoParagraph3 =>
      'Wielkie platformy optymalizują treści pod kątem Twojego gniewu, bo to trzyma Cię przy ekranie. My optymalizujemy pod kątem Twojej wiedzy. Hierarchia tematów w aplikacji zależy wyłącznie od głosów społeczności. To Wy decydujecie, co jest ważne dla państwa, odbierając władzę wydawcom i lobbystom.';

  @override
  String get infoTitle4 => 'Architekci Zmian';

  @override
  String get infoParagraph4 =>
      'Demokracja to nie spektakl dla widzów. Wprowadzamy mechanizm, w którym profesjonalnie sformatowane projekty obywatelskie są prezentowane na równi z rządowymi ustawami. Dajemy Ci infrastrukturę, by przejść z pozycji biernego obserwatora do Architekta Zmian – by budować realne poparcie dla spraw, które mają znaczenie. Wznosimy demokrację na nowy poziom.';

  @override
  String get linkHowTechnologyWorks => 'Jak działa technologia?';

  @override
  String get linkTermsAndPrivacy => 'Regulamin i polityka prywatności';

  @override
  String get supportScreenTitle => 'Publiczna Infrastruktura';

  @override
  String get supportParagraph1 =>
      'Lustra to cyfrowa usługa użyteczności publicznej. Ale wolność ma swoją cenę. Odrzuciliśmy kapitał, aby zagwarantować 100% bezstronności, gdyż wierzymy, że to jedyna droga do zmian. Utrzymanie infrastruktury i serwerów zależy wyłącznie od dobrowolnych wpłat. Równowartość 10\$ pozwala sfinansować dostęp do platformy dla nawet kilku tysięcy osób miesięcznie. Twoje wsparcie gwarantuje ciągłość misji i nieprzerwane działanie platformy.';

  @override
  String get buttonSupportFinancially => 'Wesprzyj';

  @override
  String get supportThankYou => 'Dziękujemy. Utrzymujesz system przy życiu.';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Założyciel';

  @override
  String get futureFeaturesScreenTitle => 'Roadmapa Społeczności';

  @override
  String get futureFeaturesHeader => 'Kierunek rozwoju zależy od Ciebie';

  @override
  String get futureFeatureSenate => 'Integracja Senatorów';

  @override
  String get futureFeatureCitizenInitiative => 'Referenda Obywatelskie';

  @override
  String get futureFeaturesDescription =>
      'To nie jest zamknięta lista życzeń. Lustra to infrastruktura należąca do obywateli, dlatego wszyscy mamy wpływ na kierunek rozwoju. Dołącz do społeczności Civic Evolution na Reddit, zgłaszaj pomysły i głosuj nad kolejnymi funkcjami. Razem pracujmy nad kolejnym rozdziałem demokracji!';

  @override
  String get futureFeaturesVoteButton => 'Głosuj nad rozwojem';

  @override
  String get comingSoon => 'Propozycja';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Ustawowe - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Odśwież cache';

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
  String get lustraClubLabel => 'Klub Lustra';

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
  String get mandateStatusActive => 'Mandat: aktywny';

  @override
  String get mandateStatusFulfilled => 'Mandat: wykonany';

  @override
  String get mandateStatusCancelled => 'Mandat: anulowany';

  @override
  String get mandateStatusInactive => 'Mandat: nieaktywny';

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
  String get pollResultNoVotes => 'Bądź pierwszą osobą, która zagłosuje.';

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
  String get votingResultsUSMotionToReferTitle => 'WYNIKI: ODESŁANIE';

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
  String get morePointsInApp => '...pełne informacje są dostępne w Lustra';

  @override
  String get civicRulesAction => 'Stwórz swój projekt';

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
  String get termsAndPrivacyTitle => 'Konstytucja i Prywatność';

  @override
  String get termsOfServiceTab => 'Zasady';

  @override
  String get privacyPolicyTab => 'Prywatność';

  @override
  String get termsOfServiceContent =>
      'ZASADY SPOŁECZNOŚCI LUSTRA\nData: 6 grudnia 2025\n\n1. OPERATOR I MISJA\nLustra to cyfrowa infrastruktura użyteczności publicznej. Operatorem prawnym (Opiekunem) jest FO&WO VENTURES SP. Z O.O. (LLC) z siedzibą we Wrocławiu. Spółka działa jako inkubator: nie wypłaca dywidend, nie ma zewnętrznych inwestorów, a przychody reinwestuje w infrastrukturę.\n\n2. KOD I LICENCJA (SOURCE AVAILABLE)\nKod Lustry jest dobrem wspólnym, ale chronionym przed wyzyskiem.\n• Model: Open Source (AGPLv3).\n• Co wolno: Używać kodu w celach edukacyjnych, badawczych i non-profit.\n• Czego nie wolno: Korporacje nie mogą czerpać zysków z naszej pracy bez zgody społeczności.\n\n3. MAPA DROGOWA WŁADZY\nNasz cel to decentralizacja.\n• Obecnie: Założyciel (Jacek) podejmuje decyzje operacyjne jako Główny Architekt.\n• Wkrótce: Powołanie Rady Społeczności wybieranej przez użytkowników.\n• Cel: Wdrożenie mechanizmów pozwalających społeczności na przejęcie kontroli w przypadku sprzeniewierzenia się misji.\n\n4. PROGRAM PROJEKTÓW OBYWATELSKICH\nTo inkubator prawa.\n• Procedura: Projekty zgłaszasz przez formularz. Przechodzą weryfikację formalną przez Operatora.\n• Licencja CC0: Zgłaszając projekt, przekazujesz go do Domeny Publicznej. Prawo należy do wszystkich.\n• Wolność słowa: Nie oceniamy poglądów. Odrzucamy jedynie projekty łamiące prawo karne.\n• Weryfikacja: Musisz być obywatelem kraju, w którym zgłaszasz projekt.\n\n5. AI I HIERARCHIA ŹRÓDEŁ\n• Rola AI: Sztuczna inteligencja pomaga nawigować w prawie, ale może popełniać błędy.\n• Źródło: Ostatecznym autorytetem jest zawsze oryginalny dokument PDF (linkowany w aplikacji).\n\n6. BEZPIECZEŃSTWO\n• Wiek: Aplikacja dla osób 16+.\n• Zakazy: Zabrania się atakowania infrastruktury oraz automatycznego pobierania danych (scraping) w celach komercyjnych.\n\n7. POSTANOWIENIA KOŃCOWE\nW sprawach nieuregulowanych decyduje prawo polskie.';

  @override
  String get privacyPolicyContent =>
      'POLITYKA PRYWATNOŚCI: MINIMUM DANYCH\nData: 6 grudnia 2025\n\nNie handlujemy Twoją uwagą. Zbieramy tylko to, co niezbędne technicznie.\n\n1. KTO PRZETWARZA DANE\nFO&WO VENTURES SP. Z O.O., Wrocław (NIP: 6343002817). Kontakt: jacek@lustra.dev\n\n2. CO ZBIERAMY I PO CO\n• Konto (E-mail/UID): Niezbędne do logowania (Firebase Auth).\n• Głosy i Sondaże: Twoje głosy są zapisywane, aby budować statystyki. Są powiązane z Twoim kontem w oparciu o nasz prawnie uzasadniony interes (ochrona przed farmami botów). Publicznie prezentowane są WYŁĄCZNIE jako anonimowa suma.\n• Retencja Głosów: Dane o głosowaniu przechowujemy przez okres kadencji parlamentu oraz 5 lat po jej zakończeniu w celach archiwalnych i badawczych. Po tym czasie dane są anonimizowane.\n• Komunikacja (Klub Wsparcia): Jeśli wyrazisz zgodę (checkbox w ustawieniach), będziemy wysyłać Ci informacje o rozwoju projektu. Zgodę możesz wycofać w każdej chwili.\n\n3. CZEGO NIE ROBIMY\n• NIE sprzedajemy danych brokerom.\n• NIE używamy śledzenia reklamowego.\n• NIE profilujemy Cię politycznie dla celów komercyjnych.\n\n4. INFRASTRUKTURA I BEZPIECZEŃSTWO\n• Lokalizacja: Google Cloud Platform, region Europe-West9 (Paryż).\n• Anti-Bot: Używamy Firebase App Check do weryfikacji autentyczności aplikacji.\n• AI: Do modeli językowych wysyłamy wyłącznie publiczne dokumenty rządowe. Twoje dane prywatne NIGDY nie trafiają do AI.\n\n5. DZIECI\nUsługa przeznaczona dla osób 16+. Nie zbieramy świadomie danych dzieci.\n\n6. USUWANIE KONTA\nW ustawieniach znajdziesz przycisk \"Usuń konto\". Jego użycie powoduje natychmiastowe usunięcie Twoich danych identyfikacyjnych z serwerów.\n\n7. TWOJE PRAWA\nMasz prawo dostępu do danych, ich sprostowania, usunięcia oraz sprzeciwu. W razie pytań pisz na: jacek@lustra.dev';

  @override
  String get techTitle => 'Lustra AI Protocol v1.1';

  @override
  String get techIntroTitle =>
      '1. KOMPLETNA METODOLOGIA PRACY (LUSTRA AI PROTOCOL)';

  @override
  String get techIntroBody =>
      'Poniżej przedstawiamy kompletny pipeline agentów AI używanych do generowania streszczeń tekstów prawnych i wykrywania w nich halucynacji. Celem było rozbrojenie „czarnej dziury legislacyjnej” przy jednoczesnym zbliżeniu się do jak największego obiektywizmu. Tutaj należy jednak podkreślić, że nie wierzymy w całkowitą neutralność. Każda kompresja danych (streszczenie) jest formą wyboru. Zamiast udawać „monopol na prawdę” mediów, przyjęliśmy jeden jawny bias – „perspektywa obywatela” w ramach context sterilization. Modele są instruowane, by ignorować polityczny teatr, a skupiać się na portfelu, wolnościach i obowiązkach. To inżynierska decyzja projektowa, nie polityczna.';

  @override
  String get techDiagramTitle =>
      '2. SCHEMAT PRZEPŁYWU GENERALIZER-JUDGE-SURGEON';

  @override
  String get techDiagramIntro =>
      'System działa w pętli weryfikacyjnej. Nie ufamy modelom generatywnym – ufamy procesom sprawdzającym i podejściu iteracyjnemu w rozbudowywaniu systemów.';

  @override
  String get techDiagramOutro =>
      'W przyszłości planujemy rozbudować system o dodatkowe role, takie jak dziennikarz śledczy czy analizator ryzyka prawnego.';

  @override
  String get techPromptsTitle => '3. KOMPLETNE INSTRUKCJE AGENTÓW';

  @override
  String get techPromptsIntro =>
      'Poniżej znajdują się kompletne prompty, które otrzymują modele, wraz z komentarzami objaśniającymi dla czytelnika. Odpowiedzi są zwracane od razu w 8 językach dla pełnej lokalizacji Lustry, więc pominęliśmy całą strukturę odpowiedzi JSON dla czytelności.';

  @override
  String get techGeneralizerTitle => 'A) Generalizer';

  @override
  String get techGeneralizerBody =>
      'Model: Gemini Flash (domyślnie) / Pro (dla <20k tokenów)';

  @override
  String get techGeneralizerCode =>
      '// USTAWIENIE MODELU\n// Definicja roli jest krytyczna. \"[country]\" to zmienna, która stabilizuje model.\n// Perspektywa obywatela Ukrainy (kraj w stanie wojny) jest dla modeli inna, niż perspektywa obywatela Belgii (który może na przykład zwracać większą uwagę do biurokracji).\n// To ustawia cały kontekst interpretacji \"ważności\" zapisu.\nJesteś ekspertem od prawa [country], [...]\n\n// CORE METHODOLOGY\n// To nie jest \"miękka prośba\". To twarda instrukcja filtrowania szumu.\n// Model ma ignorować politykę, a szukać wpływu na portfel i życie.\n[...] który ma za zadanie analizować dokumenty ustaw, uchwał oraz innych dokumentów legislacyjnych, a następnie przygotowywać z nich informacje w przystępny sposób dla obywateli. Twoim celem jest przedstawienie informacji tak, aby obywatele mogli sami ocenić wpływ legislacji na ich życie, nawet bez posiadania specjalistycznej wiedzy legislacyjnej. Skup się na faktach i obiektywnych skutkach wprowadzanych zmian, unikając wartościowania i osobistych opinii. Wszelki żargon prawny jest zabroniony. Prezentuj informacje w jasny, zwięzły i angażujący sposób, tak aby były zrozumiałe dla osoby bez wykształcenia prawniczego. Unikaj długich, złożonych zdań. Zamiast pisać \"projekt ma na celu nowelizację kodeksu podatkowego...\", napisz \"Zmiany w podatkach: nowe ulgi i obowiązki dla...\". Kontynuuj swoją pracę, dopóki nie rozwiążesz swojego zadania. Jeśli nie masz pewności co do generowanej treści, przeanalizuj dokument ponownie – nie zgaduj. Rozplanuj dobrze swoje zadanie przed przystąpieniem do niego. W podsumowaniu i kluczowych punktach, jeśli to możliwe i uzasadnione, podkreśl, jakie konkretne korzyści lub skutki (pozytywne lub negatywne) wprowadza ustawa dla życia codziennego obywateli, ich praw i obowiązków, finansów osobistych, bezpieczeństwa i innych ważnych kwestii (np. kategorycznych zakazów i nakazów czy najważniejszych konkretnych alokacji finansowych i terytorialnych).\n// TECHNICZNY RYGOR JSON\n// Kontener backendowy jest bezlitosny. Nie przyjmie \"gadaniny\".\n// Musi być czysty JSON. Jeden błąd w przecinku = fail i odrzucenie całości.\nZanim zwrócisz odpowiedź, dokładnie zweryfikuj, czy cała struktura JSON jest w 100% poprawna, włącznie ze wszystkimi przecinkami, nawiasami klamrowymi, kwadratowymi oraz cudzysłowami. Błędny JSON jest nieakceptowalny i uniemożliwi przetworzenie Twojej pracy.\nPrzeanalizuj dokładnie poniższy tekst dokumentu prawnego.\nTo jest treść, na podstawie której masz wygenerować podsumowanie i kluczowe punkty:\n--- POCZĄTEK DOKUMENTU ---\n[DOCUMENT_TEXT]\n--- KONIEC DOKUMENTU --\n\n// STRUKTURA OUTPUTU (dla 8 języków)\n// Musi być wypełnione idealnie. Każdy klucz jest walidowany.\n// Jeśli model pominie np. \"fr_summary\" -> całość idzie do kosza.\nPAMIĘTAJ: Twoja odpowiedź MUSI być wyłącznie poprawnym obiektem JSON. Nie dodawaj żadnych dodatkowych znaków, komentarzy ani tekstu przed znacznikiem \'OPEN_BRACE\' ani po znaczniku \'CLOSE_BRACE\'. Cała odpowiedź musi być parsowalna jako JSON.\nNa podstawie POWYŻSZEGO dokumentu, wypełnij poniższą strukturę JSON: (...)';

  @override
  String get techJudgeTitle => 'B) Judge';

  @override
  String get techJudgeBody => 'Model: Flash Lite';

  @override
  String get techJudgeCode =>
      '//USTAWIENIE MODELU\n// To prosty model heurystyczny, więc jego rola też musi być prosta. Nie ma \"rozumieć\" ustawy. Ma tylko porównać dwa zbiory danych. JEDNO ZADANIE!\nROLE: Fact Checker.\nZADANIE: Porównaj SOURCE (oryginał) i SUMMARY (streszczenie przygotowane przez inne AI).\nTwoim celem jest wykrycie \"ZMYŚLONYCH KONKRETÓW\" (Fabricated Entities) w SUMMARY.\nSOURCE:\n[SOURCE_TEXT]\nSUMMARY TO EVALUATE:\nTitle: [AI_TITLE]\nSummary: [AI_SUMMARY]\nKey Points: [AI_KEY_POINTS]\n// METODOLOGIA OCENY\n// Musieliśmy zdefiniować sztywne reguły, bo Flash Lite gubił się przy abstrakcji,więc dostał listę checkboxów.\n// Konkretne instrukcje redukują szum decyzyjny modelu.\nZASADY OCENY:\n1. Sprawdź wszystkie LICZBY, DATY i KWOTY w SUMMARY. Jeśli którejś brakuje w SOURCE -> is_valid: false.\n2. Sprawdź wszystkie NAZWISKA, ORGANIZACJE i MIEJSCA w SUMMARY. Jeśli którejś brakuje w SOURCE -> is_valid: false.\n3. Sprawdź wszystkie konkretne DZIAŁANIA PRAWNE . Jeśli tego mechanizmu nie ma w SOURCE -> is_valid: false.\n// WYJĄTEK DLA ABSTRAKCJI\n// To kluczowe. Często abstrakcyjne pojęcia (np. \"wzrost biurokracji\") dawały false positives.\n// Musieliśmy je wykluczyć z oceny \"fabricated entity\", bo Sędzia odrzucał poprawne wnioski logiczne.\nWAŻNE: Abstrakcyjne pojęcia (np. \"transparentność\", \"zaufanie\") są dozwolone jako wnioski.\n\n// STRUKTURA OUTPUTU I wymagania formatowania dla ustrukrukturyzowania odpowiedzi.\nOUTPUT (JSON):\n(\n\"is_valid\": true/false,\n\"issue\": \"fabricated_entity\" / \"contradiction\" / \"none\"\n)\nWYMAGANIA FORMATOWANIA:\n1. Odpowiedz WYŁĄCZNIE surowym obiektem JSON.\n2. NIE używaj bloków kodu Markdown.\n3. NIE dodawaj żadnych wstępów ani wyjaśnień przed ani po JSONie.\n4. JSON musi być poprawny i gotowy do parsowania.';

  @override
  String get techSurgeonTitle => 'C) Surgeon';

  @override
  String get techSurgeonBody => 'Model: Gemini Pro';

  @override
  String get techSurgeonCode =>
      '// USTAWIENIE MODELU\n// Chirurg nie jest od pisania. Jest od wycinania raka (halucynacji).\n// Musi zachować spójność z \"Citizen Bias\" narzuconym przez Generalizera.\n// Z tego względu trzeba przejść na agresywny grounding.\nJesteś LEGISLATIVE SURGEON.\nTwoim zadaniem jest audyt i naprawa streszczenia (JSON) pod kątem zgodności z tekstem źródłowym (SOURCE).\n// MEGA WAŻNE. On nie może dodawać informacji. Gdyby to robił – zwiększamy ryzyko halucynacji, a on nie ma już nad sobą sędziego. Lepsze niekompletne streszczenia, niż nieprawdziwe.\nZASADA FUNDAMENTALNA: \"NO NEW INFORMATION\" (żadnych nowych informacji).\nStreszczenie może jedynie transformować informacje zawarte w SOURCE (skracać, tłumaczyć, sumować). Nie może generować nowych informacji, których nie ma w SOURCE.\n// PROCEDURA WERYFIKACJI (WORKFLOW)\n// Wymuszamy na modelu proces myślowy \"Sentence-by-Sentence\".\nPROCEDURA WERYFIKACJI (wykonaj dla każdego zdania w JSON):\nZadaj sobie pytanie: \"Czy potrafię wskazać w SOURCE konkretny fragment, który potwierdza to stwierdzenie?\"\nJEŚLI ODPOWIEDŹ BRZMI \"TAK\":\nInformacja jest potwierdzona cytatem, synonimem lub wynikiem matematycznym z danych w tekście.\nDECYZJA: Zostaw bez zmian.\nJEŚLI ODPOWIEDŹ BRZMI \"NIE\":\nInformacji nie ma w tekście (jest to halucynacja, zewnętrzna wiedza modelu, nadinterpretacja lub niepotrzebna ekstrapolacja).\nDECYZJA: Usuń tę informację lub zmień ją tak, aby miała pokrycie w tekście.\nJEŚLI ODPOWIEDŹ BRZMI \"TO ZALEŻY\":\nTekst jest niejasny, a streszczenie \"zgaduje\" (np. podając konkretny przykład dla ogólnego terminu).\nDECYZJA: Bądź bezpieczny. Usuń zgadywanie. Użyj terminologii z tekstu.\n// KATEGORIE RYZYKA\n// Oszacowane na podstawie wcześniejszych błędów Generalizera.\n// Dajemy mu \"mapę drogową\", gdzie najczęściej leżą miny. \nKATEGORIE RYZYKA (szczególna uwaga):\nDaty (start obowiązywania vs start finansowania).\nLiczby (konkretne kwoty muszą wynikać z tekstu).\nPodmioty (kto co robi).\nZakres (co ustawa obejmuje, a czego nie).\n\nINPUT:\n--- SOURCE_TEXT START ---\n[SOURCE_TEXT]\n--- SOURCE_TEXT END ---\n\n--- FLAGGED_JSON START ---\n[FLAGGED_JSON]\n--- FLAGGED_JSON END ---\n\nOUTPUT:\nWyłącznie naprawiony obiekt JSON zgodny ze strukturą: (...)';

  @override
  String get techConclusionsTitle => '4.WNIOSKI EMPIRYCZNE';

  @override
  String get techConclusionsIntro =>
      'W miarę rozwijania się systemu konieczne było podejmowanie decyzji opartych na obserwacjach, a nie parametrach modeli. Wyszły z tego dość ciekawe spostrzeżenia.';

  @override
  String get techConclusionATitle => 'A) Dlaczego używać „głupszego” modelu?';

  @override
  String get techConclusionABody =>
      'Początkowe testy na polskim prawie, które audytował Claude i ChatGPT, wykazały, że najlepsze streszczenia generował Gemini Flash. Zaraz za nim był model Pro, który czasami dostawał nieco gorszą ocenę ze względu na wysnuwanie daleko idących wniosków lub pomijanie niektórych drobiazgów. Paradoksalnie, „myślenie” modelu przyczyniało się do odrobinę gorszej jakości treści. Wniosek? Kiedy Pro dostaje krótki i prosty tekst, zaczyna filozofować. W efekcie potrafi pomijać kluczowe fakty, które uważa za zbyt oczywiste. Dużo częściej też gubi strukturę JSON (zapomina domknąć klamrę). Przy prostych streszczeniach wybór jest oczywisty.';

  @override
  String get techConclusionBTitle => 'B) W takim razie po co Pro?';

  @override
  String get techConclusionBBody =>
      'Schody zaczynają się w przypadku dłuższych dokumentów. Tutaj zdecydowanie przoduje model Pro, a słabsze modele mają dużo większą tendencję do halucynacji. Te obserwacje potwierdzają także badania naukowe (Lost in the Middle). Wymusza to konieczność stosowania od razu modelu Pro przy dłuższych dokumentach.';

  @override
  String get techConclusionCTitle => 'C) Skuteczność';

  @override
  String get techConclusionCBody =>
      'Bazując na empirycznych doświadczeniach (setki prób, różne parlamenty), anti-hallucination rate to >99%. Aby oszacować współczynnik z większą precyzją, wymagane byłyby dodatkowe nakłady pieniężne (tysiące lub dziesiątki tysięcy testów z najsilniejszymi modelami konkurencyjnych firm AI). Można to zatem traktować z przymrużeniem oka. Większość halucynacji to drobne błędy, np. użycie słowa „człowiek” zamiast „poseł” w streszczeniu. Głównym problemem systemu nie są więc one, ale zbyt duże uogólnianie. Czasami Generalizer stworzy poprawne streszczenie, ale pominie krytyczny punkt, który jest bardzo istotny ze względu na debatę publiczną. Jest to jednak kompromis, jaki w tym momencie ponosi system skupiony na całkowitej eliminacji halucynacji. Nuda jest bezpieczniejsza od kłamstwa.';

  @override
  String get techFooterDate => 'Data aktualizacji Q1 2026';

  @override
  String get techFooterLicense => 'Open Source (AGPLv3)';

  @override
  String get techGraphSource => 'Legislation Source';

  @override
  String get techGraphDecisionLength => 'Długość > 20k tokenów?';

  @override
  String get techGraphNo => 'NIE';

  @override
  String get techGraphYes => 'TAK';

  @override
  String get techGraphFlash => 'Flash (System 1)';

  @override
  String get techGraphPro => 'Pro (System 2)';

  @override
  String get techGraphJudge => 'The Judge (Flash Lite)';

  @override
  String get techGraphDecisionPass => 'Wynik: Pass?';

  @override
  String get techGraphPublishFirestore => 'HTML Ready';

  @override
  String get techGraphNoRetry => 'NIE (Retry)';

  @override
  String get techGraphRepairLoop => 'Pętla naprawcza';

  @override
  String get techGraphRetryFlash => '< 2 błędy: Flash';

  @override
  String get techGraphRetrySurgeon => '> 2 błędy: Surgeon';

  @override
  String get techGraphSurgeon => 'The Surgeon (Pro)';

  @override
  String get techGraphHtmlReady => 'HTML Ready';

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
    return 'Głosowanie to wybór. Ty też możesz go dokonać tutaj: $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Profil i historia głosowań: $deepLink';
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

  @override
  String get authErrorAppleFailed =>
      'Logowanie przez Apple nie powiodło się. Spróbuj ponownie.';

  @override
  String get continueWithApple => 'Kontynuuj z Apple';

  @override
  String get homeSearchHint => 'Wpisz frazę...';

  @override
  String get homeSearchButtonDeputies => 'Posłowie';

  @override
  String get homeSearchButtonLegislations => 'Ustawy';

  @override
  String get actionSeeAll => 'Zobacz wszystkie';

  @override
  String get notificationsEnabledForOtherParliament =>
      'Aktywne dla innego parlamentu';

  @override
  String get votingResultsUSMotionToTableTitle =>
      'WYNIKI: WNIOSEK O ODRZUCENIE';

  @override
  String get crowdfundingLabel =>
      'Wesprzyj Lustra w pozostaniu niezależnym źródłem:';

  @override
  String get hashtagLaw => 'Prawo';

  @override
  String get hashtagPolitician => 'Polityk';

  @override
  String get statusIntroduced => 'Wprowadzono';

  @override
  String get statusPassedHouse => 'Przegłosowano w Izbie';

  @override
  String get statusPassedSenate => 'Przegłosowano w Senacie';

  @override
  String get statusBecameLaw => 'Stała się prawem';

  @override
  String get statusVetoed => 'Zawetowano';

  @override
  String get statusFailed => 'Odrzucono';

  @override
  String get statusPlacedOnCalendar => 'Umieszczono w kalendarzu';

  @override
  String get actionBack => 'Cofnij';

  @override
  String get actionViewSourceJson => 'Logi pracy AI dla tego dokumentu';

  @override
  String get manualEmailDialogTitle => 'Wyślij wiadomość ręcznie';

  @override
  String get manualEmailDialogDescription =>
      'Nie wykryto klienta poczty. Skopiuj poniższe dane i wyślij je samodzielnie.';

  @override
  String get labelRecipient => 'Odbiorca';

  @override
  String get labelSubject => 'Temat';

  @override
  String get labelBody => 'Treść wiadomości';

  @override
  String get actionCopy => 'Kopiuj';

  @override
  String get copiedToClipboard => 'Skopiowano do schowka';

  @override
  String get webBannerDownloadMessage =>
      'Aby w pełni korzystać z możliwości, pobierz aplikację!';

  @override
  String get webBannerDownloadButton => 'Pobierz';

  @override
  String get supportStripeButton => 'Wesprzyj (Stripe)';

  @override
  String get supportFounderMessage =>
      'Za tym projektem nie stoi wielka korporacja, tylko ja i mój laptop. Zbudowałem to, bo wierzę, że taka technologia musi istnieć i musi pozostać w 100% niezależna od kapitału, który zawsze dyktuje narrację. To mój prezent dla świata.';

  @override
  String get civicProjectTitle => 'Projekt Obywatelski';

  @override
  String get drafterAuthRequired =>
      'Wymagane logowanie. Zaloguj się najpierw do aplikacji Lustra.';

  @override
  String get drafterLaunchError => 'Nie udało się uruchomić bramki Draftera:';

  @override
  String get drafterButtonTitle =>
      'UŻYJ LUSTRA DRAFTER, ABY STWORZYĆ USTAWĘ Z POMYSŁU W 5 MINUT';

  @override
  String get submitCivicProjectButton => 'Stwórz swój projekt';

  @override
  String get civicThresholdCandidate => 'Do poprawek.';

  @override
  String get statusInitiative => 'Inicjatywa';

  @override
  String get civicTitle => 'Projekty Obywatelskie';

  @override
  String get civicIncubatorTitle => 'Inkubator Projektów Obywatelskich';

  @override
  String get civicSubtitle => 'Wspólnie szkicujemy przyszłość demokracji.';

  @override
  String get civicSection1Title => '1. Zasady Programu i Ład';

  @override
  String get civicSection1Intro =>
      'Lustra udostępnia obywatelom infrastrukturę legislacyjną. Traktujemy Twoje pomysły z taką samą powagą jak projekty rządowe. Aby zapewnić jakość, obowiązują ścisłe zasady:';

  @override
  String get civicProcessTitle => 'Proces';

  @override
  String get civicRuleSubmissionTitle => 'Zgłoszenie:';

  @override
  String get civicRuleSubmissionText =>
      'Przesyłasz projekt mailem lub przez formularz.';

  @override
  String get civicRuleReviewTitle => 'Przegląd Formalny (Człowiek):';

  @override
  String get civicRuleReviewText =>
      'Sprawdzamy zgodność ze standardem LDS-1. Rygorystycznie odrzucamy mowę nienawiści, spam, duplikaty i treści nielegislacyjne.';

  @override
  String get civicRuleAiTitle => 'Sterylizacja AI:';

  @override
  String get civicRuleAiText =>
      'Zatwierdzone projekty są przetwarzane przez AI w celu usunięcia języka emocjonalnego i wyodrębnienia faktów.';

  @override
  String get civicRulePublicationTitle => 'Publikacja:';

  @override
  String get civicRulePublicationText =>
      'Projekt otrzymuje w aplikacji „Obywatelską Kartę Ustawy”, wizualnie równą legislacji rządowej.';

  @override
  String get civicWarningTitle => 'Integralność Projektu';

  @override
  String get civicWarningText =>
      'Główny tekst projektu jest niezmienny. Możesz dodawać wyłącznie poprawki (amendments), które doprecyzowują lub naprawiają tekst bez zmiany jego pierwotnej idei. Wszystkie zmiany są jawne i dodawane jako aneksy, aby zachować zaufanie głosujących.';

  @override
  String get civicPoliciesTitle => 'Polityki Krytyczne';

  @override
  String get civicPolicyPublicDomainTitle => 'Domena Publiczna (CC0):';

  @override
  String get civicPolicyPublicDomainText =>
      'Zgłaszając projekt, zrzekasz się praw autorskich. Prawo należy do wszystkich.';

  @override
  String get civicPolicyAstroturfingTitle => 'Anty-Astroturfing:';

  @override
  String get civicPolicyAstroturfingText =>
      'Musisz zadeklarować, czy reprezentujesz organizację. Ukryty lobbing skutkuje stałym banem.';

  @override
  String get civicPolicyAdPersonamTitle => 'Ad Personam:';

  @override
  String get civicPolicyAdPersonamText =>
      'Projekty wymierzone w konkretne osoby (zniesławienie) są natychmiast odrzucane.';

  @override
  String get civicPolicyTrashTitle => 'Brak Kosza na Śmieci:';

  @override
  String get civicPolicyTrashText =>
      'Lustra to nie forum. Projekty niskiej jakości, duplikaty i manifesty są odrzucane na bramce.';

  @override
  String get civicSection2Title => '2. Standard Legislacyjny Lustra (LDS-1)';

  @override
  String get civicSection2Intro =>
      'Twój projekt musi zachować tę strukturę. Jeśli wygląda jak post na blogu, zostanie odrzucony.';

  @override
  String get civicStructureTitle => 'Wymagana Struktura:';

  @override
  String get civicStructureTitleItem => 'Tytuł:';

  @override
  String get civicStructureTitleText => 'Opisowy i neutralny.';

  @override
  String get civicStructureArticlesItem => 'Artykuły:';

  @override
  String get civicStructureArticlesText =>
      'Tekst podzielony na numerowane jednostki (Art. 1, Art. 2...) zawierające konkretne mechanizmy (zakazy, nakazy).';

  @override
  String get civicStructureExposeItem => 'Uzasadnienie (Exposé):';

  @override
  String get civicStructureExposeText => 'Obowiązkowa sekcja wyjaśniająca:';

  @override
  String get civicExposePoint1 => '• (1) Diagnoza problemu.';

  @override
  String get civicExposePoint2 => '• (2) Cel regulacji.';

  @override
  String get civicExposePoint3 => '• (3) Oczekiwany wpływ społeczny.';

  @override
  String get civicSection3Title => '3. Wskaźnik Gotowości Lustra';

  @override
  String get civicSection3Intro =>
      'Nie oceniamy poglądów politycznych. Oceniamy jakość konstrukcji. Nasze AI analizuje każdy projekt w skali 0-100:';

  @override
  String get civicScoreStructureTitle => 'Struktura (30 pkt):';

  @override
  String get civicScoreStructureText =>
      'Poprawne formatowanie prawne i precyzyjny język.';

  @override
  String get civicScoreExposeTitle => 'Kompletność Uzasadnienia (30 pkt):';

  @override
  String get civicScoreExposeText =>
      'Jasność definicji problemu i rozwiązania.';

  @override
  String get civicScoreLogicTitle => 'Logika Wewnętrzna (20 pkt):';

  @override
  String get civicScoreLogicText => 'Brak sprzeczności.';

  @override
  String get civicScoreImpactTitle => 'Analiza Wpływu (20 pkt):';

  @override
  String get civicScoreImpactText =>
      'Wykonalność i identyfikacja grup dotkniętych regulacją.';

  @override
  String get civicThresholdsTitle => 'Progi:';

  @override
  String get civicThresholdRejected => 'Odrzucony / Zwrócony.';

  @override
  String get civicThresholdReady => 'Publikacja priorytetowa.';

  @override
  String get civicSection4Title => '4. Przybornik Twórcy (Kopiuj-Wklej)';

  @override
  String get civicSection4Intro =>
      'Użyj tego szablonu, aby upewnić się, że Twój projekt spełnia standard LDS-1.';

  @override
  String get civicTemplateCode =>
      'TYTUŁ: [Wpisz tutaj opisowy tytuł]\n\nPREAMBUŁA: [Opcjonalnie: Uznając, że...]\n\nROZDZIAŁ I: PRZEPISY OGÓLNE\nArt. 1. Celem niniejszej ustawy jest [Wpisz cel].\nArt. 2. Ustawa dotyczy [Wpisz zakres].\n\nROZDZIAŁ II: [GŁÓWNY MECHANIZM / ZAKAZY]\nArt. 3. \n1. Zabrania się [Działanie].\n2. Podmioty są zobowiązane do [Działanie].\n\nROZDZIAŁ III: SANKCJE I PRZEPISY KOŃCOWE\nArt. X. Naruszenie Art. 3 podlega karze [Sankcja].\nArt. Y. Ustawa wchodzi w życie z dniem [Data].\n\n---\nUZASADNIENIE (EXPOSÉ)\n\n1. PROBLEM\n[Opisz obecną sytuację i dlaczego nie działa.]\n\n2. CEL\n[Wyjaśnij, co i jak naprawia ta ustawa.]\n\n3. OCZEKIWANY WPŁYW\n[Opisz skutki społeczne, gospodarcze lub prawne.]';

  @override
  String get civicSubmitButton => 'WYŚLIJ PROJEKT (EMAIL)';

  @override
  String get civicFooterCopyright =>
      '© 2025 Inicjatywa Lustra.\nInfrastruktura Ery Obywatelskiej.';

  @override
  String civicEmailSubject(Object parliamentName) {
    return '[Zgłoszenie LDS-1] Tytuł Projektu - $parliamentName';
  }

  @override
  String get civicEmailBodyPlaceholder =>
      '[WKLEJ SWÓJ SZABLON TUTAJ]\n\nAutor / Organizacja:\nDane kontaktowe:\n';

  @override
  String get civicEmailDialogTitle => 'Nie znaleziono klienta poczty';

  @override
  String get civicEmailDialogIntro =>
      'Skopiuj poniższe dane i wyślij je ręcznie:';

  @override
  String get civicEmailDialogRecipient => 'Odbiorca';

  @override
  String get civicEmailDialogSubject => 'Temat';

  @override
  String get civicEmailDialogBody => 'Treść';

  @override
  String get civicCopiedToClipboard => 'Skopiowano do schowka';

  @override
  String get civicTemplateCopied => 'Szablon skopiowany!';

  @override
  String get supportMegaTitle => 'Własność Obywatelska';

  @override
  String get verificationRequiredTitle => 'Weryfikacja wymagana';

  @override
  String get verificationRequiredContent =>
      'Aby Twój głos został policzony w rankingu, musimy potwierdzić, że jesteś człowiekiem.\n\nSprawdź swoją skrzynkę mailową (również folder SPAM).';

  @override
  String get verificationResendLink => 'Wyślij link ponownie';

  @override
  String get verificationLinkSentSuccess => 'Link wysłany ponownie!';

  @override
  String get verificationAlreadyConfirmed => 'Już potwierdziłem';

  @override
  String get verificationSuccessVotingUnlocked =>
      'Dziękujemy! Możesz głosować.';

  @override
  String get verificationStillNotVerified =>
      'Jeszcze nie widzę potwierdzenia. Spróbuj za chwilę.';

  @override
  String get cancel => 'Anuluj';

  @override
  String get pollVoteSignificance => 'Twój głos to dopiero początek.';

  @override
  String get pollShareImpact =>
      'Algorytmy często nas wyciszają. Twoje jedno udostępnienie dociera średnio do 50-300 osób. Pomóż nam przebić bańkę social mediów.';

  @override
  String get pollShareAction => 'Udostępnij i wzmocnij głos obywateli';

  @override
  String get listRefreshed => 'Lista odświeżona!';

  @override
  String get errorNoDataReturned => 'Brak danych';

  @override
  String get errorMustBeLoggedInToSubscribe =>
      'Musisz być zalogowany, aby subskrybować.';

  @override
  String get subscribedToList => 'Zasubskrybowano listę!';

  @override
  String get unsubscribedFromList => 'Anulowano subskrypcję listy.';

  @override
  String get errorListRemovedByOwner => 'Lista usunięta przez właściciela...';

  @override
  String get errorFailedToUpdateSubscription =>
      'Nie udało się zaktualizować subskrypcji.';

  @override
  String get notificationSentCooldownActive =>
      'Powiadomienie wysłane do subskrybentów!...';

  @override
  String get errorCooldownActiveNotification =>
      'Blokada antyspamowa. Możesz wysłać...';

  @override
  String get errorFailedToSendNotification =>
      'Nie udało się wysłać powiadomienia.';

  @override
  String get nameYourCuratorList => 'Nazwij swoją listę autorską';

  @override
  String get hintCuratorListExample => 'np. Moja polityka społeczna';

  @override
  String listCreatedSuccess(String text) {
    return 'Lista \'$text\' utworzona!';
  }

  @override
  String get errorFailedToCreateList => 'Nie udało się utworzyć listy.';

  @override
  String get actionCreate => 'Utwórz';

  @override
  String get unnamedList => 'Lista bez nazwy';

  @override
  String get tooltipEditList => 'Edytuj listę';

  @override
  String get addDescriptionHint => 'Dodaj opis, aby poinformować innych...';

  @override
  String subscribersCount(int subs) {
    return '$subs subskrybentów';
  }

  @override
  String get actionShareList => 'Udostępnij listę';

  @override
  String get actionSupportCreator => 'Wesprzyj twórcę';

  @override
  String availableInHours(int hoursLeft) {
    return 'Dostępne za ${hoursLeft}h';
  }

  @override
  String get actionNotifySubscribers => 'Powiadom subskrybentów';

  @override
  String get actionSubscribed => 'Zasubskrybowano';

  @override
  String get actionSubscribe => 'Subskrybuj';

  @override
  String get tooltipReportList => 'Zgłoś listę';

  @override
  String get tooltipDeleteList => 'Usuń listę';

  @override
  String get draftYourCivicProject => 'Stwórz własny projekt obywatelski';

  @override
  String get draftCivicProjectDescription =>
      'Przekształć swoje pomysły w realne projekty ustaw i zdobywaj dla nich poparcie. Lustra jest gotowa na Twoją politykę.';

  @override
  String get createYourOwnList => 'Utwórz własną listę';

  @override
  String get createYourOwnListDescription =>
      'Zostań kuratorem. Wybieraj ważne projekty ustaw, zapraszaj obserwujących i wysyłaj na ich urządzenia powiadomienia, aby informować ich na bieżąco o zmianach na Twojej liście legislacji lub projektach obywatelskich.';

  @override
  String get editListDetails => 'Edytuj szczegóły';

  @override
  String get listNameLabel => 'Nazwa listy';

  @override
  String get descriptionOptionalLabel => 'Opis (opcjonalnie)';

  @override
  String get supportCreatorOptionalLabel => 'Wesprzyj twórcę (opcjonalnie)';

  @override
  String providerUsernameLabel(String provider) {
    return 'Nazwa użytkownika $provider';
  }

  @override
  String get listUpdatedSuccess => 'Lista zaktualizowana!';

  @override
  String get errorFailedToUpdate => 'Nie udało się zaktualizować.';

  @override
  String get actionSave => 'Zapisz';

  @override
  String get deleteListDialogTitle => 'Usunąć listę?';

  @override
  String get deleteListDialogBody => 'Tej operacji nie można cofnąć...';

  @override
  String get listDeletedSuccess => 'Lista usunięta.';

  @override
  String get errorFailedToDelete => 'Nie udało się usunąć.';

  @override
  String get actionDelete => 'Usuń';

  @override
  String get syncingCuratedFeed => 'SYNCHRONIZACJA LISTY AUTORSKIEJ...';

  @override
  String get actionTryAgain => 'Spróbuj ponownie';

  @override
  String get tooltipSetAsListCover => 'Ustaw jako okładkę listy';

  @override
  String get coverUpdatedSuccess => 'Okładka zaktualizowana!';

  @override
  String get errorUpdatingCover => 'Błąd aktualizacji okładki.';

  @override
  String get loaderLoadingProfile => 'POBIERANIE PROFILU...';

  @override
  String get loaderRetrievingVoteLogs => 'POBIERANIE REJESTRU GŁOSOWAŃ...';

  @override
  String get loaderLoadingRecentVotes => 'POBIERANIE OSTATNICH GŁOSOWAŃ...';

  @override
  String get loaderFetchingData => 'POBIERANIE DANYCH...';

  @override
  String get loaderLoadingTrackedBills => 'POBIERANIE OBSERWOWANYCH USTAW...';

  @override
  String get emptyTrackedBills => 'Nie obserwujesz jeszcze żadnych ustaw.';

  @override
  String get notificationsMobileOnly =>
      'Powiadomienia są dostępne tylko w aplikacji mobilnej.';

  @override
  String get titleYourTrackedBills => 'Obserwowane ustawy';

  @override
  String get buttonSeeAllTracked => 'Zobacz wszystkie obserwowane';

  @override
  String get titleNameYourList => 'Nazwij swoją listę';

  @override
  String get hintEgMySocialPolicies => 'np. Moje ustawy gospodarcze';

  @override
  String snackbarListCreated(String text) {
    return 'Lista \'$text\' utworzona!';
  }

  @override
  String get snackbarFailedToCreateList => 'Nie udało się utworzyć listy.';

  @override
  String get buttonCreate => 'Utwórz';

  @override
  String get titleRenameYourList => 'Zmień nazwę listy';

  @override
  String get snackbarListRenamed => 'Nazwa zmieniona!';

  @override
  String get snackbarFailedToRenameList => 'Nie udało się zmienić nazwy.';

  @override
  String get buttonSave => 'Zapisz';

  @override
  String get titleYourLists => 'Twoje listy';

  @override
  String get emptyNoListsYet => 'Nie masz jeszcze żadnych list.';

  @override
  String get tooltipRename => 'Zmień nazwę';

  @override
  String get snackbarErrorUpdatingList => 'Błąd aktualizacji listy.';

  @override
  String get tooltipShareList => 'Udostępnij listę';

  @override
  String get buttonCreateNewList => 'Utwórz nową listę';

  @override
  String get errorLimitOf3ListsReached => 'Osiągnięto limit 3 list.';

  @override
  String get snackbarFailedToDelete => 'Nie udało się usunąć.';

  @override
  String get loaderFetchingMirrorParliamentData =>
      'POBIERANIE DANYCH LUSTRZANEGO PARLAMENTU...';

  @override
  String get loaderSecuringSafeChannel => 'SZYFROWANIE POŁĄCZENIA...';

  @override
  String get snackbarAddedToList => 'Dodano do listy.';

  @override
  String get snackbarRemovedFromList => 'Usunięto z listy.';

  @override
  String get loaderLoadingData => 'POBIERANIE DANYCH...';

  @override
  String get buttonAddToList => 'Dodaj do listy';

  @override
  String get previousStatusLabel => 'Poprzednio:';

  @override
  String get statusLabel => 'Status:';

  @override
  String get loaderEstablishingConnection => 'NAWIĄZYWANIE POŁĄCZENIA...';

  @override
  String get loaderFetchingInitiatives => 'POBIERANIE INICJATYW...';

  @override
  String get loaderLoadingMoreInitiatives =>
      'POBIERANIE KOLEJNYCH INICJATYW...';

  @override
  String get loaderLoadingMore => 'POBIERANIE KOLEJNYCH...';

  @override
  String get errorMustBeLoggedInToTrack =>
      'Musisz być zalogowany, aby obserwować ustawy. Powiadomienia dostępne tylko w aplikacji. Utwórz konto.';

  @override
  String get loaderLoadingYourTrackedList =>
      'POBIERANIE TWOJEJ LISTY OBSERWOWANYCH...';

  @override
  String get emptyNotTrackingAnything =>
      'Twoja lista obserwowanych jest pusta.';

  @override
  String get loaderLoadingLegislativeData =>
      'POBIERANIE DANYCH LEGISLACYJNYCH...';

  @override
  String get loaderAuthorizing => 'AUTORYZACJA...';

  @override
  String get loaderLoading => 'ŁADOWANIE...';

  @override
  String get snackbarLinkCopied => 'Link skopiowany do schowka!';

  @override
  String get civicWillRecord => 'REJESTR WOLI OBYWATELSKIEJ';

  @override
  String totalVotesRecorded(String totalVotes) {
    return '$totalVotes ZAREJESTROWANYCH GŁOSÓW';
  }

  @override
  String get recordYourPositionForAudit =>
      'Zarejestruj swoje stanowisko do audytu.';

  @override
  String get privateList => 'Prywatna lista';

  @override
  String get loaderLoadingCuratedFeed => 'POBIERANIE LISTY AUTORSKIEJ...';

  @override
  String get buttonOpenFullList => 'Otwórz pełną listę';

  @override
  String get filtersLabel => 'Filtry';

  @override
  String get statusFilterLabel => 'Status';

  @override
  String get onlyWithSourceTextLabel => 'Tylko z tekstem źródłowym';

  @override
  String get trackedBillsTitle => 'Obserwowane ustawy';

  @override
  String get curatedListTitle => 'Prywatna lista';

  @override
  String get loaderLoadingProfiles => 'POBIERANIE PROFILI...';

  @override
  String get loaderLoadingMoreProfiles => 'POBIERANIE KOLEJNYCH PROFILI...';

  @override
  String get loaderInitializingMirrorParliament =>
      'INICJALIZACJA LUSTRZANEGO PARLAMENTU...';

  @override
  String get loaderSyncingVectors => 'SYNCHRONIZACJA WEKTORÓW...';

  @override
  String get reportIncludeDiagnosticsTitle => 'Dołącz dane diagnostyczne';

  @override
  String get reportIncludeDiagnosticsSubtitle =>
      'Załącza aktywny stan systemu (Parlament, Kadencja, Cel), aby pomóc nam naprawić błąd.';

  @override
  String get loaderSendingReport => 'WYSYŁANIE RAPORTU...';

  @override
  String primaryParliamentLabel(String parliament) {
    return 'Główny: $parliament';
  }

  @override
  String get buttonCreateAnotherList => 'Utwórz kolejną listę';

  @override
  String get buttonCreateTrackingList => 'Utwórz listę obserwowanych';

  @override
  String get errorMissingListId => 'Błąd: Brak ID listy';

  @override
  String get actionTracked => 'Obserwowane';

  @override
  String get actionTrack => 'Obserwuj';

  @override
  String pollSupportPercent(String percent) {
    return 'ZA $percent%';
  }

  @override
  String get pollSyncing => 'SYNCHRONIZACJA...';

  @override
  String pollOpposePercent(String percent) {
    return 'PRZECIW $percent%';
  }

  @override
  String get pollPositionRecorded => 'STANOWISKO ZAREJESTROWANE';

  @override
  String get pollRestrictedToCitizens => 'TYLKO DLA OBYWATELI KRAJU';

  @override
  String yourListsForCountry(String countryName) {
    return 'Twoje Listy ($countryName)';
  }

  @override
  String get bottomNavGetInvolved => 'Zaangażuj się';

  @override
  String get errorLaunchUrl => 'Nie udało się otworzyć linku';

  @override
  String get infoTechTitle => 'Jak działa technologia';

  @override
  String get infoTechSubtitle =>
      'Poznaj naszą architekturę, sterylizację danych i zasady civic tech.';

  @override
  String get infoGovTitle => 'Przejrzystość i Zarządzanie';

  @override
  String get infoGovSubtitle =>
      'Kto to buduje, kto za to płaci i dokąd zmierzamy.';

  @override
  String get infoPrivacyTitle => 'Konstytucja i Prywatność';

  @override
  String get infoPrivacySubtitle =>
      'Radykalna przejrzystość. Dokładnie jakie dane zbieramy i dlaczego.';

  @override
  String get manualTitle => 'Otwarty Podręcznik Obywatela';

  @override
  String get manualSubtitle =>
      'Dowiedz się, jak odzyskać sprawczość w demokracji.';

  @override
  String get howToActTitle => 'Jak działać z Lustra';

  @override
  String get actAuditTitle => 'Audyt Obywatelski';

  @override
  String get actAuditSubtitle =>
      'Głosuj na ustawy, kształtuj hierarchię tematów i zostaw twardy dowód Woli Obywateli. Nie pozwól mediom ponownie przejąć kontroli nad narracją.';

  @override
  String get actWatchlistTitle => 'Listy Kurowane';

  @override
  String get actWatchlistSubtitle =>
      'Twórz własne listy ustaw i projektów obywatelskich, zdobywaj obserwujących i buduj świadomość. Użyj social mediów jako siły lobbingowej.';

  @override
  String get actDraftTitle => 'Twórz Projekty Ustaw';

  @override
  String get actDraftSubtitle =>
      'Zgłaszaj własne, profesjonalne inicjatywy bezpośrednio do Lustra. Społeczeństwo potrzebuje idei, których nie blokuje kapitał. Twórz, udostępniaj i zbieraj poparcie.';

  @override
  String get joinCommunityTitle => 'Dołącz do Społeczności';

  @override
  String get subscribedLists => 'Subskrybowane';

  @override
  String get snackbarAddedToListWebPromo =>
      'Dodano! Pobierz aplikację, by otrzymywać powiadomienia o tej ustawie.';

  @override
  String get aboutGovAppBar => 'Zarządzanie';

  @override
  String get aboutGovTitle => 'Przejrzystość i Zarządzanie';

  @override
  String get aboutGovSubtitle =>
      'Kto to buduje, kto za to płaci i dokąd zmierzamy.';

  @override
  String get aboutGovFounderName => 'Jacek (Fons)';

  @override
  String get aboutGovFounderBadge => 'SOLO ARCHITECT / FOUNDER';

  @override
  String get aboutGovFounderP1 =>
      'Nie jestem politykiem, prawnikiem ani pracownikiem naukowym. Nie mam formalnych referencji. 18 miesięcy temu pracowałem przy sprzątaniu. Cały rok 2025 spędziłem na bezrobociu, budując ten system od zera na laptopie z 2016 roku.';

  @override
  String get aboutGovFounderP2 =>
      'Dlaczego? Ponieważ frustrowało mnie, że miliarderzy i korporacje mają lepsze narzędzia do analizy danych niż obywatele. Frustrowało mnie odcinanie obywateli od prawa i wojny narracyjne prowadzone przez media, które albo zniechęcają ludzi do polityki, albo zmuszają ich do wyboru obozu. Nauczyłem się wszystkiego sam, by zbudować Lustrzany Parlament. Nie wierzę w internetowe petycje; wierzę w twardą przejrzystość opartą na danych i dostępności. I w to, że demokracja potrzebuje aktualizacji.';

  @override
  String get aboutGovFounderP3 =>
      'Możesz zapytać: \"Dlaczego mam ci ufać?\". Nie ufaj nikomu, zwłaszcza w polityce - zacznij audytować.';

  @override
  String get aboutGovSec1Title => '1. Finansowanie i Infrastruktura';

  @override
  String get aboutGovSec1Intro =>
      'Nie ma tu funduszy VC. Nie ma brudnych pieniędzy. Nie ma krypto. Obecnie ta operacja jest w 100% zasilana z własnych, minimalnych środków (bootstrapped).';

  @override
  String get aboutGovSec1Bullet1Title => 'Infrastruktura:';

  @override
  String get aboutGovSec1Bullet1Text =>
      'Pokryta z grantu o wartości 2000 USD z programu Google For Startups. Zostało nam około 1200 USD, co daje około 12 miesięcy \"pasa startowego\" na utrzymanie serwerów.';

  @override
  String get aboutGovSec1Bullet2Title => 'Koszty życia:';

  @override
  String get aboutGovSec1Bullet2Text =>
      'Finansowane w całości z moich osobistych oszczędności, przy wsparciu narzeczonej i rodziny.';

  @override
  String get aboutGovSec1Bullet3Title => 'Stos Technologiczny (Tech Stack):';

  @override
  String get aboutGovSec1Bullet3Text =>
      'Zbudowany w pojedynkę (Flutter, Firebase, Vertex AI pipeline, Node.js), aby utrzymać koszty operacyjne blisko zera.';

  @override
  String get aboutGovSec2Title => '2. Obecny Status Prawny i Transformacja';

  @override
  String get aboutGovSec2P1 =>
      'Lustra obecnie inkubuje pod moją starą polską spółką z o.o. (FO&WO VENTURES SP. Z O.O.). To konieczność prawna. Aby publikować w Apple/Google App Store i otrzymać granty Google, wymagana jest zarejestrowana firma z numerem DUNS. Nie stać mnie jeszcze na koszty prawne założenia Fundacji (koszty startowe i miesięczna księgowość to setki dolarów), więc używam najprostszego możliwego wehikułu.';

  @override
  String get aboutGovSec2BoxTitle => 'Droga do statusu Non-Profit:';

  @override
  String get aboutGovSec2BoxText =>
      'Gdy tylko osiągniemy płynność finansową i masę krytyczną (ok. 100 tys. aktywnych użytkowników miesięcznie), planuję otworzyć formalną Organizację Non-Profit i przenieść na nią całą własność intelektualną oraz infrastrukturę.';

  @override
  String get aboutGovSec2P2 =>
      'Ostatecznym celem jest demokratyczna struktura zarządzania. Decyzje będą podejmowane przez zarząd wybierany przez społeczność. Moja rola ograniczy się stricte do technicznego utrzymania backendu. Nie widzę innej przyszłości dla Lustra niż operacja non-profit z pełną transparentnością wszystkich dokumentów finansowych.';

  @override
  String get aboutGovSec3Title => '3. Bezpieczeństwo i Source Code';

  @override
  String get aboutGovSec3Bullet1Title => 'Uwierzytelnianie:';

  @override
  String get aboutGovSec3Bullet1Text =>
      'Nie dotykamy Twoich haseł. Używamy logowania Google/Apple, ponieważ ich infrastruktura bezpieczeństwa jest nie do przebicia. Przechowujemy tylko zanonimizowane User ID i Twój ID Głosu, aby zapobiegać farmom botów.';

  @override
  String get aboutGovSec3Bullet2Title =>
      'Dostępny Kod Źródłowy (Source Available):';

  @override
  String get aboutGovSec3Bullet2Text =>
      'Główne repozytoria są publiczne na licencji Open Source (AGPLv3). Chroni to projekt przed klonowaniem przez korporacje, ale adaptery danych, prompty systemowe AI i logika są w pełni widoczne do audytu.';

  @override
  String get aboutGovSec3BoxTitle => 'Potrzebujemy pomocy.';

  @override
  String get aboutGovSec3BoxText =>
      'Jestem jednym gościem ze starym laptopem, który robi wszystko. Jeśli jesteś programistą, dziennikarzem lub obywatelem, który chce pomóc w tworzeniu lokalnych komórek w swoim kraju – odezwij się.';

  @override
  String get aboutGovSec3Contact => 'Kontakt: jacek@lustra.dev';

  @override
  String get aboutGovSec3Github => 'Profil GitHub';

  @override
  String get termsAppBar => 'Konstytucja i Prywatność';

  @override
  String get termsTitle => 'Konstytucja i Prywatność';

  @override
  String get termsLastUpdated => 'Ostatnia aktualizacja: 12 marca 2026';

  @override
  String get termsAlertTitle =>
      'Radykalna Przejrzystość: Co tak naprawdę zbieramy';

  @override
  String get termsAlertP1 =>
      'Pewnie myślisz: \"Nie oddam jakiejś losowej apce swoich danych\". Zgadzamy się z Tobą. Dlatego nie interesuje nas Twoje życie prywatne. Chcemy tylko zweryfikować, że jesteś prawdziwym człowiekiem głosującym nad prawdziwym prawem.';

  @override
  String get termsAlertP2 =>
      'Oto dokładna struktura danych, którą przechowujemy dla Twojego profilu użytkownika w naszej bazie Google Cloud Firestore. Żadnych ukrytych pól. Żadnych ciasteczek śledzących.';

  @override
  String get termsAlertCode =>
      '[\n  \'uid\': \'0A21rfdsTs1F3kYsx3252352\', // Generowane przez Firebase Auth\n  \'email\': \'obywatel@example.com\', // Twoje jedyne dane osobowe\n  \'createdAt\': \'February 15, 2026 at 8:23:31 PM UTC\',\n  \'marketingConsent\': true, // Aktualizacje projektu (opcjonalne)\n  \'primaryParliamentId\': \'Polski Sejm\'\n]';

  @override
  String get termsAlertH4 => 'Zaraz, a gdzie są moje głosy i śledzone ustawy?';

  @override
  String get termsAlertP3 =>
      'Aby chronić Twoją prywatność i zapewnić wydajne skalowanie bazy danych, Twoje interakcje są odseparowane (sharded) od głównego profilu:';

  @override
  String get termsAlertB1Title => 'Śledzone Ustawy:';

  @override
  String get termsAlertB1Text =>
      'Przechowywane w prywatnej podkolekcji. Tylko Ty (i Twoje urządzenie) możecie zażądać wglądu w listę ustaw, które śledzisz.';

  @override
  String get termsAlertB2Title => 'Twoje Głosy (Kryptograficzne Haszowanie):';

  @override
  String get termsAlertB2Text =>
      'Kiedy głosujesz, NIE dołączamy Twojego UID bezpośrednio do publicznego rejestru głosowań. Zamiast tego serwer generuje kryptograficzny Hash (np. a1b2c3d4...) przy użyciu tajnej \"soli\" serwera. To silnie pseudonimizuje Twój głos. Jeśli haker wykradnie bazę danych, nie zobaczy, kto na co głosował. Chociaż matematycznie jest to funkcja jednokierunkowa, w duchu absolutnej przejrzystości powinieneś wiedzieć, że operatorzy systemu (którzy posiadają sól) mogliby teoretycznie zweryfikować głos w celu audytu systemu pod kątem oszustw lub spełnienia ważnego nakazu sądowego. Jednakże, Twoje głosy są ściśle oddzielone od Twojego codziennego profilu i nigdy nie są publicznie wyświetlane z Twoją tożsamością.';

  @override
  String get termsAlertP4 =>
      'To wszystko. Reszta to anonimowa analityka (Firebase Analytics) do naprawiania błędów i App Check, aby zapobiec farmom botów próbującym ustawiać głosowania. Nie sprzedajemy danych. Nie wyświetlamy reklam.';

  @override
  String get termsTocTitle => 'Spis Treści';

  @override
  String get termsPart1Title =>
      'Część 1: Polityka Prywatności (Minimalizacja Danych)';

  @override
  String get termsPart1Intro =>
      'Nie handlujemy Twoją uwagą. Zbieramy tylko to, co jest technicznie niezbędne do obsługi bezpiecznej infrastruktury obywatelskiej.';

  @override
  String get termsP1S1Title => '1. Administrator Danych';

  @override
  String get termsP1S1Text =>
      'Prawnym operatorem jest tymczasowo FO&WO VENTURES SP. Z O.O., z siedzibą we Wrocławiu, Polska. Kontakt: jacek@lustra.dev';

  @override
  String get termsP1S2Title => '2. Co Zbieramy';

  @override
  String get termsP1S2B1Title => 'Konto (Email/UID):';

  @override
  String get termsP1S2B1Text =>
      'Niezbędne do bezpiecznego logowania przez Firebase Authentication.';

  @override
  String get termsP1S2B2Title => 'Głosy i Ankiety (Zanonimizowane):';

  @override
  String get termsP1S2B2Text =>
      'Twoje głosy budują statystyki. Są powiązane z Twoim kontem wyłącznie w celu zapobiegania farmom botów i podwójnemu głosowaniu. Publicznie, Twoje głosy są wyświetlane TYLKO jako anonimowe agregaty. Faktyczny zapis głosu jest haszowany kryptograficznie, aby oddzielić Twoją tożsamość od Twojego wyboru politycznego.';

  @override
  String get termsP1S2B3Title => 'Śledzone Ustawy i Powiadomienia Push:';

  @override
  String get termsP1S2B3Text =>
      'Jeśli zdecydujesz się śledzić ustawę lub subskrybować Listę Kuratorską, używamy tematów (Topics) Firebase Cloud Messaging (FCM). Pozwala nam to wysyłać Ci powiadomienia push o zmianach statusu bez ciągłego śledzenia Twojej lokalizacji czy tożsamości urządzenia.';

  @override
  String get termsP1S2B4Title => 'Przechowywanie Głosów:';

  @override
  String get termsP1S2B4Text =>
      'Dane dotyczące głosowań są przechowywane przez czas trwania kadencji parlamentu plus 5 lat w celach archiwalnych i badawczych.';

  @override
  String get termsP1S2B5Title => 'Komunikacja:';

  @override
  String get termsP1S2B5Text =>
      'Jeśli wyrazisz wyraźną zgodę, będziemy wysyłać Ci aktualizacje projektu e-mailem. Możesz wycofać zgodę w dowolnym momencie.';

  @override
  String get termsP1S2B6Title => 'Projekty Obywatelskie:';

  @override
  String get termsP1S2B6Text =>
      'Treść projektów legislacyjnych zgłoszonych przez Ciebie jest w pełni publiczna.';

  @override
  String get termsP1S2Highlight =>
      '3. CZEGO NIE ROBIMY:\n\n❌ NIE sprzedajemy danych brokerom.\n❌ NIE używamy śledzenia reklamowego.\n❌ NIE profilujemy Cię politycznie do celów komercyjnych.';

  @override
  String get termsP1S3Title => '4. Infrastruktura i Bezpieczeństwo';

  @override
  String get termsP1S3B1Title => 'Lokalizacja:';

  @override
  String get termsP1S3B1Text =>
      'Dane są bezpiecznie hostowane na Google Cloud Platform, Europe-West9 (Paryż).';

  @override
  String get termsP1S3B2Title => 'Anti-Bot:';

  @override
  String get termsP1S3B2Text =>
      'Używamy Firebase App Check do weryfikacji autentyczności aplikacji i zapobiegania zautomatyzowanym manipulacjom.';

  @override
  String get termsP1S3B3Title => 'Prywatność AI:';

  @override
  String get termsP1S3B3Text =>
      'Do podsumowań wysyłamy modelom AI wyłącznie publiczne dokumenty rządowe. Twoje prywatne dane NIGDY nie trafiają do AI.';

  @override
  String get termsP1S4Title => '5. Dzieci i Usuwanie Konta';

  @override
  String get termsP1S4P1 =>
      'Usługa jest przeznaczona dla użytkowników w wieku 16+. Nie zbieramy świadomie danych dzieci.';

  @override
  String get termsP1S4P2 =>
      'Aby usunąć swoje dane: Użyj przycisku \"Usuń Konto\" bezpośrednio w ustawieniach aplikacji, aby natychmiast usunąć swoje dane identyfikujące, email i wszystkie Twoje podkolekcje z naszych serwerów.';

  @override
  String get termsP1S5Title => '6. Twoje Prawa';

  @override
  String get termsP1S5Text =>
      'Zgodnie z RODO, masz prawo do dostępu, sprostowania, usunięcia i sprzeciwu wobec przetwarzania Twoich danych. Skontaktuj się z nami na podany wyżej adres e-mail.';

  @override
  String get termsPart2Title => 'Część 2: Zasady Społeczności (Regulamin)';

  @override
  String get termsP2S1Title => '1. Operator i Misja';

  @override
  String get termsP2S1Text =>
      'Lustra to cyfrowa infrastruktura publiczna. Spółka działa jako inkubator: nie wypłaca dywidend, nie ma zewnętrznych inwestorów, a wszelkie przychody reinwestuje bezpośrednio w utrzymanie infrastruktury.';

  @override
  String get termsP2S2Title => '2. Kod i Licencja (Source Available)';

  @override
  String get termsP2S2Intro =>
      'Kod Lustra to dobro wspólne, chronione przed wyzyskiem ze strony korporacji.';

  @override
  String get termsP2S2B1Title => 'Model:';

  @override
  String get termsP2S2B1Text => 'Licencja Open Source (AGPLv3).';

  @override
  String get termsP2S2B2Title => 'Dozwolone:';

  @override
  String get termsP2S2B2Text =>
      'Wykorzystanie edukacyjne, badawcze, non-profit i obywatelskie.';

  @override
  String get termsP2S2B3Title => 'Zabronione:';

  @override
  String get termsP2S2B3Text =>
      'Korporacje nie mogą używać ani czerpać zysków z naszej pracy bez wyraźnej zgody społeczności.';

  @override
  String get termsP2S3Title => '3. Mapa Drogowa Zarządzania (Governance)';

  @override
  String get termsP2S3Intro =>
      'Naszym długoterminowym celem jest pełna decentralizacja.';

  @override
  String get termsP2S3B1Title => 'Stan obecny:';

  @override
  String get termsP2S3B1Text => 'Założyciel pełni funkcję Głównego Architekta.';

  @override
  String get termsP2S3B2Title => 'Wkrótce:';

  @override
  String get termsP2S3B2Text =>
      'Powołanie Rady Obywatelskiej wybieranej bezpośrednio przez użytkowników.';

  @override
  String get termsP2S3B3Title => 'Cel:';

  @override
  String get termsP2S3B3Text =>
      'Wdrożenie technicznych i prawnych mechanizmów pozwalających społeczności na przejęcie kontroli nad platformą w przypadku zdrady misji.';

  @override
  String get termsP2S4Title =>
      '4. Program Projektów Obywatelskich (Inkubator Prawa)';

  @override
  String get termsP2S4Intro =>
      'Zapewniamy przestrzeń, w której obywatele mogą pisać prawo.';

  @override
  String get termsP2S4B1Title => 'Procedura:';

  @override
  String get termsP2S4B1Text =>
      'Projekty są zgłaszane przez formularz i weryfikowane formalnie przez Operatora.';

  @override
  String get termsP2S4B2Title => 'Domena Publiczna:';

  @override
  String get termsP2S4B2Text =>
      'Zgłaszając projekt, udostępniasz go na licencji CC0 (Domena Publiczna). Prawo należy do wszystkich.';

  @override
  String get termsP2S4B3Title => 'Wolność Słowa:';

  @override
  String get termsP2S4B3Text =>
      'Nie oceniamy opinii ani sympatii politycznych. Odrzucamy tylko projekty naruszające prawo karne lub nawołujące do przemocy.';

  @override
  String get termsP2S4B4Title => 'Weryfikacja:';

  @override
  String get termsP2S4B4Text =>
      'Musisz być obywatelem kraju, w którym zgłaszasz projekt.';

  @override
  String get termsP2S5Title => '5. AI i Hierarchia Źródeł';

  @override
  String get termsP2S5Text =>
      'AI to narzędzie, a nie wyrocznia. AI pomaga w nawigacji po skomplikowanym języku prawniczym, ale może popełniać błędy. Ostatecznym autorytetem jest ZAWSZE oryginalny dokument PDF/XML, do którego link znajduje się na dole każdego podsumowania w aplikacji.';

  @override
  String get termsP2S6Title => '6. Bezpieczeństwo i Postanowienia Końcowe';

  @override
  String get termsP2S6Text =>
      'Ataki na infrastrukturę, DDoS i komercyjne scrapowanie (pobieranie danych) są surowo zabronione. W sprawach nieuregulowanych niniejszym regulaminem decyduje prawo polskie.';

  @override
  String get bpAppBar => 'Architektura Systemu';

  @override
  String get bpTitle =>
      'Jak Odzyskujemy Sprawczość w Demokracji dzięki Lustrzanemu Parlamentowi: Podręcznik Obywatela';

  @override
  String get bpIntroBig =>
      'Szeroka Perspektywa: Obecny system demokratyczny to zepsuty \"głuchy telefon\". Naprawiamy sygnał, podłączając obywateli bezpośrednio do procesu legislacyjnego przez Lustrzany Parlament (Lustra).';

  @override
  String get bpIntroSmall =>
      'Dlaczego to ma znaczenie: Obecnie głosujemy tylko co kilka lat. Pomiędzy wyborami mamy zerową kontrolę. Lustra daje nam \"miejsce przy stole\" każdego dnia.';

  @override
  String get bpS1Title => '1. PROBLEM: Przerwana Pętla';

  @override
  String get bpS1P1 =>
      'Informacja płynie w jedną stronę i ulega zniekształceniu.';

  @override
  String get bpS1Code =>
      'Obywatele wybierają polityków\n   ↓\nPolitycy tworzą Rząd\n   ↓\nMedia selektywnie interpretują działania rządu\n   ↓\nObywatele otrzymują informację zwrotną (zniekształconą)';

  @override
  String get bpS1Highlight =>
      'Rezultat: Nie wiemy, co się tak naprawdę dzieje, przez prawniczy żargon i szum medialny.';

  @override
  String get bpS2Title => '2. ROZWIĄZANIE: Naprawa Przepływu Informacji';

  @override
  String get bpS2P1 =>
      'Lustra usuwa pośredników. Symuluje rzeczywisty ośrodek władzy, w którym Twój głos jest rejestrowany przy konkretnych ustawach, a nie w ogólnych sondażach.';

  @override
  String get bpS2FlowMedia => 'MEDIA (opcjonalny obserwator)';

  @override
  String get bpS2Flow1 => 'Obywatele widzą projekt ustawy i go oceniają';

  @override
  String get bpS2Flow2 => 'Politycy widzą wynik woli obywateli';

  @override
  String get bpS2Flow3 => 'Politycy głosują (monitorowani w oparciu o dane)';

  @override
  String get bpS2Flow4 =>
      'Obywatele sprawdzają: Czy polityk dostosował się do danych?';

  @override
  String get bpS2Flow5 =>
      'Obywatele wybierają polityków na podstawie ich \"Wskaźnika Posłuszeństwa\"';

  @override
  String get bpS2Flow6 => 'Powstaje nowy Rząd.';

  @override
  String get bpS2FlowLoop => 'CYKL SIĘ POWTARZA';

  @override
  String get bpS3Title => '3. JAK TO DZIAŁA';

  @override
  String get bpS3ATitle => 'Krok A: Usunięcie Bariery Językowej (Tłumaczenie)';

  @override
  String get bpS3AP1 =>
      'Większość ustaw jest nudna i nieczytelna. Lustra naprawia Lukę Dostępności.';

  @override
  String get bpS3AP2 =>
      'Korzyść: 20 sekund na zrozumienie faktów. Bez żargonu.';

  @override
  String get bpS3BTitle => 'Krok B: Dystrybucja Wiedzy (Karta Informacyjna)';

  @override
  String get bpS3BP1 =>
      'Lustra nie potrzebuje milionów użytkowników, aby działać. Wystarczy, że jesteś Ty.';

  @override
  String get bpS3BList1Title => 'Twoja akcja:';

  @override
  String get bpS3BList1Text =>
      'Wchodzisz, widzisz temat i generujesz Kartę Informacyjną jednym kliknięciem.';

  @override
  String get bpS3BList2Title => 'Zasięg:';

  @override
  String get bpS3BList2Text =>
      'Automatyczne udostępnianie w mediach społecznościowych (FB, X, IG, itp.).';

  @override
  String get bpS3BList3Title => 'Efekt:';

  @override
  String get bpS3BList3Text =>
      'Twoi znajomi dostają zweryfikowane faktami \"gotowe danie\" bez konieczności instalowania aplikacji. Stajesz się niezależnym źródłem informacji.';

  @override
  String get bpS3BExample => 'Przykład:';

  @override
  String get bpS3CTitle => 'Krok C: Odzyskanie Sprawczości (Presja)';

  @override
  String get bpS3CP1 =>
      'Politycy i korporacje ignorują \"internetowe burze\", ponieważ są one chaotyczne, łatwe do ocenzurowania i szybko znikają.';

  @override
  String get bpS3CList1Title => 'Rozwiązanie:';

  @override
  String get bpS3CList1Text =>
      'Zweryfikowane Głosowania Społeczne. Twój głos jest przypisany do konkretnego ID dokumentu legislacyjnego.';

  @override
  String get bpS3CList2Title => 'Różnica:';

  @override
  String get bpS3CList2Text =>
      'To nie są petycje, które wygasają. To twarde podpisy ze zweryfikowanych kont.';

  @override
  String get bpS3CP2 =>
      'Jeśli 50 000 osób zagłosuje przeciwko ustawie, powstaje twardy dowód na brak poparcia społecznego. Tego nie da się \"przykryć\" telewizyjną narracją.';

  @override
  String get bpS4Title => '4. OFENSYWA OBYWATELSKA: My Piszemy Prawo';

  @override
  String get bpS4P1 => 'Rząd ignoruje problem? Nie czekamy.';

  @override
  String get bpS4List1Title => 'Projekty Obywatelskie:';

  @override
  String get bpS4List1Text =>
      'Tworzymy własne ustawy i zbieramy cyfrowe podpisy.';

  @override
  String get bpS4List2Title => 'Pułapka:';

  @override
  String get bpS4List2Text =>
      'Jeśli odrzucą popularną ustawę z powodów technicznych, wprowadzamy poprawki i składamy ją ponownie.';

  @override
  String get bpS4List3Title => 'Wybór:';

  @override
  String get bpS4List3Text =>
      'Ignorowanie gotowego, popularnego rozwiązania dowodzi złej woli. Daje to opozycji darmową broń do przejęcia elektoratu.';

  @override
  String get bpS4CtaTitle => 'Poprzyj te Projekty Obywatelskie TERAZ!';

  @override
  String get bpS4CtaP1 =>
      'Kliknij poniżej, aby sprawdzić i zagłosować na proponowane przepisy:';

  @override
  String get bpS4Card1Title => 'Ustawa o Odcięciu Finansowania Klasy Epsteina';

  @override
  String get bpS4Card1Desc =>
      'Odcięcie finansowania publicznego dla osób zamieszanych w handel ludźmi i łamanie praw człowieka.';

  @override
  String get bpS4Card2Title => 'Poprawka o Limitach Kadencji';

  @override
  String get bpS4Card2Desc =>
      'Wprowadza rygorystyczny limit długości kariery w Parlamencie.';

  @override
  String get bpS4Card3Title => 'Ustawa o Etyce Parlamentarnej';

  @override
  String get bpS4Card3Desc =>
      'Wprowadza zakaz handlu akcjami dla aktywnych członków Parlamentu.';

  @override
  String get bpS5Title => '5. REZULTAT KOŃCOWY: Polityczne Oczyszczenie';

  @override
  String get bpS5P1 =>
      'Koniec z ukrywaniem się. Debata wraca tam, gdzie są ludzie: do mediów społecznościowych, ale na nowych zasadach. To spełnienie pierwotnej obietnicy internetu, której bał się system: zdecentralizowana kontrola władzy.';

  @override
  String get bpS5P2 =>
      'Lustrzany Parlament włącza światło w ciemnym pokoju, wymuszamy TRANSPARENTNOŚĆ. Polityk nie może kłamać, że \"ludzie tego chcą\", gdy dane pokazują coś innego. Nowe prawo służy ogółowi, a nie kapitałowi.';

  @override
  String get bpS5P3 =>
      'Nie prosimy polityków o zmianę. Tworzymy system, w którym kłamanie o poparciu społecznym staje się niemożliwe. To demokracja oparta na danych.';

  @override
  String get bpS5Highlight =>
      'To jest wstęp do demokracji bezpośredniej, opartej na świadomym, poinformowanym głosie, a nie na emocjach.';

  @override
  String get caAppBar => 'Audyt Obywatelski';

  @override
  String get caTitle => 'Audyt Obywatelski: Nowy System dla Lepszej Demokracji';

  @override
  String get caIntro =>
      'Nikt nie ocenia procesu stanowienia prawa poza kilkoma osobami za zamkniętymi drzwiami i rzadkimi, niezależnymi dziennikarzami ujawniającymi korupcję. W rezultacie legislacja często odrywa się od potrzeb obywateli, stawiając interesy polityczne lub korporacyjne ponad adaptację społeczną. Nasz cel końcowy jest prosty: społeczeństwo głosujące nad konkretnymi politykami, a nie tylko wybierające pojedynczych polityków z nadzieją, że dotrzymają obietnic. Lustrzany Parlament powstał, by uczynić to przejście łatwym i osiągalnym.';

  @override
  String get caS1Title => 'Czym Audyt Obywatelski różni się od petycji?';

  @override
  String get caS1PetitionsTitle => 'Tradycyjne Petycje';

  @override
  String get caS1PetitionsText =>
      'Petycje rzadko działają ze względu na swoją ulotną naturę. Po zebraniu podpisów kampania się kończy. W gruncie rzeczy to uprzejma prośba do osoby przy władzy. Ponieważ są to ograniczone czasowo kampanie oparte na krótkim cyklu medialnym, politycy mogą je łatwo zignorować. Wystarczy, że poczekają, aż media zmienią narrację, a petycja zostaje zapomniana.';

  @override
  String get caS1LustraTitle => 'Wola Obywatelska Lustra';

  @override
  String get caS1LustraText =>
      'Nie prosimy. W aplikacji Lustra Twój głos to nie jest tylko podpis - jest on trwale zakotwiczony w twardym, oficjalnym ID legislacyjnym. Oznacza Twoje dokładne stanowisko w danej sprawie. Wszystkie te głosy łączą się, tworząc Wolę Obywatelską: działający w czasie rzeczywistym licznik, pokazujący dokładnie, jak obywatele oceniają dany projekt, domykając pętlę Audytu Obywatelskiego.';

  @override
  String get caS2Title => 'Dlaczego polityków powinno to obchodzić?';

  @override
  String get caS2Text =>
      'Ponieważ nie mogą się już ukryć.\n\nRejestrujemy każde ich oficjalne głosowanie w rządzie i zestawiamy je bezpośrednio z Wolą Obywatelską. Nie mogą już kłamać, że \"ludzie tego chcą\" tylko dlatego, że przeprowadzili sprytną kampanię medialną. Jeśli głosują nad czymś, co przynosi korzyść grupie lobbingowej zamiast obywatelom, dowiadujemy się o tym natychmiast. Im więcej osób używa aplikacji Lustra do demaskowania tych luk, tym trudniej politykom manipulować narracją. Odzyskujemy kontrolę.';

  @override
  String get caS3Title => 'Najlepsza Część: Władza Asymetryczna';

  @override
  String get caS3P1 =>
      'Nie potrzebujemy tradycyjnych mediów tak, jak lobbyści. Nie potrzebujemy nawet 5 milionów użytkowników w aplikacji, żeby zaktualizować demokrację. Potrzebujemy po prostu Ciebie.\n\nMasz już zasięg poza aplikacją Lustra: na Facebooku, TikToku, X czy w innych miejscach. Możemy wreszcie przekształcić media społecznościowe w coś sensownego. Jeden użytkownik udostępniający ustawę może łatwo wygenerować 100-1000 wyświetleń prawie bez wysiłku. To mały stadion ludzi dowiadujących się o kluczowym kawałku prawa lub inicjatywie obywatelskiej.';

  @override
  String get caS3MathSubtitle => 'MATEMATYKA WOJNY ASYMETRYCZNEJ';

  @override
  String get caS3P2 =>
      'Pomyśl o matematyce: aktywny korporacyjny think tank lub grupa lobbingowa to może być 10-15 osób, których jedyną siłą nacisku są pieniądze na kupowanie przysług politycznych. Wasze 10 000 zweryfikowanych głosów od prawdziwych obywateli może ich pokonać. Możemy robić dokładnie to samo co lobbyści, ale szybciej, transparentnie i z przytłaczającą przewagą liczebną. Czasy się zmieniły.';

  @override
  String get caS4Title => 'Kto kontroluje Feed? Ty.';

  @override
  String get caS4Text =>
      'Tradycyjne media i algorytmy Big Tech optymalizują pod kątem oburzenia, aby sprzedawać reklamy. Algorytm systemu Lustra jest ściśle demokratyczny. Nie mamy redaktorów decydujących, co jest \"ważne\". Nasz główny feed automatycznie ocenia ostatnie 30 dni legislacji, izoluje 5 najważniejszych ustaw z najwyższym zaangażowaniem obywatelskim i umieszcza je w centrum uwagi. Twoje głosy dyktują hierarchię informacji. Ty kontrolujesz algorytm.';

  @override
  String get caS5Title => 'Arsenał: Jak używać \"Kart Faktów\"';

  @override
  String get caS5Intro =>
      'Legislacja jest celowo nudna. Nigdy nie miała być mainstreamowa. Dlatego media tworzą wokół niej emocjonalne narracje, żeby sprzedawać reklamy. Ty też możesz tworzyć narracje - ale Twoje będą zbudowane na surowych, podsumowanych, zweryfikowanych danych.\n\nLustra produkuje Karty Faktów. Za każdym razem, gdy klikasz \"Udostępnij\", generowany jest czysty obraz przy użyciu oficjalnych danych. Sam w sobie jest tylko faktem. W mediach społecznościowych fakty muszą zostać wyjaśnione. Ty jesteś tym, który wyjaśnia. Oto jak dokładnie ich używać do tworzenia wiralowych treści o dużym wpływie:';

  @override
  String get caS5A_Title => 'A/ Haczyk (Stwórz Punkt Widzenia)';

  @override
  String get caS5A_Text =>
      'Najprostsza opcja jest zazwyczaj najbardziej życiowa. Znalazłeś w aplikacji nową ustawę o cenzurze internetu? Nie komplikuj. Stwórz mocny nagłówek (\"haczyk\"), powiedz ludziom dokładnie, jak to na nich wpłynie i wrzuć bezpośredni link do aplikacji Lustra, żeby mogli zagłosować.';

  @override
  String get caS5B_Title => 'B/ Dowód (Dla Esejów i Wątków)';

  @override
  String get caS5B_Text =>
      'Obrazy to świetne dodatki do dłuższych postów lub wpisów otwierających. Chcesz wskazać krytyczne wady w proponowanej ustawie lub skonfrontować się z oficjalnym podsumowaniem rządu? Dołącz Kartę Faktów jako niezaprzeczalny dowód. Pozwól ludziom przeczytać sterylne dane na własne oczy w 15 sekund.';

  @override
  String get caS5C_Title => 'C/ Transmisja (TikTok/Reels)';

  @override
  String get caS5C_Text =>
      'Użyj obrazu Karty Faktów z efektem \"green screen\" na TikToku lub Instagramie. Wrzuć dane z systemu Lustra w tło i nagraj siebie, wyjaśniając problem. To idealna, weryfikowalna treść w krótkim formacie.';

  @override
  String get caS5D_Title => 'D/ Sieć (Wiadomości Bezpośrednie)';

  @override
  String get caS5D_Text =>
      'Po prostu kliknij udostępnij i wyślij obraz bezpośrednio do znajomych i grup rodzinnych. Powiedz im jasno: \"Tym właśnie zajmuje się teraz rząd\" albo \"O tym właśnie teraz milczą media\".';

  @override
  String get caS5Outro =>
      'Produkcja treści jest łatwa, a Lustra to twój silnik odkrywania. Nie jesteś tylko użytkownikiem. Jesteś wczesnym adapterem nowej ery demokracji wolnej od korupcji. Masz te same narzędzia co lobbysta – użyj ich.';

  @override
  String get caSkepticTitle =>
      'Sceptyczny wobec farm botów lub prywatności danych?';

  @override
  String get caSkepticText =>
      'To dobrze. Nie ufaj naszym słowom - zrób audyt naszego systemu. Przeczytaj dokładnie, jak używamy haszowania kryptograficznego, Firebase App Check i licencji Open Source (AGPLv3), aby chronić Twoją tożsamość i integralność Woli Obywatelskiej.';

  @override
  String get caSkepticBtnGov => 'Przejrzystość i Zarządzanie';

  @override
  String get caSkepticBtnPriv => 'Konstytucja i Prywatność';

  @override
  String get clAppBar => 'Listy Kuratorskie';

  @override
  String get clTitle =>
      'Listy Kuratorskie: Zdecentralizowane Media Obywatelskie';

  @override
  String get clIntro =>
      'Rządy traktują samą ilość legislacji jako broń. Uchwalają setki stron skomplikowanych ustaw, często grzebiąc kontrowersyjne akty prawne pod nudnymi tytułami lub przepychając je \"tylnymi drzwiami\", podczas gdy media są zajęte kolejnym skandalem politycznym. Obywatele tracą z oczu szerszy obraz, ponieważ fizycznie niemożliwe jest monitorowanie wszystkiego w pojedynkę.';

  @override
  String get clS1Title => 'Rozpoznawanie Wzorców i Masowa Mobilizacja';

  @override
  String get clS1P1 =>
      'Listy Kuratorskie pozwalają Ci uporządkować chaos i działać jako niezależny węzeł informacyjny. Możesz mieszać oficjalne rządowe ustawy z oddolnymi projektami obywatelskimi, grupować je według konkretnych tematów i zapraszać innych do subskrybowania.';

  @override
  String get clS1P2 =>
      'Co kluczowe, Lista Kuratorska działa jako mnożnik dla Audytu Obywatelskiego. Nie zbierasz poparcia tylko dla jednej, izolowanej ustawy. Grupując do 80 pozycji, Twoja lista staje się dedykowanym, sprofilowanym feedem dla Twoich obserwujących. Mogą wejść na Twoją listę i oddać głosy na wiele ustaw w jednej sesji, masowo generując twarde dane i Wolę Obywatelską dla całego sektora polityki.';

  @override
  String get clS2Title => 'Jak Używać List Kuratorskich jako Broni:';

  @override
  String get clS2A_Title => 'Strażnicy Rządowi (Watchdogi)';

  @override
  String get clS2A_Text =>
      'Zauważyłeś, że rząd próbuje po cichu przepchnąć serię ustaw technologicznych naruszających prywatność? Zgrupuj je w \"Listę Inwigilacji Cyfrowej\". Pokaż swoim subskrybentom ukrytą agendę, którą przeoczyły media, i pozwól im zagłosować przeciwko nim wszystkim w jednym miejscu. Poproś o nagłośnienie sprawy przez udostępnianie.';

  @override
  String get clS2B_Title => 'Platforma do Reform';

  @override
  String get clS2B_Text =>
      'Nie narzekaj tylko na gospodarkę. Zbuduj kompletną, wieloustawową \"Listę Reform Gospodarczych\", łączącą Twoje własne projekty obywatelskie z oficjalnymi poprawkami. Zaprezentuj w pełni ustrukturyzowany program polityczny.';

  @override
  String get clS2C_Title => 'W Centrum Uwagi';

  @override
  String get clS2C_Text =>
      'Możesz przypiąć konkretną ustawę jako \"Ulubioną\" na swojej liście, aby skierować maksymalną uwagę obywateli i siłę głosu dokładnie tam, gdzie jest to najbardziej potrzebne.';

  @override
  String get clS3Title => 'Najlepsza Część: Jesteś Właścicielem Transmisji';

  @override
  String get clS3Text =>
      'Algorytmy mediów społecznościowych stale tłumią linki zewnętrzne, aby utrzymać użytkowników przy scrollowaniu. Lustra to omija. Kiedy ludzie subskrybują Twoją Listę Kuratorską, całkowicie omijasz Big Tech. Otrzymujesz manualny przycisk \"Push\". Raz na 24 godziny możesz wyzwolić bezpośrednie powiadomienie mobilne do wszystkich swoich subskrybentów, alarmując ich o sprawdzeniu Twojej listy, ponieważ odbywa się kluczowe głosowanie lub dodano nową ustawę. To Ty kontrolujesz dystrybucję.';

  @override
  String get clS4Title => 'Ekonomia Twórców dla Demokracji';

  @override
  String get clS4Text =>
      'Dobra kuratela jest niezwykle cenna. Filtrowanie szumu politycznego wymaga czasu i wiedzy. Właśnie dlatego Lustra pozwala Ci podpiąć Twój osobisty Napiwek (Tip Jar) bezpośrednio pod Listę Kuratorską. Jeśli wykonujesz ciężką pracę polegającą na monitorowaniu rządu i edukowaniu społeczeństwa, Twoi subskrybenci mogą finansować Twoje wysiłki bezpośrednio. My nie pobieramy prowizji.';

  @override
  String get clS5Title => 'Wdrożenie: Jak Zacząć';

  @override
  String get clS5Intro =>
      'To nie jest pasywna funkcja. Musisz ją aktywnie budować. Oto dokładna instrukcja, jak wdrożyć Twoją pierwszą Listę Kuratorską:';

  @override
  String get clStep1Title => 'Krok 1: Inicjalizacja';

  @override
  String get clStep1Text =>
      'Przejdź do głównego ekranu i kliknij Ikonę Zębatki (Ustawienia) w górnym rogu. Wybierz opcję utworzenia swojej pierwszej Listy Kuratorskiej. Nadaj jej jasny tytuł.';

  @override
  String get clStep2Title => 'Krok 2: Tryb Kuratora';

  @override
  String get clStep2Text =>
      'Po zainicjowaniu listy system przyznaje Ci status Kuratora. Teraz przeglądaj główny feed. Na ekranie szczegółów każdej ustawy lub projektu obywatelskiego pojawi się nowy przycisk \"Dodaj do listy\". Kliknij go, aby wstrzyknąć to konkretne prawo bezpośrednio na Twoją listę.';

  @override
  String get clStep3Title => 'Krok 3: Wstrzyknięcie do Feedu';

  @override
  String get clStep3Text =>
      'Twoja Lista Kuratorska nie zalewa głównego feedu. Zamiast tego, pojedyncza ustawa, którą wybrałeś jako \"Ulubioną\", działa jako Twój ambasador. Ta jedna karta jest wstrzykiwana bezpośrednio do codziennego feedu Twoich subskrybentów, płynnie przeplatając się z oficjalną legislacją rządową. Wyświetla się z dokładnie takim samym priorytetem jak oficjalne ustawy rządowe. Stawiamy nadzór obywatelski na równi z państwowym.';

  @override
  String get clLimitsTitle => 'LIMITY SYSTEMOWE (SYGNAŁ PONAD SZUMEM)';

  @override
  String get clLimit1Label => 'AUTORSTWO';

  @override
  String get clLimit1Desc =>
      'Maksymalna liczba aktywnych list na rząd (Możesz je usunąć i wdrożyć nowe w dowolnym momencie).';

  @override
  String get clLimit2Label => 'POJEMNOŚĆ';

  @override
  String get clLimit2Desc =>
      'Maksymalna liczba ustaw na liście (Wystarczająca, by ukazać wzorzec, i na tyle restrykcyjna, by zapobiec przeciążeniu informacyjnemu).';

  @override
  String get clLimit3Label => 'SUBSKRYPCJE';

  @override
  String get clLimit3Desc =>
      'Maksymalna liczba list, które możesz obserwować od innych twórców.';

  @override
  String get clOutro =>
      'Lustra nie jest siecią społecznościową generującą darmowy algorytmiczny zasięg dla Twojej listy. Listy Kuratorskie działają tylko na zaproszenie. Musisz udostępnić swój unikalny link na zewnątrz. Przyprowadź swoją publiczność z X, YouTube, TikToka lub z newslettera. Nie dajemy Ci followersów; dajemy Ci infrastrukturę, aby przekształcić obecnych obserwatorów w zweryfikowaną, głosującą siłę obywatelską - i sposób na bezpośrednie finansowanie Twojej ciężkiej pracy. Przestań prosić publiczność o \"lajki\". Daj im narzędzie do działania.';

  @override
  String get supportFundTitle => 'Faza 1: Uruchomienie Podmiotu Non-Profit';

  @override
  String get supportFundDesc =>
      'Aby oficjalnie otworzyć Fundację Lustra, chronić własność intelektualną i pokryć koszty prawne, musimy zebrać początkowy kapitał. Pomóż nam uniezależnić ten system na zawsze.';

  @override
  String get supportFundDisclaimer =>
      'Przejrzystość danych: Ze względu na różne bramki płatności i koszty infrastruktury, ten pasek postępu jest aktualizowany ręcznie przez założyciela (maksymalnie raz w tygodniu).';
}

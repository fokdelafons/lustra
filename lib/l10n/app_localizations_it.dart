// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get errorFailedToLoadData => 'Errore nel caricamento dei dati';

  @override
  String get errorNoData => 'Nessun dato da visualizzare.';

  @override
  String get noData => 'Nessun dato';

  @override
  String get noDate => 'Nessuna data';

  @override
  String get shareAction => 'Condividi';

  @override
  String get loginAction => 'Accedi';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsChangeLanguage => 'Cambia lingua';

  @override
  String get settingsLogout => 'Esci';

  @override
  String get tryAgainButton => 'Riprova';

  @override
  String get moreButton => '... Altro';

  @override
  String get seeDetailsLink => 'Vedi dettagli ->';

  @override
  String get bottomNavHome => 'Home';

  @override
  String get bottomNavInfo => 'Informazioni';

  @override
  String get bottomNavSupport => 'Sostieni';

  @override
  String get bottomNavFutureFeatures => 'Funzioni future';

  @override
  String termLabel(String termNumber) {
    return 'Legislatura: $termNumber';
  }

  @override
  String termMenuItem(int termNumber, String termYears) {
    return 'Legislatura $termNumber $termYears';
  }

  @override
  String get errorNoDataForTerm =>
      'Nessun dato da visualizzare per la legislatura selezionata.';

  @override
  String get sectionPopularVotes => 'Votazioni popolari';

  @override
  String get sectionUpcoming => 'Prossimamente';

  @override
  String get sectionLegislationInProcess => 'Legislazione in corso';

  @override
  String get sectionMpProfiles => 'Profili dei deputati';

  @override
  String get buttonBrowseVotes => 'Browser votazioni';

  @override
  String get buttonScheduledMeetings => 'Sessioni programmate';

  @override
  String get buttonBillsInProgress => 'Leggi in corso';

  @override
  String get buttonAllMps => 'Tutti i deputati';

  @override
  String get buttonCheckProfile => 'Vedi profilo';

  @override
  String get errorNoDeputiesData => 'Nessun dato sui deputati.';

  @override
  String get errorNoDataLastVote => 'Nessun dato sull\'ultima votazione.';

  @override
  String get errorNoDataUpcomingVote => 'Nessun dato sulla prossima votazione.';

  @override
  String get errorNoSummaryLastVote =>
      'Nessun riepilogo per l\'ultima votazione.';

  @override
  String get errorNoSummaryUpcomingVote =>
      'Nessun riepilogo per la prossima votazione.';

  @override
  String get errorNoDataLegislationInProcess =>
      'Nessun dato sulla legislazione in corso.';

  @override
  String get errorNoSummaryLegislationInProcess =>
      'Nessun riepilogo per la legislazione in corso.';

  @override
  String get keyPoints => 'Punti chiave';

  @override
  String get noKeyPoints => 'Nessun punto chiave';

  @override
  String get votingResultsTitle => 'RISULTATI DELLA VOTAZIONE';

  @override
  String get labelFor => 'A favore:';

  @override
  String get labelAgainst => 'Contro:';

  @override
  String get labelAbstained => 'Astenuti:';

  @override
  String get noStatusInfo => 'Nessuna informazione sullo stato';

  @override
  String scheduledMeetingDate(String date) {
    return 'Sessione programmata: $date';
  }

  @override
  String get noScheduledMeetingDate => 'Nessuna data di sessione programmata';

  @override
  String processStartDate(String date) {
    return 'Inizio del processo: $date';
  }

  @override
  String get noProcessStartDate => 'Nessuna data di inizio del processo';

  @override
  String mpDistrict(String districtNumber) {
    return 'Distretto: $districtNumber';
  }

  @override
  String get actionCollapse => 'Comprimi';

  @override
  String get actionExpand => 'Mostra di più...';

  @override
  String get votingFor => 'A favore';

  @override
  String get votingAgainst => 'Contro';

  @override
  String get votingAbstainShort => 'Ast.';

  @override
  String get citizenPollTitle => 'Sondaggio dei cittadini';

  @override
  String get pollTemporarilyUnavailable =>
      'Sondaggio temporaneamente non disponibile. Riprova più tardi.';

  @override
  String get errorDisplayingPollBar =>
      'Errore nella visualizzazione dei risultati del sondaggio.';

  @override
  String get pollNoForAgainstVotes => 'Nessun voto a favore/contro';

  @override
  String get pollNoVotesCast => 'Nessun voto espresso';

  @override
  String pollTotalVotes(int count) {
    return 'Voti espressi: $count';
  }

  @override
  String get pollSupport => 'Sostengo';

  @override
  String get pollDontSupport => 'Non sostengo';

  @override
  String get loginToVote => 'Accedi per votare';

  @override
  String get dialogChooseLanguage => 'Scegli la lingua';

  @override
  String get dialogCancel => 'Annulla';

  @override
  String get infoScreenTitle => 'Informazioni';

  @override
  String get infoTitle1 => 'Separare la politica dai media';

  @override
  String get infoParagraph1 =>
      'Lustra è un\'applicazione per seguire la politica utilizzando dati ufficiali. Con la tecnologia AI, i riassunti delle leggi e i risultati delle votazioni sono presentati in modo conciso, chiaro e imparziale. Seguire la politica non richiede più sforzo o tempo, solo pochi clic.';

  @override
  String get infoTitle2 => 'Interessi comuni al di sopra delle divisioni';

  @override
  String get infoParagraph2 =>
      'Come società, condividiamo obiettivi comuni come libertà, sicurezza e prosperità. Le differenze di vedute sono una parte naturale della democrazia: modellano il dibattito e consentono prospettive diverse. Con l\'accesso a informazioni affidabili, possiamo prendere decisioni più informate e partecipare alla vita pubblica basandoci sui fatti, non sulle emozioni o sulle narrazioni dei media.';

  @override
  String get infoTitle3 => 'Fatti, non parole';

  @override
  String get infoParagraph3 =>
      'Non devi più fidarti delle promesse elettorali: puoi rivedere la cronologia delle votazioni dei singoli deputati e analizzare le loro decisioni. Il profilo di ogni politico include un elenco puntato, che consente una valutazione rapida e indipendente del suo operato. La cronologia completa del lavoro verrà ampliata man mano che l\'applicazione si svilupperà.';

  @override
  String get infoTitle4 => 'Persone, non partiti';

  @override
  String get infoParagraph4 =>
      'I deputati dovrebbero considerare gli interessi dei loro elettori, non solo votare secondo la linea del partito. Il sistema dei partiti divide la società, ma tutto può essere cambiato a piccoli passi. Il primo è la consapevolezza pubblica. Usa l\'app, parla, condividi le votazioni, partecipa ai sondaggi e rimani informato. La politica influenza quasi ogni aspetto della nostra vita, quindi non c\'è motivo per cui pochi decidano tutto.';

  @override
  String get linkHowTechnologyWorks => 'Come funziona la tecnologia?';

  @override
  String get linkTermsAndPrivacy => 'Termini e Informativa sulla privacy';

  @override
  String get supportScreenTitle => 'Sostieni il progetto';

  @override
  String get supportParagraph1 =>
      'Lustra è il mio progetto personale pro bono. L\'applicazione sarà sempre gratuita, senza funzioni a pagamento, estensioni, pubblicità o limitazioni. Credo che tutti dovrebbero avere un accesso illimitato a informazioni accessibili, senza commenti di parte o filtri. Se sei d\'accordo con la missione, ti incoraggio a sostenerla con una donazione di qualsiasi importo. Ogni contributo, non importa quanto piccolo, mi aiuterà a mantenere l\'app e a svilupparla ulteriormente.';

  @override
  String get buttonSupportFinancially => 'Sostieni finanziariamente';

  @override
  String get supportThankYou =>
      'Grazie per la tua fiducia e per ogni forma di coinvolgimento';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Creatore dell\'applicazione';

  @override
  String get leaderboardTitle => 'Principali donatori (Ultimo mese)';

  @override
  String get futureFeaturesScreenTitle => 'Funzioni future';

  @override
  String get futureFeaturesHeader => 'Funzionalità pianificate';

  @override
  String get futureFeatureReferendum => 'Indizione di un referendum';

  @override
  String get futureFeatureSenate => 'Senato e senatori';

  @override
  String get futureFeatureCitizenInitiative =>
      'Iniziativa legislativa dei cittadini - progetti di legge';

  @override
  String get futureFeatureIndependentCandidates =>
      'Candidati indipendenti al parlamento';

  @override
  String get futureFeaturePetitions => 'Petizioni al parlamento';

  @override
  String get comingSoon => 'Prossimamente';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Completato - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Aggiorna dati';

  @override
  String get advancedSearchHint => 'Ricerca avanzata...';

  @override
  String get filterTypeLabel => 'Tipo: ';

  @override
  String get filterStatusLabel => 'Stato: ';

  @override
  String get allOption => 'Tutti';

  @override
  String get errorFetchData => 'Impossibile recuperare i dati. Riprova.';

  @override
  String get emptyListFilterMessage =>
      'Nessuna legge trovata che corrisponda ai criteri selezionati.';

  @override
  String get emptyListDefaultMessage =>
      'Nessuna legge completata da visualizzare per questa fonte.';

  @override
  String get searchDialogTitle => 'Cerca e filtra';

  @override
  String get searchDialogHint => 'Inserisci il termine di ricerca...';

  @override
  String get searchDialogTimePeriodLabel => 'Periodo di tempo';

  @override
  String get searchDialogSearchButton => 'Cerca';

  @override
  String get searchDialogSelectDateRange => 'Seleziona intervallo';

  @override
  String get searchDialogDateRangePickerHelp =>
      'Seleziona un intervallo di date';

  @override
  String get searchDialogDateRangePickerCancel => 'ANNULLA';

  @override
  String get searchDialogDateRangePickerConfirm => 'OK';

  @override
  String get searchDialogDateRangePickerSave => 'SALVA';

  @override
  String get timePeriodLastWeek => 'Ultima settimana';

  @override
  String get timePeriodLastMonth => 'Ultimo mese';

  @override
  String get timePeriodLast3Months => 'Ultimi 3 mesi';

  @override
  String get timePeriodLastYear => 'Ultimo anno';

  @override
  String get timePeriodAll => 'Sempre';

  @override
  String get timePeriodCustom => 'Intervallo personalizzato';

  @override
  String get categoryAll => 'Tutti';

  @override
  String get categoryHealth => 'Salute';

  @override
  String get categoryFamily => 'Famiglia';

  @override
  String get categoryTaxes => 'Tasse';

  @override
  String get categoryMigration => 'Migrazione';

  @override
  String get categoryLabor => 'Lavoro';

  @override
  String get categorySecurity => 'Sicurezza';

  @override
  String get categoryEducation => 'Istruzione';

  @override
  String get categoryEnvironment => 'Ambiente';

  @override
  String get categoryCourtsAndLaw => 'Tribunali e legge';

  @override
  String get categoryTransport => 'Trasporti';

  @override
  String get categoryBenefits => 'Benefici';

  @override
  String get categoryRealEstate => 'Immobiliare';

  @override
  String get categoryMediaAndCulture => 'Media e cultura';

  @override
  String get categoryLocalGovernment => 'Governo locale';

  @override
  String get categoryAgriculture => 'Agricoltura';

  @override
  String get categoryPublicInvestments => 'Investimenti pubblici';

  @override
  String get categoryInformatization => 'Informatizzazione';

  @override
  String get categoryEconomy => 'Economia';

  @override
  String get categoryOther => 'Altro';

  @override
  String futureLegislationScreenTitle(String parliamentName) {
    return 'Prossime leggi - $parliamentName';
  }

  @override
  String get searchDialogAdvancedTitle => 'Cerca e filtra (Avanzato)';

  @override
  String get emptyListFilterMessageFuture =>
      'Nessuna prossima legge trovata che corrisponda ai criteri selezionati.';

  @override
  String get emptyListDefaultMessageFuture =>
      'Nessuna legge programmata da visualizzare per questa fonte.';

  @override
  String get noScheduledMeetings => 'Nessuna sessione programmata';

  @override
  String get dateFormatError => 'Errore di formattazione della data';

  @override
  String get upcomingMeetings => 'Prossime sessioni:';

  @override
  String get keyPointsTitle => 'Punti chiave:';

  @override
  String processLegislationScreenTitle(String parliamentName) {
    return 'Leggi in corso - $parliamentName';
  }

  @override
  String get searchHint => 'Cerca...';

  @override
  String get emptyListFilterMessageProcess =>
      'Nessuna legge in corso trovata che corrisponda ai criteri selezionati.';

  @override
  String get emptyListDefaultMessageProcess =>
      'Nessuna legge attiva nel processo legislativo per questa fonte.';

  @override
  String processStartDateCardLabel(String date) {
    return 'Inizio del processo: $date';
  }

  @override
  String get upcomingMeetingsCardLabel => 'Prossime sessioni:';

  @override
  String get detailsScreenTitle => 'LUSTRA';

  @override
  String get shareTooltip => 'Condividi';

  @override
  String get keyPointsSectionTitle => 'Punti chiave:';

  @override
  String get officialContentButton => 'Testo ufficiale';

  @override
  String get processPageButton => 'Pagina del processo';

  @override
  String get fullVotingResultsPDF => 'Risultati completi della votazione (PDF)';

  @override
  String get scheduledMeetingsSectionTitle => 'Sessioni programmate';

  @override
  String get additionalInfoSectionTitle => 'Informazioni aggiuntive';

  @override
  String printNumberLabel(String id) {
    return 'Numero di stampa: $id';
  }

  @override
  String processStartDateLabel(String date) {
    return 'Data di inizio del processo: $date';
  }

  @override
  String votingDateLabel(String date) {
    return 'Data della votazione: $date';
  }

  @override
  String meetingNumberLabel(String number) {
    return 'N. sessione: $number';
  }

  @override
  String votingNumberLabel(String number) {
    return 'N. votazione: $number';
  }

  @override
  String get sourceLabel => 'Fonte: https://api.sejm.gov.pl/';

  @override
  String summarizedByLabel(String modelName) {
    return 'Riepilogato da: $modelName';
  }

  @override
  String promptUsedLabel(String prompt) {
    return 'Prompt utilizzato: $prompt';
  }

  @override
  String get reportErrorButton => 'Segnala un errore';

  @override
  String get noUrlAvailableSnackbar => 'Nessun URL disponibile.';

  @override
  String cannotOpenLinkSnackbar(String url) {
    return 'Impossibile aprire il link: $url';
  }

  @override
  String get alreadyVotedSnackbar => 'Il tuo voto è già stato registrato.';

  @override
  String get sharingFunctionNotImplementedSnackbar =>
      'Funzione di condivisione (da implementare)';

  @override
  String get reportErrorFunctionNotImplementedSnackbar =>
      'Funzione di segnalazione errori (da implementare)';

  @override
  String get loginScreenTitle => 'Accedi';

  @override
  String get registrationScreenTitle => 'Registrazione';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get loginButton => 'Accedi';

  @override
  String get registerButton => 'Registrati';

  @override
  String get orDivider => 'O';

  @override
  String get continueWithGoogle => 'Continua con Google';

  @override
  String get continueWithFacebook => 'Continua con Facebook';

  @override
  String get promptToRegister => 'Non hai un account? Registrati';

  @override
  String get promptToLogin => 'Hai già un account? Accedi';

  @override
  String get validatorInvalidEmail => 'Inserisci un indirizzo email valido.';

  @override
  String get validatorPasswordTooShort =>
      'La password deve contenere almeno 6 caratteri.';

  @override
  String get authErrorInvalidCredentials => 'Email o password non validi.';

  @override
  String get authErrorEmailInUse => 'Questo indirizzo email è già in uso.';

  @override
  String get authErrorWeakPassword => 'La password è troppo debole.';

  @override
  String get authErrorDefault => 'Si è verificato un errore. Riprova.';

  @override
  String get authErrorUnexpected => 'Si è verificato un errore inaspettato.';

  @override
  String get authErrorGoogleFailed =>
      'Accesso con Google non riuscito. Riprova.';

  @override
  String get authErrorFacebookFailed =>
      'Accesso con Facebook non riuscito. Riprova.';

  @override
  String get authErrorAccountExists =>
      'Esiste già un account con questa email. Accedi con la tua password.';

  @override
  String mpScreenTitle(String parliamentName) {
    return 'Deputati - $parliamentName';
  }

  @override
  String get searchMPsHint => 'Cerca deputati...';

  @override
  String get allFilter => 'Tutti';

  @override
  String get noMPsForSource => 'Nessun deputato disponibile per questa fonte.';

  @override
  String get noMPsMatchFilter => 'Nessun deputato corrisponde ai criteri.';

  @override
  String get attendanceLabelShort => 'Presenze';

  @override
  String get attendanceTooltipWarning =>
      'Presenze calcolate su una legislatura con un numero ridotto di votazioni.\nI dati potrebbero essere meno rappresentativi.';

  @override
  String get supportLabel => 'Sostegno: ';

  @override
  String get unaffiliatedClub => 'Non iscritto';

  @override
  String mpDetailsScreenTitle(String firstName, String lastName) {
    return '$firstName $lastName';
  }

  @override
  String get shareProfileTooltip => 'Condividi profilo';

  @override
  String get socialPollSectionTitle => 'Sondaggio sociale';

  @override
  String get parliamentaryActivitySectionTitle => 'Attività parlamentare';

  @override
  String parliamentaryTenureSectionTitle(int years) {
    return 'Anzianità parlamentare: $years anni';
  }

  @override
  String get parliamentaryTenureNoData => 'Anzianità parlamentare: Nessun dato';

  @override
  String get tenureTooltip =>
      'Il numero di anni è un valore approssimativo, calcolato sulla base dei dati sottostanti, senza tenere conto della scadenza prematura del mandato parlamentare.';

  @override
  String tenureTermItem(String romanNumeral, String duration) {
    return '$romanNumeral legislatura del Sejm della Repubblica di Polonia $duration';
  }

  @override
  String get unknownTermDuration => 'Periodo sconosciuto';

  @override
  String get noTermData => 'Nessun dato dettagliato sulle legislature.';

  @override
  String get plHistoricalDataDisclaimer =>
      'Nota: I dati storici della 1ª e 2ª legislatura del Sejm della Repubblica di Polonia non sono disponibili e non sono inclusi.';

  @override
  String get personalDataSectionTitle => 'Dati personali';

  @override
  String get contactSectionTitle => 'Contatti';

  @override
  String get dataSourceLabel => 'Fonte dei dati: API del Sejm RP';

  @override
  String get mandateStatusActive => 'Mandato parlamentare: attivo';

  @override
  String get mandateStatusFulfilled => 'Mandato parlamentare: espletato';

  @override
  String get mandateStatusCancelled => 'Mandato parlamentare: annullato';

  @override
  String get mandateStatusInactive => 'Mandato parlamentare: inattivo';

  @override
  String get followingAddedSnackbar => 'Aggiunto ai seguiti';

  @override
  String get followingRemovedSnackbar => 'Rimosso dai seguiti';

  @override
  String clubLabel(String clubName) {
    return 'Gruppo: $clubName';
  }

  @override
  String formerlyLabel(String clubs) {
    return ' (precedentemente: $clubs)';
  }

  @override
  String professionLabel(String profession) {
    return 'Professione: $profession';
  }

  @override
  String districtLabel(String districtName, int districtNum) {
    return 'Distretto: $districtName (n. $districtNum)';
  }

  @override
  String votesObtainedLabel(String votes) {
    return 'Voti ottenuti: $votes';
  }

  @override
  String get birthDateLabel => 'Data di nascita';

  @override
  String get ageLabel => 'Età';

  @override
  String ageUnit(int age) {
    return '$age anni';
  }

  @override
  String get birthPlaceLabel => 'Luogo di nascita';

  @override
  String get educationLabel => 'Istruzione';

  @override
  String get voivodeshipLabel => 'Voivodato';

  @override
  String get emailLabelWithColon => 'Email:';

  @override
  String get votingsTab => 'Votazioni recenti';

  @override
  String get interpellationsTab => 'Interpellanze';

  @override
  String get attendanceLabel => 'Presenza generale alle votazioni';

  @override
  String get attendanceTooltipBase =>
      'La scala valuta il livello di adempimento del dovere parlamentare di base. Gli intervalli adottati si basano sul presupposto che un\'alta affluenza sia una misura di responsabilità nei confronti degli elettori.';

  @override
  String get attendanceTooltipPartialMandate =>
      '\n\nIl deputato ha ricoperto il mandato per una parte della legislatura. La presenza si riferisce a questo periodo.';

  @override
  String get attendanceTooltipUnknownMandate =>
      '\n\nPresenza calcolata sulla base di una legislatura con un numero ridotto di votazioni. I dati potrebbero essere meno rappresentativi.';

  @override
  String get errorLoadVotings =>
      'Impossibile caricare la cronologia delle votazioni.';

  @override
  String get errorLoadInterpellations =>
      'Impossibile caricare le interpellanze.';

  @override
  String get noVotingsData =>
      'Nessun dato su votazioni importanti da visualizzare.';

  @override
  String get noInterpellationsData => 'Nessun dato.';

  @override
  String get loadVotingsButton => 'Prova a caricare le votazioni';

  @override
  String get loadMoreButton => 'Mostra di più';

  @override
  String interpellationSentDate(String date) {
    return 'Data di presentazione: $date';
  }

  @override
  String get interpellationReplyFrom => 'Risposta da: ';

  @override
  String cannotOpenReplyLink(String url) {
    return 'Impossibile aprire il link della risposta: $url';
  }

  @override
  String get pollResultNoVotes => 'nessun voto';

  @override
  String get pollResultOverwhelmingMajority => 'maggioranza schiacciante';

  @override
  String get pollResultMajority => 'maggioranza';

  @override
  String get pollResultMinority => 'minoranza';

  @override
  String get pollResultOverwhelmingMinority => 'minoranza schiacciante';

  @override
  String pollResultFormatted(String percentage, String description) {
    return '$percentage - $description';
  }

  @override
  String pollTotalVotesLabel(int count) {
    return 'Numero di voti espressi: $count';
  }

  @override
  String get pollVoteToAction => 'Vota per vedere i risultati';

  @override
  String get voteTypeFor => 'A favore';

  @override
  String get voteTypeAgainst => 'Contro';

  @override
  String get voteTypeAbstain => 'Astenuto';

  @override
  String get voteTypeAbsent => 'Assente';

  @override
  String get defaultPrompt => 'Prompt';

  @override
  String get statusInProgress => 'In corso';

  @override
  String get statusPassedSejmToSenat => 'Approvata e trasmessa al Senato';

  @override
  String get statusRejectedSejm => 'Respinta';

  @override
  String get statusRejectedBySenate => 'Respinta dal Senato';

  @override
  String get statusToPresident => 'Trasmessa al Presidente';

  @override
  String get statusVetoPresident => 'VETO del Presidente';

  @override
  String get statusToConstitutionalTribunal =>
      'Rinviata alla Corte Costituzionale';

  @override
  String get statusSignedByPresident => 'Firmata dal Presidente';

  @override
  String get statusEnacted => 'Promulgata';

  @override
  String get statusExpired => 'Scaduta';

  @override
  String get statusAdoptedResolution => 'Approvata';

  @override
  String get statusRejectedResolution => 'Respinta';

  @override
  String get statusImmediateRejection => 'Reiezione immediata';

  @override
  String get statusWithdrawn => 'Ritirata';

  @override
  String get filterStatusAll => 'Tutti';

  @override
  String get filterStatusPassed => 'Approvati';

  @override
  String get filterStatusRejected => 'Respinti';

  @override
  String get docTypeBill => 'Progetto di legge';

  @override
  String get docTypeResolution => 'Progetto di risoluzione';

  @override
  String get statusUpcoming => 'In programma';

  @override
  String get statusIntroducedInHouse =>
      'Presentato alla Camera dei Rappresentanti';

  @override
  String get statusReportedToSenate => 'Riferito al Senato';

  @override
  String get statusReportedInHouse => 'Riferito alla Camera';

  @override
  String get statusReferredInSenate => 'Assegnato al Senato';

  @override
  String get statusReferredInHouse => 'Assegnato alla Camera';

  @override
  String get statusReferenceChangeSenate => 'Cambio di assegnazione al Senato';

  @override
  String get statusReceivedInSenate => 'Ricevuto al Senato';

  @override
  String get statusPlacedOnCalendarSenate =>
      'Iscritto al calendario del Senato';

  @override
  String get statusIntroducedInSenate => 'Presentato al Senato';

  @override
  String get statusEngrossedInHouse =>
      'Approvato nella sua forma finale alla Camera';

  @override
  String get statusAgreedToSenate => 'Concordato al Senato';

  @override
  String get statusEngrossedAmendmentHouse =>
      'Emendamento approvato alla Camera';

  @override
  String get statusFailedPassageSenate => 'Passaggio fallito al Senato';

  @override
  String get statusLaidOnTableInHouse => 'Accantonato alla Camera';

  @override
  String get statusPrivateLaw => 'Legge Privata';

  @override
  String get statusPublicLaw => 'Legge Pubblica';

  @override
  String get statusAdopted => 'Adottato';

  @override
  String get statusDeBundesratApproved => 'Il Bundesrat ha approvato';

  @override
  String get statusDeAdopted => 'Adottato';

  @override
  String get statusDeIntroductionApproved => 'Introduzione approvata';

  @override
  String get statusDeAnnounced => 'Promulgato';

  @override
  String get statusDeRejected => 'Respinto';

  @override
  String get statusDeBundesratDenied => 'Il Bundesrat ha negato il consenso';

  @override
  String get statusDeIntroductionRejected => 'Introduzione respinta';

  @override
  String get statusDeDeclaredCompleted => 'Dichiarato concluso';

  @override
  String get statusDeCompletedByTermEnd => 'Concluso per fine legislatura';

  @override
  String get statusDeDeclaredUnconstitutional => 'Dichiarato incostituzionale';

  @override
  String get statusDeWithdrawn => 'Ritirato';

  @override
  String get statusDeBundesratProcessCompleted =>
      'Processo nel Bundesrat completato';

  @override
  String get statusDeCompleted => 'Completato';

  @override
  String get statusDeCompletedSeeProcess => 'Completato - vedi procedura';

  @override
  String get statusDeRecommendationAvailable =>
      'Raccomandazione di risoluzione disponibile';

  @override
  String get statusDeToBundesratNotDeliberated =>
      'Trasmesso al Bundesrat - non ancora deliberato';

  @override
  String get statusDeAssignedToCommittees => 'Assegnato alle commissioni';

  @override
  String get statusDeNotYetDeliberated => 'Non ancora deliberato';

  @override
  String get statusDeMergedWith => 'Unito con... (vedi procedura)';

  @override
  String get statusDeReferred => 'Assegnato';

  @override
  String get statusFrLawPublished => 'Legge pubblicata';

  @override
  String get statusFrOrdinancePublished => 'Ordinanza pubblicata';

  @override
  String get statusFrResolutionPublished => 'Risoluzione pubblicata';

  @override
  String get statusFrDecreePublished => 'Decreto pubblicato';

  @override
  String get statusFrDecision => 'Decisione';

  @override
  String get statusFrRejected => 'Respinto';

  @override
  String get statusFrPrescribed => 'Prescritto';

  @override
  String get statusFrPropositionLoi => 'Proposta di legge (parlamentare)';

  @override
  String get statusFrProjetLoi => 'Disegno di legge (governativo)';

  @override
  String get statusUkActOfParliament => 'Atto del Parlamento';

  @override
  String get statusUkRoyalAssent => 'Assenso Reale';

  @override
  String get statusUkWithdrawn => 'Ritirato';

  @override
  String get statusUkRejected => 'Respinto';

  @override
  String get statusUk1stReading => '1ª lettura';

  @override
  String get statusUk2ndReading => '2ª lettura';

  @override
  String get statusUk3rdReading => '3ª lettura';

  @override
  String get statusUkCommitteeStage => 'Fase in commissione';

  @override
  String get statusUkCommonsExaminers => 'Esaminatori dei Comuni';

  @override
  String get statusUkLordsSpecialCommittee =>
      'Commissione speciale dei Lord sui disegni di legge pubblici';

  @override
  String get statusUkMoneyResolution => 'Risoluzione finanziaria';

  @override
  String get statusUkConsiderationLordsAmendments =>
      'Esame degli emendamenti dei Lord';

  @override
  String get statusUkConsiderationLordsMessage =>
      'Esame del messaggio dei Lord';

  @override
  String get statusUkOrderOfCommitmentDischarged =>
      'Ordine di rinvio in commissione annullato';

  @override
  String get statusUkProgrammeMotion => 'Mozione di programmazione';

  @override
  String get statusUkReportStage => 'Fase di relazione';

  @override
  String get statusUkSecondReadingCommittee =>
      'Commissione per la seconda lettura';

  @override
  String get statusUkWaysAndMeansResolution => 'Risoluzione \'Ways and Means\'';

  @override
  String get errorCheckConnection =>
      'Per favore, controlla la tua connessione internet.';

  @override
  String get buttonRetry => 'Riprova';

  @override
  String get shareAsPost => 'Condividi come post (1:1)';

  @override
  String get shareAsStory => 'Condividi come storia (16:9)';

  @override
  String get morePointsInApp =>
      '...le informazioni complete sono disponibili nell\'app Lustra';

  @override
  String get pollVotingViaApp => 'Votazione disponibile nell\'app!';

  @override
  String get supportPollTitle => 'Sondaggio di supporto';

  @override
  String get termsCountLabel => 'Numero di mandati';

  @override
  String get settingsNotificationsNewLaws => 'Notifiche su nuove legislazioni';

  @override
  String get settingsNotificationsVoteResults =>
      'Notifiche sui risultati delle votazioni';

  @override
  String get detailsButton => 'Dettagli';

  @override
  String get errorNoVotingsDetails => 'NESSUN DATO DETTAGLIATO SULLA VOTAZIONE';

  @override
  String get clearText => 'Pulisci';

  @override
  String get consideredOnLabel => 'In esame il:';

  @override
  String get legislationFooterAiDisclaimer =>
      'Il riassunto sopra è stato generato dall\'IA e costituisce un\'elaborazione del documento governativo originale, nel rispetto di tutti i principi di imparcialità e libera informazione. I dettagli della query utilizzata e il suo schema sono disponibili nella scheda informativa.';

  @override
  String get legislationFooterModelUsed => 'Modello utilizzato:';

  @override
  String get legislationFooterSourceData =>
      'I dati di origine sono disponibili gratuitamente nel sistema governativo all\'indirizzo:';

  @override
  String get appMotto =>
      '... ovvero informazione legislativa imparziale e senza connotazioni politiche.';

  @override
  String get acceptTermsPrefix => 'Accetto i';

  @override
  String get termsAndConditions => 'Termini e l\'Informativa sulla privacy';

  @override
  String get validatorAcceptTerms => 'Devi accettare i termini per continuare.';

  @override
  String get joinSupportClubPrefix => 'Voglio unirmi al';

  @override
  String get supportClub => 'Club di Supporto Lustra';

  @override
  String get supportClubDescription =>
      'Riceverai informazioni speciali sullo sviluppo del progetto e sulle iniziative future.';

  @override
  String get registrationFinishTitle => 'Completa la registrazione';

  @override
  String get welcomeMessage => 'Benvenuto!';

  @override
  String get finalStepMessage =>
      'Ancora un ultimo passo. Per favore, accetta i termini per continuare.';

  @override
  String get continueButton => 'Continua';

  @override
  String get selectYourParliament => 'Seleziona il tuo parlamento';

  @override
  String get validatorSelectParliament =>
      'Seleziona un parlamento per continuare.';

  @override
  String get forgotPasswordButton => 'Password dimenticata?';

  @override
  String get passwordResetEmailSent =>
      'Un link per reimpostare la password è stato inviato alla tua email.';

  @override
  String get authErrorUserNotFound =>
      'Nessun utente trovato con questo indirizzo email.';

  @override
  String get settingsDeleteAccount => 'Elimina account';

  @override
  String get errorDeleteAccount => 'Impossibile eliminare l\'account. Riprova.';

  @override
  String get dialogReauthenticateTitle => 'Conferma la tua identità';

  @override
  String get dialogConfirm => 'Conferma';

  @override
  String get dialogDeleteAccountTitle =>
      'Sei sicuro di voler eliminare il tuo account?';

  @override
  String get dialogDeleteAccountContent =>
      'Questa azione non può essere annullata. Tutti i tuoi dati, inclusa la cronologia delle votazioni, verranno eliminati in modo permanente.';

  @override
  String get dialogDelete => 'Elimina';

  @override
  String get termsOfServiceContent =>
      '<b>Termini di Servizio dell\'App \"Lustra\"</b>\n\nUltimo aggiornamento: 10 agosto 2025\n\nCiao! Sono il creatore dell\'app Lustra.\nSono felice che tu sia qui. Ho creato Lustra perché credo che ognuno di noi meriti un accesso semplice e trasparente alle informazioni su come vengono create le leggi che influenzano la nostra vita.\n\nQuesto documento sono i termini di servizio – una sorta di accordo tra me e te. L\'ho scritto in un linguaggio semplice affinché tu sappia esattamente quali sono le regole dell\'app. Ti prego di leggerlo con calma. Usando Lustra, confermi di accettare queste regole.\n\n<b>1. Glossario, ovvero di chi e di cosa stiamo parlando</b>\n•\t<b>Io, mio, me</b> – cioè io, Jacek, il creatore dell\'app, che opera tramite la società FO&WO VENTURES SP. Z O.O. con sede a Breslavia.\n•\t<b>Tu, tuo, te</b> – cioè tu, la persona che utilizza l\'app.\n•\t<b>App</b> o <b>Lustra</b> – l\'applicazione mobile \"Lustra\" che stai usando.\n•\t<b>Account</b> – il tuo account personale nell\'app, che puoi creare per utilizzare funzionalità aggiuntive.\n•\t<b>Termini</b> – questo stesso documento.\n\n<b>2. Di cosa tratta Lustra? (Principi fondamentali)</b>\n•\tLustra è un\'app gratuita che ha lo scopo di fornirti informazioni accessibili sui processi legislativi in parlamenti selezionati. Qui troverai riassunti di progetti di legge, risultati di votazioni e dati sui parlamentari.\n•\tDevi avere almeno 16 anni per usare l\'app. Se crei un Account, confermi di soddisfare questa condizione.\n•\tL\'uso delle funzioni informative di base non richiede la creazione di un Account.\n\n<b>3. Il tuo Account nell\'app</b>\n•\tPuoi creare un Account usando il tuo indirizzo e-mail. Questo ti permetterà di usare funzionalità aggiuntive, come votare nei sondaggi o ricevere notifiche personalizzate.\n•\tRicorda che puoi avere un solo Account.\n•\tSei responsabile di mantenere la tua password segreta e di tutto ciò che accade sul tuo Account.\n\n<b>4. Come puoi usare i contenuti? (Licenza)</b>\n•\tTutti i dati originali (es. testi completi delle leggi, risultati delle votazioni, dati dei parlamentari) provengono da fonti ufficiali e pubbliche e sono informazioni pubbliche.\n•\tI contenuti che creo con il mio sistema proprietario e la tecnologia AI (cioè riassunti, titoli semplificati, punti chiave) ti vengono forniti per un uso libero a scopi informativi, educativi e privati. Puoi leggerli e condividerli come screenshot.\n•\tTi chiedo gentilmente di non copiare questi dati in modo massivo (non fare scraping). Creare e mantenere questo sistema mi costa tempo e denaro. Pertanto, per proteggere questo progetto, i Termini ti vietano di:\n\t\to\tScaricare automaticamente e creare un tuo database basato sui contenuti generati nell\'app.\n\t\to\tUtilizzare i contenuti dell\'app per scopi commerciali.\n\t\to\tTentare di violare la sicurezza, decompilare l\'app o interferire con il suo funzionamento.\n•\tHai un\'idea per usare i dati di Lustra in modo interessante? Sono aperto a collaborazioni! Scrivimi a jacek@lustra.dev – sarò felice di parlarne.\n\n<b>5. Sondaggi e affidabilità dei dati</b>\n•\tUna delle funzioni dell\'app sono i sondaggi in cui puoi esprimere il tuo sostegno a una data legge. Per rendere i risultati di questi sondaggi il più affidabili possibile, ti prego di selezionare nelle impostazioni il parlamento del paese di cui sei cittadino (se disponibile nell\'elenco).\n\n<b>6. La mia responsabilità (o meglio, la sua assenza)</b>\n•\tFornisco l\'app \"così com\'è\" (in inglese \"as is\"). Faccio ogni sforzo per garantire che i dati siano aggiornati e corretti, ma provengono da API governative esterne, che possono contenere errori. Pertanto, non posso essere ritenuto responsabile per eventuali inesattezze nei dati originali.\n•\tLustra è un progetto pro bono che mantengo con fondi propri. Farò del mio meglio per mantenerlo in funzione senza interruzioni, ma devo riservarmi la possibilità di pause tecniche. Mi riservo anche il diritto di terminare il servizio se, ad esempio, esaurisco i fondi per mantenerlo.\n•\tI contenuti dell\'app, in particolare quelli generati dall\'AI, sono a scopo informativo ed educativo. Non costituiscono consulenza legale.\n\n<b>7. Club di Supporto Lustra</b>\n•\tPuoi unirti al \"Club di Supporto Lustra\" dando un consenso separato e volontario. Ciò significa che potrò inviarti e-mail sullo sviluppo dell\'app, nuove funzionalità, e anche chiedere supporto nelle discussioni sul futuro del progetto o un aiuto finanziario se necessario. Troverai maggiori dettagli in merito nella Politica sulla Privacy.\n\n<b>8. Cessazione del nostro accordo</b>\n•\tPuoi cessarlo in qualsiasi momento. Basta usare l\'opzione \"Elimina account\" nelle impostazioni dell\'app. Ciò comporterà la cancellazione irreversibile del tuo Account e dei dati ad esso associati.\n•\tIo posso bloccare o eliminare il tuo Account se violi gravemente questi Termini, ad esempio, tentando di danneggiare il funzionamento dell\'app.\n\n<b>9. Modifiche ai Termini</b>\n•\tIl mondo cambia, e anche l\'app lo farà. Mi riservo il diritto di modificare questi Termini. Ti informerò di ogni modifica importante in anticipo, ad esempio tramite un messaggio nell\'app. L\'uso continuato di Lustra dopo l\'introduzione delle modifiche ne comporterà l\'accettazione.\n\n<b>10. Contatti e disposizioni finali</b>\n•\tSe hai domande, non esitare a scrivere a: jacek@lustra.dev.\n•\tPer tutte le questioni non regolate da questi Termini, si applica la legge polacca.\n\nGrazie per essere qui e per aiutare a creare uno stato trasparente!';

  @override
  String get termsAndPrivacyTitle => 'Termini e Privacy';

  @override
  String get termsOfServiceTab => 'Termini';

  @override
  String get privacyPolicyTab => 'Privacy';

  @override
  String get privacyPolicyContent =>
      '<b>Informativa sulla Privacy dell\'Applicazione \"Lustra\"</b>\n\nUltimo aggiornamento: 10 agosto 2025\n\nQuesto documento è l\'Informativa sulla Privacy. So che tali testi possono essere lunghi e complicati, quindi ho fatto del mio meglio per scriverlo in modo semplice.\nLa tua privacy e la tua fiducia sono la mia priorità assoluta. In questa informativa, ti spiegherò quali dati raccolgo, perché lo faccio e come li proteggo.\n\n<b>1. Chi si prende cura dei tuoi dati? (Titolare del Trattamento)</b>\nIl titolare del trattamento dei tuoi dati personali sono io, Jacek, che opero tramite la società FO&WO VENTURES SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ (ul. Wapienna 13/7, 50-518 Wrocław, NIP: 6343002817).\nSe hai domande sui tuoi dati, scrivimi direttamente a: jacek@lustra.dev.\n\n<b>2. Quali dati raccolgo e perché?</b>\nRaccolgo solo i dati necessari per il funzionamento dell\'applicazione o per i quali fornisci un consenso separato e volontario. Ecco un elenco dettagliato:\n•\t<b>Quando crei un Account:</b>\n\to\t<b>Il tuo indirizzo e-mail:</b> Ne ho bisogno per creare e gestire in sicurezza il tuo Account, permetterti di accedere e di reimpostare la password se la dimentichi.\n\to\t<b>ID Utente Unico (UID):</b> È una stringa di caratteri casuale assegnata automaticamente dal sistema Firebase, che mi permette di collegare in modo sicuro i tuoi dati al tuo Account.\n•\t<b>Quando utilizzi le funzionalità dell\'app (come utente registrato):</b>\n\to\t<b>I tuoi voti nei sondaggi (\"sostengo\" / \"non sostengo\"):</b> Li salvo per creare statistiche aggregate e completamente anonime di sostegno alle singole leggi, che vedi nell\'app. Il tuo voto individuale non viene mai mostrato pubblicamente.\n\to\t<b>La tua lista di leggi seguite:</b> La conservo per darti un facile accesso e per poterti (in futuro) inviare notifiche sui loro progressi.\n\to\t<b>Il tuo parlamento scelto:</b> Salvo questa informazione per permetterti di partecipare ai sondaggi pertinenti e (in futuro) ricevere notifiche per il paese corretto.\n•\t<b>Quando ti unisci al Club di Supporto Lustra (completamente volontario):</b>\n\to\t<b>Informazioni sul tuo consenso (vero/falso):</b> Le salvo per sapere se desideri ricevere messaggi aggiuntivi da parte mia. Scrivo di più sul Club nella sezione 5.\n•\t<b>Quando segnali un errore:</b>\n\to\tSe decidi di inviare una segnalazione di errore nei dati, salverò il contenuto della tua segnalazione per analizzare e correggere il problema.\nCosa <b>NON</b> raccolgo: Non uso alcuno strumento di analisi esterno (come Google Analytics) per tracciare la tua attività nell\'app.\n\n<b>3. A chi affido i tuoi dati? (I miei partner tecnologici)</b>\nPer far funzionare Lustra, utilizzo i servizi di partner tecnologici fidati a cui affido il trattamento di alcuni dati. Essi sono:\n•\t<b>Google (come parte del servizio Firebase):</b> È la spina dorsale tecnologica dell\'intera app. Google mi fornisce l\'infrastruttura per:\n\to\t<b>Autenticazione (Firebase Authentication):</b> Accesso sicuro e gestione del tuo Account.\n\to\t<b>Database (Cloud Firestore):</b> Archiviazione dei dati legati al tuo Account (es. voti nei sondaggi, lista di leggi seguite).\n•\t<b>Google (come parte del servizio Gemini AI):</b> È lo strumento che uso per analizzare i testi legislativi. Voglio essere assolutamente chiaro: invio all\'AI solo testi di leggi e documenti disponibili al pubblico. I tuoi dati personali (come email o UID) non vengono mai inviati lì.\nTutti i dati sono conservati su server di Google situati all\'interno dello Spazio Economico Europeo.\n\n<b>4. Per quanto tempo conservo i tuoi dati?</b>\nIn parole povere: conservo i tuoi dati finché hai un Account con me. Se decidi di cancellarlo, tutti i tuoi dati personali verranno eliminati in modo permanente.\n\n<b>5. Il Club di Supporto Lustra – cos\'è?</b>\nÈ un posto speciale per le persone che vogliono essere più vicine al progetto. L\'adesione è completamente volontaria e richiede la spunta di un consenso separato. Se ti unisci, accetti che io ti invii occasionalmente e-mail su:\n•\tsviluppo dell\'app e nuove funzionalità pianificate,\n•\teventi speciali, ad es. tavole rotonde sul futuro di Lustra,\n•\taltri progetti simili con la stessa missione che potrei creare in futuro,\n•\trichieste di supporto finanziario se il progetto si trovasse in difficoltà.\nPuoi ritirare il tuo consenso in qualsiasi momento nelle impostazioni dell\'app.\n\n<b>6. I tuoi diritti – hai il pieno controllo</b>\nIl GDPR ti conferisce una serie di diritti e voglio che tu possa esercitarli facilmente. Hai il diritto di:\n•\tAccesso ai tuoi dati: Sapere quali dati conservo su di te.\n•\tRettifica (correzione) dei tuoi dati.\n•\tCancellazione dei tuoi dati (diritto all\'oblio): Puoi farlo in qualsiasi momento utilizzando l\'opzione \"Elimina account\" nelle impostazioni dell\'app.\n•\tLimitazione del trattamento dei tuoi dati.\n•\tPortabilità dei dati.\n•\tOpposizione al trattamento dei dati.\n•\tRevoca del consenso (ad es. per essere nel Club di Supporto Lustra).\n•\tPresentare un reclamo al Presidente dell\'Ufficio per la Protezione dei Dati Personali (UODO) se ritieni che stia trattando i tuoi dati illegalmente.\nPer esercitare la maggior parte di questi diritti, basta scrivermi a jacek@lustra.dev.\n\n<b>7. Sicurezza dei tuoi dati</b>\nPrendo la sicurezza molto sul serio. Utilizzo le soluzioni fornite da Google Firebase, che applicano standard di sicurezza moderni, inclusa la crittografia dei dati sia durante la trasmissione (protocollo SSL) che durante l\'archiviazione sui server.\n\n<b>8. Dati dei minori</b>\nCome menzionato nei Termini di Servizio, l\'app è destinata a persone di età pari o superiore a 16 anni. Non raccolgo né tratto consapevolmente dati di persone più giovani.\n\n<b>9. Modifiche a questa informativa</b>\nPotrei aggiornare questa informativa in futuro. Ti informerò di eventuali modifiche significative in anticipo all\'interno dell\'app.\n\nGrazie per la tua fiducia.\nJacek';

  @override
  String get techPageTitle => 'Sulla tecnologia e l\'imparzialità';

  @override
  String get techPageIntro =>
      'Dietro ogni titolo semplificato e riassunto di una legge c\'è un modello linguistico. Qui voglio spiegarti in piena trasparenza come funziona e come mi assicuro che le informazioni che ricevi siano sempre pure e imparziali.';

  @override
  String get techPageWhyAiTitle => 'Perché uso l\'IA?';

  @override
  String get techPageWhyAiBody =>
      'I testi delle leggi e dei documenti parlamentari sono scritti in un complicato gergo legale. Leggere e comprendere anche una legge breve è una sfida, persino per un avvocato.\n\nIl mio obiettivo era creare uno strumento che traducesse questo linguaggio ermetico \"dal legale all\'umano\". Analizzare manualmente centinaia di documenti al giorno sarebbe impossibile per una sola persona. Ecco perché ho fatto ricorso all\'IA, come potente strumento di analisi e semplificazione del testo, che mi permette di fornirti le informazioni in modo rapido e accessibile.';

  @override
  String get techPageWhatForTitle => 'Per cosa uso esattamente l\'IA?';

  @override
  String get techPageWhatForBody =>
      'L\'Intelligenza Artificiale svolge tre compiti specifici:\n  • Semplifica i titoli ufficiali in titoli che dicono subito di cosa tratta il documento.\n  • Crea brevi riassunti di 2-3 frasi che si concentrano sull\'impatto delle modifiche sulla vita quotidiana dei cittadini.\n  • Estrae dal groviglio di testo alcuni punti chiave, ovvero le modifiche e le soluzioni più importanti.\n\nTutti gli altri dati, come i risultati delle votazioni o le informazioni sui parlamentari, provengono direttamente da API governative ufficiali.';

  @override
  String get techPageBiasTitle =>
      'Come garantisco l\'imparzialità? Istruzioni per l\'IA';

  @override
  String get techPageBiasBody =>
      'Questa è la parte più importante. L\'IA esegue comandi specifici. Questi comandi (chiamati \"prompt\" in informatica) sono una sorta di istruzione molto precisa che è alla base dell\'imparzialità dell\'intera applicazione.\n\nEcco i principi chiave che ho inculcato nel mio sistema di IA:\n  • <b>Ruolo di esperto neutrale:</b> Ordino all\'IA di assumere il ruolo di un esperto di diritto apolitico, il cui unico scopo è analizzare e spiegare, non valutare o commentare.\n  • <b>Solo fatti, niente opinioni:</b> L\'istruzione vieta espressamente all\'IA di esprimere le proprie opinioni, di dare giudizi di valore e di usare un linguaggio che possa suggerire se una determinata modifica sia \"buona\" o \"cattiva\". Deve concentrarsi esclusivamente sui fatti.\n  • <b>Prospettiva del cittadino comune:</b> Invece di analizzare la legge dalla prospettiva di un avvocato, l\'IA ha il compito di rispondere alla domanda: \"Cosa significa questa modifica per me, un comune cittadino? Come influenzerà le mie finanze, la mia salute, i miei diritti e i miei doveri?\".';

  @override
  String get techPagePromiseTitle =>
      'Istruzioni complete e trasparenti a disposizione';

  @override
  String get techPagePromiseBody =>
      'Non credere sulla parola. Di seguito trovi il contenuto esatto dell\'istruzione (prompt) che fornisco al modello di IA (Google Gemini) durante l\'analisi di ogni documento, assicurandomi che anche i parametri di creatività siano impostati su 0 (in modo che l\'IA non inventi nulla durante l\'analisi). Questo è il \"cervello\" dell\'operazione.\n\n(Nota: questo prompt si evolverà e migliorerà nel tempo, per rendere la qualità dei riassunti sempre più alta).';

  @override
  String techPagePromptCode(Object DOCUMENT_TEXT, Object country) {
    return 'Sei un esperto di diritto di $country che ha il compito di analizzare documenti di legge, delibere e altri documenti legislativi, e quindi di preparare da essi informazioni in modo accessibile per i cittadini. Il tuo obiettivo è presentare le informazioni in modo che i cittadini possano valutare da soli l\'impatto della legislazione sulla loro vita, anche senza avere conoscenze legislative specialistiche. Concentrati sui fatti e sulle conseguenze delle modifiche introdotte, evitando valutazioni e opinioni personali. Qualsiasi gergo legale è vietato. Presenta le informazioni in modo chiaro, conciso e coinvolgente, in modo che siano comprensibili per una persona senza formazione giuridica. Evita frasi lunghe e complesse. Invece di scrivere \"il progetto mira a implementare la direttiva sulla raccolta differenziata dei rifiuti...\", scrivi \"Nuove regole per la raccolta differenziata: uso di sacchi speciali, ecc....\". Continua il tuo lavoro finché non avrai risolto il tuo compito. Se non sei sicuro del contenuto generato, analizza di nuovo il documento - non tirare a indovinare. Pianifica bene il tuo compito prima di iniziare. Nel riassunto e nei punti chiave, se possibile e giustificato, sottolinea quali benefici o conseguenze concrete (positive o negative) la legge introduce per la vita quotidiana dei cittadini, i loro diritti e doveri, le loro finanze personali, la loro sicurezza e altre questioni importanti.\n\nLa tua risposta DEVE essere in formato JSON - e contenere le seguenti chiavi.\nPrima di restituire la risposta, verifica attentamente che l\'intera struttura JSON sia corretta al 100%, comprese tutte le virgole, le parentesi graffe, le parentesi quadre e le virgolette. Un JSON non corretto è inaccettabile e impedirà l\'elaborazione del tuo lavoro.\n\nAnalizza attentamente il seguente testo del documento legale. Questo è il contenuto sulla base del quale devi generare il riassunto e i punti chiave:\n--- INIZIO DEL DOCUMENTO ---\n$DOCUMENT_TEXT\n--- FINE DEL DOCUMENTO ---\n\nRICORDA: La tua risposta DEVE essere esclusivamente un oggetto JSON valido. Non aggiungere caratteri, commenti o testo extra prima del tag \'OPEN_BRACE\' o dopo il tag \'CLOSE_BRACE\'. L\'intera risposta deve essere analizzabile come JSON.\nSulla base del documento SOPRA, compila la seguente struttura JSON:\nEcco la struttura JSON che mi aspetto (riempila con il contenuto):\n__OPEN_BRACE__\n  \"ai_title\": \"Un nuovo, breve titolo per l\'atto giuridico in italiano, che catturi l\'essenza delle modifiche introdotte (ad es. massimo 10-12 parole).\",\n  \"summary\": \"Un riassunto conciso di 2-3 frasi del contenuto dell\'atto giuridico in italiano, scritto dal punto di vista dell\'impatto sulla vita quotidiana dei cittadini.\",\n  \"key_points\": [\n    \"Primo breve punto in italiano riguardante le più importanti soluzioni o modifiche introdotte.\",\n    \"Secondo breve punto in italiano...\"\n  ],\n \"category\": [\"Categorizza il documento di default in una categoria, in base al campo che tratta principalmente. Scegline fino a 3 se il documento tratta anche questioni SIGNIFICATIVE di altre categorie. DEVI scegliere le categorie ESCLUSIVAMENTE dal seguente elenco: Salute, Istruzione, Famiglia, Tasse, Lavoro, Sicurezza, Ambiente, Tribunali e Diritto, Trasporti, Prestazioni, Immobili, Media e Cultura, Autonomie locali, Migrazione, Agricoltura, Investimenti pubblici, Informatizzazione, Economia. Se il documento non rientra decisamente in nessuna di queste, DEVI usare \'Altro\'. Se usi \'Altro\', questa dovrebbe essere l\'UNICA categoria selezionata. NON creare nuove categorie. La risposta deve essere un array di stringhe, ad es. [\\\"Tasse\\\", \\\"Famiglia\\\"].\", \"Seconda categoria (opzionale)\", \"Terza categoria (opzionale)\"]\n__CLOSE_BRACE__';
  }

  @override
  String get techPageFlawlessTitle => 'L\'IA è infallibile?';

  @override
  String get techPageFlawlessBody =>
      'Certo che no. Come ogni tecnologia, può commettere un errore o interpretare male qualcosa. Per questo motivo, nell\'applicazione troverai un meccanismo che ti permette di segnalare un errore nei dati: ogni segnalazione di questo tipo è per me estremamente preziosa e mi aiuta a migliorare il sistema.\n\nIl mio obiettivo a lungo termine è quello di sviluppare ulteriormente questa tecnologia e persino di gestire un mio modello locale senza alcuna limitazione, per aumentare ulteriormente la precisione e l\'indipendenza dell\'applicazione.';

  @override
  String get techPageOutro =>
      'Grazie per la tua fiducia. Spero che grazie a questa trasparenza, l\'uso di Lustra sarà per te ancora più prezioso.';

  @override
  String get votingResultsPL1stReadingTitle => 'VOTAZIONE SULLA REIEZIONE';

  @override
  String get reportErrorDescription =>
      'Descrivi brevemente l\'errore o cosa manca. La tua segnalazione ci aiuterà a migliorare l\'applicazione.';

  @override
  String get reportErrorHint => 'Scrivi il tuo messaggio...';

  @override
  String get reportErrorValidationEmpty => 'Il messaggio non può essere vuoto.';

  @override
  String get reportErrorSuccess =>
      'Grazie! La tua segnalazione è stata inviata.';

  @override
  String get actionCancel => 'Annulla';

  @override
  String get actionSend => 'Invia';

  @override
  String get mustBeLoggedInToReport =>
      'Devi aver effettuato l\'accesso per segnalare un errore.';

  @override
  String get reportErrorRateLimitExceeded =>
      'Limite di segnalazioni superato (10 ogni 24 ore).';

  @override
  String get supportQuickTitle => 'Supporto rapido';

  @override
  String get supportPaymentsUnavailable =>
      'I pagamenti non sono attualmente disponibili.';

  @override
  String get supportNoProducts => 'Nessuna opzione di supporto disponibile.';

  @override
  String get supportCampaignsTitle => 'Campagne mirate';

  @override
  String get supportCampaignsDescription =>
      'Sostieni obiettivi di sviluppo specifici, ad esempio l\'aggiunta di un nuovo parlamento.';

  @override
  String get supportCampaignsButton =>
      'Vedi campagna attiva (presto disponibile)';

  @override
  String get forceUpdateTitle => 'Aggiornamento Richiesto';

  @override
  String get forceUpdateDescription =>
      'È disponibile una nuova versione dell\'app. Per continuare, aggiorna l\'app all\'ultima versione.';

  @override
  String get forceUpdateButton => 'Aggiorna ora';

  @override
  String get deputies => 'Deputati';

  @override
  String get sortingLabel => 'Ordina per: ';

  @override
  String get sortByPopularity => 'Popolarità';

  @override
  String get sortByAttendance => 'Presenza';

  @override
  String partyLabel(Object partyName) {
    return 'Partito: $partyName';
  }

  @override
  String districtLabelUS(Object districtName, String districtNum) {
    return '$districtNumº distretto di $districtName';
  }

  @override
  String tenureTermItemUS(Object memberType, String termNumber) {
    return '$termNumberº Congresso ($memberType)';
  }

  @override
  String get birthYearLabel => 'Anno di nascita:';

  @override
  String get sponsorshipsTab => 'Sponsorizzazioni';

  @override
  String get sponsorshipTypeSponsor => 'Proponente';

  @override
  String get sponsorshipTypeCosponsor => 'Coproponente';

  @override
  String get termCurrently => '(attualmente)';

  @override
  String get parliamentaryTenureTitle => 'Mandato parlamentare';

  @override
  String get usRoleRepresentative => 'Rappresentante';

  @override
  String get usRoleSenator => 'Senatore';

  @override
  String shareLegislationText(Object deepLink) {
    return 'Guarda i dettagli di questo disegno di legge nell\'app Lustra! $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Guarda e valuta il lavoro di questo deputato/a nell\'app Lustra! $deepLink';
  }

  @override
  String get clipboardCopySuccess => 'Link dell\'app copiato negli appunti!';

  @override
  String get mandateInactive => 'MANDATO INATTIVO';

  @override
  String get votingUnavailable => 'Votazione non disponibile';

  @override
  String get historicalTerm => 'LEGISLATURA STORICA';

  @override
  String get pollUnavailable => 'Sondaggio non disponibile';

  @override
  String get billsLabel => 'Disegni di legge';

  @override
  String get sponsorshipSublabel => '(Patrocinati/Co-patrocinati)';

  @override
  String get missingDataWarningShare =>
      'Manca il documento originale di questo disegno di legge. Aiutaci e invia una richiesta ufficiale via email per la sua pubblicazione tramite la nostra app in pochi secondi!';

  @override
  String get missingDataSourceUserMessage =>
      'Manca il documento originale di questo disegno di legge. Aiutaci inviando una richiesta ufficiale via email per la sua pubblicazione e unisciti al gruppo di persone che hanno a cuore la trasparenza delle informazioni!';

  @override
  String get missingDataSourceButton => 'Richiedi documento via email';

  @override
  String get cannotOpenEmailApp =>
      'Impossibile aprire l\'app di posta elettronica. Controlla che sia installata e di aver configurato un account.';

  @override
  String get sortByFreshness => 'Più recenti';

  @override
  String get pollPermissionDeniedError =>
      'Questo sondaggio è disponibile solo per gli utenti assegnati a questo parlamento.';

  @override
  String get supportCampaignsButtonActive => 'Sostieni la campagna';

  @override
  String get supportCampaignsButtonInactive => 'Campagna inattiva';
}

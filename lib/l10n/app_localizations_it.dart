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
  String get sectionPopularVotes => 'Votazioni legislative';

  @override
  String get sectionUpcoming => 'Dibattiti programmati';

  @override
  String get sectionLegislationInProcess => 'In corso';

  @override
  String get civicProjectsSectionTitle => 'Iniziative cittadine';

  @override
  String get sectionMpProfiles => 'Politici popolari';

  @override
  String get votingSourceTooltip => 'Vedi la fonte della votazione';

  @override
  String get legislationSponsorLabel => 'Sponsor';

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
  String get citizenPollTitle => 'Volontà Cittadina';

  @override
  String get pollTemporarilyUnavailable =>
      'Sondaggio temporaneamente non disponibile. Riprova più tardi.';

  @override
  String get errorDisplayingPollBar =>
      'Errore nella visualizzazione dei risultati del sondaggio.';

  @override
  String get pollNoForAgainstVotes => 'Nessun voto a favore/contro';

  @override
  String get pollNoVotesCast => 'Sii il primo a votare.';

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
  String get infoTitle1 => 'Cittadini Sopra la Politica';

  @override
  String get infoParagraph1 =>
      'I media non informano, curano la realtà. Si stima che il 95% della legislazione scompaia in un \"buco nero\" di silenzio perché troppo complessa per vendere pubblicità. Lustra scavalca gli intermediari. Trasformiamo il linguaggio burocratico in fatti accessibili, mostrandoti ciò che il governo approva realmente, non solo ciò di cui vuole parlare.';

  @override
  String get infoTitle2 => 'Fatti, Non Marketing';

  @override
  String get infoParagraph2 =>
      'La politica oggi è per l\'80% marketing e per il 20% legge. Noi separiamo le due cose. Applichiamo un processo di \"sterilizzazione del contesto\": rimuoviamo il linguaggio emotivo e la retorica di parte, lasciando solo i fatti legali. Non è un \"altro punto di vista\". È una riduzione del rumore che ti permette di formarti la tua opinione basandoti sulla fonte.';

  @override
  String get infoTitle3 => 'Potere Senza Intermediari';

  @override
  String get infoParagraph3 =>
      'Le grandi piattaforme ottimizzano i contenuti per la tua indignazione, perché questo ti tiene incollato allo schermo. Noi ottimizziamo per la tua conoscenza. La gerarchia dei temi nell\'app dipende esclusivamente dai voti della comunità. Siete voi a decidere cosa è importante, riprendendo il potere da editori e lobbisti.';

  @override
  String get infoTitle4 => 'Architetti del Cambiamento';

  @override
  String get infoParagraph4 =>
      'La democrazia non è uno sport per spettatori. Introduciamo un meccanismo in cui le iniziative dei cittadini sono presentate alla pari con i progetti governativi. Ti forniamo l\'infrastruttura per passare da osservatore passivo ad Architetto del Cambiamento, costruendo un sostegno reale per le questioni che contano. Portiamo la democrazia a un nuovo livello.';

  @override
  String get linkHowTechnologyWorks => 'Come funziona la tecnologia?';

  @override
  String get linkTermsAndPrivacy => 'Termini e Informativa sulla privacy';

  @override
  String get supportScreenTitle => 'Infrastruttura Pubblica';

  @override
  String get supportParagraph1 =>
      'Lustra è un servizio di pubblica utilità digitale. Ma la libertà ha un prezzo. Abbiamo rifiutato il capitale per garantire il 100% di imparzialità, credendo che sia l\'unica strada per il cambiamento. La manutenzione dell\'infrastruttura e dei server dipende esclusivamente da contributi volontari. L\'equivalente di 10\$ finanzia l\'accesso alla piattaforma per diverse migliaia di persone al mese. Il tuo sostegno garantisce la continuità della missione.';

  @override
  String get buttonSupportFinancially => 'Sostieni';

  @override
  String get supportThankYou => 'Grazie. Mantieni vivo il sistema.';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Fondatore';

  @override
  String get futureFeaturesScreenTitle => 'Roadmap della Comunità';

  @override
  String get futureFeaturesHeader => 'Tu Controlli la Direzione';

  @override
  String get futureFeatureSenate => 'Integrazione dei Senatori';

  @override
  String get futureFeatureCitizenInitiative => 'Referendum Cittadini';

  @override
  String get futureFeaturesDescription =>
      'Questa non è una lista dei desideri chiusa. Lustra è un\'infrastruttura che appartiene ai cittadini, quindi tutti noi abbiamo un impatto sul suo sviluppo. Unisciti alla comunità Civic Evolution su Reddit, proponi idee e vota sulle prossime funzionalità. Scriviamo insieme il prossimo capitolo della democrazia!';

  @override
  String get futureFeaturesVoteButton => 'Vota sulla Roadmap';

  @override
  String get comingSoon => 'Proposta';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Legislativo - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Aggiorna la cache';

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
  String get lustraClubLabel => 'Club Lustra';

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
  String get mandateStatusActive => 'Mandato: attivo';

  @override
  String get mandateStatusFulfilled => 'Mandato: espletato';

  @override
  String get mandateStatusCancelled => 'Mandato: annullato';

  @override
  String get mandateStatusInactive => 'Mandato: inattivo';

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
  String get pollResultNoVotes => 'Sii il primo a votare.';

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
  String get votingResultsUSMotionToReferTitle => 'RISULTATI: RINVIO';

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
      '...le informazioni complete sono disponibili in Lustra';

  @override
  String get civicRulesAction => 'Crea il tuo progetto';

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
  String get termsAndPrivacyTitle => 'Costituzione e Privacy';

  @override
  String get termsOfServiceTab => 'Regole';

  @override
  String get privacyPolicyTab => 'Privacy';

  @override
  String get termsOfServiceContent =>
      'REGOLE DELLA COMUNITÀ LUSTRA\nData: 6 dicembre 2025\n\n1. OPERATORE E MISSIONE\nLustra è un\'infrastruttura pubblica digitale. L\'operatore legale (Custode) è FO&WO VENTURES SP. Z O.O. (LLC). L\'azienda agisce come incubatore: niente dividendi, investitori esterni, reinvestimento dei ricavi nell\'infrastruttura.\n\n2. CODICE E LICENZA (SOURCE AVAILABLE)\nIl codice è un bene comune.\n• Modello: Open Source (AGPLv3).\n• Consentito: Uso educativo, ricerca, non profit.\n• Vietato: Le corporazioni non possono trarre profitto senza consenso.\n\n3. ROADMAP DI GOVERNANCE\nObiettivo: decentralizzazione.\n• Attuale: Il Fondatore (Jacek) è Architetto Capo.\n• Presto: Consiglio Civico eletto dagli utenti.\n• Obiettivo: Meccanismi per il controllo della comunità in caso di tradimento della missione.\n\n4. PROGETTI CITTADINI\nIncubatore di leggi.\n• Procedura: Invio via modulo, verifica formale.\n• Licenza CC0: Rilasci il progetto nel Dominio Pubblico.\n• Libertà di parola: Non giudichiamo le opinioni. Rifiutiamo solo violazioni del codice penale.\n• Verifica: Devi essere cittadino del paese interessato.\n\n5. IA E FONTI\n• Ruolo IA: Aiuta a navigare ma può sbagliare.\n• Fonte: L\'autorità finale è sempre il PDF originale.\n\n6. SICUREZZA\n• Età: Utenti 16+.\n• Vietato: Attacchi all\'infrastruttura e scraping commerciale.\n\n7. DISPOSIZIONI FINALI\nRegolato dalla legge polacca.';

  @override
  String get privacyPolicyContent =>
      'INFORMATIVA PRIVACY: MINIMIZZAZIONE\nData: 6 dicembre 2025\n\nNon commerciamo la tua attenzione. Raccolta minima.\n\n1. TITOLARE DEL TRATTAMENTO\nFO&WO VENTURES SP. Z O.O. Contatto: jacek@lustra.dev\n\n2. COSA RACCOGLIAMO\n• Account (Email/UID): Necessario per il login.\n• Voti: Collegati al tuo account per prevenire manipolazioni (bot). Pubblicamente SOLO aggregati anonimi.\n• Conservazione: Dati di voto conservati per la legislatura + 5 anni (archivio). Poi anonimizzati.\n• Comunicazione (Club di Supporto): Se acconsenti (impostazioni), inviamo aggiornamenti. Revoca possibile sempre.\n• Progetti Cittadini: Contenuto pubblico.\n\n3. COSA NON FACCIAMO\n• NO vendita dati.\n• NO tracking pubblicitario.\n• NO profilazione politica commerciale.\n\n4. INFRASTRUTTURA & SICUREZZA\n• Luogo: Google Cloud, Europe-West9 (Parigi).\n• Anti-Bot: Uso di Firebase App Check.\n• IA: I tuoi dati privati non vanno MAI all\'IA.\n\n5. BAMBINI\nServizio per 16+. Nessuna raccolta dati bambini.\n\n6. CANCELLAZIONE\nPulsante \"Elimina account\" nelle impostazioni per rimozione immediata.\n\n7. I TUOI DIRITTI\nAccesso, rettifica, cancellazione, opposizione. Contatto: jacek@lustra.dev';

  @override
  String get techTitle => 'Lustra AI Protocol v1.1';

  @override
  String get techIntroTitle =>
      '1. METODOLOGIA DI LAVORO COMPLETA (LUSTRA AI PROTOCOL)';

  @override
  String get techIntroBody =>
      'Di seguito presentiamo la pipeline completa degli agenti AI utilizzati per generare riassunti di testi legali e rilevare allucinazioni al loro interno. L\'obiettivo era disinnescare il \"buco nero legislativo\" avvicinandosi il più possibile all\'oggettività. Tuttavia, va sottolineato che non crediamo nella totale neutralità. Ogni compressione dei dati (riassunto) è una forma di scelta. Invece di fingere il \"monopolio della verità\" dei media, abbiamo adottato un bias esplicito – la \"prospettiva del cittadino\" nell\'ambito della context sterilization. I modelli sono istruiti a ignorare il teatro politico e a concentrarsi sul portafoglio, sulle libertà e sui doveri. È una decisione progettuale ingegneristica, non politica.';

  @override
  String get techDiagramTitle =>
      '2. DIAGRAMMA DI FLUSSO GENERALIZER-JUDGE-SURGEON';

  @override
  String get techDiagramIntro =>
      'Il sistema funziona in un ciclo di verifica. Non ci fidiamo dei modelli generativi – ci fidiamo dei processi di controllo e di un approccio iterativo nell\'espansione dei sistemi.';

  @override
  String get techDiagramOutro =>
      'In futuro, prevediamo di espandere il sistema con ruoli aggiuntivi, come un giornalista investigativo o un analista del rischio legale.';

  @override
  String get techPromptsTitle => '3. ISTRUZIONI COMPLETE DEGLI AGENTI';

  @override
  String get techPromptsIntro =>
      'Di seguito si trovano i prompt completi ricevuti dai modelli, insieme a commenti esplicativi per il lettore. Le risposte vengono restituite immediatamente in 8 lingue per la completa localizzazione di Lustra, quindi abbiamo omesso l\'intera struttura di risposta JSON per leggibilità.';

  @override
  String get techGeneralizerTitle => 'A) Generalizer';

  @override
  String get techGeneralizerBody =>
      'Modello: Gemini Flash (predefinito) / Pro (per <20k token)';

  @override
  String get techGeneralizerCode =>
      '// IMPOSTAZIONE DEL MODELLO\n// La definizione del ruolo è critica. \"[country]\" è una variabile che stabilizza il modello.\n// La prospettiva di un cittadino dell\'Ucraina (paese in guerra) è diversa per i modelli rispetto alla prospettiva di un cittadino del Belgio (che può, ad esempio, prestare maggiore attenzione alla burocrazia).\n// Questo imposta l\'intero contesto di interpretazione dell\'\"importanza\" di una disposizione.\nSei un esperto di diritto di [country], [...]\n\n// METODOLOGIA CORE\n// Questa non è una \"richiesta gentile\". È un\'istruzione rigida per filtrare il rumore.\n// Il modello deve ignorare la politica e cercare l\'impatto sul portafoglio e sulla vita.\n[...] che ha il compito di analizzare documenti di leggi, risoluzioni e altri documenti legislativi, e poi preparare informazioni da essi in modo accessibile ai cittadini. Il tuo obiettivo è presentare le informazioni in modo che i cittadini possano valutare da soli l\'impatto della legislazione sulla loro vita, anche senza conoscenze legislative specialistiche. Concentrati sui fatti e sugli effetti obiettivi dei cambiamenti introdotti, evitando giudizi di valore e opinioni personali. Tutto il gergo legale è vietato. Presenta le informazioni in modo chiaro, conciso e coinvolgente, affinché siano comprensibili per una persona senza formazione giuridica. Evita frasi lunghe e complesse. Invece di scrivere \"il progetto mira alla modifica del codice fiscale...\", scrivi \"Cambiamenti nelle tasse: nuove agevolazioni e obblighi per...\". Continua il tuo lavoro finché non hai risolto il tuo compito. Se non sei sicuro del contenuto generato, analizza nuovamente il documento – non tirare a indovinare. Pianifica bene il tuo compito prima di iniziarlo. Nel riassunto e nei punti chiave, se possibile e giustificato, sottolinea quali benefici o effetti concreti (positivi o negativi) la legge introduce per la vita quotidiana dei cittadini, i loro diritti e doveri, le finanze personali, la sicurezza e altre questioni importanti (ad es. divieti e obblighi categorici o le più importanti allocazioni finanziarie e territoriali concrete).\n// RIGORE TECNICO JSON\n// Il container backend è spietato. Non accetterà \"chiacchiere\".\n// Deve essere JSON pulito. Un errore in una virgola = fallimento e rifiuto del tutto.\nPrima di restituire la risposta, verifica attentamente che l\'intera struttura JSON sia corretta al 100%, incluse tutte le virgole, parentesi graffe, parentesi quadre e virgolette. Un JSON errato è inaccettabile e impedirà l\'elaborazione del tuo lavoro.\nAnalizza attentamente il testo del documento legale qui sotto.\nQuesto è il contenuto sulla base del quale devi generare il riassunto e i punti chiave:\n--- INIZIO DOCUMENTO ---\n[DOCUMENT_TEXT]\n--- FINE DOCUMENTO --\n\n// STRUTTURA OUTPUT (per 8 lingue)\n// Deve essere compilata perfettamente. Ogni chiave viene validata.\n// Se il modello omette ad es. \"fr_summary\" -> tutto va nel cestino.\nRICORDA: La tua risposta DEVE essere esclusivamente un oggetto JSON valido. Non aggiungere caratteri aggiuntivi, commenti o testo prima del tag \'OPEN_BRACE\' né dopo il tag \'CLOSE_BRACE\'. L\'intera risposta deve essere analizzabile come JSON.\nSulla base del documento SOPRA, compila la struttura JSON sottostante: (...)';

  @override
  String get techJudgeTitle => 'B) Judge';

  @override
  String get techJudgeBody => 'Modello: Flash Lite';

  @override
  String get techJudgeCode =>
      '// IMPOSTAZIONE DEL MODELLO\n// È un modello euristico semplice, quindi anche il suo ruolo deve essere semplice. Non deve \"capire\" la legge. Deve solo confrontare due set di dati. UN SOLO COMPITO!\nRUOLO: Fact Checker.\nCOMPITO: Confronta SOURCE (originale) e SUMMARY (riassunto preparato da un\'altra AI).\nIl tuo obiettivo è rilevare \"ENTITÀ FABBRICATE\" (Fabricated Entities) nel SUMMARY.\nSOURCE:\n[SOURCE_TEXT]\nSUMMARY TO EVALUATE:\nTitle: [AI_TITLE]\nSummary: [AI_SUMMARY]\nKey Points: [AI_KEY_POINTS]\n// METODOLOGIA DI VALUTAZIONE\n// Abbiamo dovuto definire regole rigide, perché Flash Lite si perdeva con l\'astrazione, quindi ha ricevuto una lista di controllo.\n// Istruzioni concrete riducono il rumore decisionale del modello.\nREGOLE DI VALUTAZIONE:\n1. Controlla tutti i NUMERI, DATE e IMPORTI nel SUMMARY. Se ne manca qualcuno nella SOURCE -> is_valid: false.\n2. Controlla tutti i COGNOMI, ORGANIZZAZIONI e LUOGHI nel SUMMARY. Se ne manca qualcuno nella SOURCE -> is_valid: false.\n3. Controlla tutte le AZIONI LEGALI concrete. Se questo meccanismo non è nella SOURCE -> is_valid: false.\n// ECCEZIONE PER L\'ASTRAZIONE\n// Questo è fondamentale. Concetti astratti (ad es. \"aumento della burocrazia\") davano spesso falsi positivi.\n// Abbiamo dovuto escluderli dalla valutazione \"fabricated entity\", perché il Giudice rifiutava conclusioni logiche corrette.\nIMPORTANTE: Concetti astratti (ad es. \"trasparenza\", \"fiducia\") sono consentiti come conclusioni.\n\n// STRUTTURA OUTPUT e requisiti di formattazione per strutturare la risposta.\nOUTPUT (JSON):\n(\n\"is_valid\": true/false,\n\"issue\": \"fabricated_entity\" / \"contradiction\" / \"none\"\n)\nREQUISITI DI FORMATTAZIONE:\n1. Rispondi ESCLUSIVAMENTE con un oggetto JSON grezzo.\n2. NON usare blocchi di codice Markdown.\n3. NON aggiungere introduzioni o spiegazioni prima o dopo il JSON.\n4. Il JSON deve essere corretto e pronto per l\'analisi.';

  @override
  String get techSurgeonTitle => 'C) Surgeon';

  @override
  String get techSurgeonBody => 'Modello: Gemini Pro';

  @override
  String get techSurgeonCode =>
      '// IMPOSTAZIONE DEL MODELLO\n// Il Chirurgo non è lì per scrivere. È lì per rimuovere il cancro (le allucinazioni).\n// Deve mantenere la coerenza con il \"Citizen Bias\" imposto dal Generalizer.\n// Per questo motivo, bisogna passare a un grounding aggressivo.\nSei un LEGISLATIVE SURGEON.\nIl tuo compito è l\'audit e la riparazione del riassunto (JSON) in merito alla conformità con il testo sorgente (SOURCE).\n// MEGA IMPORTANTE. Non può aggiungere informazioni. Se lo facesse – aumentiamo il rischio di allucinazioni, e non ha più un giudice sopra di sé. Meglio riassunti incompleti che falsi.\nREGOLA FONDAMENTALE: \"NO NEW INFORMATION\" (nessuna nuova informazione).\nIl riassunto può solo trasformare le informazioni contenute nella SOURCE (accorciare, tradurre, sommare). Non può generare nuove informazioni che non sono nella SOURCE.\n// PROCEDURA DI VERIFICA (WORKFLOW)\n// Forziamo il modello a un processo di pensiero \"Frase per Frase\".\nPROCEDURA DI VERIFICA (esegui per ogni frase nel JSON):\nChiediti: \"Posso indicare nella SOURCE un frammento concreto che conferma questa affermazione?\"\nSE LA RISPOSTA È \"SÌ\":\nL\'informazione è confermata da una citazione, un sinonimo o un risultato matematico dai dati nel testo.\nDECISIONE: Lascia invariato.\nSE LA RISPOSTA È \"NO\":\nL\'informazione non è nel testo (è un\'allucinazione, conoscenza esterna del modello, sovrainterpretazione o estrapolazione inutile).\nDECISIONE: Rimuovi questa informazione o modificala affinché sia coperta nel testo.\nSE LA RISPOSTA È \"DIPENDE\":\nIl testo non è chiaro e il riassunto \"tira a indovinare\" (ad es. fornendo un esempio concreto per un termine generale).\nDECISIONE: Vai sul sicuro. Rimuovi le supposizioni. Usa la terminologia del testo.\n// CATEGORIE DI RISCHIO\n// Stimate sulla base di errori precedenti del Generalizer.\n// Gli diamo una \"mappa stradale\" di dove si trovano solitamente le mine.\nCATEGORIE DI RISCHIO (attenzione particolare):\nDate (inizio validità vs inizio finanziamento).\nNumeri (gli importi concreti devono risultare dal testo).\nSoggetti (chi fa cosa).\nPortata (cosa copre la legge e cosa no).\n\nINPUT:\n--- SOURCE_TEXT START ---\n[SOURCE_TEXT]\n--- SOURCE_TEXT END ---\n\n--- FLAGGED_JSON START ---\n[FLAGGED_JSON]\n--- FLAGGED_JSON END ---\n\nOUTPUT:\nEsclusivamente l\'oggetto JSON riparato conforme alla struttura: (...)';

  @override
  String get techConclusionsTitle => '4. CONCLUSIONI EMPIRICHE';

  @override
  String get techConclusionsIntro =>
      'Man mano che il sistema si sviluppava, è stato necessario prendere decisioni basate su osservazioni e non sui parametri dei modelli. Ne sono scaturite alcune intuizioni piuttosto interessanti.';

  @override
  String get techConclusionATitle =>
      'A) Perché usare un modello più \"stupido\"?';

  @override
  String get techConclusionABody =>
      'I test iniziali sulla legge polacca, auditati da Claude e ChatGPT, hanno mostrato che Gemini Flash generava i migliori riassunti. Subito dopo c\'era il modello Pro, che a volte riceveva una valutazione leggermente inferiore a causa di conclusioni di vasta portata o dell\'omissione di alcuni dettagli. Paradossalmente, il \"pensiero\" del modello contribuiva a una qualità del contenuto leggermente peggiore. Conclusione? Quando Pro riceve un testo breve e semplice, inizia a filosofeggiare. Di conseguenza, può omettere fatti chiave che considera troppo ovvi. Perde anche molto più spesso la struttura JSON (dimentica di chiudere la parentesi). Per riassunti semplici, la scelta è ovvia.';

  @override
  String get techConclusionBTitle => 'B) Allora a che serve Pro?';

  @override
  String get techConclusionBBody =>
      'I problemi iniziano con documenti più lunghi. Qui, il modello Pro è decisamente in testa, mentre i modelli più deboli hanno una tendenza molto maggiore alle allucinazioni. Queste osservazioni sono confermate anche da studi scientifici (Lost in the Middle). Ciò impone la necessità di utilizzare immediatamente il modello Pro per documenti più lunghi.';

  @override
  String get techConclusionCTitle => 'C) Efficacia';

  @override
  String get techConclusionCBody =>
      'Basandosi su esperienze empiriche (centinaia di prove, diversi parlamenti), il tasso anti-allucinazione è >99%. Per stimare il coefficiente con maggiore precisione, sarebbero necessari esborsi finanziari aggiuntivi (migliaia o decine di migliaia di test con i modelli più forti di aziende di AI concorrenti). Si può quindi prendere questo dato con le pinze. La maggior parte delle allucinazioni sono errori minori, ad es. l\'uso della parola \"uomo\" invece di \"deputato\" nel riassunto. Il problema principale del sistema non sono quindi loro, ma un\'eccessiva generalizzazione. A volte il Generalizer creerà un riassunto corretto, ma ometterà un punto critico che è molto importante per il dibattito pubblico. Tuttavia, questo è un compromesso che il sistema accetta in questo momento, concentrato sull\'eliminazione totale delle allucinazioni. La noia è più sicura della menzogna.';

  @override
  String get techFooterDate => 'Data aggiornamento Q1 2026';

  @override
  String get techFooterLicense => 'Open Source (AGPLv3)';

  @override
  String get techGraphSource => 'Legislation Source';

  @override
  String get techGraphDecisionLength => 'Lunghezza > 20k token?';

  @override
  String get techGraphNo => 'NO';

  @override
  String get techGraphYes => 'SÌ';

  @override
  String get techGraphFlash => 'Flash (System 1)';

  @override
  String get techGraphPro => 'Pro (System 2)';

  @override
  String get techGraphJudge => 'The Judge (Flash Lite)';

  @override
  String get techGraphDecisionPass => 'Risultato: Pass?';

  @override
  String get techGraphPublishFirestore => 'HTML Ready';

  @override
  String get techGraphNoRetry => 'NO (Retry)';

  @override
  String get techGraphRepairLoop => 'Ciclo di riparazione';

  @override
  String get techGraphRetryFlash => '< 2 errori: Flash';

  @override
  String get techGraphRetrySurgeon => '> 2 errori: Surgeon';

  @override
  String get techGraphSurgeon => 'The Surgeon (Pro)';

  @override
  String get techGraphHtmlReady => 'HTML Ready';

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
    return 'Votare è una scelta. Esprimi la tua qui: $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Profilo e storico dei voti: $deepLink';
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

  @override
  String get authErrorAppleFailed => 'Accesso con Apple non riuscito. Riprova.';

  @override
  String get continueWithApple => 'Continua con Apple';

  @override
  String get homeSearchHint => 'Inserisci una frase...';

  @override
  String get homeSearchButtonDeputies => 'Deputati';

  @override
  String get homeSearchButtonLegislations => 'Leggi';

  @override
  String get actionSeeAll => 'Vedi tutto';

  @override
  String get notificationsEnabledForOtherParliament =>
      'Attivo per un altro parlamento';

  @override
  String get votingResultsUSMotionToTableTitle =>
      'RISULTATI: MOZIONE DI REIEZIONE';

  @override
  String get crowdfundingLabel =>
      'Sostieni Lustra affinché rimanga una fonte indipendente:';

  @override
  String get hashtagLaw => 'Legge';

  @override
  String get hashtagPolitician => 'Politico';

  @override
  String get statusIntroduced => 'Presentato';

  @override
  String get statusPassedHouse => 'Approvato alla Camera';

  @override
  String get statusPassedSenate => 'Approvato al Senato';

  @override
  String get statusBecameLaw => 'Diventato legge';

  @override
  String get statusVetoed => 'Posto il veto';

  @override
  String get statusFailed => 'Respinto';

  @override
  String get statusPlacedOnCalendar => 'Inserito nel calendario';

  @override
  String get actionBack => 'Indietro';

  @override
  String get actionViewSourceJson =>
      'Registri di lavoro IA per questo documento';

  @override
  String get manualEmailDialogTitle => 'Invia messaggio manualmente';

  @override
  String get manualEmailDialogDescription =>
      'Nessun client di posta rilevato. Copia i dati sottostanti e inviali tu stesso.';

  @override
  String get labelRecipient => 'Destinatario';

  @override
  String get labelSubject => 'Oggetto';

  @override
  String get labelBody => 'Corpo del messaggio';

  @override
  String get actionCopy => 'Copia';

  @override
  String get copiedToClipboard => 'Copiato negli appunti';

  @override
  String get webBannerDownloadMessage =>
      'Per sfruttare appieno tutte le funzionalità, scarica l\'app!';

  @override
  String get webBannerDownloadButton => 'Scarica';

  @override
  String get supportStripeButton => 'Sostieni (Stripe)';

  @override
  String get supportFounderMessage =>
      'Non c\'è una grande azienda dietro questo progetto, solo io e il mio portatile. L\'ho costruito perché credo che tale tecnologia debba esistere e rimanere al 100% indipendente dal capitale, che detta sempre la narrazione. Questo è il mio regalo al mondo.';

  @override
  String get civicProjectTitle => 'Progetto Civico';

  @override
  String get drafterAuthRequired =>
      'Autenticazione richiesta. Accedi prima a Lustra.';

  @override
  String get drafterLaunchError => 'Impossibile avviare il gateway Drafter:';

  @override
  String get drafterButtonTitle =>
      'USA LUSTRA DRAFTER PER CREARE UNA LEGGE DA UN\'IDEA IN 5 MINUTI';

  @override
  String get submitCivicProjectButton => 'Crea il tuo progetto';

  @override
  String get civicThresholdCandidate => 'Da revisionare.';

  @override
  String get statusInitiative => 'Iniziativa';

  @override
  String get civicTitle => 'Progetti Civici';

  @override
  String get civicIncubatorTitle => 'Incubatore di Progetti Civici';

  @override
  String get civicSubtitle => 'Disegnare il futuro della democrazia, insieme.';

  @override
  String get civicSection1Title => '1. Regole del Programma & Governance';

  @override
  String get civicSection1Intro =>
      'Lustra fornisce ai cittadini un\'infrastruttura legislativa. Trattiamo le tue idee con la stessa serietà dei disegni di legge governativi. Per garantire la qualità, si applicano regole rigorose:';

  @override
  String get civicProcessTitle => 'Il Processo';

  @override
  String get civicRuleSubmissionTitle => 'Invio:';

  @override
  String get civicRuleSubmissionText => 'Invii una bozza via email/modulo.';

  @override
  String get civicRuleReviewTitle => 'Revisione Formale (Umana):';

  @override
  String get civicRuleReviewText =>
      'Verifichiamo la conformità allo standard LDS-1. Filtriamo rigorosamente discorsi d\'odio, spam, duplicati e contenuti non legislativi.';

  @override
  String get civicRuleAiTitle => 'Sterilizzazione AI:';

  @override
  String get civicRuleAiText =>
      'Le bozze approvate vengono elaborate dalla nostra AI per rimuovere il linguaggio emotivo ed estrarre i fatti chiave.';

  @override
  String get civicRulePublicationTitle => 'Pubblicazione:';

  @override
  String get civicRulePublicationText =>
      'Il progetto riceve una \"Carta di Legge Civica\" nell\'app, visivamente uguale alla legislazione governativa.';

  @override
  String get civicWarningTitle => 'Integrità del Progetto';

  @override
  String get civicWarningText =>
      'Il testo principale rimane invariato. Puoi aggiungere solo emendamenti per perfezionare il testo senza stravolgerne l\'idea originale. Ogni modifica è pubblica e aggiunta come allegato per garantire la trasparenza.';

  @override
  String get civicPoliciesTitle => 'Politiche Critiche';

  @override
  String get civicPolicyPublicDomainTitle => 'Dominio Pubblico (CC0):';

  @override
  String get civicPolicyPublicDomainText =>
      'Inviando un progetto, rinunci a tutti i diritti d\'autore. La legge appartiene a tutti.';

  @override
  String get civicPolicyAstroturfingTitle => 'Anti-Astroturfing:';

  @override
  String get civicPolicyAstroturfingText =>
      'Devi dichiarare se rappresenti un\'organizzazione. Il lobbying occulto comporta un ban permanente.';

  @override
  String get civicPolicyAdPersonamTitle => 'Ad Personam:';

  @override
  String get civicPolicyAdPersonamText =>
      'I progetti mirati a individui specifici (diffamazione) vengono respinti immediatamente.';

  @override
  String get civicPolicyTrashTitle => 'Nessun Cestino:';

  @override
  String get civicPolicyTrashText =>
      'Lustra non è un forum. Bozze di bassa qualità, duplicati e manifesti vengono respinti all\'ingresso.';

  @override
  String get civicSection2Title => '2. Standard Legislativo Lustra (LDS-1)';

  @override
  String get civicSection2Intro =>
      'La tua bozza deve seguire questa struttura. Se sembra un post di un blog, verrà respinta.';

  @override
  String get civicStructureTitle => 'Struttura Richiesta:';

  @override
  String get civicStructureTitleItem => 'Titolo:';

  @override
  String get civicStructureTitleText => 'Descrittivo e neutrale.';

  @override
  String get civicStructureArticlesItem => 'Articoli:';

  @override
  String get civicStructureArticlesText =>
      'Testo diviso in unità numerate (Art. 1, Art. 2...) contenenti meccanismi specifici (divieti, obblighi).';

  @override
  String get civicStructureExposeItem => 'Relazione Illustrativa (Exposé):';

  @override
  String get civicStructureExposeText => 'Sezione obbligatoria che spiega:';

  @override
  String get civicExposePoint1 => '• (1) Diagnosi del problema.';

  @override
  String get civicExposePoint2 => '• (2) Obiettivo della regolamentazione.';

  @override
  String get civicExposePoint3 => '• (3) Impatto sociale previsto.';

  @override
  String get civicSection3Title => '3. Punteggio di Prontezza Lustra';

  @override
  String get civicSection3Intro =>
      'Non giudichiamo le tue opinioni politiche. Giudichiamo la qualità della costruzione. La nostra AI analizza ogni bozza su una scala da 0 a 100:';

  @override
  String get civicScoreStructureTitle => 'Struttura (30 pti):';

  @override
  String get civicScoreStructureText =>
      'Formattazione legale corretta e linguaggio preciso.';

  @override
  String get civicScoreExposeTitle => 'Completezza dell\'Esposto (30 pti):';

  @override
  String get civicScoreExposeText =>
      'Chiarezza della definizione del problema/soluzione.';

  @override
  String get civicScoreLogicTitle => 'Logica Interna (20 pti):';

  @override
  String get civicScoreLogicText => 'Assenza di contraddizioni.';

  @override
  String get civicScoreImpactTitle => 'Analisi d\'Impatto (20 pti):';

  @override
  String get civicScoreImpactText =>
      'Fattibilità e identificazione dei gruppi interessati.';

  @override
  String get civicThresholdsTitle => 'Soglie:';

  @override
  String get civicThresholdRejected => 'Respinto / Restituito.';

  @override
  String get civicThresholdReady => 'Pubblicazione prioritaria.';

  @override
  String get civicSection4Title => '4. Kit del Creatore (Copia & Incolla)';

  @override
  String get civicSection4Intro =>
      'Usa questo modello per assicurarti che il tuo progetto soddisfi lo standard LDS-1.';

  @override
  String get civicTemplateCode =>
      'TITOLO: [Inserisci Titolo Descrittivo Qui]\n\nPREAMBOLO: [Opzionale: Riconoscendo che...]\n\nCAPITOLO I: DISPOSIZIONI GENERALI\nArt. 1. L\'obiettivo di questa Legge è [Inserisci Obiettivo].\nArt. 2. Questa Legge si applica a [Inserisci Ambito].\n\nCAPITOLO II: [MECCANISMO PRINCIPALE / DIVIETI]\nArt. 3. \n1. È vietato [Azione].\n2. Le entità sono tenute a [Azione].\n\nCAPITOLO III: SANZIONI & DISPOSIZIONI FINALI\nArt. X. La violazione dell\'Art. 3 è punita con [Sanzione].\nArt. Y. Questa Legge entra in vigore il [Data].\n\n---\nRELAZIONE ILLUSTRATIVA (EXPOSÉ)\n\n1. IL PROBLEMA\n[Descrivi la situazione attuale e perché sta fallendo.]\n\n2. L\'OBIETTIVO\n[Spiega cosa risolve questa legge e come.]\n\n3. IMPACT PREVISTO\n[Descrivi le conseguenze sociali, economiche o legali.]';

  @override
  String get civicSubmitButton => 'INVIA BOZZA (EMAIL)';

  @override
  String get civicFooterCopyright =>
      '© 2025 Iniziativa Lustra.\nInfrastruttura per l\'Era Civica.';

  @override
  String civicEmailSubject(Object parliamentName) {
    return '[Invio LDS-1] Titolo Progetto - $parliamentName';
  }

  @override
  String get civicEmailBodyPlaceholder =>
      '[INCOLLA IL TUO MODELLO QUI]\n\nAutore / Organizzazione:\nInfo Contatto:\n';

  @override
  String get civicEmailDialogTitle => 'Client Email Non Trovato';

  @override
  String get civicEmailDialogIntro =>
      'Si prega di copiare i dettagli qui sotto e inviare manualmente:';

  @override
  String get civicEmailDialogRecipient => 'Destinatario';

  @override
  String get civicEmailDialogSubject => 'Oggetto';

  @override
  String get civicEmailDialogBody => 'Corpo';

  @override
  String get civicCopiedToClipboard => 'Copiato negli appunti';

  @override
  String get civicTemplateCopied => 'Modello copiato!';

  @override
  String get supportMegaTitle => 'Proprietà Civica';

  @override
  String get verificationRequiredTitle => 'Verifica richiesta';

  @override
  String get verificationRequiredContent =>
      'Per contare il tuo voto nella classifica, dobbiamo confermare che sei umano.\n\nControlla la tua casella di posta (inclusa la cartella SPAM).';

  @override
  String get verificationResendLink => 'Invia di nuovo il link';

  @override
  String get verificationLinkSentSuccess => 'Link inviato di nuovo!';

  @override
  String get verificationAlreadyConfirmed => 'Ho confermato';

  @override
  String get verificationSuccessVotingUnlocked => 'Grazie! Ora puoi votare.';

  @override
  String get verificationStillNotVerified =>
      'Conferma non ancora trovata. Riprova tra un attimo.';

  @override
  String get cancel => 'Annulla';

  @override
  String get pollVoteSignificance => 'Il tuo voto è solo l\'inizio.';

  @override
  String get pollShareImpact =>
      'Gli algoritmi spesso ci mettono a tacere. La tua singola condivisione raggiunge in media 50-300 persone. Aiutaci a rompere la bolla dei social media.';

  @override
  String get pollShareAction => 'Condividi e amplifica la voce dei cittadini';

  @override
  String get listRefreshed => 'Lista aggiornata!';

  @override
  String get errorNoDataReturned => 'Nessun dato restituito';

  @override
  String get errorMustBeLoggedInToSubscribe => 'Devi accedere per iscriverti.';

  @override
  String get subscribedToList => 'Iscritto alla lista!';

  @override
  String get unsubscribedFromList => 'Iscrizione annullata.';

  @override
  String get errorListRemovedByOwner => 'Lista rimossa dal proprietario...';

  @override
  String get errorFailedToUpdateSubscription =>
      'Impossibile aggiornare l\'iscrizione.';

  @override
  String get notificationSentCooldownActive =>
      'Notifica inviata agli iscritti!...';

  @override
  String get errorCooldownActiveNotification =>
      'Blocco attivo. Puoi inviare...';

  @override
  String get errorFailedToSendNotification =>
      'Impossibile inviare la notifica.';

  @override
  String get nameYourCuratorList => 'Nomina la tua Lista d\'Autore';

  @override
  String get hintCuratorListExample => 'es. La mia politica economica';

  @override
  String listCreatedSuccess(String text) {
    return 'Lista \'$text\' creata!';
  }

  @override
  String get errorFailedToCreateList => 'Impossibile creare la lista.';

  @override
  String get actionCreate => 'Crea';

  @override
  String get unnamedList => 'Lista senza nome';

  @override
  String get tooltipEditList => 'Modifica Lista';

  @override
  String get addDescriptionHint => 'Aggiungi una descrizione...';

  @override
  String subscribersCount(int subs) {
    return '$subs iscritti';
  }

  @override
  String get actionShareList => 'Condividi Lista';

  @override
  String get actionSupportCreator => 'Supporta il Creatore';

  @override
  String availableInHours(int hoursLeft) {
    return 'Disponibile in ${hoursLeft}h';
  }

  @override
  String get actionNotifySubscribers => 'Notifica Iscritti';

  @override
  String get actionSubscribed => 'Iscritto';

  @override
  String get actionSubscribe => 'Iscriviti';

  @override
  String get tooltipReportList => 'Segnala Lista';

  @override
  String get tooltipDeleteList => 'Elimina Lista';

  @override
  String get draftYourCivicProject => 'Redigi il tuo progetto cittadino';

  @override
  String get draftCivicProjectDescription =>
      'Trasforma le tue idee in veri e propri disegni di legge e raccogli consensi. Lustra è pronta per le tue politiche.';

  @override
  String get createYourOwnList => 'Crea la tua lista';

  @override
  String get createYourOwnListDescription =>
      'Diventa un curatore. Seleziona i disegni di legge importanti, invita follower e invia notifiche ai loro dispositivi per tenerli aggiornati sui cambiamenti nella tua lista di legislazione o nei progetti cittadini.';

  @override
  String get editListDetails => 'Modifica Dettagli';

  @override
  String get listNameLabel => 'Nome della Lista';

  @override
  String get descriptionOptionalLabel => 'Descrizione (Opzionale)';

  @override
  String get supportCreatorOptionalLabel => 'Supporta il Creatore (Opzionale)';

  @override
  String providerUsernameLabel(String provider) {
    return 'Nome utente $provider';
  }

  @override
  String get listUpdatedSuccess => 'Lista aggiornata!';

  @override
  String get errorFailedToUpdate => 'Impossibile aggiornare.';

  @override
  String get actionSave => 'Salva';

  @override
  String get deleteListDialogTitle => 'Eliminare la Lista?';

  @override
  String get deleteListDialogBody => 'Questa azione è irreversibile...';

  @override
  String get listDeletedSuccess => 'Lista eliminata.';

  @override
  String get errorFailedToDelete => 'Impossibile eliminare.';

  @override
  String get actionDelete => 'Elimina';

  @override
  String get syncingCuratedFeed => 'SINCRONIZZAZIONE LISTA D\'AUTORE...';

  @override
  String get actionTryAgain => 'Riprova';

  @override
  String get tooltipSetAsListCover => 'Imposta come copertina';

  @override
  String get coverUpdatedSuccess => 'Copertina aggiornata!';

  @override
  String get errorUpdatingCover => 'Errore durante l\'aggiornamento.';

  @override
  String get loaderLoadingProfile => 'CARICAMENTO PROFILO...';

  @override
  String get loaderRetrievingVoteLogs => 'RECUPERO REGISTRI DI VOTO...';

  @override
  String get loaderLoadingRecentVotes => 'CARICAMENTO VOTI RECENTI...';

  @override
  String get loaderFetchingData => 'RECUPERO DATI...';

  @override
  String get loaderLoadingTrackedBills => 'CARICAMENTO LEGGI MONITORATE...';

  @override
  String get emptyTrackedBills => 'Non stai monitorando alcuna legge.';

  @override
  String get notificationsMobileOnly => 'Notifiche disponibili solo nell\'app.';

  @override
  String get titleYourTrackedBills => 'Leggi Monitorate';

  @override
  String get buttonSeeAllTracked => 'Vedi tutto';

  @override
  String get titleNameYourList => 'Nomina la tua Lista';

  @override
  String get hintEgMySocialPolicies => 'es. Le mie politiche sociali';

  @override
  String snackbarListCreated(String text) {
    return 'Lista \'$text\' creata!';
  }

  @override
  String get snackbarFailedToCreateList => 'Impossibile creare la lista.';

  @override
  String get buttonCreate => 'Crea';

  @override
  String get titleRenameYourList => 'Rinomina Lista';

  @override
  String get snackbarListRenamed => 'Lista rinominata!';

  @override
  String get snackbarFailedToRenameList => 'Impossibile rinominare.';

  @override
  String get buttonSave => 'Salva';

  @override
  String get titleYourLists => 'Le tue Liste';

  @override
  String get emptyNoListsYet => 'Non hai ancora nessuna lista.';

  @override
  String get tooltipRename => 'Rinomina';

  @override
  String get snackbarErrorUpdatingList => 'Errore durante l\'aggiornamento.';

  @override
  String get tooltipShareList => 'Condividi Lista';

  @override
  String get buttonCreateNewList => 'Crea Nuova Lista';

  @override
  String get errorLimitOf3ListsReached => 'Limite di 3 liste raggiunto.';

  @override
  String get snackbarFailedToDelete => 'Impossibile eliminare.';

  @override
  String get loaderFetchingMirrorParliamentData =>
      'RECUPERO DATI DEL PARLAMENTO SPECCHIO...';

  @override
  String get loaderSecuringSafeChannel => 'CRITTOGRAFIA CONNESSIONE...';

  @override
  String get snackbarAddedToList => 'Aggiunto alla tua lista.';

  @override
  String get snackbarRemovedFromList => 'Rimosso dalla lista.';

  @override
  String get loaderLoadingData => 'CARICAMENTO DATI...';

  @override
  String get buttonAddToList => 'Aggiungi alla Lista';

  @override
  String get previousStatusLabel => 'Precedentemente:';

  @override
  String get statusLabel => 'Stato:';

  @override
  String get loaderEstablishingConnection => 'CONNESSIONE IN CORSO...';

  @override
  String get loaderFetchingInitiatives => 'RECUPERO INIZIATIVE...';

  @override
  String get loaderLoadingMoreInitiatives => 'CARICAMENTO ALTRE INIZIATIVE...';

  @override
  String get loaderLoadingMore => 'CARICAMENTO IN CORSO...';

  @override
  String get errorMustBeLoggedInToTrack =>
      'Devi accedere per monitorare. Crea un account.';

  @override
  String get loaderLoadingYourTrackedList =>
      'CARICAMENTO LISTA DI MONITORAGGIO...';

  @override
  String get emptyNotTrackingAnything => 'Non stai monitorando nulla.';

  @override
  String get loaderLoadingLegislativeData => 'CARICAMENTO DATI LEGISLATIVI...';

  @override
  String get loaderAuthorizing => 'AUTORIZZAZIONE...';

  @override
  String get loaderLoading => 'CARICAMENTO...';

  @override
  String get snackbarLinkCopied => 'Link copiato negli appunti!';

  @override
  String get civicWillRecord => 'REGISTRO DELLA VOLONTÀ CIVICA';

  @override
  String totalVotesRecorded(String totalVotes) {
    return '$totalVotes VOTI REGISTRATI';
  }

  @override
  String get recordYourPositionForAudit =>
      'Registra la tua posizione per l\'audit.';

  @override
  String get privateList => 'Lista Privata';

  @override
  String get loaderLoadingCuratedFeed => 'CARICAMENTO LISTA D\'AUTORE...';

  @override
  String get buttonOpenFullList => 'Apri Lista Completa';

  @override
  String get filtersLabel => 'Filtri';

  @override
  String get statusFilterLabel => 'Stato';

  @override
  String get onlyWithSourceTextLabel => 'Solo con testo sorgente';

  @override
  String get trackedBillsTitle => 'Leggi Monitorate';

  @override
  String get curatedListTitle => 'Lista Privata';

  @override
  String get loaderLoadingProfiles => 'CARICAMENTO PROFILI...';

  @override
  String get loaderLoadingMoreProfiles => 'CARICAMENTO ALTRI PROFILI...';

  @override
  String get loaderInitializingMirrorParliament =>
      'INIZIALIZZAZIONE PARLAMENTO SPECCHIO...';

  @override
  String get loaderSyncingVectors => 'SINCRONIZZAZIONE VETTORI...';

  @override
  String get reportIncludeDiagnosticsTitle => 'Includi diagnostica di sistema';

  @override
  String get reportIncludeDiagnosticsSubtitle =>
      'Allega lo stato attivo (Parlamento, Legislatura, Obiettivo) per aiutarci a risolvere il problema.';

  @override
  String get loaderSendingReport => 'INVIO REPORT...';

  @override
  String primaryParliamentLabel(String parliament) {
    return 'Principale: $parliament';
  }

  @override
  String get buttonCreateAnotherList => 'Crea un\'altra lista';

  @override
  String get buttonCreateTrackingList => 'Crea Lista di Monitoraggio';

  @override
  String get errorMissingListId => 'Errore: ID Lista mancante';

  @override
  String get actionTracked => 'Monitorato';

  @override
  String get actionTrack => 'Monitora';

  @override
  String pollSupportPercent(String percent) {
    return 'A FAVORE $percent%';
  }

  @override
  String get pollSyncing => 'SINCRONIZZAZIONE...';

  @override
  String pollOpposePercent(String percent) {
    return 'CONTRO $percent%';
  }

  @override
  String get pollPositionRecorded => 'POSIZIONE REGISTRATA';

  @override
  String get pollRestrictedToCitizens => 'RISERVATO AI CITTADINI';

  @override
  String yourListsForCountry(String countryName) {
    return 'Le tue Liste ($countryName)';
  }

  @override
  String get bottomNavGetInvolved => 'Partecipa';

  @override
  String get errorLaunchUrl => 'Impossibile aprire il link';

  @override
  String get infoTechTitle => 'Come funziona la tecnologia';

  @override
  String get infoTechSubtitle =>
      'Scopri la nostra architettura, la sterilizzazione dei dati e i principi del civic tech.';

  @override
  String get infoGovTitle => 'Trasparenza e Governance';

  @override
  String get infoGovSubtitle =>
      'Chi lo costruisce, chi paga e dove stiamo andando.';

  @override
  String get infoPrivacyTitle => 'Costituzione e Privacy';

  @override
  String get infoPrivacySubtitle =>
      'Trasparenza radicale. Quali dati raccogliamo e perché.';

  @override
  String get manualTitle => 'Manuale Aperto del Cittadino';

  @override
  String get manualSubtitle =>
      'Impara a riprendere il controllo nella democrazia.';

  @override
  String get howToActTitle => 'Come agire con Lustra';

  @override
  String get actAuditTitle => 'Audit Cittadino';

  @override
  String get actAuditSubtitle =>
      'Vota le leggi per plasmare le priorità e lasciare prove tangibili della Volontà dei Cittadini. Non lasciare che i media guidino la conversazione.';

  @override
  String get actWatchlistTitle => 'Liste di Monitoraggio';

  @override
  String get actWatchlistSubtitle =>
      'Crea liste personalizzate di disegni di legge per raccogliere iscritti e aumentare la consapevolezza. Usa i social media come forza di lobbying.';

  @override
  String get actDraftTitle => 'Proponi Leggi Cittadine';

  @override
  String get actDraftSubtitle =>
      'Invia le tue iniziative a Lustra. La società moderna ha bisogno di nuove idee non ostacolate dal capitale. Crea, condividi e raccogli supporto.';

  @override
  String get joinCommunityTitle => 'Unisciti alla Community';

  @override
  String get subscribedLists => 'Iscritto';

  @override
  String get snackbarAddedToListWebPromo =>
      'Aggiunto! Scarica l\'app per ricevere notifiche push su questo disegno di legge.';

  @override
  String get aboutGovAppBar => 'Governance';

  @override
  String get aboutGovTitle => 'Trasparenza e Governance';

  @override
  String get aboutGovSubtitle =>
      'Chi costruisce questo sistema, chi lo paga e dove stiamo andando.';

  @override
  String get aboutGovFounderName => 'Jacek (Fons)';

  @override
  String get aboutGovFounderBadge => 'ARCHITETTO SOLISTA / FONDATORE';

  @override
  String get aboutGovFounderP1 =>
      'Non sono un politico, un avvocato o un accademico. Non ho credenziali formali. 18 mesi fa facevo le pulizie. Ho trascorso l\'intero 2025 disoccupato, costruendo questo sistema da zero su un laptop del 2016.';

  @override
  String get aboutGovFounderP2 =>
      'Perché? Perché ero frustrato dal fatto che miliardari e corporazioni avessero strumenti di analisi dei dati migliori dei cittadini. Ero frustrato dall\'esclusione dei cittadini dalla legge e dalle guerre di narrazione lanciate dai media, che o allontanano le persone dalla politica o le costringono a scegliere uno schieramento. Ho imparato tutto da solo per costruire un Parlamento Specchio. Non credo nelle petizioni online; credo nella trasparenza dura, basata sui dati e sull\'accessibilità. E nel fatto che la democrazia abbia bisogno di un aggiornamento.';

  @override
  String get aboutGovFounderP3 =>
      'Potresti chiederti: \"Perché dovrei fidarmi di te?\". Non fidarti di nessuno, specialmente in politica: inizia a verificare i dati (audit).';

  @override
  String get aboutGovSec1Title => '1. Finanziamenti e Infrastruttura';

  @override
  String get aboutGovSec1Intro =>
      'Non ci sono capitali di rischio (VC). Non ci sono fondi oscuri. Non ci sono criptovalute. Attualmente, questa operazione è completamente autofinanziata (bootstrapped).';

  @override
  String get aboutGovSec1Bullet1Title => 'Infrastruttura:';

  @override
  String get aboutGovSec1Bullet1Text =>
      'Coperta da una sovvenzione in crediti di 2.000 \$ dal programma Google For Startups. Al momento ci restano circa 1.200 \$, che ci garantiscono circa 12 mesi di autonomia per i server (runway).';

  @override
  String get aboutGovSec1Bullet2Title => 'Costo della vita:';

  @override
  String get aboutGovSec1Bullet2Text =>
      'Sostenuto interamente dai miei risparmi personali, dalla mia fidanzata e dalla mia famiglia.';

  @override
  String get aboutGovSec1Bullet3Title => 'Stack Tecnologico (Tech Stack):';

  @override
  String get aboutGovSec1Bullet3Text =>
      'Costruito da solo (Flutter, Firebase, Vertex AI pipeline, Node.js) per mantenere i costi operativi prossimi allo zero.';

  @override
  String get aboutGovSec2Title => '2. Attuale Entità Legale e Transizione';

  @override
  String get aboutGovSec2P1 =>
      'Lustra è attualmente in fase di incubazione sotto la mia vecchia SRL polacca (FO&WO VENTURES SP. Z O.O.). Questa è una necessità legale. Per pubblicare sugli App Store di Apple/Google e per ricevere i crediti per startup da Google, è necessaria una società registrata con un numero DUNS. Non posso ancora permettermi le spese legali per avviare una Fondazione (oltre 500 \$ di costi di configurazione e contabilità mensile), quindi utilizzo il veicolo più snello possibile.';

  @override
  String get aboutGovSec2BoxTitle =>
      'La Tabella di Marcia verso il Non-Profit:';

  @override
  String get aboutGovSec2BoxText =>
      'Non appena raggiungeremo la liquidità finanziaria e la massa critica (circa 100k utenti mensili), ho in programma di aprire un\'organizzazione Non-Profit formale e di trasferirvi tutta la proprietà intellettuale e l\'infrastruttura.';

  @override
  String get aboutGovSec2P2 =>
      'L\'obiettivo finale è una struttura di governance democratica. Le decisioni saranno prese da un consiglio eletto dalla comunità. Il mio ruolo sarà strettamente limitato alla manutenzione tecnica del backend. Non vedo alcun altro futuro per Lustra se non un\'operazione non-profit con la piena trasparenza di tutti i documenti finanziari.';

  @override
  String get aboutGovSec3Title => '3. Sicurezza e Codice Sorgente';

  @override
  String get aboutGovSec3Bullet1Title => 'Autenticazione:';

  @override
  String get aboutGovSec3Bullet1Text =>
      'Non tocchiamo le tue password. Utilizziamo l\'autenticazione Google/Apple perché la loro infrastruttura di sicurezza è superiore. Memorizziamo solo un ID Utente anonimizzato e l\'ID del tuo Voto per impedire l\'azione di bot farm.';

  @override
  String get aboutGovSec3Bullet2Title =>
      'Codice Sorgente Disponibile (Source Available):';

  @override
  String get aboutGovSec3Bullet2Text =>
      'I repository principali sono pubblici sotto la Licenza Open Source (AGPLv3). Questo protegge il progetto dalla clonazione aziendale, ma gli adattatori di dati, i prompt di sistema dell\'IA e la logica sono completamente visibili per eventuali audit.';

  @override
  String get aboutGovSec3BoxTitle => 'Abbiamo bisogno di aiuto.';

  @override
  String get aboutGovSec3BoxText =>
      'Sono un ragazzo con un vecchio laptop che fa tutto da solo. Se sei uno sviluppatore, un giornalista o un cittadino che vuole aiutare a creare cellule locali nel tuo paese, contattaci.';

  @override
  String get aboutGovSec3Contact => 'Contatti: jacek@lustra.dev';

  @override
  String get aboutGovSec3Github => 'Profilo GitHub';

  @override
  String get termsAppBar => 'Costituzione e Privacy';

  @override
  String get termsTitle => 'Costituzione e Privacy';

  @override
  String get termsLastUpdated => 'Ultimo aggiornamento: 12 marzo 2026';

  @override
  String get termsAlertTitle =>
      'Trasparenza Radicale: Cosa raccogliamo veramente';

  @override
  String get termsAlertP1 =>
      'Potresti pensare: \"Non darò i miei dati a degli sconosciuti\". Siamo d\'accordo. Ecco perché non vogliamo la tua vita privata. Vogliamo solo verificare che tu sia un vero essere umano che vota su leggi reali.';

  @override
  String get termsAlertP2 =>
      'Ecco l\'esatta struttura dei dati che memorizziamo per il tuo profilo utente nel nostro database Google Cloud Firestore. Nessun campo nascosto. Nessun cookie di tracciamento.';

  @override
  String get termsAlertCode =>
      '[\n  \'uid\': \'0A21rfdsTs1F3kYsx3252352\', // Generato da Firebase Auth\n  \'email\': \'cittadino@example.com\', // Il tuo unico dato personale\n  \'createdAt\': \'February 15, 2026 at 8:23:31 PM UTC\',\n  \'marketingConsent\': true, // Per aggiornamenti sul progetto (opzionale)\n  \'primaryParliamentId\': \'Parlamento Italiano\'\n]';

  @override
  String get termsAlertH4 =>
      'Aspetta, dove sono i miei voti e le leggi monitorate?';

  @override
  String get termsAlertP3 =>
      'Per proteggere la tua privacy e garantire che il nostro database sia scalabile in modo efficiente, le tue interazioni sono separate (sharded) dal tuo profilo principale:';

  @override
  String get termsAlertB1Title => 'Leggi Monitorate:';

  @override
  String get termsAlertB1Text =>
      'Memorizzate in una sub-collection privata. Solo tu (e il tuo dispositivo) potete richiedere di vedere la lista delle leggi che state monitorando.';

  @override
  String get termsAlertB2Title => 'I Tuoi Voti (Hashing Crittografico):';

  @override
  String get termsAlertB2Text =>
      'Quando voti, NON colleghiamo il tuo UID direttamente al registro di voto pubblico. Invece, il server genera un Hash crittografico (es. a1b2c3d4...) utilizzando un \"salt\" segreto del server. Questo pseudonimizza fortemente il tuo voto. Se un hacker ruba il database, non può vedere chi ha votato per cosa. Anche se matematicamente è una funzione unidirezionale, nello spirito della trasparenza assoluta, devi sapere che gli operatori di sistema (che possiedono il salt segreto) potrebbero teoricamente verificare un voto per controllare eventuali frodi nel sistema o conformarsi a un ordine del tribunale valido. Tuttavia, i tuoi voti sono rigorosamente separati dal tuo profilo quotidiano e non vengono mai visualizzati pubblicamente con la tua identità.';

  @override
  String get termsAlertP4 =>
      'Questo è tutto. Il resto è analisi anonima (Firebase Analytics) per correggere i bug e App Check per impedire alle bot-farm di truccare i voti. Non vendiamo dati. Non pubblichiamo annunci pubblicitari.';

  @override
  String get termsTocTitle => 'Sommario';

  @override
  String get termsPart1Title =>
      'Parte 1: Informativa sulla Privacy (Minimizzazione dei Dati)';

  @override
  String get termsPart1Intro =>
      'Non commerciamo con la tua attenzione. Raccogliamo solo ciò che è tecnicamente necessario per gestire un\'infrastruttura civica sicura.';

  @override
  String get termsP1S1Title => '1. Titolare del Trattamento dei Dati';

  @override
  String get termsP1S1Text =>
      'L\'operatore legale è temporaneamente FO&WO VENTURES SP. Z O.O. (SRL), con sede a Breslavia (Wrocław), Polonia. Contatti: jacek@lustra.dev';

  @override
  String get termsP1S2Title => '2. Cosa Raccogliamo';

  @override
  String get termsP1S2B1Title => 'Account (Email/UID):';

  @override
  String get termsP1S2B1Text =>
      'Necessario per l\'accesso sicuro tramite Firebase Authentication.';

  @override
  String get termsP1S2B2Title => 'Voti e Sondaggi (Anonimizzati):';

  @override
  String get termsP1S2B2Text =>
      'I tuoi voti costruiscono le statistiche. Sono collegati al tuo account esclusivamente per prevenire bot farm e voti doppi. Pubblicamente, i tuoi voti vengono visualizzati SOLO come aggregati anonimi. Il record di voto effettivo viene sottoposto a hashing crittografico per separare la tua identità dalla tua scelta politica.';

  @override
  String get termsP1S2B3Title => 'Leggi Monitorate e Notifiche Push:';

  @override
  String get termsP1S2B3Text =>
      'Se scegli di monitorare una legge o iscriverti a una Lista Curata, utilizziamo gli argomenti (Topics) di Firebase Cloud Messaging (FCM) di Google. Questo ci consente di inviarti notifiche push sui cambiamenti di stato senza tracciare costantemente la tua posizione o l\'identità del tuo dispositivo.';

  @override
  String get termsP1S2B4Title => 'Conservazione dei Voti:';

  @override
  String get termsP1S2B4Text =>
      'I dati di voto vengono conservati per tutta la durata del mandato parlamentare più 5 anni per scopi di archiviazione e ricerca.';

  @override
  String get termsP1S2B5Title => 'Comunicazione:';

  @override
  String get termsP1S2B5Text =>
      'Se acconsenti esplicitamente, ti invieremo gli aggiornamenti del progetto via email. Puoi revocare il consenso in qualsiasi momento.';

  @override
  String get termsP1S2B6Title => 'Progetti dei Cittadini:';

  @override
  String get termsP1S2B6Text =>
      'Il contenuto delle bozze legislative da te presentate è interamente pubblico.';

  @override
  String get termsP1S2Highlight =>
      '3. COSA NON FACCIAMO:\n\n❌ NON vendiamo dati ai data broker.\n❌ NON utilizziamo tracciamento pubblicitario.\n❌ NON ti profiliamo politicamente per scopi commerciali.';

  @override
  String get termsP1S3Title => '4. Infrastruttura e Sicurezza';

  @override
  String get termsP1S3B1Title => 'Posizione:';

  @override
  String get termsP1S3B1Text =>
      'I dati sono ospitati in modo sicuro su Google Cloud Platform, Europe-West9 (Parigi).';

  @override
  String get termsP1S3B2Title => 'Anti-Bot:';

  @override
  String get termsP1S3B2Text =>
      'Utilizziamo Firebase App Check per verificare l\'autenticità dell\'app e prevenire manipolazioni automatizzate.';

  @override
  String get termsP1S3B3Title => 'Privacy e Intelligenza Artificiale:';

  @override
  String get termsP1S3B3Text =>
      'Inviamo ai modelli di IA solo documenti governativi pubblici per il riepilogo. I tuoi dati privati NON vengono MAI inviati all\'IA.';

  @override
  String get termsP1S4Title => '5. Bambini e Cancellazione dell\'Account';

  @override
  String get termsP1S4P1 =>
      'Il servizio è destinato a utenti di età superiore a 16 anni. Non raccogliamo intenzionalmente dati di minori.';

  @override
  String get termsP1S4P2 =>
      'Per eliminare i tuoi dati: Utilizza il pulsante \"Elimina Account\" direttamente nelle impostazioni dell\'app per rimuovere immediatamente i tuoi dati identificativi, l\'email e tutte le tue sub-collection dai nostri server.';

  @override
  String get termsP1S5Title => '6. I Tuoi Diritti';

  @override
  String get termsP1S5Text =>
      'Ai sensi del GDPR, hai il diritto di accedere, rettificare, cancellare e opporti al trattamento dei tuoi dati. Contattaci all\'indirizzo email fornito sopra.';

  @override
  String get termsPart2Title =>
      'Parte 2: Regole della Comunità (Termini di Servizio)';

  @override
  String get termsP2S1Title => '1. Operatore e Missione';

  @override
  String get termsP2S1Text =>
      'Lustra è un\'infrastruttura pubblica digitale. L\'azienda funge da incubatore: non paga dividendi, non ha investitori esterni e reinveste ogni entrata direttamente nel mantenimento dell\'infrastruttura.';

  @override
  String get termsP2S2Title => '2. Codice e Licenza (Source Available)';

  @override
  String get termsP2S2Intro =>
      'Il codice di Lustra è un bene comune protetto dallo sfruttamento aziendale.';

  @override
  String get termsP2S2B1Title => 'Modello:';

  @override
  String get termsP2S2B1Text => 'Licenza Open Source (AGPLv3).';

  @override
  String get termsP2S2B2Title => 'Consentito:';

  @override
  String get termsP2S2B2Text =>
      'Uso educativo, di ricerca e non-profit/civico.';

  @override
  String get termsP2S2B3Title => 'Vietato:';

  @override
  String get termsP2S2B3Text =>
      'Le aziende non possono utilizzare o trarre profitto dal nostro lavoro senza l\'esplicito consenso della comunità.';

  @override
  String get termsP2S3Title => '3. Tabella di Marcia della Governance';

  @override
  String get termsP2S3Intro =>
      'Il nostro obiettivo a lungo termine è la piena decentralizzazione.';

  @override
  String get termsP2S3B1Title => 'Stato attuale:';

  @override
  String get termsP2S3B1Text =>
      'Il Fondatore agisce come Architetto Principale (Lead Architect).';

  @override
  String get termsP2S3B2Title => 'A breve:';

  @override
  String get termsP2S3B2Text =>
      'Creazione di un Consiglio Civico (Civic Board) eletto direttamente dagli utenti.';

  @override
  String get termsP2S3B3Title => 'Obiettivo:';

  @override
  String get termsP2S3B3Text =>
      'Implementare meccanismi tecnici e legali affinché la comunità possa assumere il controllo della piattaforma in caso di tradimento della missione.';

  @override
  String get termsP2S4Title =>
      '4. Programma delle Bozze dei Cittadini (Incubatore di Leggi)';

  @override
  String get termsP2S4Intro =>
      'Forniamo uno spazio in cui i cittadini possono scrivere le leggi.';

  @override
  String get termsP2S4B1Title => 'Procedura:';

  @override
  String get termsP2S4B1Text =>
      'Le bozze vengono presentate tramite modulo e verificate formalmente dall\'Operatore.';

  @override
  String get termsP2S4B2Title => 'Pubblico Dominio:';

  @override
  String get termsP2S4B2Text =>
      'Inviando una bozza, la rilasci sotto la Licenza CC0 (Pubblico Dominio). La legge appartiene a tutti.';

  @override
  String get termsP2S4B3Title => 'Libertà di Espressione:';

  @override
  String get termsP2S4B3Text =>
      'Non giudichiamo opinioni o inclinazioni politiche. Rifiutiamo solo progetti che violano il diritto penale o incitano alla violenza.';

  @override
  String get termsP2S4B4Title => 'Verifica:';

  @override
  String get termsP2S4B4Text =>
      'Devi essere un cittadino del paese in cui presenti una bozza.';

  @override
  String get termsP2S5Title =>
      '5. Intelligenza Artificiale e Gerarchia delle Fonti';

  @override
  String get termsP2S5Text =>
      'L\'IA è uno strumento, non un oracolo. L\'IA aiuta a navigare nel complesso linguaggio legale, ma può commettere errori. L\'autorità suprema è SEMPRE il documento originale in PDF/XML linkato in fondo a ogni riepilogo nell\'app.';

  @override
  String get termsP2S6Title => '6. Sicurezza e Disposizioni Finali';

  @override
  String get termsP2S6Text =>
      'Gli attacchi all\'infrastruttura, il DDoS e lo scraping commerciale sono severamente vietati. Le questioni non regolate nel presente documento sono decise dalla legge polacca.';

  @override
  String get bpAppBar => 'Architettura del Sistema';

  @override
  String get bpTitle =>
      'Come Riconquistiamo il Controllo nella Democrazia con il Parlamento Specchio: Manuale per i Cittadini';

  @override
  String get bpIntroBig =>
      'Il Quadro Generale: L\'attuale sistema democratico è un \"telefono senza fili\" rotto. Ripariamo il segnale collegando i cittadini direttamente al processo legislativo tramite il Parlamento Specchio (Lustra).';

  @override
  String get bpIntroSmall =>
      'Perché è importante: Attualmente, votiamo solo ogni pochi anni. Tra un\'elezione e l\'altra, abbiamo zero controllo. Lustra ci dà un \"posto a tavola\" ogni singolo giorno.';

  @override
  String get bpS1Title => '1. IL PROBLEMA: Un Ciclo Interrotto';

  @override
  String get bpS1P1 =>
      'L\'informazione fluisce in una sola direzione e viene distorta.';

  @override
  String get bpS1Code =>
      'I cittadini eleggono i politici\n   ↓\nI politici formano un Governo\n   ↓\nI media interpretano selettivamente le azioni del governo\n   ↓\nI cittadini ricevono un feedback (distorto)';

  @override
  String get bpS1Highlight =>
      'Risultato: Non sappiamo cosa stia realmente accadendo a causa del gergo legale e del rumore mediatico.';

  @override
  String get bpS2Title => '2. LA SOLUZIONE: Riparare il Flusso di Informazioni';

  @override
  String get bpS2P1 =>
      'Lustra elimina gli intermediari. Simula un vero centro di potere in cui il tuo voto viene registrato su specifici disegni di legge, non solo in sondaggi generici.';

  @override
  String get bpS2FlowMedia => 'MEDIA (osservatore opzionale)';

  @override
  String get bpS2Flow1 => 'I cittadini vedono una bozza di legge e la valutano';

  @override
  String get bpS2Flow2 => 'I politici vedono il risultato della volontà civica';

  @override
  String get bpS2Flow3 => 'I politici votano (monitorati rispetto ai dati)';

  @override
  String get bpS2Flow4 =>
      'I cittadini controllano: Il politico ha rispettato i dati?';

  @override
  String get bpS2Flow5 =>
      'I cittadini scelgono i politici in base al loro \"Punteggio di Obbedienza\" (Obedience Score)';

  @override
  String get bpS2Flow6 => 'Viene formato un nuovo Governo.';

  @override
  String get bpS2FlowLoop => 'IL CICLO SI RIPETE';

  @override
  String get bpS3Title => '3. COME FUNZIONA';

  @override
  String get bpS3ATitle =>
      'Fase A: Rimozione della Barriera Linguistica (Traduzione)';

  @override
  String get bpS3AP1 =>
      'La maggior parte delle leggi è noiosa e illeggibile. Lustra colma il Divario di Accessibilità.';

  @override
  String get bpS3AP2 =>
      'Vantaggio: 20 secondi per capire i fatti. Nessun gergo.';

  @override
  String get bpS3BTitle =>
      'Fase B: Distribuzione della Conoscenza (La Scheda Informativa)';

  @override
  String get bpS3BP1 =>
      'Lustra non ha bisogno di milioni di utenti per funzionare. Basta che ci sia Tu.';

  @override
  String get bpS3BList1Title => 'La tua azione:';

  @override
  String get bpS3BList1Text =>
      'Entri, vedi un argomento e generi una Scheda Informativa (Fact Card) con un clic.';

  @override
  String get bpS3BList2Title => 'Copertura:';

  @override
  String get bpS3BList2Text =>
      'Condivisione automatica sui tuoi social media (FB, X, IG, ecc.).';

  @override
  String get bpS3BList3Title => 'Effetto:';

  @override
  String get bpS3BList3Text =>
      'I tuoi amici ricevono un \"pasto pronto\" verificato dai fatti senza aver bisogno dell\'app. Diventi una fonte di informazione indipendente.';

  @override
  String get bpS3BExample => 'Esempio:';

  @override
  String get bpS3CTitle => 'Fase C: Riconquistare il Controllo (La Pressione)';

  @override
  String get bpS3CP1 =>
      'I politici e le corporazioni ignorano le \"tempeste su internet\" perché sono caotiche, facili da censurare e scompaiono rapidamente.';

  @override
  String get bpS3CList1Title => 'Soluzione:';

  @override
  String get bpS3CList1Text =>
      'Votazioni Sociali Verificate. Il tuo voto è collegato a un ID di un documento legislativo specifico.';

  @override
  String get bpS3CList2Title => 'Differenza:';

  @override
  String get bpS3CList2Text =>
      'Queste non sono petizioni che scadono. Sono firme concrete di account verificati.';

  @override
  String get bpS3CP2 =>
      'Se 50.000 persone votano contro un disegno di legge, si crea una prova inconfutabile della mancanza di supporto sociale. Questo non può essere \"insabbiato\" da una narrazione televisiva.';

  @override
  String get bpS4Title => '4. OFFENSIVA CIVICA: Noi Scriviamo le Leggi';

  @override
  String get bpS4P1 => 'Il governo ignora un problema? Noi non aspettiamo.';

  @override
  String get bpS4List1Title => 'Bozze Civiche:';

  @override
  String get bpS4List1Text =>
      'Creiamo i nostri disegni di legge e raccogliamo firme digitali.';

  @override
  String get bpS4List2Title => 'La Trappola:';

  @override
  String get bpS4List2Text =>
      'Se rifiutano una legge popolare per cavilli tecnici, applichiamo emendamenti e la ripresentiamo.';

  @override
  String get bpS4List3Title => 'La Scelta:';

  @override
  String get bpS4List3Text =>
      'Ignorare una soluzione pronta e popolare dimostra malafede. Fornisce all\'opposizione un\'arma gratuita per conquistare l\'elettorato.';

  @override
  String get bpS4CtaTitle => 'Sostieni queste Bozze Civiche ORA!';

  @override
  String get bpS4CtaP1 =>
      'Clicca qui sotto per esaminare e votare le proposte di legge:';

  @override
  String get bpS4Card1Title => 'Legge sul Definanziamento della Classe Epstein';

  @override
  String get bpS4Card1Desc =>
      'Taglia i finanziamenti pubblici per le figure coinvolte nel traffico e nelle violazioni dei diritti umani.';

  @override
  String get bpS4Card2Title => 'Emendamento sui Limiti di Mandato';

  @override
  String get bpS4Card2Desc =>
      'Stabilisce un limite rigoroso alla durata della carriera in Parlamento.';

  @override
  String get bpS4Card3Title => 'Legge sull\'Etica Parlamentare';

  @override
  String get bpS4Card3Desc =>
      'Implementa il divieto di compravendita di azioni per i membri attivi del Parlamento.';

  @override
  String get bpS5Title => '5. RISULTATO FINALE: Pulizia Politica';

  @override
  String get bpS5P1 =>
      'Niente più nascondigli. Il dibattito torna dove sono le persone: sui social media, ma con nuove regole. Questa è la realizzazione della promessa originale di Internet che il sistema temeva: il controllo decentralizzato del potere.';

  @override
  String get bpS5P2 =>
      'Il Parlamento Specchio accende la luce in una stanza buia, forziamo la TRASPARENZA. Un politico non può mentire dicendo che \"la gente vuole questo\" quando i dati mostrano il contrario. Le nuove leggi servono il bene comune, non il capitale.';

  @override
  String get bpS5P3 =>
      'Non stiamo chiedendo ai politici di cambiare. Stiamo creando un sistema in cui mentire sul sostegno pubblico diventa impossibile. Questa è la democrazia basata sui dati.';

  @override
  String get bpS5Highlight =>
      'Questa è un\'introduzione alla democrazia diretta, basata su una voce consapevole e informata, non sulle emozioni.';

  @override
  String get caAppBar => 'Audit Civico';

  @override
  String get caTitle =>
      'Audit Civico: Un Nuovo Sistema per una Democrazia Migliore';

  @override
  String get caIntro =>
      'Nessuno valuta il processo legislativo a parte poche persone a porte chiuse e l\'occasionale giornalista indipendente che espone la corruzione. Di conseguenza, la legislazione spesso si allontana dai bisogni civici, dando priorità agli interessi politici o aziendali rispetto all\'adattamento della società. Il nostro obiettivo finale è semplice: una società che vota sulle politiche reali, non che elegge semplicemente singoli politici sperando che mantengano le promesse. Il Parlamento Specchio è stato costruito per rendere questa transizione facile e realizzabile.';

  @override
  String get caS1Title => 'In cosa l\'Audit Civico è diverso dalle petizioni?';

  @override
  String get caS1PetitionsTitle => 'Petizioni Tradizionali';

  @override
  String get caS1PetitionsText =>
      'Le petizioni raramente funzionano a causa della loro natura effimera. Dopo aver raccolto le firme, la campagna finisce. In sostanza, è una richiesta educata rivolta a una persona al potere. Poiché si tratta di campagne a tempo limitato che si basano su un breve ciclo mediatico, i politici possono facilmente ignorarle. Aspettano semplicemente che i media cambino narrazione e la petizione viene dimenticata.';

  @override
  String get caS1LustraTitle => 'Volontà Civica di Lustra';

  @override
  String get caS1LustraText =>
      'Noi non chiediamo. In Lustra, il tuo voto non è solo una firma: è ancorato in modo permanente a un solido ID legislativo ufficiale. Segna la tua esatta posizione su una politica specifica. Tutti questi voti si combinano per creare la Volontà Civica (Civic Will): un contatore in tempo reale che mostra esattamente come i cittadini valutano un progetto, chiudendo il cerchio dell\'Audit Civico.';

  @override
  String get caS2Title => 'Perché dovrebbe importare ai politici?';

  @override
  String get caS2Text =>
      'Perché non possono più nascondersi.\n\nRegistriamo ogni loro voto ufficiale al governo e lo confrontiamo direttamente con la Volontà Civica. Non possono più mentire dicendo che \"la gente vuole questo\" solo perché hanno condotto una brillante campagna mediatica. Se votano su qualcosa che avvantaggia una lobby invece dei cittadini, lo scopriamo immediatamente. Più le persone usano Lustra per esporre queste lacune, più diventa difficile per i politici manipolare la narrazione. Riprendiamo il controllo.';

  @override
  String get caS3Title => 'La Parte Migliore: Potere Asimmetrico';

  @override
  String get caS3P1 =>
      'Non abbiamo bisogno dei media tradizionali come fanno i lobbisti. Non abbiamo nemmeno bisogno di 5 milioni di utenti all\'interno dell\'app per aggiornare la democrazia. Abbiamo solo bisogno di Te.\n\nHai già un pubblico al di fuori di Lustra: su Facebook, TikTok, X o altrove. Possiamo finalmente trasformare i social media in qualcosa di significativo. Un solo utente che condivide un disegno di legge può facilmente generare dalle 100 alle 1.000 visualizzazioni con quasi zero sforzo. È come un piccolo stadio di persone che viene informato su un pezzo cruciale di legge o un\'iniziativa civica.';

  @override
  String get caS3MathSubtitle => 'MATEMATICA DELLA GUERRA ASIMMETRICA';

  @override
  String get caS3P2 =>
      'Pensa alla matematica: un think tank aziendale o un gruppo di pressione attivo potrebbe essere composto da 10-15 persone la cui unica leva sono i soldi per comprare favori politici. I vostri 10.000 voti verificati di veri cittadini possono sopraffarli. Possiamo fare esattamente quello che fanno i lobbisti, ma più velocemente, in modo trasparente e con una schiacciante superiorità numerica. I tempi sono cambiati.';

  @override
  String get caS4Title => 'Chi controlla il Feed? Tu.';

  @override
  String get caS4Text =>
      'I media tradizionali e gli algoritmi delle Big Tech ottimizzano i contenuti per l\'indignazione al fine di vendere pubblicità. L\'algoritmo di Lustra è rigorosamente democratico. Non abbiamo redattori che decidono cosa sia \"importante\". Il nostro feed principale valuta automaticamente gli ultimi 30 giorni di legislazione, isola i 5 disegni di legge con il maggior coinvolgimento civico e li mette in primo piano. I tuoi voti dettano la gerarchia delle informazioni. Tu controlli l\'algoritmo.';

  @override
  String get caS5Title =>
      'L\'Arsenale: Come utilizzare le \"Schede dei Fatti\"';

  @override
  String get caS5Intro =>
      'La legislazione è intenzionalmente noiosa. Non è mai stata concepita per essere mainstream. Ecco perché i media creano narrazioni emotive attorno ad essa per vendere pubblicità. Anche tu puoi creare narrazioni, ma le tue saranno costruite su dati grezzi, riassunti e verificati.\n\nLustra produce le Schede dei Fatti (Fact Cards). Ogni volta che clicchi su \"Condividi\", viene generata un\'immagine pulita utilizzando dati ufficiali. Di per sé, è solo un fatto. Sui social media, i fatti devono essere spiegati. Tu sei colui che li spiega. Ecco esattamente come utilizzarli per creare contenuti virali e di grande impatto:';

  @override
  String get caS5A_Title => 'A/ L\'Amo (Crea l\'Angolazione)';

  @override
  String get caS5A_Text =>
      'L\'opzione più semplice è di solito la più riconoscibile. Hai trovato un nuovo disegno di legge sulla censura di Internet nell\'app? Non complicare le cose. Crea un titolo forte (un \"amo\"), dì alle persone esattamente come questo influisce su di loro e inserisci il link diretto a Lustra in modo che possano votare.';

  @override
  String get caS5B_Title => 'B/ La Prova (Per Saggi e Thread)';

  @override
  String get caS5B_Text =>
      'Le immagini sono ottime aggiunte a post più lunghi o incipit. Vuoi evidenziare difetti critici in una proposta di legge o confrontare il riassunto ufficiale del governo? Allega la Scheda dei Fatti come prova innegabile. Lascia che le persone leggano i dati sterilizzati con i propri occhi in 15 secondi.';

  @override
  String get caS5C_Title => 'C/ La Trasmissione (TikTok/Reels)';

  @override
  String get caS5C_Text =>
      'Usa l\'immagine della Scheda dei Fatti con un effetto \"green screen\" su TikTok o Instagram. Metti i dati di Lustra sullo sfondo e registrati mentre spieghi il problema. È il perfetto contenuto breve e verificabile.';

  @override
  String get caS5D_Title => 'D/ La Rete (Messaggi Diretti)';

  @override
  String get caS5D_Text =>
      'Clicca semplicemente su condividi e invia l\'immagine direttamente ai tuoi amici e ai gruppi familiari. Dì loro chiaramente: \"Questo è quello che sta succedendo al governo in questo momento\", oppure \"questo è ciò su cui i media tacciono ora.\"';

  @override
  String get caS5Outro =>
      'La produzione di contenuti è facile e Lustra è il tuo motore di scoperta. Non sei solo un utente. Sei uno dei primi ad adottare la nuova era della democrazia libera dalla corruzione. Hai gli stessi strumenti di un lobbista: usali.';

  @override
  String get caSkepticTitle =>
      'Scettico sulle bot farm o sulla privacy dei dati?';

  @override
  String get caSkepticText =>
      'Bene. Non fidarti delle nostre parole: controlla il nostro sistema. Leggi esattamente come utilizziamo l\'hashing crittografico, Firebase App Check e la licenza Open Source (AGPLv3) per proteggere la tua identità e l\'integrità della Volontà Civica.';

  @override
  String get caSkepticBtnGov => 'Trasparenza e Governance';

  @override
  String get caSkepticBtnPriv => 'Costituzione e Privacy';

  @override
  String get clAppBar => 'Liste Curate';

  @override
  String get clTitle => 'Liste Curate: Media Civici Decentralizzati';

  @override
  String get clIntro =>
      'I governi usano l\'enorme volume della legislazione come un\'arma. Approvano centinaia di pagine di leggi complesse, spesso seppellendo atti controversi dietro titoli noiosi o facendoli passare dalla \"porta sul retro\" mentre i media sono distratti dall\'ultimo scandalo politico. I cittadini perdono di vista il quadro generale perché è fisicamente impossibile monitorare tutto da soli.';

  @override
  String get clS1Title =>
      'Riconoscimento degli Schemi e Mobilitazione di Massa';

  @override
  String get clS1P1 =>
      'Le Liste Curate ti consentono di organizzare il caos e di agire come un nodo di informazione indipendente. Puoi mescolare i disegni di legge ufficiali del governo con le bozze civiche di base, raggrupparli per argomenti specifici e invitare altri a iscriversi.';

  @override
  String get clS1P2 =>
      'Fondamentalmente, una Lista Curata funge da moltiplicatore per l\'Audit Civico. Non stai solo raccogliendo supporto per una legge isolata. Raggruppando fino a 80 elementi, la tua lista diventa un feed dedicato e mirato per i tuoi follower. Possono entrare nella tua lista ed esprimere i loro voti su più leggi in un\'unica sessione, generando massicciamente dati concreti e Volontà Civica per un intero settore politico.';

  @override
  String get clS2Title => 'Come usare le Liste Curate come un\'Arma:';

  @override
  String get clS2A_Title => 'Cani da Guardia del Governo (Watchdogs)';

  @override
  String get clS2A_Text =>
      'Noti che il governo sta cercando di far passare silenziosamente una serie di leggi tecnologiche che invadono la privacy? Raggruppale in una \"Lista sulla Sorveglianza Digitale\". Mostra ai tuoi iscritti l\'agenda nascosta che i media hanno perso e lascia che votino contro tutte loro in un unico posto. Chiedi loro di amplificare il messaggio condividendolo.';

  @override
  String get clS2B_Title => 'Piattaforma per le Riforme';

  @override
  String get clS2B_Text =>
      'Non limitarti a lamentarti dell\'economia. Costruisci una \"Lista di Riforma Economica\" completa e multi-legge, mescolando i tuoi progetti civici con gli emendamenti ufficiali. Presenta una piattaforma politica completamente strutturata.';

  @override
  String get clS2C_Title => 'I Riflettori';

  @override
  String get clS2C_Text =>
      'Puoi fissare un disegno di legge specifico come \"Preferito\" nella tua lista per dirigere la massima attenzione civica e il potere di voto esattamente dove ce n\'è più bisogno.';

  @override
  String get clS3Title => 'La Parte Migliore: Tu Possiedi la Trasmissione';

  @override
  String get clS3Text =>
      'Gli algoritmi dei social media sopprimono costantemente i link esterni per far sì che gli utenti continuino a scorrere. Lustra bypassa tutto questo. Quando le persone si iscrivono alla tua Lista Curata, aggiri completamente le Big Tech. Ti viene fornito un pulsante \"Push\" manuale. Una volta ogni 24 ore, puoi attivare una notifica mobile diretta a tutti i tuoi iscritti, avvisandoli di controllare la tua lista perché è in corso un voto cruciale o è stata aggiunta una nuova legge. Tu controlli la distribuzione.';

  @override
  String get clS4Title => 'L\'Economia dei Creatori per la Democrazia';

  @override
  String get clS4Text =>
      'Una buona cura dei contenuti è estremamente preziosa. Filtrare il rumore politico richiede tempo e competenza. Ecco perché Lustra ti permette di collegare il tuo Barattolo delle Mance (Tip Jar) personale direttamente alla tua Lista Curata. Se fai il duro lavoro di monitorare il governo ed educare il pubblico, i tuoi iscritti possono finanziare i tuoi sforzi direttamente. Noi non prendiamo percentuali.';

  @override
  String get clS5Title => 'Implementazione: Come Iniziare';

  @override
  String get clS5Intro =>
      'Questa non è una funzionalità passiva. Devi costruirla attivamente. Ecco le istruzioni esatte per distribuire la tua prima Lista Curata:';

  @override
  String get clStep1Title => 'Passo 1: Inizializzazione';

  @override
  String get clStep1Text =>
      'Vai alla schermata principale e clicca sull\'icona dell\'ingranaggio (Impostazioni) nell\'angolo in alto. Seleziona l\'opzione per creare la tua prima Lista Curata. Dalle un titolo chiaro.';

  @override
  String get clStep2Title => 'Passo 2: Modalità Curatore';

  @override
  String get clStep2Text =>
      'Una volta inizializzata la tua lista, il sistema ti concede lo status di Curatore. Ora, sfoglia il feed principale. All\'interno della schermata dei dettagli di ogni legge o progetto civico, apparirà un nuovo pulsante \"Aggiungi alla lista\". Cliccalo per inserire quella specifica legge direttamente nella tua lista.';

  @override
  String get clStep3Title => 'Passo 3: Iniezione nel Feed';

  @override
  String get clStep3Text =>
      'La tua Lista Curata non inonda il feed principale. Invece, l\'unico disegno di legge che hai selezionato come \"Preferito\" funge da tuo ambasciatore. Questa singola scheda viene iniettata direttamente nei feed quotidiani dei tuoi iscritti, intrecciandosi perfettamente con la legislazione ufficiale del governo. Viene visualizzata con la stessa identica priorità delle leggi governative ufficiali. Poniamo il controllo civico sullo stesso piano dello Stato.';

  @override
  String get clLimitsTitle => 'LIMITI DI SISTEMA (SEGNALE SUL RUMORE)';

  @override
  String get clLimit1Label => 'AUTORIALITÀ';

  @override
  String get clLimit1Desc =>
      'Numero massimo di liste attive per governo (Puoi eliminarle e implementarne di nuove in qualsiasi momento).';

  @override
  String get clLimit2Label => 'CAPACITÀ';

  @override
  String get clLimit2Desc =>
      'Numero massimo di leggi per lista (Più che sufficiente per esporre uno schema, abbastanza restrittivo da prevenire il sovraccarico di informazioni).';

  @override
  String get clLimit3Label => 'ISCRIZIONI';

  @override
  String get clLimit3Desc =>
      'Numero massimo di liste che puoi osservare da altri creatori.';

  @override
  String get clOutro =>
      'Lustra non è un social network che genera portata algoritmica gratuita per la tua lista. Le Liste Curate sono solo su invito. Devi condividere il tuo link unico esternamente. Porta il tuo pubblico da X, YouTube, TikTok o dalla tua newsletter. Non ti diamo follower; ti diamo l\'infrastruttura per trasformare i tuoi attuali follower in una forza civica verificata e votante, e un modo per essere finanziato direttamente per il tuo duro lavoro. Smetti di chiedere \"mi piace\" al tuo pubblico. Dai loro uno strumento per agire.';

  @override
  String get supportFundTitle => 'Fase 1: Lancio dell\'Entità Non-Profit';

  @override
  String get supportFundDesc =>
      'Per aprire ufficialmente la Fondazione Lustra, proteggere la proprietà intellettuale e coprire le spese legali di avvio, abbiamo bisogno di raccogliere un capitale iniziale. Aiutaci a rendere questo sistema indipendente per sempre.';

  @override
  String get supportFundDisclaimer =>
      'Trasparenza dei dati: A causa dei diversi gateway di pagamento e dei costi dell\'infrastruttura, questa barra di avanzamento viene aggiornata manualmente dal fondatore (massimo una volta a settimana).';

  @override
  String get actionSyncViaQr => 'Mostra QR';

  @override
  String get actionHideQr => 'Nascondi QR';

  @override
  String get promoGuestTrackBills =>
      'Segui la legislazione e ricevi notifiche su nuove votazioni e leggi.';

  @override
  String get promoGetAppForNotifications =>
      'Scarica l\'app mobile per migliori prestazioni e notifiche sui tuoi progetti di legge seguiti.';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get errorFailedToLoadData => 'Échec du chargement des données';

  @override
  String get errorNoData => 'Aucune donnée à afficher.';

  @override
  String get noData => 'Pas de données';

  @override
  String get noDate => 'Pas de date';

  @override
  String get shareAction => 'Partager';

  @override
  String get loginAction => 'Se connecter';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsChangeLanguage => 'Changer de langue';

  @override
  String get settingsLogout => 'Se déconnecter';

  @override
  String get tryAgainButton => 'Réessayer';

  @override
  String get moreButton => '... Plus';

  @override
  String get seeDetailsLink => 'Voir les détails ->';

  @override
  String get bottomNavHome => 'Accueil';

  @override
  String get bottomNavInfo => 'Informations';

  @override
  String get bottomNavSupport => 'Soutenir';

  @override
  String get bottomNavFutureFeatures => 'Fonctionnalités futures';

  @override
  String termLabel(String termNumber) {
    return 'Législature : $termNumber';
  }

  @override
  String termMenuItem(int termNumber, String termYears) {
    return 'Législature $termNumber $termYears';
  }

  @override
  String get errorNoDataForTerm =>
      'Aucune donnée à afficher pour la législature sélectionnée.';

  @override
  String get sectionPopularVotes => 'Votes populaires';

  @override
  String get sectionUpcoming => 'Prochainement';

  @override
  String get sectionLegislationInProcess => 'Législation en cours';

  @override
  String get sectionMpProfiles => 'Profils des députés';

  @override
  String get buttonBrowseVotes => 'Navigateur de votes';

  @override
  String get buttonScheduledMeetings => 'Sessions prévues';

  @override
  String get buttonBillsInProgress => 'Lois en cours';

  @override
  String get buttonAllMps => 'Tous les députés';

  @override
  String get buttonCheckProfile => 'Voir le profil';

  @override
  String get errorNoDeputiesData => 'Aucune donnée sur les députés.';

  @override
  String get errorNoDataLastVote => 'Aucune donnée sur le dernier vote.';

  @override
  String get errorNoDataUpcomingVote => 'Aucune donnée sur le prochain vote.';

  @override
  String get errorNoSummaryLastVote => 'Aucun résumé pour le dernier vote.';

  @override
  String get errorNoSummaryUpcomingVote =>
      'Aucun résumé pour le prochain vote.';

  @override
  String get errorNoDataLegislationInProcess =>
      'Aucune donnée sur la législation en cours.';

  @override
  String get errorNoSummaryLegislationInProcess =>
      'Aucun résumé pour la législation en cours.';

  @override
  String get keyPoints => 'Points clés';

  @override
  String get noKeyPoints => 'Aucun point clé';

  @override
  String get votingResultsTitle => 'RÉSULTATS DU VOTE';

  @override
  String get labelFor => 'Pour :';

  @override
  String get labelAgainst => 'Contre :';

  @override
  String get labelAbstained => 'Abstentions :';

  @override
  String get noStatusInfo => 'Aucune information de statut';

  @override
  String scheduledMeetingDate(String date) {
    return 'Session prévue : $date';
  }

  @override
  String get noScheduledMeetingDate => 'Aucune date de session prévue';

  @override
  String processStartDate(String date) {
    return 'Début du processus : $date';
  }

  @override
  String get noProcessStartDate => 'Aucune date de début du processus';

  @override
  String mpDistrict(String districtNumber) {
    return 'Circonscription : $districtNumber';
  }

  @override
  String get actionCollapse => 'Réduire';

  @override
  String get actionExpand => 'Afficher plus...';

  @override
  String get votingFor => 'Pour';

  @override
  String get votingAgainst => 'Contre';

  @override
  String get votingAbstainShort => 'Abst.';

  @override
  String get citizenPollTitle => 'Sondage citoyen';

  @override
  String get pollTemporarilyUnavailable =>
      'Sondage temporairement indisponible. Veuillez réessayer plus tard.';

  @override
  String get errorDisplayingPollBar =>
      'Erreur lors de l\'affichage des résultats du sondage.';

  @override
  String get pollNoForAgainstVotes => 'Aucun vote Pour/Contre';

  @override
  String get pollNoVotesCast => 'Aucun vote exprimé';

  @override
  String pollTotalVotes(int count) {
    return 'Votes exprimés : $count';
  }

  @override
  String get pollSupport => 'Je soutiens';

  @override
  String get pollDontSupport => 'Je ne soutiens pas';

  @override
  String get loginToVote => 'Connectez-vous pour voter';

  @override
  String get dialogChooseLanguage => 'Choisir la langue';

  @override
  String get dialogCancel => 'Annuler';

  @override
  String get infoScreenTitle => 'Informations';

  @override
  String get infoTitle1 => 'Séparer la politique des médias';

  @override
  String get infoParagraph1 =>
      'Lustra est une application permettant de suivre la politique à l\'aide de données officielles. Grâce à la technologie de l\'IA, les résumés des lois et les résultats des votes sont présentés de manière concise, claire et impartiale. Suivre la politique ne demande plus d\'effort ni de temps - quelques clics suffisent.';

  @override
  String get infoTitle2 => 'Des intérêts communs au-delà des divisions';

  @override
  String get infoParagraph2 =>
      'En tant que société, nous partageons des objectifs communs tels que la liberté, la sécurité et la prospérité. Les différences de vues sont un élément naturel de la démocratie - elles façonnent le débat et permettent de voir différentes perspectives. Avec un accès à des informations fiables, nous pouvons prendre des décisions plus éclairées et participer à la vie publique sur la base de faits, et non d\'émotions ou de récits médiatiques.';

  @override
  String get infoTitle3 => 'Des actes, pas des mots';

  @override
  String get infoParagraph3 =>
      'Vous n\'avez plus besoin de faire confiance aux promesses électorales - vous pouvez consulter l\'historique des votes de chaque député et analyser leurs décisions. Le profil de chaque politicien comprend une liste à puces, permettant une évaluation rapide et indépendante de son bilan. L\'historique de travail complet sera étoffé au fur et à mesure du développement de l\'application.';

  @override
  String get infoTitle4 => 'Des personnes, pas des partis';

  @override
  String get infoParagraph4 =>
      'Les députés devraient tenir compte des intérêts de leurs électeurs, et pas seulement voter selon la ligne du parti. Le système des partis divise la société, mais tout peut être changé par petites étapes. La première est la prise de conscience du public. Utilisez l\'application, parlez, partagez les votes, participez aux sondages et restez informé. La politique affecte presque tous les aspects de notre vie, il n\'y a donc aucune raison pour que quelques-uns décident de tout.';

  @override
  String get linkHowTechnologyWorks => 'Comment fonctionne la technologie ?';

  @override
  String get linkTermsAndPrivacy =>
      'Conditions et Politique de confidentialité';

  @override
  String get supportScreenTitle => 'Soutenir le projet';

  @override
  String get supportParagraph1 =>
      'Lustra est mon projet personnel pro bono. L\'application sera toujours gratuite, sans fonctionnalités payantes, extensions, publicités ou limitations. Je crois que tout le monde devrait avoir un accès illimité à une information accessible - sans commentaires partisans ou filtres. Si vous êtes d\'accord avec la mission, je vous encourage à la soutenir par un don de n\'importe quel montant. Chaque contribution, aussi petite soit-elle, m\'aidera à maintenir l\'application et à la développer davantage.';

  @override
  String get buttonSupportFinancially => 'Soutenir financièrement';

  @override
  String get supportThankYou =>
      'Merci pour votre confiance et pour chaque forme d\'engagement';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Créateur de l\'application';

  @override
  String get leaderboardTitle => 'Top donateurs (Mois dernier)';

  @override
  String get futureFeaturesScreenTitle => 'Fonctionnalités futures';

  @override
  String get futureFeaturesHeader => 'Fonctionnalités prévues';

  @override
  String get futureFeatureReferendum => 'Organisation d\'un référendum';

  @override
  String get futureFeatureSenate => 'Sénat et sénateurs';

  @override
  String get futureFeatureCitizenInitiative =>
      'Initiative législative citoyenne - projets de loi';

  @override
  String get futureFeatureIndependentCandidates =>
      'Candidats indépendants au parlement';

  @override
  String get futureFeaturePetitions => 'Pétitions au parlement';

  @override
  String get comingSoon => 'Bientôt';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Terminé - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Actualiser les données';

  @override
  String get advancedSearchHint => 'Recherche avancée...';

  @override
  String get filterTypeLabel => 'Type : ';

  @override
  String get filterStatusLabel => 'Statut : ';

  @override
  String get allOption => 'Tous';

  @override
  String get errorFetchData =>
      'Échec de la récupération des données. Veuillez réessayer.';

  @override
  String get emptyListFilterMessage =>
      'Aucune loi ne correspond aux critères sélectionnés.';

  @override
  String get emptyListDefaultMessage =>
      'Aucune loi terminée à afficher pour cette source.';

  @override
  String get searchDialogTitle => 'Rechercher et filtrer';

  @override
  String get searchDialogHint => 'Entrez un terme de recherche...';

  @override
  String get searchDialogTimePeriodLabel => 'Période';

  @override
  String get searchDialogSearchButton => 'Rechercher';

  @override
  String get searchDialogSelectDateRange => 'Sélectionner une plage';

  @override
  String get searchDialogDateRangePickerHelp =>
      'Sélectionnez une plage de dates';

  @override
  String get searchDialogDateRangePickerCancel => 'ANNULER';

  @override
  String get searchDialogDateRangePickerConfirm => 'OK';

  @override
  String get searchDialogDateRangePickerSave => 'ENREGISTRER';

  @override
  String get timePeriodLastWeek => 'La semaine dernière';

  @override
  String get timePeriodLastMonth => 'Le mois dernier';

  @override
  String get timePeriodLast3Months => 'Les 3 derniers mois';

  @override
  String get timePeriodLastYear => 'L\'année dernière';

  @override
  String get timePeriodAll => 'Toute la période';

  @override
  String get timePeriodCustom => 'Plage personnalisée';

  @override
  String get categoryAll => 'Tous';

  @override
  String get categoryHealth => 'Santé';

  @override
  String get categoryFamily => 'Famille';

  @override
  String get categoryTaxes => 'Impôts';

  @override
  String get categoryMigration => 'Migration';

  @override
  String get categoryLabor => 'Travail';

  @override
  String get categorySecurity => 'Sécurité';

  @override
  String get categoryEducation => 'Éducation';

  @override
  String get categoryEnvironment => 'Environnement';

  @override
  String get categoryCourtsAndLaw => 'Tribunaux et droit';

  @override
  String get categoryTransport => 'Transport';

  @override
  String get categoryBenefits => 'Prestations';

  @override
  String get categoryRealEstate => 'Immobilier';

  @override
  String get categoryMediaAndCulture => 'Médias et culture';

  @override
  String get categoryLocalGovernment => 'Gouvernement local';

  @override
  String get categoryAgriculture => 'Agriculture';

  @override
  String get categoryPublicInvestments => 'Investissements publics';

  @override
  String get categoryInformatization => 'Informatisation';

  @override
  String get categoryEconomy => 'Économie';

  @override
  String get categoryOther => 'Autre';

  @override
  String futureLegislationScreenTitle(String parliamentName) {
    return 'Projets de loi à venir - $parliamentName';
  }

  @override
  String get searchDialogAdvancedTitle => 'Rechercher et filtrer (Avancé)';

  @override
  String get emptyListFilterMessageFuture =>
      'Aucun projet de loi à venir ne correspond aux critères sélectionnés.';

  @override
  String get emptyListDefaultMessageFuture =>
      'Aucun projet de loi prévu à afficher pour cette source.';

  @override
  String get noScheduledMeetings => 'Aucune session prévue';

  @override
  String get dateFormatError => 'Erreur de format de date';

  @override
  String get upcomingMeetings => 'Prochaines sessions :';

  @override
  String get keyPointsTitle => 'Points clés :';

  @override
  String processLegislationScreenTitle(String parliamentName) {
    return 'Lois en cours - $parliamentName';
  }

  @override
  String get searchHint => 'Rechercher...';

  @override
  String get emptyListFilterMessageProcess =>
      'Aucune loi en cours ne correspond aux critères sélectionnés.';

  @override
  String get emptyListDefaultMessageProcess =>
      'Aucune loi active dans le processus législatif pour cette source.';

  @override
  String processStartDateCardLabel(String date) {
    return 'Début du processus : $date';
  }

  @override
  String get upcomingMeetingsCardLabel => 'Prochaines sessions :';

  @override
  String get detailsScreenTitle => 'LUSTRA';

  @override
  String get shareTooltip => 'Partager';

  @override
  String get keyPointsSectionTitle => 'Points clés :';

  @override
  String get officialContentButton => 'Texte officiel';

  @override
  String get processPageButton => 'Page du processus';

  @override
  String get fullVotingResultsPDF => 'Résultats complets du vote (PDF)';

  @override
  String get scheduledMeetingsSectionTitle => 'Sessions prévues';

  @override
  String get additionalInfoSectionTitle => 'Informations supplémentaires';

  @override
  String printNumberLabel(String id) {
    return 'Numéro d\'impression : $id';
  }

  @override
  String processStartDateLabel(String date) {
    return 'Date de début du processus : $date';
  }

  @override
  String votingDateLabel(String date) {
    return 'Date du vote : $date';
  }

  @override
  String meetingNumberLabel(String number) {
    return 'N° de la session : $number';
  }

  @override
  String votingNumberLabel(String number) {
    return 'N° du vote : $number';
  }

  @override
  String get sourceLabel => 'Source : https://api.sejm.gov.pl/';

  @override
  String summarizedByLabel(String modelName) {
    return 'Résumé par : $modelName';
  }

  @override
  String promptUsedLabel(String prompt) {
    return 'Prompt utilisé : $prompt';
  }

  @override
  String get reportErrorButton => 'Signaler une erreur';

  @override
  String get noUrlAvailableSnackbar => 'Aucune URL disponible.';

  @override
  String cannotOpenLinkSnackbar(String url) {
    return 'Impossible d\'ouvrir le lien : $url';
  }

  @override
  String get alreadyVotedSnackbar => 'Votre vote a déjà été enregistré.';

  @override
  String get sharingFunctionNotImplementedSnackbar =>
      'Fonction de partage (à implémenter)';

  @override
  String get reportErrorFunctionNotImplementedSnackbar =>
      'Fonction de signalement d\'erreur (à implémenter)';

  @override
  String get loginScreenTitle => 'Connexion';

  @override
  String get registrationScreenTitle => 'Inscription';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get passwordLabel => 'Mot de passe';

  @override
  String get loginButton => 'Se connecter';

  @override
  String get registerButton => 'S\'inscrire';

  @override
  String get orDivider => 'OU';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get continueWithFacebook => 'Continuer avec Facebook';

  @override
  String get promptToRegister => 'Pas de compte ? Inscrivez-vous';

  @override
  String get promptToLogin => 'Vous avez déjà un compte ? Connectez-vous';

  @override
  String get validatorInvalidEmail =>
      'Veuillez entrer une adresse e-mail valide.';

  @override
  String get validatorPasswordTooShort =>
      'Le mot de passe doit comporter au moins 6 caractères.';

  @override
  String get authErrorInvalidCredentials => 'E-mail ou mot de passe invalide.';

  @override
  String get authErrorEmailInUse => 'Cette adresse e-mail est déjà utilisée.';

  @override
  String get authErrorWeakPassword => 'Le mot de passe est trop faible.';

  @override
  String get authErrorDefault =>
      'Une erreur s\'est produite. Veuillez réessayer.';

  @override
  String get authErrorUnexpected => 'Une erreur inattendue s\'est produite.';

  @override
  String get authErrorGoogleFailed =>
      'La connexion avec Google a échoué. Veuillez réessayer.';

  @override
  String get authErrorFacebookFailed =>
      'La connexion avec Facebook a échoué. Veuillez réessayer.';

  @override
  String get authErrorAccountExists =>
      'Un compte avec cet e-mail existe déjà. Veuillez vous connecter avec votre mot de passe.';

  @override
  String mpScreenTitle(String parliamentName) {
    return 'Députés - $parliamentName';
  }

  @override
  String get searchMPsHint => 'Rechercher des députés...';

  @override
  String get allFilter => 'Tous';

  @override
  String get noMPsForSource => 'Aucun député disponible pour cette source.';

  @override
  String get noMPsMatchFilter => 'Aucun député ne correspond aux critères.';

  @override
  String get attendanceLabelShort => 'Présence';

  @override
  String get attendanceTooltipWarning =>
      'Présence calculée sur la base d\'une législature avec un petit nombre de votes.\nLes données peuvent être moins représentatives.';

  @override
  String get supportLabel => 'Soutien : ';

  @override
  String get unaffiliatedClub => 'Non-inscrit';

  @override
  String mpDetailsScreenTitle(String firstName, String lastName) {
    return '$firstName $lastName';
  }

  @override
  String get shareProfileTooltip => 'Partager le profil';

  @override
  String get socialPollSectionTitle => 'Sondage social';

  @override
  String get parliamentaryActivitySectionTitle => 'Activité parlementaire';

  @override
  String parliamentaryTenureSectionTitle(int years) {
    return 'Ancienneté parlementaire : $years ans';
  }

  @override
  String get parliamentaryTenureNoData =>
      'Ancienneté parlementaire : Pas de données';

  @override
  String get tenureTooltip =>
      'Le nombre d\'années est une valeur approximative, calculée sur la base des données ci-dessous, sans tenir compte de l\'expiration prématurée du mandat parlementaire.';

  @override
  String tenureTermItem(String romanNumeral, String duration) {
    return '${romanNumeral}e législature de la Diète de la République de Pologne $duration';
  }

  @override
  String get unknownTermDuration => 'Période inconnue';

  @override
  String get noTermData => 'Pas de données détaillées sur les législatures.';

  @override
  String get plHistoricalDataDisclaimer =>
      'Remarque : Les données historiques des 1ère et 2ème législatures de la Diète de la République de Pologne ne sont pas disponibles et ne sont pas incluses.';

  @override
  String get personalDataSectionTitle => 'Données personnelles';

  @override
  String get contactSectionTitle => 'Contact';

  @override
  String get dataSourceLabel => 'Source des données : API du Sejm RP';

  @override
  String get mandateStatusActive => 'Mandat de député : actif';

  @override
  String get mandateStatusFulfilled => 'Mandat de député : accompli';

  @override
  String get mandateStatusCancelled => 'Mandat de député : annulé';

  @override
  String get mandateStatusInactive => 'Mandat de député : inactif';

  @override
  String get followingAddedSnackbar => 'Ajouté aux suivis';

  @override
  String get followingRemovedSnackbar => 'Retiré des suivis';

  @override
  String clubLabel(String clubName) {
    return 'Groupe : $clubName';
  }

  @override
  String formerlyLabel(String clubs) {
    return ' (anciennement : $clubs)';
  }

  @override
  String professionLabel(String profession) {
    return 'Profession : $profession';
  }

  @override
  String districtLabel(String districtName, int districtNum) {
    return 'Circonscription : $districtName (n° $districtNum)';
  }

  @override
  String votesObtainedLabel(String votes) {
    return 'Votes obtenus : $votes';
  }

  @override
  String get birthDateLabel => 'Date de naissance';

  @override
  String get ageLabel => 'Âge';

  @override
  String ageUnit(int age) {
    return '$age ans';
  }

  @override
  String get birthPlaceLabel => 'Lieu de naissance';

  @override
  String get educationLabel => 'Éducation';

  @override
  String get voivodeshipLabel => 'Voïvodie';

  @override
  String get emailLabelWithColon => 'E-mail :';

  @override
  String get votingsTab => 'Votes récents';

  @override
  String get interpellationsTab => 'Interpellations';

  @override
  String get attendanceLabel => 'Présence générale aux votes';

  @override
  String get attendanceTooltipBase =>
      'L\'échelle évalue le niveau de respect de l\'obligation parlementaire de base. Les fourchettes adoptées reposent sur l\'hypothèse qu\'un taux de présence élevé est une mesure de la responsabilité envers les électeurs.';

  @override
  String get attendanceTooltipPartialMandate =>
      '\n\nLe député a exercé son mandat pendant une partie de la législature. La présence se réfère à cette période.';

  @override
  String get attendanceTooltipUnknownMandate =>
      '\n\nPrésence calculée sur la base d\'une législature avec un petit nombre de votes. Les données peuvent être moins représentatives.';

  @override
  String get errorLoadVotings =>
      'Échec du chargement de l\'historique des votes.';

  @override
  String get errorLoadInterpellations =>
      'Échec du chargement des interpellations.';

  @override
  String get noVotingsData =>
      'Aucune donnée sur les votes importants à afficher.';

  @override
  String get noInterpellationsData => 'Aucune donnée.';

  @override
  String get loadVotingsButton => 'Essayer de charger les votes';

  @override
  String get loadMoreButton => 'Afficher plus';

  @override
  String interpellationSentDate(String date) {
    return 'Date de soumission : $date';
  }

  @override
  String get interpellationReplyFrom => 'Réponse de : ';

  @override
  String cannotOpenReplyLink(String url) {
    return 'Impossible d\'ouvrir le lien de la réponse : $url';
  }

  @override
  String get pollResultNoVotes => 'pas de votes';

  @override
  String get pollResultOverwhelmingMajority => 'majorité écrasante';

  @override
  String get pollResultMajority => 'majorité';

  @override
  String get pollResultMinority => 'minorité';

  @override
  String get pollResultOverwhelmingMinority => 'minorité écrasante';

  @override
  String pollResultFormatted(String percentage, String description) {
    return '$percentage - $description';
  }

  @override
  String pollTotalVotesLabel(int count) {
    return 'Nombre de votes exprimés : $count';
  }

  @override
  String get pollVoteToAction => 'Votez pour voir les résultats';

  @override
  String get voteTypeFor => 'Pour';

  @override
  String get voteTypeAgainst => 'Contre';

  @override
  String get voteTypeAbstain => 'Abstention';

  @override
  String get voteTypeAbsent => 'Absent';

  @override
  String get defaultPrompt => 'Prompt';

  @override
  String get statusInProgress => 'En cours';

  @override
  String get statusPassedSejmToSenat => 'Adoptée et transmise au Sénat';

  @override
  String get statusRejectedSejm => 'Rejetée';

  @override
  String get statusRejectedBySenate => 'Rejetée par le Sénat';

  @override
  String get statusToPresident => 'Transmise au Président';

  @override
  String get statusVetoPresident => 'VETO du Président';

  @override
  String get statusToConstitutionalTribunal =>
      'Déférée au Conseil constitutionnel';

  @override
  String get statusSignedByPresident => 'Signée par le Président';

  @override
  String get statusEnacted => 'Promulguée';

  @override
  String get statusExpired => 'Expirée';

  @override
  String get statusAdoptedResolution => 'Adoptée';

  @override
  String get statusRejectedResolution => 'Rejetée';

  @override
  String get statusImmediateRejection => 'Rejet immédiat';

  @override
  String get statusWithdrawn => 'Retirée';

  @override
  String get filterStatusAll => 'Tous';

  @override
  String get filterStatusPassed => 'Adoptés';

  @override
  String get filterStatusRejected => 'Rejetés';

  @override
  String get docTypeBill => 'Projet de loi';

  @override
  String get docTypeResolution => 'Projet de résolution';

  @override
  String get statusUpcoming => 'Prévu';

  @override
  String get statusIntroducedInHouse =>
      'Présenté à la Chambre des représentants';

  @override
  String get statusReportedToSenate => 'Rapporté au Sénat';

  @override
  String get statusReportedInHouse => 'Rapporté à la Chambre';

  @override
  String get statusReferredInSenate => 'Renvoyé au Sénat';

  @override
  String get statusReferredInHouse => 'Renvoyé à la Chambre';

  @override
  String get statusReferenceChangeSenate => 'Changement de renvoi au Sénat';

  @override
  String get statusReceivedInSenate => 'Reçu au Sénat';

  @override
  String get statusPlacedOnCalendarSenate => 'Inscrit au calendrier du Sénat';

  @override
  String get statusIntroducedInSenate => 'Présenté au Sénat';

  @override
  String get statusEngrossedInHouse => 'Adopté en forme finale à la Chambre';

  @override
  String get statusAgreedToSenate => 'Approuvé au Sénat';

  @override
  String get statusEngrossedAmendmentHouse => 'Amendement adopté à la Chambre';

  @override
  String get statusFailedPassageSenate => 'Échec au Sénat';

  @override
  String get statusLaidOnTableInHouse => 'Mis de côté à la Chambre';

  @override
  String get statusPrivateLaw => 'Loi privée';

  @override
  String get statusPublicLaw => 'Loi publique';

  @override
  String get statusAdopted => 'Adopté';

  @override
  String get statusDeBundesratApproved => 'Le Bundesrat a approuvé';

  @override
  String get statusDeAdopted => 'Adopté';

  @override
  String get statusDeIntroductionApproved => 'Introduction approuvée';

  @override
  String get statusDeAnnounced => 'Promulgué';

  @override
  String get statusDeRejected => 'Rejeté';

  @override
  String get statusDeBundesratDenied =>
      'Le Bundesrat a refusé son consentement';

  @override
  String get statusDeIntroductionRejected => 'Introduction rejetée';

  @override
  String get statusDeDeclaredCompleted => 'Déclaré clos';

  @override
  String get statusDeCompletedByTermEnd => 'Expiré à la fin de la législature';

  @override
  String get statusDeDeclaredUnconstitutional => 'Déclaré inconstitutionnel';

  @override
  String get statusDeWithdrawn => 'Retiré';

  @override
  String get statusDeBundesratProcessCompleted =>
      'Procédure au Bundesrat terminée';

  @override
  String get statusDeCompleted => 'Terminé';

  @override
  String get statusDeCompletedSeeProcess => 'Terminé - voir procédure';

  @override
  String get statusDeRecommendationAvailable =>
      'Recommandation de résolution disponible';

  @override
  String get statusDeToBundesratNotDeliberated =>
      'Transmis au Bundesrat - pas encore délibéré';

  @override
  String get statusDeAssignedToCommittees => 'Assigné aux commissions';

  @override
  String get statusDeNotYetDeliberated => 'Pas encore délibéré';

  @override
  String get statusDeMergedWith => 'Fusionné avec... (voir procédure)';

  @override
  String get statusDeReferred => 'Renvoyé';

  @override
  String get statusFrLawPublished => 'Loi publiée';

  @override
  String get statusFrOrdinancePublished => 'Ordonnance publiée';

  @override
  String get statusFrResolutionPublished => 'Résolution publiée';

  @override
  String get statusFrDecreePublished => 'Décret publié';

  @override
  String get statusFrDecision => 'Décision';

  @override
  String get statusFrRejected => 'Rejeté';

  @override
  String get statusFrPrescribed => 'Prescrit';

  @override
  String get statusFrPropositionLoi => 'Wetsvoorstel (parlementair)';

  @override
  String get statusFrProjetLoi => 'Wetsontwerp (regering)';

  @override
  String get statusUkActOfParliament => 'Loi du Parlement';

  @override
  String get statusUkRoyalAssent => 'Sanction royale';

  @override
  String get statusUkWithdrawn => 'Retiré';

  @override
  String get statusUkRejected => 'Rejeté';

  @override
  String get statusUk1stReading => '1ère lecture';

  @override
  String get statusUk2ndReading => '2ème lecture';

  @override
  String get statusUk3rdReading => '3ème lecture';

  @override
  String get statusUkCommitteeStage => 'Étape en commission';

  @override
  String get statusUkCommonsExaminers => 'Examinateurs des Communes';

  @override
  String get statusUkLordsSpecialCommittee =>
      'Commission spéciale des Lords sur les projets de loi publics';

  @override
  String get statusUkMoneyResolution => 'Résolution financière';

  @override
  String get statusUkConsiderationLordsAmendments =>
      'Examen des amendements des Lords';

  @override
  String get statusUkConsiderationLordsMessage => 'Examen du message des Lords';

  @override
  String get statusUkOrderOfCommitmentDischarged =>
      'Ordre de renvoi en commission annulé';

  @override
  String get statusUkProgrammeMotion => 'Motion de programmation';

  @override
  String get statusUkReportStage => 'Étape du rapport';

  @override
  String get statusUkSecondReadingCommittee => 'Commission de deuxième lecture';

  @override
  String get statusUkWaysAndMeansResolution => 'Résolution des Voies et Moyens';

  @override
  String get errorCheckConnection =>
      'Veuillez vérifier votre connexion internet.';

  @override
  String get buttonRetry => 'Réessayer';

  @override
  String get shareAsPost => 'Partager en tant que publication (1:1)';

  @override
  String get shareAsStory => 'Partager en story (16:9)';

  @override
  String get morePointsInApp =>
      '...les informations complètes sont disponibles dans l\'application Lustra';

  @override
  String get pollVotingViaApp => 'Vote disponible dans l\'application !';

  @override
  String get supportPollTitle => 'Sondage de soutien';

  @override
  String get termsCountLabel => 'Nombre de mandats';

  @override
  String get settingsNotificationsNewLaws =>
      'Notifications sur les nouvelles législations';

  @override
  String get settingsNotificationsVoteResults =>
      'Notifications sur les résultats des votes';

  @override
  String get detailsButton => 'Détails';

  @override
  String get errorNoVotingsDetails => 'AUCUNE DONNÉE DE VOTE DÉTAILLÉE';

  @override
  String get clearText => 'Effacer';

  @override
  String get consideredOnLabel => 'En cours d\'examen le :';

  @override
  String get legislationFooterAiDisclaimer =>
      'Le résumé ci-dessus a été généré par l\'IA et constitue une élaboration du document gouvernemental original, dans le respect de tous les principes d\'impartialité et de libre information. Les détails de la requête utilisée et son schéma peuvent être consultés dans l\'onglet d\'information.';

  @override
  String get legislationFooterModelUsed => 'Modèle utilisé :';

  @override
  String get legislationFooterSourceData =>
      'Les données sources sont disponibles gratuitement sur le système gouvernemental à l\'adresse :';

  @override
  String get appMotto =>
      '... c\'est-à-dire une information législative impartiale et sans coloration politique.';

  @override
  String get acceptTermsPrefix => 'J\'accepte les';

  @override
  String get termsAndConditions =>
      'Conditions et la Politique de confidentialité';

  @override
  String get validatorAcceptTerms =>
      'Vous devez accepter les conditions pour continuer.';

  @override
  String get joinSupportClubPrefix => 'Je veux rejoindre le';

  @override
  String get supportClub => 'Club de Soutien Lustra';

  @override
  String get supportClubDescription =>
      'Vous recevrez des informations spéciales sur le développement du projet et les initiatives futures.';

  @override
  String get registrationFinishTitle => 'Finaliser l\'inscription';

  @override
  String get welcomeMessage => 'Bienvenue !';

  @override
  String get finalStepMessage =>
      'Juste une dernière étape. Veuillez accepter les conditions pour continuer.';

  @override
  String get continueButton => 'Continuer';

  @override
  String get selectYourParliament => 'Sélectionnez votre parlement';

  @override
  String get validatorSelectParliament =>
      'Veuillez sélectionner un parlement pour continuer.';

  @override
  String get forgotPasswordButton => 'Mot de passe oublié ?';

  @override
  String get passwordResetEmailSent =>
      'Un lien pour réinitialiser votre mot de passe a été envoyé à votre adresse e-mail.';

  @override
  String get authErrorUserNotFound =>
      'Aucun utilisateur trouvé avec cette adresse e-mail.';

  @override
  String get settingsDeleteAccount => 'Supprimer le compte';

  @override
  String get errorDeleteAccount =>
      'Échec de la suppression du compte. Veuillez réessayer.';

  @override
  String get dialogReauthenticateTitle => 'Confirmez votre identité';

  @override
  String get dialogConfirm => 'Confirmer';

  @override
  String get dialogDeleteAccountTitle =>
      'Êtes-vous sûr de vouloir supprimer votre compte ?';

  @override
  String get dialogDeleteAccountContent =>
      'Cette action est irréversible. Toutes vos données, y compris votre historique de vote, seront définitivement supprimées.';

  @override
  String get dialogDelete => 'Supprimer';

  @override
  String get termsOfServiceContent =>
      '<b>Conditions d\'Utilisation de l\'Application \"Lustra\"</b>\n\nDate de dernière mise à jour : 10 août 2025\n\nBonjour ! Ici, le créateur de l\'application Lustra.\nJe suis ravi que vous soyez ici. J\'ai créé Lustra car je crois que chacun de nous mérite un accès simple et transparent à l\'information sur la manière dont sont élaborées les lois qui affectent nos vies.\n\nCe document constitue les conditions d\'utilisation – une sorte de contrat entre vous et moi. Je l\'ai rédigé dans un langage simple pour que vous sachiez exactement quelles sont les règles de l\'application. Veuillez le lire attentivement. En utilisant Lustra, vous confirmez que vous acceptez ces règles.\n\n<b>1. Glossaire, c\'est-à-dire de qui et de quoi il s\'agit</b>\n•\t<b>Je, mon, moi</b> – c\'est moi, Jacek, le créateur de l\'application, agissant pour le compte de la société FO&WO VENTURES SP. Z O.O. basée à Wrocław.\n•\t<b>Vous, votre, vos</b> – c\'est vous, la personne qui utilise l\'application.\n•\t<b>Application</b> ou <b>Lustra</b> – l\'application mobile \"Lustra\" que vous utilisez actuellement.\n•\t<b>Compte</b> – votre compte personnel dans l\'application, que vous pouvez créer pour utiliser des fonctionnalités supplémentaires.\n•\t<b>Conditions</b> – ce présent document.\n\n<b>2. Quel est le but de Lustra ? (Principes généraux)</b>\n•\tLustra est une application gratuite visant à vous fournir des informations accessibles sur les processus législatifs dans des parlements sélectionnés. Vous y trouverez des résumés de projets de loi, des résultats de votes et des informations sur les députés.\n•\tVous devez avoir au moins 16 ans pour utiliser l\'application. Si vous créez un Compte, vous confirmez que vous remplissez cette condition.\n•\tL\'utilisation des fonctionnalités d\'information de base ne nécessite pas la création d\'un Compte.\n\n<b>3. Votre Compte dans l\'application</b>\n•\tVous pouvez créer un Compte en utilisant votre adresse e-mail. Cela vous permettra d\'utiliser des fonctionnalités supplémentaires, comme voter dans des sondages ou recevoir des notifications personnalisées.\n•\tVeuillez noter que vous ne pouvez avoir qu\'un seul Compte.\n•\tVous êtes responsable de la confidentialité de votre mot de passe et de tout ce qui se passe sur votre Compte.\n\n<b>4. Comment pouvez-vous utiliser le contenu ? (Licence)</b>\n•\tToutes les données sources (par ex. textes complets des lois, résultats des votes, données des députés) proviennent de sources officielles et publiques et sont des informations publiques.\n•\tLe contenu que je crée à l\'aide de mon système propriétaire et de la technologie d\'IA (c\'est-à-dire les résumés, les titres simplifiés, les points clés) vous est fourni pour une utilisation libre à des fins d\'information, d\'éducation et privées. Vous pouvez le lire et le partager sous forme de captures d\'écran.\n•\tJe vous demande de ne pas copier ces données de manière automatisée (pas de scraping). La création et la maintenance de ce système me coûtent du temps et de l\'argent. Par conséquent, pour protéger ce projet, les Conditions vous interdisent de :\n\t\to\tTélécharger automatiquement et créer votre propre base de données à partir du contenu généré dans l\'application.\n\t\to\tUtiliser le contenu de l\'application à des fins commerciales.\n\t\to\tTenter de contourner la sécurité, de décompiler l\'application ou de perturber son fonctionnement.\n•\tVous avez une idée pour utiliser les données de Lustra de manière intéressante ? Je suis ouvert à la collaboration ! Écrivez-moi à jacek@lustra.dev – je serais heureux d\'en discuter.\n\n<b>5. Sondages et exactitude des données</b>\n•\tL\'une des fonctionnalités de l\'application sont les sondages où vous pouvez exprimer votre soutien à un projet de loi donné. Pour que les résultats de ces sondages soient aussi fiables que possible, veuillez sélectionner dans les paramètres le parlement du pays dont vous êtes citoyen (s\'il est disponible dans la liste).\n\n<b>6. Ma responsabilité (ou plutôt son absence)</b>\n•\tJe fournis l\'application \"telle quelle\" (en anglais \"as is\"). Je mets tout en œuvre pour que les données soient à jour et exactes, mais elles proviennent d\'API gouvernementales externes, qui peuvent contenir des erreurs. Par conséquent, je ne peux être tenu responsable d\'éventuelles inexactitudes dans les données sources.\n•\tLustra est un projet pro bono que j\'entretiens avec mes propres fonds. Je ferai de mon mieux pour qu\'il fonctionne sans interruption, mais je dois me réserver la possibilité de pannes techniques. Je me réserve également le droit de mettre fin au service, par exemple, si je n\'ai plus les fonds pour le maintenir.\n•\tLe contenu de l\'application, en particulier celui généré par l\'IA, est à des fins d\'information et d\'éducation. Il ne constitue pas un conseil juridique.\n\n<b>7. Club de Soutien Lustra</b>\n•\tVous pouvez rejoindre le \"Club de Soutien Lustra\" en donnant un consentement distinct et volontaire. Cela signifie que je pourrai vous envoyer des e-mails sur le développement de l\'application, les nouvelles fonctionnalités, et également solliciter votre soutien dans les discussions sur l\'avenir du projet ou une aide financière si nécessaire. Vous trouverez plus de détails à ce sujet dans la Politique de Confidentialité.\n\n<b>8. Résiliation de notre contrat</b>\n•\tVous pouvez y mettre fin à tout moment. Il vous suffit d\'utiliser l\'option \"Supprimer le compte\" dans les paramètres de l\'application. Cela entraînera la suppression définitive de votre Compte et des données qui y sont associées.\n•\tJe peux bloquer ou supprimer votre Compte si vous enfreignez gravement ces Conditions, par exemple, en essayant de nuire au fonctionnement de l\'application.\n\n<b>9. Modifications des Conditions</b>\n•\tLe monde change, l\'application aussi. Je me réserve le droit de modifier ces Conditions. Je vous informerai de tout changement important à l\'avance, par exemple, par un message dans l\'application. Continuer à utiliser Lustra après l\'introduction des modifications vaudra acceptation de celles-ci.\n\n<b>10. Contact et dispositions finales</b>\n•\tSi vous avez des questions, n\'hésitez pas à écrire à : jacek@lustra.dev.\n•\tPour toutes les questions non régies par les présentes Conditions, le droit polonais s\'applique.\n\nMerci d\'être là et d\'aider à créer un État transparent !';

  @override
  String get termsAndPrivacyTitle => 'Conditions et Confidentialité';

  @override
  String get termsOfServiceTab => 'Conditions';

  @override
  String get privacyPolicyTab => 'Confidentialité';

  @override
  String get privacyPolicyContent =>
      '<b>Politique de Confidentialité de l\'Application \"Lustra\"</b>\n\nDate de dernière mise à jour : 10 août 2025\n\nCe document est la Politique de Confidentialité. Je sais que de tels textes peuvent être longs et compliqués, c\'est pourquoi j\'ai fait de mon mieux pour le rédiger simplement.\nVotre vie privée et votre confiance sont ma priorité absolue. Dans cette politique, je vais vous expliquer quelles données je collecte, pourquoi je le fais et comment je les protège.\n\n<b>1. Qui prend soin de vos données ? (Responsable du Traitement)</b>\nLe responsable du traitement de vos données personnelles est moi, Jacek, agissant pour le compte de la société FO&WO VENTURES SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ (ul. Wapienna 13/7, 50-518 Wrocław, NIP : 6343002817).\nSi vous avez des questions concernant vos données, écrivez-moi directement à : jacek@lustra.dev.\n\n<b>2. Quelles données je collecte et pourquoi ?</b>\nJe ne collecte que les données nécessaires au fonctionnement de l\'application ou pour lesquelles vous donnez un consentement distinct et volontaire. Voici une liste détaillée :\n•\t<b>Lorsque vous créez un Compte :</b>\n\to\t<b>Votre adresse e-mail :</b> J\'en ai besoin pour créer et gérer votre Compte en toute sécurité, vous permettre de vous connecter et de réinitialiser votre mot de passe si vous l\'oubliez.\n\to\t<b>Identifiant utilisateur unique (UID) :</b> Il s\'agit d\'une chaîne de caractères aléatoire attribuée automatiquement par le système Firebase, qui me permet de lier en toute sécurité vos données à votre Compte.\n•\t<b>Lorsque vous utilisez les fonctionnalités de l\'application (en tant qu\'utilisateur connecté) :</b>\n\to\t<b>Vos votes dans les sondages (\"pour\" / \"contre\") :</b> Je les enregistre pour créer des statistiques globales et entièrement anonymes de soutien aux différentes lois, que vous voyez dans l\'application. Votre vote individuel n\'est jamais affiché publiquement.\n\to\t<b>Votre liste de législations suivies :</b> Je la conserve pour que vous y ayez un accès facile et pour pouvoir (à l\'avenir) vous envoyer des notifications sur leur avancement.\n\to\t<b>Votre parlement sélectionné :</b> J\'enregistre cette information pour que vous puissiez participer aux sondages pertinents et (à l\'avenir) recevoir des notifications pour le bon pays.\n•\t<b>Lorsque vous rejoignez le Club de Soutien Lustra (entièrement volontaire) :</b>\n\to\t<b>Information sur votre consentement (vrai/faux) :</b> Je l\'enregistre pour savoir si vous souhaitez recevoir des messages supplémentaires de ma part. J\'en dis plus sur le Club à la section 5.\n•\t<b>Lorsque vous signalez un bug :</b>\n\to\tSi vous décidez d\'envoyer un rapport d\'erreur de données, j\'enregistrerai le contenu de votre rapport pour analyser et corriger le problème.\nCe que je ne collecte <b>PAS</b> : Je n\'utilise aucun outil d\'analyse externe (comme Google Analytics) pour suivre votre activité dans l\'application.\n\n<b>3. À qui je confie vos données ? (Mes partenaires technologiques)</b>\nPour que Lustra fonctionne, j\'utilise les services de partenaires technologiques de confiance à qui je confie le traitement de certaines données. Ce sont :\n•\t<b>Google (dans le cadre du service Firebase) :</b> C\'est l\'épine dorsale technologique de toute l\'application. Google me fournit l\'infrastructure pour :\n\to\t<b>L\'authentification (Firebase Authentication) :</b> Connexion sécurisée et gestion de votre Compte.\n\to\t<b>La base de données (Cloud Firestore) :</b> Stockage des données liées à votre Compte (par ex. votes aux sondages, liste des législations suivies).\n•\t<b>Google (dans le cadre du service Gemini AI) :</b> C\'est l\'outil que j\'utilise pour analyser les textes législatifs. Je veux être absolument clair : j\'envoie uniquement à l\'IA des textes de lois et de documents accessibles au public. Vos données personnelles (comme l\'e-mail ou l\'UID) n\'y sont jamais envoyées.\nToutes les données sont stockées sur des serveurs de Google situés dans l\'Espace Économique Européen.\n\n<b>4. Combien de temps je conserve vos données ?</b>\nEn bref : je conserve vos données aussi longtemps que vous avez un Compte chez moi. Si vous décidez de le supprimer, toutes vos données personnelles seront effacées de manière permanente.\n\n<b>5. Le Club de Soutien Lustra – qu\'est-ce que c\'est ?</b>\nC\'est un endroit spécial pour les personnes qui veulent être plus proches du projet. L\'adhésion est entièrement volontaire et nécessite de cocher un consentement séparé. Si vous adhérez, vous acceptez que je vous envoie occasionnellement des e-mails concernant :\n•\tle développement de l\'application et les nouvelles fonctionnalités prévues,\n•\tles événements spéciaux, par ex. des tables rondes sur l\'avenir de Lustra,\n•\td\'autres projets similaires porteurs de la même mission que je pourrais créer à l\'avenir,\n•\tles demandes de soutien financier si le projet se trouve dans une situation difficile.\nVous pouvez retirer votre consentement à tout moment dans les paramètres de l\'application.\n\n<b>6. Vos droits – vous avez le contrôle total</b>\nLe RGPD vous confère une série de droits, et je veux que vous puissiez les exercer facilement. Vous avez le droit de :\n•\tAccéder à vos données : Savoir quelles données je détiens sur vous.\n•\tRectifier (corriger) vos données.\n•\tSupprimer vos données (droit à l\'oubli) : Vous pouvez le faire à tout moment en utilisant l\'option \"Supprimer le compte\" dans les paramètres de l\'application.\n•\tLimiter le traitement de vos données.\n•\tLa portabilité des données.\n•\tVous opposer au traitement de vos données.\n•\tRetirer votre consentement (par ex. pour faire partie du Club de Soutien Lustra).\n•\tDéposer une plainte auprès du Président de l\'Office de la Protection des Données Personnelles (UODO) si vous estimez que je traite vos données illégalement.\nPour exercer la plupart de ces droits, il suffit de m\'écrire à jacek@lustra.dev.\n\n<b>7. Sécurité de vos données</b>\nJe prends la sécurité très au sérieux. J\'utilise les solutions fournies par Google Firebase, qui appliquent des normes de sécurité modernes, y compris le chiffrement des données lors de leur transfert (protocole SSL) et de leur stockage sur les serveurs.\n\n<b>8. Données des enfants</b>\nComme mentionné dans les Conditions d\'utilisation, l\'application est destinée aux personnes âgées de 16 ans et plus. Je ne collecte ni ne traite sciemment les données de personnes plus jeunes.\n\n<b>9. Modifications de cette politique</b>\nJe pourrai mettre à jour cette politique à l\'avenir. Je vous informerai de tout changement important à l\'avance dans l\'application.\n\nMerci de votre confiance.\nJacek';

  @override
  String get techPageTitle =>
      'À propos de la technologie et de l\'impartialité';

  @override
  String get techPageIntro =>
      'Derrière chaque titre simplifié et chaque résumé de loi se cache un modèle linguistique. Ici, je souhaite vous expliquer en toute transparence comment il fonctionne et comment je m\'assure que les informations que vous recevez sont toujours pures et impartiales.';

  @override
  String get techPageWhyAiTitle => 'Pourquoi est-ce que j\'utilise l\'IA ?';

  @override
  String get techPageWhyAiBody =>
      'Les textes de loi et les documents parlementaires sont rédigés dans un jargon juridique complexe. Lire et comprendre même une loi courte est un défi, même pour un juriste.\n\nMon objectif était de créer un outil qui traduise ce langage hermétique « du juridique à l\'humain ». Analyser manuellement des centaines de documents par jour serait impossible pour une seule personne. C\'est pourquoi j\'ai eu recours à l\'IA – en tant qu\'outil puissant d\'analyse et de simplification de texte, qui permet de vous fournir des informations rapidement et sous une forme accessible.';

  @override
  String get techPageWhatForTitle => 'À quoi me sert exactement l\'IA ?';

  @override
  String get techPageWhatForBody =>
      'L\'Intelligence Artificielle accomplit trois tâches spécifiques :\n  • Elle simplifie les titres officiels en des titres qui expliquent immédiatement de quoi traite le document.\n  • Elle crée de courts résumés de 2 à 3 phrases qui se concentrent sur l\'impact des changements sur la vie quotidienne des citoyens.\n  • Elle extrait du fouillis de texte quelques points clés, c\'est-à-dire les changements et les solutions les plus importants.\n\nToutes les autres données, comme les résultats des votes ou les informations sur les députés, proviennent directement des API gouvernementales officielles.';

  @override
  String get techPageBiasTitle =>
      'Comment est-ce que je garantis l\'impartialité ? Instruction pour l\'IA';

  @override
  String get techPageBiasBody =>
      'C\'est la partie la plus importante. L\'IA exécute des commandes spécifiques. Ces commandes (appelées « prompt » en informatique) sont une sorte d\'instruction très précise qui constitue le fondement de l\'impartialité de toute l\'application.\n\nVoici les principes clés que j\'ai intégrés à mon système d\'IA :\n  • <b>Rôle d\'expert neutre :</b> J\'ordonne à l\'IA d\'adopter le rôle d\'un expert en droit apolitique, dont le seul but est d\'analyser et d\'expliquer, et non d\'évaluer ou de commenter.\n  • <b>Seulement des faits, pas d\'opinions :</b> L\'instruction interdit explicitement à l\'IA d\'exprimer ses propres opinions, de porter des jugements de valeur et d\'utiliser un langage qui pourrait suggérer si un changement donné est « bon » ou « mauvais ». Elle doit se concentrer exclusivement sur les faits.\n  • <b>Perspective du citoyen ordinaire :</b> Au lieu d\'analyser la loi du point de vue d\'un juriste, l\'IA a pour tâche de répondre à la question : « Que signifie ce changement pour moi, un citoyen ordinaire ? Comment affectera-t-il mes finances, ma santé, mes droits et mes devoirs ? ».';

  @override
  String get techPagePromiseTitle =>
      'Instruction complète et transparente à consulter';

  @override
  String get techPagePromiseBody =>
      'Ne me croyez pas sur parole. Vous trouverez ci-dessous le contenu exact de l\'instruction (prompt) que je transmets au modèle d\'IA (Google Gemini) lors de l\'analyse de chaque document, en m\'assurant que les paramètres de créativité sont également réglés sur 0 (afin que l\'IA n\'invente rien lors de l\'analyse). C\'est le « cerveau » de l\'opération.\n\n(Remarque : ce prompt évoluera et sera amélioré avec le temps, afin que la qualité des résumés soit de plus en plus élevée.)';

  @override
  String techPagePromptCode(Object DOCUMENT_TEXT, Object country) {
    return 'Vous êtes un expert en droit de $country chargé d\'analyser des documents de loi, des résolutions et d\'autres documents législatifs, puis d\'en préparer des informations de manière accessible pour les citoyens. Votre objectif est de présenter les informations de telle sorte que les citoyens puissent évaluer par eux-mêmes l\'impact de la législation sur leur vie, même sans avoir de connaissances législatives spécialisées. Concentrez-vous sur les faits et les conséquences des changements introduits, en évitant les jugements de valeur et les opinions personnelles. Tout jargon juridique est interdit. Présentez les informations de manière claire, concise et engageante, afin qu\'elles soient compréhensibles pour une personne sans formation juridique. Évitez les phrases longues et complexes. Au lieu d\'écrire « le projet vise à mettre en œuvre la directive concernant le tri des déchets... », écrivez « Nouvelles règles pour le tri des déchets : utilisation de sacs spéciaux, etc.... ». Poursuivez votre travail jusqu\'à ce que vous ayez résolu votre tâche. Si vous n\'êtes pas sûr du contenu généré, analysez à nouveau le document - ne devinez pas. Planifiez bien votre tâche avant de commencer. Dans le résumé et les points clés, si possible et justifié, soulignez les avantages ou les conséquences concrètes (positives ou négatives) que la loi introduit dans la vie quotidienne des citoyens, leurs droits et devoirs, leurs finances personnelles, leur sécurité et d\'autres questions importantes.\n\nVotre réponse DOIT être au format JSON - et contenir les clés suivantes.\nAvant de renvoyer la réponse, vérifiez attentivement que toute la structure JSON est correcte à 100%, y compris toutes les virgules, accolades, crochets et guillemets. Un JSON incorrect est inacceptable et empêchera le traitement de votre travail.\n\nAnalysez attentivement le texte suivant du document juridique. C\'est le contenu sur la base duquel vous devez générer le résumé et les points clés :\n--- DÉBUT DU DOCUMENT ---\n$DOCUMENT_TEXT\n--- FIN DU DOCUMENT ---\n\nN\'OUBLIEZ PAS : Votre réponse DOIT être exclusivement un objet JSON valide. N\'ajoutez aucun caractère, commentaire ou texte supplémentaire avant la balise \'OPEN_BRACE\' ou après la balise \'CLOSE_BRACE\'. L\'ensemble de la réponse doit pouvoir être analysé en tant que JSON.\nSur la base du document CI-DESSUS, remplissez la structure JSON suivante :\nVoici la structure JSON que j\'attends (remplissez-la avec du contenu) :\n__OPEN_BRACE__\n  \"ai_title\": \"Un nouveau titre court pour l\'acte juridique en français, qui rend l\'essence des changements introduits (par exemple, 10-12 mots maximum).\",\n  \"summary\": \"Un résumé concis de 2-3 phrases du contenu de l\'acte juridique en français, rédigé du point de vue de son impact sur la vie quotidienne des citoyens.\",\n  \"key_points\": [\n    \"Premier point court en français concernant les solutions ou les changements les plus importants introduits.\",\n    \"Deuxième point court en français...\"\n  ],\n \"category\": [\"Classez le document par défaut dans une catégorie, en fonction du domaine qu\'il concerne principalement. Choisissez-en jusqu\'à 3 si le document aborde également des questions IMPORTANTES d\'autres catégories. Vous DEVEZ choisir des catégories EXCLUSIVEMENT dans la liste suivante : Santé, Éducation, Famille, Impôts, Travail, Sécurité, Environnement, Tribunaux et Droit, Transports, Prestations, Immobilier, Médias et Culture, Collectivités locales, Migration, Agriculture, Investissements publics, Informatisation, Économie. Si le document ne correspond définitivement à aucune d\'entre elles, vous DEVEZ utiliser \'Autre\'. Si vous utilisez \'Autre\', ce devrait être la SEULE catégorie sélectionnée. NE créez PAS de nouvelles catégories. La réponse doit être un tableau de chaînes de caractères, par ex. [\\\"Impôts\\\", \\\"Famille\\\"].\", \"Deuxième catégorie (facultatif)\", \"Troisième catégorie (facultatif)\"]\n__CLOSE_BRACE__';
  }

  @override
  String get techPageFlawlessTitle => 'L\'IA est-elle infaillible ?';

  @override
  String get techPageFlawlessBody =>
      'Bien sûr que non. Comme toute technologie, elle peut commettre une erreur ou mal interpréter quelque chose. C\'est pourquoi vous trouverez dans l\'application un mécanisme vous permettant de signaler une erreur dans les données – chaque signalement de ce type est extrêmement précieux pour moi et m\'aide à améliorer le système.\n\nMon objectif à long terme est de continuer à développer cette technologie, et même d\'exploiter mon propre modèle local sans aucune restriction, afin d\'accroître encore la précision et l\'indépendance de l\'application.';

  @override
  String get techPageOutro =>
      'Merci de votre confiance. J\'espère que grâce à cette transparence, l\'utilisation de Lustra sera encore plus précieuse pour vous.';

  @override
  String get votingResultsPL1stReadingTitle => 'VOTE SUR LE REJET';

  @override
  String get reportErrorDescription =>
      'Décrivez brièvement l\'erreur ou ce qui manque. Votre rapport nous aidera à améliorer l\'application.';

  @override
  String get reportErrorHint => 'Saisissez votre message...';

  @override
  String get reportErrorValidationEmpty => 'Le message ne peut pas être vide.';

  @override
  String get reportErrorSuccess => 'Merci ! Votre rapport a été envoyé.';

  @override
  String get actionCancel => 'Annuler';

  @override
  String get actionSend => 'Envoyer';

  @override
  String get mustBeLoggedInToReport =>
      'Vous devez être connecté pour signaler une erreur.';

  @override
  String get reportErrorRateLimitExceeded =>
      'Limite de rapports atteinte (10 par 24 heures).';

  @override
  String get supportQuickTitle => 'Soutien rapide';

  @override
  String get supportPaymentsUnavailable =>
      'Les paiements sont actuellement indisponibles.';

  @override
  String get supportNoProducts => 'Aucune option de soutien disponible.';

  @override
  String get supportCampaignsTitle => 'Campagnes ciblées';

  @override
  String get supportCampaignsDescription =>
      'Soutenez des objectifs de développement spécifiques, par exemple l\'ajout d\'un nouveau parlement.';

  @override
  String get supportCampaignsButton =>
      'Voir la campagne active (bientôt disponible)';

  @override
  String get forceUpdateTitle => 'Mise à jour requise';

  @override
  String get forceUpdateDescription =>
      'Une nouvelle version de l\'application est disponible. Pour continuer, veuillez mettre à jour l\'application vers la dernière version.';

  @override
  String get forceUpdateButton => 'Mettre à jour';

  @override
  String get deputies => 'Députés';

  @override
  String get sortingLabel => 'Trier par : ';

  @override
  String get sortByPopularity => 'Popularité';

  @override
  String get sortByAttendance => 'Présence';

  @override
  String partyLabel(Object partyName) {
    return 'Parti : $partyName';
  }

  @override
  String districtLabelUS(Object districtName, String districtNum) {
    String _temp0 = intl.Intl.selectLogic(districtNum, {
      '1': '1er',
      'other': '${districtNum}e',
    });
    return '$_temp0 district de $districtName';
  }

  @override
  String tenureTermItemUS(Object memberType, String termNumber) {
    String _temp0 = intl.Intl.selectLogic(termNumber, {
      '1': '1er',
      'other': '${termNumber}e',
    });
    return '$_temp0 Congrès ($memberType)';
  }

  @override
  String get birthYearLabel => 'Année de naissance :';

  @override
  String get sponsorshipsTab => 'Parrainages';

  @override
  String get sponsorshipTypeSponsor => 'Parrain';

  @override
  String get sponsorshipTypeCosponsor => 'Coparrain';

  @override
  String get termCurrently => '(actuellement)';

  @override
  String get parliamentaryTenureTitle => 'Mandat parlementaire';

  @override
  String get usRoleRepresentative => 'Représentant';

  @override
  String get usRoleSenator => 'Sénateur';

  @override
  String shareLegislationText(Object deepLink) {
    return 'Consultez les détails de ce projet de loi dans l\'application Lustra ! $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Consultez et évaluez le travail de ce député(e) dans l\'application Lustra ! $deepLink';
  }

  @override
  String get clipboardCopySuccess =>
      'Lien de l\'application copié dans le presse-papiers !';

  @override
  String get mandateInactive => 'MANDAT INACTIF';

  @override
  String get votingUnavailable => 'Vote non disponible';

  @override
  String get historicalTerm => 'LÉGISLATURE HISTORIQUE';

  @override
  String get pollUnavailable => 'Sondage non disponible';

  @override
  String get billsLabel => 'Projets de loi';

  @override
  String get sponsorshipSublabel => '(Parrainés/Coparrainés)';

  @override
  String get missingDataWarningShare =>
      'Le document source de ce projet de loi est manquant. Aidez-nous et déposez une demande officielle par e-mail pour sa publication via notre application en quelques secondes !';

  @override
  String get missingDataSourceUserMessage =>
      'Le document source de ce projet de loi est manquant. Aidez-nous en déposant une demande officielle par e-mail pour sa publication et rejoignez le groupe de personnes qui veillent à la transparence de l\'information !';

  @override
  String get missingDataSourceButton => 'Demander le document par e-mail';

  @override
  String get cannotOpenEmailApp =>
      'Impossible d\'ouvrir l\'application de messagerie. Vérifiez si elle est installée et si un compte est configuré.';

  @override
  String get sortByFreshness => 'Les plus récents';

  @override
  String get pollPermissionDeniedError =>
      'Ce sondage n\'est disponible que pour les utilisateurs assignés à ce parlement.';

  @override
  String get supportCampaignsButtonActive => 'Soutenir la campagne';

  @override
  String get supportCampaignsButtonInactive => 'Campagne inactive';
}

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
  String get sectionPopularVotes => 'Votes législatifs';

  @override
  String get sectionUpcoming => 'Débats prévus';

  @override
  String get sectionLegislationInProcess => 'En cours';

  @override
  String get civicProjectsSectionTitle => 'Initiatives citoyennes';

  @override
  String get sectionMpProfiles => 'Politiciens populaires';

  @override
  String get votingSourceTooltip => 'Voir la source du vote';

  @override
  String get legislationSponsorLabel => 'Sponsor';

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
  String get citizenPollTitle => 'Volonté Citoyenne';

  @override
  String get pollTemporarilyUnavailable =>
      'Sondage temporairement indisponible. Veuillez réessayer plus tard.';

  @override
  String get errorDisplayingPollBar =>
      'Erreur lors de l\'affichage des résultats du sondage.';

  @override
  String get pollNoForAgainstVotes => 'Aucun vote Pour/Contre';

  @override
  String get pollNoVotesCast => 'Soyez le premier à voter.';

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
  String get infoTitle1 => 'Les Citoyens avant la Politique';

  @override
  String get infoParagraph1 =>
      'Les médias n\'informent pas, ils sélectionnent la réalité. On estime que 95 % de la législation disparaît dans un \"trou noir\" médiatique car elle est trop complexe pour vendre de la publicité. Lustra contourne les intermédiaires. Nous transformons le langage bureaucratique en faits accessibles, vous montrant ce que le gouvernement vote réellement, pas seulement ce dont il veut parler.';

  @override
  String get infoTitle2 => 'Des Faits, Pas du Marketing';

  @override
  String get infoParagraph2 =>
      'La politique d\'aujourd\'hui, c\'est 80 % de marketing et 20 % de droit. Nous séparons les deux. Nous appliquons un processus de \"stérilisation du contexte\" : nous supprimons le langage émotionnel et la langue de bois partisane pour ne laisser que les faits juridiques. Ce n\'est pas un \"autre point de vue\". C\'est une réduction du bruit qui vous permet de vous forger votre propre opinion à la source.';

  @override
  String get infoTitle3 => 'Le Pouvoir Sans Intermédiaires';

  @override
  String get infoParagraph3 =>
      'Les grandes plateformes optimisent leur contenu pour votre colère, car cela vous garde connecté. Nous optimisons pour votre savoir. La hiérarchie des sujets dans l\'application dépend entièrement des votes de la communauté. C\'est vous qui décidez de ce qui est important, reprenant le pouvoir aux éditeurs et aux lobbyistes.';

  @override
  String get infoTitle4 => 'Architectes du Changement';

  @override
  String get infoParagraph4 =>
      'La démocratie n\'est pas un sport de spectateurs. Nous introduisons un mécanisme où les initiatives citoyennes sont présentées sur un pied d\'égalité avec les projets gouvernementaux. Nous vous fournissons l\'infrastructure pour passer d\'observateur passif à Architecte du Changement – pour construire un soutien réel aux causes qui comptent. Nous portons la démocratie à un niveau supérieur.';

  @override
  String get linkHowTechnologyWorks => 'Comment fonctionne la technologie ?';

  @override
  String get linkTermsAndPrivacy =>
      'Conditions et Politique de confidentialité';

  @override
  String get supportScreenTitle => 'Infrastructure Publique';

  @override
  String get supportParagraph1 =>
      'Lustra est un service public numérique. Mais la liberté a un prix. Nous avons rejeté le capital pour garantir une impartialité totale, car nous croyons que c\'est la seule voie vers le changement. La maintenance de l\'infrastructure et des serveurs dépend uniquement de contributions volontaires. L\'équivalent de 10 \$ permet de financer l\'accès à la plateforme pour plusieurs milliers de personnes par mois. Votre soutien garantit la continuité de la mission et le fonctionnement ininterrompu.';

  @override
  String get buttonSupportFinancially => 'Soutenir';

  @override
  String get supportThankYou => 'Merci. Vous maintenez le système en vie.';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Fondateur';

  @override
  String get futureFeaturesScreenTitle => 'Feuille de Route Communautaire';

  @override
  String get futureFeaturesHeader => 'Vous Contrôlez la Direction';

  @override
  String get futureFeatureSenate => 'Intégration des Sénateurs';

  @override
  String get futureFeatureCitizenInitiative => 'Référendums Citoyens';

  @override
  String get futureFeaturesDescription =>
      'Ce n\'est pas une liste de souhaits fermée. Lustra est une infrastructure appartenant aux citoyens, nous avons donc tous un impact sur son développement. Rejoignez la communauté Civic Evolution sur Reddit, proposez des idées et votez pour les prochaines fonctionnalités. Écrivons ensemble le prochain chapitre de la démocratie !';

  @override
  String get futureFeaturesVoteButton => 'Voter sur la Roadmap';

  @override
  String get comingSoon => 'Proposition';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Législatif - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Rafraîchir le cache';

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
  String get lustraClubLabel => 'Club Lustra';

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
  String get mandateStatusActive => 'Mandat : actif';

  @override
  String get mandateStatusFulfilled => 'Mandat : accompli';

  @override
  String get mandateStatusCancelled => 'Mandat : annulé';

  @override
  String get mandateStatusInactive => 'Mandat : inactif';

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
  String get pollResultNoVotes => 'Soyez le premier à voter.';

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
  String get votingResultsUSMotionToReferTitle => 'RÉSULTATS : RENVOI';

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
      '...les informations complètes sont disponibles au sein de Lustra';

  @override
  String get civicRulesAction => 'Créez votre projet';

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
  String get termsAndPrivacyTitle => 'Constitution & Vie Privée';

  @override
  String get termsOfServiceTab => 'Règles';

  @override
  String get privacyPolicyTab => 'Vie Privée';

  @override
  String get termsOfServiceContent =>
      'RÈGLES DE LA COMMUNAUTÉ LUSTRA\nDate : 6 décembre 2025\n\n1. OPÉRATEUR ET MISSION\nLustra est une infrastructure publique numérique. L\'opérateur légal (Gardien) est FO&WO VENTURES SP. Z O.O. (LLC). La société agit comme incubateur : pas de dividendes, pas d\'investisseurs externes, réinvestissement des revenus dans l\'infrastructure.\n\n2. CODE ET LICENCE (SOURCE AVAILABLE)\nLe code est un bien commun.\n• Modèle : Open Source (AGPLv3).\n• Autorisé : Usage éducatif, recherche, non lucratif.\n• Interdit : Les entreprises ne peuvent pas profiter de notre travail sans consentement.\n\n3. FEUILLE DE ROUTE GOUVERNANCE\nObjectif : décentralisation.\n• Actuel : Le Fondateur (Jacek) est Architecte Principal.\n• Bientôt : Création d\'un Conseil Civique élu par les utilisateurs.\n• But : Mécanismes permettant à la communauté de prendre le contrôle en cas de trahison de la mission.\n\n4. PROJETS CITOYENS\nUn incubateur de lois.\n• Procédure : Soumission par formulaire, vérification formelle par l\'Opérateur.\n• Licence CC0 : Vous libérez le projet dans le Domaine Public. La loi appartient à tous.\n• Liberté d\'expression : Nous ne jugeons pas les opinions. Nous rejetons uniquement les projets violant le droit pénal.\n• Vérification : Vous devez être citoyen du pays concerné.\n\n5. IA ET SOURCES\n• Rôle IA : L\'IA aide à naviguer mais peut faire des erreurs.\n• Source : L\'autorité ultime est toujours le PDF original.\n\n6. SÉCURITÉ\n• Âge : Utilisateurs 16+.\n• Interdictions : Attaques d\'infrastructure et scraping commercial interdits.\n\n7. DISPOSITIONS FINALES\nRégies par le droit polonais.';

  @override
  String get privacyPolicyContent =>
      'POLITIQUE DE CONFIDENTIALITÉ : MINIMISATION\nDate : 6 décembre 2025\n\nNous ne vendons pas votre attention. Collecte minimale.\n\n1. RESPONSABLE DU TRAITEMENT\nFO&WO VENTURES SP. Z O.O. Contact : jacek@lustra.dev\n\n2. CE QUE NOUS COLLECTONS\n• Compte (E-mail/UID) : Nécessaire pour la connexion.\n• Votes : Liés à votre compte pour empêcher la manipulation (bots). Affichés publiquement UNIQUEMENT comme agrégats anonymes.\n• Rétention : Données de vote conservées pendant la législature + 5 ans (archives/recherche). Ensuite anonymisées.\n• Communication (Club de Soutien) : Avec votre accord (paramètres), nous envoyons des infos sur le projet. Retrait possible à tout moment.\n• Projets Citoyens : Le contenu est public.\n\n3. CE QUE NOUS NE FAISONS PAS\n• PAS de vente de données.\n• PAS de traçage publicitaire.\n• PAS de profilage politique commercial.\n\n4. INFRASTRUCTURE & SÉCURITÉ\n• Lieu : Google Cloud, Europe-West9 (Paris).\n• Anti-Bot : Utilisation de Firebase App Check.\n• IA : Vos données privées ne vont JAMAIS vers l\'IA.\n\n5. ENFANTS\nService pour 16+. Pas de collecte de données d\'enfants.\n\n6. SUPPRESSION\nBouton \"Supprimer le compte\" dans les paramètres pour effacement immédiat.\n\n7. VOS DROITS\nAccès, rectification, suppression, opposition. Contact : jacek@lustra.dev';

  @override
  String get techTitle => 'Lustra AI Protocol v1.1';

  @override
  String get techIntroTitle =>
      '1. MÉTHODOLOGIE DE TRAVAIL COMPLÈTE (LUSTRA AI PROTOCOL)';

  @override
  String get techIntroBody =>
      'Nous présentons ci-dessous le pipeline complet d\'agents IA utilisés pour générer des résumés de textes juridiques et y détecter les hallucinations. L\'objectif était de désamorcer le « trou noir législatif » tout en s\'approchant le plus possible de l\'objectivité. Toutefois, il convient de souligner que nous ne croyons pas à la neutralité totale. Toute compression de données (résumé) est une forme de choix. Au lieu de prétendre au « monopole de la vérité » des médias, nous avons adopté un biais explicite – la « perspective citoyenne » dans le cadre de la context sterilization. Les modèles sont instruits pour ignorer le théâtre politique et se concentrer sur le portefeuille, les libertés et les devoirs. C\'est une décision de conception technique, pas politique.';

  @override
  String get techDiagramTitle => '2. SCHÉMA DE FLUX GENERALIZER-JUDGE-SURGEON';

  @override
  String get techDiagramIntro =>
      'Le système fonctionne en boucle de vérification. Nous ne faisons pas confiance aux modèles génératifs – nous faisons confiance aux processus de vérification et à une approche itérative dans le développement des systèmes.';

  @override
  String get techDiagramOutro =>
      'À l\'avenir, nous prévoyons d\'étendre le système avec des rôles supplémentaires, tels qu\'un journaliste d\'investigation ou un analyste de risque juridique.';

  @override
  String get techPromptsTitle => '3. INSTRUCTIONS COMPLÈTES DES AGENTS';

  @override
  String get techPromptsIntro =>
      'Vous trouverez ci-dessous les prompts complets reçus par les modèles, accompagnés de commentaires explicatifs pour le lecteur. Les réponses sont renvoyées immédiatement en 8 langues pour une localisation complète de Lustra, nous avons donc omis toute la structure de réponse JSON pour plus de lisibilité.';

  @override
  String get techGeneralizerTitle => 'A) Generalizer';

  @override
  String get techGeneralizerBody =>
      'Modèle : Gemini Flash (par défaut) / Pro (pour <20k tokens)';

  @override
  String get techGeneralizerCode =>
      '// CONFIGURATION DU MODÈLE\n// La définition du rôle est critique. \"[country]\" est une variable qui stabilise le modèle.\n// La perspective d\'un citoyen ukrainien (pays en guerre) est différente pour les modèles de celle d\'un citoyen belge (qui peut, par exemple, accorder plus d\'attention à la bureaucratie).\n// Cela définit tout le contexte d\'interprétation de l\'\"importance\" d\'une disposition.\nVous êtes un expert en droit de [country], [...]\n\n// MÉTHODOLOGIE CŒUR\n// Ce n\'est pas une \"demande polie\". C\'est une instruction ferme de filtrage du bruit.\n// Le modèle doit ignorer la politique et chercher l\'impact sur le portefeuille et la vie.\n[...] qui a pour tâche d\'analyser les documents de lois, résolutions et autres documents législatifs, puis de préparer des informations à partir de ceux-ci de manière accessible aux citoyens. Votre objectif est de présenter l\'information de manière à ce que les citoyens puissent évaluer eux-mêmes l\'impact de la législation sur leur vie, même sans connaissances législatives spécialisées. Concentrez-vous sur les faits et les effets objectifs des changements introduits, en évitant les jugements de valeur et les opinions personnelles. Tout jargon juridique est interdit. Présentez les informations de manière claire, concise et engageante, afin qu\'elles soient compréhensibles pour une personne sans formation juridique. Évitez les phrases longues et complexes. Au lieu d\'écrire \"le projet vise à amender le code fiscal...\", écrivez \"Changements fiscaux : nouveaux allégements et obligations pour...\". Continuez votre travail jusqu\'à ce que vous ayez résolu votre tâche. Si vous n\'êtes pas sûr du contenu généré, analysez à nouveau le document – ne devinez pas. Planifiez bien votre tâche avant de commencer. Dans le résumé et les points clés, si possible et justifié, soulignez quels avantages ou effets concrets (positifs ou négatifs) la loi introduit pour la vie quotidienne des citoyens, leurs droits et devoirs, leurs finances personnelles, leur sécurité et d\'autres questions importantes (par ex. interdictions et obligations catégoriques ou les allocations financières et territoriales concrètes les plus importantes).\n// RIGUEUR TECHNIQUE JSON\n// Le conteneur backend est impitoyable. Il n\'acceptera pas de \"bavardage\".\n// Ce doit être du JSON propre. Une erreur de virgule = échec et rejet de l\'ensemble.\nAvant de renvoyer la réponse, vérifiez soigneusement que toute la structure JSON est correcte à 100%, y compris toutes les virgules, accolades, crochets et guillemets. Un JSON incorrect est inacceptable et empêchera le traitement de votre travail.\nAnalysez soigneusement le texte du document juridique ci-dessous.\nCeci est le contenu sur la base duquel vous devez générer le résumé et les points clés :\n--- DÉBUT DU DOCUMENT ---\n[DOCUMENT_TEXT]\n--- FIN DU DOCUMENT --\n\n// STRUCTURE DE SORTIE (pour 8 langues)\n// Doit être rempli parfaitement. Chaque clé est validée.\n// Si le modèle omet par ex. \"fr_summary\" -> tout va à la poubelle.\nN\'OUBLIEZ PAS : Votre réponse DOIT être exclusivement un objet JSON valide. N\'ajoutez aucun caractère, commentaire ou texte supplémentaire avant la balise \'OPEN_BRACE\' ni après la balise \'CLOSE_BRACE\'. Toute la réponse doit être analysable en tant que JSON.\nSur la base du document CI-DESSUS, remplissez la structure JSON ci-dessous : (...)';

  @override
  String get techJudgeTitle => 'B) Judge';

  @override
  String get techJudgeBody => 'Modèle : Flash Lite';

  @override
  String get techJudgeCode =>
      '// CONFIGURATION DU MODÈLE\n// C\'est un modèle heuristique simple, donc son rôle doit aussi être simple. Il n\'a pas à \"comprendre\" la loi. Il doit seulement comparer deux ensembles de données. UNE SEULE TÂCHE !\nRÔLE : Fact Checker.\nTÂCHE : Comparez SOURCE (original) et SUMMARY (résumé préparé par une autre IA).\nVotre objectif est de détecter les \"ENTITÉS FABRIQUÉES\" (Fabricated Entities) dans le SUMMARY.\nSOURCE :\n[SOURCE_TEXT]\nSUMMARY TO EVALUATE :\nTitle : [AI_TITLE]\nSummary : [AI_SUMMARY]\nKey Points : [AI_KEY_POINTS]\n// MÉTHODOLOGIE D\'ÉVALUATION\n// Nous avons dû définir des règles rigides, car Flash Lite se perdait avec l\'abstraction, il a donc reçu une liste de contrôle.\n// Des instructions concrètes réduisent le bruit décisionnel du modèle.\nRÈGLES D\'ÉVALUATION :\n1. Vérifiez tous les NOMBRES, DATES et MONTANTS dans le SUMMARY. S\'il en manque dans la SOURCE -> is_valid : false.\n2. Vérifiez tous les NOMS, ORGANISATIONS et LIEUX dans le SUMMARY. S\'il en manque dans la SOURCE -> is_valid : false.\n3. Vérifiez toutes les ACTIONS JURIDIQUES concrètes. Si ce mécanisme n\'est pas dans la SOURCE -> is_valid : false.\n// EXCEPTION POUR L\'ABSTRACTION\n// C\'est crucial. Les concepts abstraits (par ex. \"augmentation de la bureaucratie\") donnaient souvent des faux positifs.\n// Nous avons dû les exclure de l\'évaluation \"fabricated entity\", car le Juge rejetait des conclusions logiques correctes.\nIMPORTANT : Les concepts abstraits (par ex. \"transparence\", \"confiance\") sont autorisés comme conclusions.\n\n// STRUCTURE DE SORTIE et exigences de formatage pour structurer la réponse.\nOUTPUT (JSON) :\n(\n\"is_valid\" : true/false,\n\"issue\" : \"fabricated_entity\" / \"contradiction\" / \"none\"\n)\nEXIGENCES DE FORMATAGE :\n1. Répondez EXCLUSIVEMENT avec un objet JSON brut.\n2. N\'utilisez PAS de blocs de code Markdown.\n3. N\'ajoutez AUCUNE introduction ni explication avant ou après le JSON.\n4. Le JSON doit être correct et prêt à être analysé.';

  @override
  String get techSurgeonTitle => 'C) Surgeon';

  @override
  String get techSurgeonBody => 'Modèle : Gemini Pro';

  @override
  String get techSurgeonCode =>
      '// CONFIGURATION DU MODÈLE\n// Le Chirurgien n\'est pas là pour écrire. Il est là pour découper le cancer (les hallucinations).\n// Doit maintenir la cohérence avec le \"Citizen Bias\" imposé par le Generalizer.\n// Pour cette raison, il faut passer à un grounding agressif.\nVous êtes un LEGISLATIVE SURGEON.\nVotre tâche est d\'auditer et de réparer le résumé (JSON) quant à sa conformité avec le texte source (SOURCE).\n// MÉGA IMPORTANT. Il ne peut pas ajouter d\'informations. S\'il le faisait – nous augmentons le risque d\'hallucination, et il n\'a plus de juge au-dessus de lui. Mieux vaut des résumés incomplets que faux.\nRÈGLE FONDAMENTALE : \"NO NEW INFORMATION\" (aucune nouvelle information).\nLe résumé ne peut que transformer les informations contenues dans la SOURCE (raccourcir, traduire, sommer). Il ne peut pas générer de nouvelles informations qui ne sont pas dans la SOURCE.\n// PROCÉDURE DE VÉRIFICATION (WORKFLOW)\n// Nous forçons le modèle à un processus de pensée \"Phrase par Phrase\".\nPROCÉDURE DE VÉRIFICATION (exécutez pour chaque phrase du JSON) :\nPosez-vous la question : \"Puis-je indiquer dans la SOURCE un fragment concret qui confirme cette affirmation ?\"\nSI LA RÉPONSE EST \"OUI\" :\nL\'information est confirmée par une citation, un synonyme ou un résultat mathématique des données dans le texte.\nDÉCISION : Laisser inchangé.\nSI LA RÉPONSE EST \"NON\" :\nL\'information n\'est pas dans le texte (c\'est une hallucination, une connaissance externe du modèle, une surinterprétation ou une extrapolation inutile).\nDÉCISION : Supprimez cette information ou modifiez-la pour qu\'elle soit couverte par le texte.\nSI LA RÉPONSE EST \"ÇA DÉPEND\" :\nLe texte n\'est pas clair et le résumé \"devine\" (par ex. en donnant un exemple concret pour un terme général).\nDÉCISION : Soyez prudent. Supprimez les devinettes. Utilisez la terminologie du texte.\n// CATÉGORIES DE RISQUE\n// Estimées sur la base des erreurs précédentes du Generalizer.\n// Nous lui donnons une \"feuille de route\" des endroits où se trouvent généralement les mines.\nCATÉGORIES DE RISQUE (attention particulière) :\nDates (début de validité vs début de financement).\nNombres (les montants concrets doivent résulter du texte).\nSujets (qui fait quoi).\nPortée (ce que la loi couvre et ce qu\'elle ne couvre pas).\n\nINPUT :\n--- SOURCE_TEXT START ---\n[SOURCE_TEXT]\n--- SOURCE_TEXT END ---\n\n--- FLAGGED_JSON START ---\n[FLAGGED_JSON]\n--- FLAGGED_JSON END ---\n\nOUTPUT :\nExclusivement l\'objet JSON réparé conforme à la structure : (...)';

  @override
  String get techConclusionsTitle => '4. CONCLUSIONS EMPIRIQUES';

  @override
  String get techConclusionsIntro =>
      'Au fur et à mesure du développement du système, il a fallu prendre des décisions basées sur des observations et non sur les paramètres des modèles. Cela a donné lieu à des constatations assez intéressantes.';

  @override
  String get techConclusionATitle =>
      'A) Pourquoi utiliser un modèle plus « bête » ?';

  @override
  String get techConclusionABody =>
      'Les tests initiaux sur le droit polonais, audités par Claude et ChatGPT, ont montré que Gemini Flash générait les meilleurs résumés. Il était suivi de près par le modèle Pro, qui recevait parfois une note légèrement inférieure en raison de conclusions trop poussées ou de l\'omission de certains détails. Paradoxalement, la « pensée » du modèle contribuait à une qualité de contenu légèrement inférieure. Conclusion ? Lorsque Pro reçoit un texte court et simple, il commence à philosopher. En conséquence, il peut omettre des faits clés qu\'il considère comme trop évidents. Il perd aussi beaucoup plus souvent la structure JSON (oublie de fermer l\'accolade). Pour les résumés simples, le choix est évident.';

  @override
  String get techConclusionBTitle => 'B) Alors pourquoi Pro ?';

  @override
  String get techConclusionBBody =>
      'Les difficultés commencent avec les documents plus longs. Ici, le modèle Pro est nettement en tête, tandis que les modèles plus faibles ont une tendance beaucoup plus grande aux hallucinations. Ces observations sont également confirmées par des études scientifiques (Lost in the Middle). Cela impose la nécessité d\'utiliser immédiatement le modèle Pro pour les documents plus longs.';

  @override
  String get techConclusionCTitle => 'C) Efficacité';

  @override
  String get techConclusionCBody =>
      'Sur la base d\'expériences empiriques (centaines d\'essais, différents parlements), le taux anti-hallucination est >99%. Pour estimer le coefficient avec une plus grande précision, des dépenses financières supplémentaires seraient nécessaires (milliers ou dizaines de milliers de tests avec les modèles les plus puissants des entreprises d\'IA concurrentes). On peut donc prendre cela avec un grain de sel. La plupart des hallucinations sont des erreurs mineures, par ex. l\'utilisation du mot « homme » au lieu de « député » dans le résumé. Le problème principal du système n\'est donc pas elles, mais une généralisation excessive. Parfois, le Generalizer créera un résumé correct, mais omettra un point critique qui est très important pour le débat public. C\'est cependant un compromis que le système accepte pour le moment, concentré sur l\'élimination totale des hallucinations. L\'ennui est plus sûr que le mensonge.';

  @override
  String get techFooterDate => 'Date de mise à jour Q1 2026';

  @override
  String get techFooterLicense => 'Open Source (AGPLv3) License';

  @override
  String get techGraphSource => 'Legislation Source';

  @override
  String get techGraphDecisionLength => 'Longueur > 20k tokens ?';

  @override
  String get techGraphNo => 'NON';

  @override
  String get techGraphYes => 'OUI';

  @override
  String get techGraphFlash => 'Flash (Système 1)';

  @override
  String get techGraphPro => 'Pro (Système 2)';

  @override
  String get techGraphJudge => 'The Judge (Flash Lite)';

  @override
  String get techGraphDecisionPass => 'Résultat : Pass ?';

  @override
  String get techGraphPublishFirestore => 'HTML Ready';

  @override
  String get techGraphNoRetry => 'NON (Retry)';

  @override
  String get techGraphRepairLoop => 'Boucle de réparation';

  @override
  String get techGraphRetryFlash => '< 2 erreurs : Flash';

  @override
  String get techGraphRetrySurgeon => '> 2 erreurs : Surgeon';

  @override
  String get techGraphSurgeon => 'The Surgeon (Pro)';

  @override
  String get techGraphHtmlReady => 'HTML Ready';

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
    return 'Voter est un choix. Faites le vôtre ici : $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Profil et historique des votes : $deepLink';
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

  @override
  String get authErrorAppleFailed =>
      'La connexion avec Apple a échoué. Veuillez réessayer.';

  @override
  String get continueWithApple => 'Continuer avec Apple';

  @override
  String get homeSearchHint => 'Entrez une phrase...';

  @override
  String get homeSearchButtonDeputies => 'Députés';

  @override
  String get homeSearchButtonLegislations => 'Lois';

  @override
  String get actionSeeAll => 'Voir tout';

  @override
  String get notificationsEnabledForOtherParliament =>
      'Actif pour un autre parlement';

  @override
  String get votingResultsUSMotionToTableTitle => 'RÉSULTATS : MOTION DE REJET';

  @override
  String get crowdfundingLabel =>
      'Soutenez Lustra pour qu’il reste une source indépendante :';

  @override
  String get hashtagLaw => 'Loi';

  @override
  String get hashtagPolitician => 'Politicien';

  @override
  String get statusIntroduced => 'Présenté';

  @override
  String get statusPassedHouse => 'Adopté à la Chambre';

  @override
  String get statusPassedSenate => 'Adopté au Sénat';

  @override
  String get statusBecameLaw => 'Devenu loi';

  @override
  String get statusVetoed => 'Mis son veto';

  @override
  String get statusFailed => 'Rejeté';

  @override
  String get statusPlacedOnCalendar => 'Inscrit au calendrier';

  @override
  String get actionBack => 'Retour';

  @override
  String get actionViewSourceJson =>
      'Journaux de travail de l\'IA pour ce document';

  @override
  String get manualEmailDialogTitle => 'Envoyer le message manuellement';

  @override
  String get manualEmailDialogDescription =>
      'Aucun client de messagerie détecté. Copiez les données ci-dessous et envoyez-les vous-même.';

  @override
  String get labelRecipient => 'Destinataire';

  @override
  String get labelSubject => 'Objet';

  @override
  String get labelBody => 'Corps du message';

  @override
  String get actionCopy => 'Copier';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get webBannerDownloadMessage =>
      'Pour profiter pleinement des fonctionnalités, téléchargez l\'application !';

  @override
  String get webBannerDownloadButton => 'Télécharger';

  @override
  String get supportStripeButton => 'Soutenir (Stripe)';

  @override
  String get supportFounderMessage =>
      'Il n\'y a pas de grande entreprise derrière ce projet, juste moi et mon ordinateur portable. J\'ai construit cela car je crois qu\'une telle technologie doit exister et rester 100% indépendante du capital, qui dicte toujours le récit. C\'est mon cadeau au monde.';

  @override
  String get civicProjectTitle => 'Projet Citoyen';

  @override
  String get drafterAuthRequired =>
      'Authentification requise. Veuillez d\'abord vous connecter à Lustra.';

  @override
  String get drafterLaunchError =>
      'Échec du lancement de la passerelle Drafter :';

  @override
  String get drafterButtonTitle =>
      'UTILISEZ LUSTRA DRAFTER POUR CRÉER UNE LOI À PARTIR D\'UNE IDÉE EN 5 MINUTES';

  @override
  String get submitCivicProjectButton => 'Créez votre projet';

  @override
  String get civicThresholdCandidate => 'À réviser.';

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
  String get civicWarningTitle => 'Intégrité du Projet';

  @override
  String get civicWarningText =>
      'Le texte principal est permanent. Vous pouvez uniquement ajouter des amendements pour affiner le texte sans en changer l\'intention initiale. Chaque modification est ajoutée en annexe pour garantir la transparence.';

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
  String get supportMegaTitle => 'Propriété Citoyenne';

  @override
  String get verificationRequiredTitle => 'Vérification requise';

  @override
  String get verificationRequiredContent =>
      'Pour comptabiliser votre vote dans le classement, nous devons confirmer que vous êtes humain.\n\nVeuillez vérifier votre boîte de réception (y compris le dossier SPAM).';

  @override
  String get verificationResendLink => 'Renvoyer le lien';

  @override
  String get verificationLinkSentSuccess => 'Lien renvoyé !';

  @override
  String get verificationAlreadyConfirmed => 'J\'ai confirmé';

  @override
  String get verificationSuccessVotingUnlocked => 'Merci ! Vous pouvez voter.';

  @override
  String get verificationStillNotVerified =>
      'Confirmation non trouvée. Veuillez réessayer dans un instant.';

  @override
  String get cancel => 'Annuler';

  @override
  String get pollVoteSignificance => 'Votre vote n\'est que le début.';

  @override
  String get pollShareImpact =>
      'Les algorithmes nous font souvent taire. Votre seul partage touche en moyenne 50 à 300 personnes. Aidez-nous à briser la bulle des réseaux sociaux.';

  @override
  String get pollShareAction => 'Partagez et amplifiez la voix des citoyens';

  @override
  String get listRefreshed => 'Liste actualisée !';

  @override
  String get errorNoDataReturned => 'Aucune donnée retournée';

  @override
  String get errorMustBeLoggedInToSubscribe =>
      'Vous devez être connecté pour vous abonner.';

  @override
  String get subscribedToList => 'Abonné à la liste !';

  @override
  String get unsubscribedFromList => 'Désabonné de la liste.';

  @override
  String get errorListRemovedByOwner =>
      'Liste supprimée par son propriétaire...';

  @override
  String get errorFailedToUpdateSubscription =>
      'Échec de la mise à jour de l\'abonnement.';

  @override
  String get notificationSentCooldownActive =>
      'Notification envoyée aux abonnés !...';

  @override
  String get errorCooldownActiveNotification =>
      'Délai d\'attente actif. Vous pouvez envoyer...';

  @override
  String get errorFailedToSendNotification =>
      'Échec de l\'envoi de la notification.';

  @override
  String get nameYourCuratorList => 'Nommez votre liste d\'auteur';

  @override
  String get hintCuratorListExample => 'ex. Ma Politique Économique';

  @override
  String listCreatedSuccess(String text) {
    return 'Liste \'$text\' créée !';
  }

  @override
  String get errorFailedToCreateList => 'Échec de la création de la liste.';

  @override
  String get actionCreate => 'Créer';

  @override
  String get unnamedList => 'Liste sans nom';

  @override
  String get tooltipEditList => 'Modifier la liste';

  @override
  String get addDescriptionHint => 'Ajoutez une description...';

  @override
  String subscribersCount(int subs) {
    return '$subs abonnés';
  }

  @override
  String get actionShareList => 'Partager la liste';

  @override
  String get actionSupportCreator => 'Soutenir le créateur';

  @override
  String availableInHours(int hoursLeft) {
    return 'Disponible dans ${hoursLeft}h';
  }

  @override
  String get actionNotifySubscribers => 'Informer les abonnés';

  @override
  String get actionSubscribed => 'Abonné';

  @override
  String get actionSubscribe => 'S\'abonner';

  @override
  String get tooltipReportList => 'Signaler la liste';

  @override
  String get tooltipDeleteList => 'Supprimer la liste';

  @override
  String get draftYourCivicProject => 'Rédigez votre propre projet citoyen';

  @override
  String get draftCivicProjectDescription =>
      'Transformez vos idées en véritables projets de loi et rassemblez des soutiens. Lustra est prête pour vos politiques.';

  @override
  String get createYourOwnList => 'Créez votre propre liste';

  @override
  String get createYourOwnListDescription =>
      'Devenez curateur. Sélectionnez des projets de loi importants, invitez des abonnés et envoyez des notifications sur leurs appareils pour les tenir informés des changements dans votre liste de législation ou de projets citoyens.';

  @override
  String get editListDetails => 'Modifier les détails';

  @override
  String get listNameLabel => 'Nom de la liste';

  @override
  String get descriptionOptionalLabel => 'Description (Optionnel)';

  @override
  String get supportCreatorOptionalLabel => 'Soutenir le créateur (Optionnel)';

  @override
  String providerUsernameLabel(String provider) {
    return 'Nom d\'utilisateur $provider';
  }

  @override
  String get listUpdatedSuccess => 'Liste mise à jour !';

  @override
  String get errorFailedToUpdate => 'Échec de la mise à jour.';

  @override
  String get actionSave => 'Enregistrer';

  @override
  String get deleteListDialogTitle => 'Supprimer la liste ?';

  @override
  String get deleteListDialogBody => 'Cette action est irréversible...';

  @override
  String get listDeletedSuccess => 'Liste supprimée.';

  @override
  String get errorFailedToDelete => 'Échec de la suppression.';

  @override
  String get actionDelete => 'Supprimer';

  @override
  String get syncingCuratedFeed => 'SYNCHRONISATION DE LA LISTE D\'AUTEUR...';

  @override
  String get actionTryAgain => 'Réessayer';

  @override
  String get tooltipSetAsListCover => 'Définir comme couverture de liste';

  @override
  String get coverUpdatedSuccess => 'Couverture mise à jour !';

  @override
  String get errorUpdatingCover =>
      'Erreur lors de la mise à jour de la couverture.';

  @override
  String get loaderLoadingProfile => 'CHARGEMENT DU PROFIL...';

  @override
  String get loaderRetrievingVoteLogs =>
      'RÉCUPÉRATION DES JOURNAUX DE VOTES...';

  @override
  String get loaderLoadingRecentVotes => 'CHARGEMENT DES VOTES RÉCENTS...';

  @override
  String get loaderFetchingData => 'RÉCUPÉRATION DES DONNÉES...';

  @override
  String get loaderLoadingTrackedBills => 'CHARGEMENT DES LOIS SUIVIES...';

  @override
  String get emptyTrackedBills => 'Vous ne suivez encore aucune loi.';

  @override
  String get notificationsMobileOnly =>
      'Notifications disponibles uniquement sur l\'application.';

  @override
  String get titleYourTrackedBills => 'Vos Lois Suivies';

  @override
  String get buttonSeeAllTracked => 'Voir tous les suivis';

  @override
  String get titleNameYourList => 'Nommez votre liste';

  @override
  String get hintEgMySocialPolicies => 'ex. Mes Politiques Sociales';

  @override
  String snackbarListCreated(String text) {
    return 'Liste \'$text\' créée !';
  }

  @override
  String get snackbarFailedToCreateList => 'Échec de la création.';

  @override
  String get buttonCreate => 'Créer';

  @override
  String get titleRenameYourList => 'Renommer votre liste';

  @override
  String get snackbarListRenamed => 'Liste renommée !';

  @override
  String get snackbarFailedToRenameList => 'Échec du renommage.';

  @override
  String get buttonSave => 'Enregistrer';

  @override
  String get titleYourLists => 'Vos Listes';

  @override
  String get emptyNoListsYet => 'Vous n\'avez pas encore de listes.';

  @override
  String get tooltipRename => 'Renommer';

  @override
  String get snackbarErrorUpdatingList => 'Erreur lors de la mise à jour.';

  @override
  String get tooltipShareList => 'Partager la liste';

  @override
  String get buttonCreateNewList => 'Créer une nouvelle liste';

  @override
  String get errorLimitOf3ListsReached => 'Limite de 3 listes atteinte.';

  @override
  String get snackbarFailedToDelete => 'Échec de la suppression.';

  @override
  String get loaderFetchingMirrorParliamentData =>
      'RÉCUPÉRATION DES DONNÉES DU PARLEMENT MIROIR...';

  @override
  String get loaderSecuringSafeChannel => 'CHIFFREMENT DE LA CONNEXION...';

  @override
  String get snackbarAddedToList => 'Ajouté à votre liste.';

  @override
  String get snackbarRemovedFromList => 'Retiré de votre liste.';

  @override
  String get loaderLoadingData => 'CHARGEMENT DES DONNÉES...';

  @override
  String get buttonAddToList => 'Ajouter à la liste';

  @override
  String get previousStatusLabel => 'Précédemment :';

  @override
  String get statusLabel => 'Statut :';

  @override
  String get loaderEstablishingConnection => 'ÉTABLISSEMENT DE LA CONNEXION...';

  @override
  String get loaderFetchingInitiatives => 'RÉCUPÉRATION DES INITIATIVES...';

  @override
  String get loaderLoadingMoreInitiatives =>
      'CHARGEMENT DE PLUS D\'INITIATIVES...';

  @override
  String get loaderLoadingMore => 'CHARGEMENT...';

  @override
  String get errorMustBeLoggedInToTrack =>
      'Vous devez être connecté. Créez un compte.';

  @override
  String get loaderLoadingYourTrackedList =>
      'CHARGEMENT DE VOTRE LISTE DE SUIVI...';

  @override
  String get emptyNotTrackingAnything => 'Vous ne suivez rien pour le moment.';

  @override
  String get loaderLoadingLegislativeData =>
      'CHARGEMENT DES DONNÉES LÉGISLATIVES...';

  @override
  String get loaderAuthorizing => 'AUTORISATION...';

  @override
  String get loaderLoading => 'CHARGEMENT...';

  @override
  String get snackbarLinkCopied => 'Lien copié dans le presse-papiers !';

  @override
  String get civicWillRecord => 'REGISTRE DE LA VOLONTÉ CITOYENNE';

  @override
  String totalVotesRecorded(String totalVotes) {
    return '$totalVotes VOTES ENREGISTRÉS';
  }

  @override
  String get recordYourPositionForAudit =>
      'Enregistrez votre position pour l\'audit.';

  @override
  String get privateList => 'Liste Privée';

  @override
  String get loaderLoadingCuratedFeed => 'CHARGEMENT DE LA LISTE D\'AUTEUR...';

  @override
  String get buttonOpenFullList => 'Ouvrir la liste complète';

  @override
  String get filtersLabel => 'Filtres';

  @override
  String get statusFilterLabel => 'Statut';

  @override
  String get onlyWithSourceTextLabel => 'Uniquement avec le texte source';

  @override
  String get trackedBillsTitle => 'Lois Suivies';

  @override
  String get curatedListTitle => 'Liste Privée';

  @override
  String get loaderLoadingProfiles => 'CHARGEMENT DES PROFILS...';

  @override
  String get loaderLoadingMoreProfiles => 'CHARGEMENT DE PLUS DE PROFILS...';

  @override
  String get loaderInitializingMirrorParliament =>
      'INITIALISATION DU PARLEMENT MIROIR...';

  @override
  String get loaderSyncingVectors => 'SYNCHRONISATION DES VECTEURS...';

  @override
  String get reportIncludeDiagnosticsTitle =>
      'Inclure les diagnostics du système';

  @override
  String get reportIncludeDiagnosticsSubtitle =>
      'Joint l\'état actif (Parlement, Mandat, Cible) pour nous aider à corriger le problème.';

  @override
  String get loaderSendingReport => 'ENVOI DU RAPPORT...';

  @override
  String primaryParliamentLabel(String parliament) {
    return 'Principal : $parliament';
  }

  @override
  String get buttonCreateAnotherList => 'Créer une autre liste';

  @override
  String get buttonCreateTrackingList => 'Créer une liste de suivi';

  @override
  String get errorMissingListId => 'Erreur : ID de liste manquant';

  @override
  String get actionTracked => 'Suivi';

  @override
  String get actionTrack => 'Suivre';

  @override
  String pollSupportPercent(String percent) {
    return 'POUR $percent%';
  }

  @override
  String get pollSyncing => 'SYNCHRONISATION...';

  @override
  String pollOpposePercent(String percent) {
    return 'CONTRE $percent%';
  }

  @override
  String get pollPositionRecorded => 'POSITION ENREGISTRÉE';

  @override
  String get pollRestrictedToCitizens => 'RÉSERVÉ AUX CITOYENS';

  @override
  String yourListsForCountry(String countryName) {
    return 'Vos Listes ($countryName)';
  }

  @override
  String get bottomNavGetInvolved => 'S\'impliquer';

  @override
  String get errorLaunchUrl => 'Impossible d\'ouvrir le lien';

  @override
  String get infoTechTitle => 'Comment fonctionne la technologie';

  @override
  String get infoTechSubtitle =>
      'Découvrez notre architecture, la stérilisation des données et nos principes de civic tech.';

  @override
  String get infoGovTitle => 'Transparence et Gouvernance';

  @override
  String get infoGovSubtitle =>
      'Qui construit cela, qui paie et où nous allons.';

  @override
  String get infoPrivacyTitle => 'Constitution et Confidentialité';

  @override
  String get infoPrivacySubtitle =>
      'Transparence radicale. Quelles données nous collectons et pourquoi.';

  @override
  String get manualTitle => 'Manuel Ouvert du Citoyen';

  @override
  String get manualSubtitle =>
      'Apprenez à vous réapproprier le pouvoir en démocratie.';

  @override
  String get howToActTitle => 'Comment agir avec Lustra';

  @override
  String get actAuditTitle => 'Audit Citoyen';

  @override
  String get actAuditSubtitle =>
      'Votez sur les lois pour façonner la hiérarchie des sujets et laisser une preuve solide de la Volonté Citoyenne. Ne laissez plus les médias détourner la conversation.';

  @override
  String get actWatchlistTitle => 'Listes de Suivi';

  @override
  String get actWatchlistSubtitle =>
      'Créez des listes personnalisées de projets de loi pour rassembler des abonnés et sensibiliser. Utilisez les réseaux sociaux comme force de lobbying.';

  @override
  String get actDraftTitle => 'Rédiger des Projets Citoyens';

  @override
  String get actDraftSubtitle =>
      'Soumettez vos initiatives professionnelles à Lustra. La société a besoin d\'idées nouvelles non bloquées par le capital. Créez, partagez et rassemblez des soutiens.';

  @override
  String get joinCommunityTitle => 'Rejoindre la Communauté';

  @override
  String get subscribedLists => 'Abonné';

  @override
  String get snackbarAddedToListWebPromo =>
      'Ajouté ! Téléchargez l\'application pour recevoir des notifications push.';

  @override
  String get aboutGovAppBar => 'Gouvernance';

  @override
  String get aboutGovTitle => 'Transparence & Gouvernance';

  @override
  String get aboutGovSubtitle =>
      'Qui construit cela, qui paie et où nous allons.';

  @override
  String get aboutGovFounderName => 'Jacek (Fons)';

  @override
  String get aboutGovFounderBadge => 'ARCHITECTE SOLO / FONDATEUR';

  @override
  String get aboutGovFounderP1 =>
      'Je ne suis pas un politicien, un avocat ou un universitaire. Je n\'ai pas de diplômes officiels. Il y a 18 mois, je faisais des ménages. J\'ai passé toute l\'année 2025 au chômage, à construire ce système à partir de zéro sur un ordinateur portable de 2016.';

  @override
  String get aboutGovFounderP2 =>
      'Pourquoi ? Parce que j\'étais frustré que les milliardaires et les entreprises aient de meilleurs outils de données que les citoyens. J\'étais frustré par la confiscation du droit aux citoyens et par les guerres narratives menées par les médias, qui soit aliènent les gens de la politique, soit les obligent à choisir un camp. J\'ai tout appris par moi-même pour construire un Parlement Miroir (Mirror Parliament). Je ne crois pas aux pétitions en ligne ; je crois à la transparence pure basée sur les données et à l\'accessibilité. Et au fait que la démocratie a besoin d\'une mise à jour.';

  @override
  String get aboutGovFounderP3 =>
      'Vous pourriez demander : \"Pourquoi devrais-je vous faire confiance ?\". Ne faites confiance à personne, surtout en politique - commencez à auditer.';

  @override
  String get aboutGovSec1Title => '1. Financement & Infrastructure';

  @override
  String get aboutGovSec1Intro =>
      'Il n\'y a pas de capital-risque (VC). Il n\'y a pas d\'argent sale. Il n\'y a pas de crypto. Actuellement, cette opération est entièrement autofinancée (bootstrapped).';

  @override
  String get aboutGovSec1Bullet1Title => 'Infrastructure :';

  @override
  String get aboutGovSec1Bullet1Text =>
      'Couverte par une bourse de 2 000 \$ du programme Google For Startups. Il nous reste actuellement environ 1 200 \$, ce qui nous donne environ 12 mois de fonctionnement des serveurs.';

  @override
  String get aboutGovSec1Bullet2Title => 'Coût de la vie :';

  @override
  String get aboutGovSec1Bullet2Text =>
      'Soutenu entièrement par mes économies personnelles, ma fiancée et ma famille.';

  @override
  String get aboutGovSec1Bullet3Title => 'Stack Technologique :';

  @override
  String get aboutGovSec1Bullet3Text =>
      'Construit seul (Flutter, Firebase, Vertex AI pipeline, Node.js) pour maintenir les coûts opérationnels proches de zéro.';

  @override
  String get aboutGovSec2Title => '2. Entité Juridique Actuelle & Transition';

  @override
  String get aboutGovSec2P1 =>
      'Lustra est actuellement incubé sous mon ancienne SARL polonaise (FO&WO VENTURES SP. Z O.O.). C\'est une nécessité légale. Pour publier sur les App Stores d\'Apple/Google et pour recevoir les crédits Google Startup, une entreprise enregistrée avec un numéro DUNS est requise. Je n\'ai pas encore les moyens de payer les frais juridiques pour créer une Fondation (+ de 500 \$ de création et de comptabilité mensuelle), j\'utilise donc le véhicule le plus léger possible.';

  @override
  String get aboutGovSec2BoxTitle => 'La Feuille de Route vers le Non-Profit :';

  @override
  String get aboutGovSec2BoxText =>
      'Dès que nous atteindrons la liquidité financière et la masse critique (environ 100k utilisateurs mensuels), je prévois d\'ouvrir une organisation à but non lucratif officielle et d\'y transférer toute la propriété intellectuelle et l\'infrastructure.';

  @override
  String get aboutGovSec2P2 =>
      'Le but ultime est une structure de gouvernance démocratique. Les décisions seront prises par un conseil élu par la communauté. Mon rôle sera strictement limité à la maintenance technique du backend. Je ne vois pas d\'autre avenir pour Lustra qu\'une opération à but non lucratif avec une transparence totale de tous les documents financiers.';

  @override
  String get aboutGovSec3Title => '3. Sécurité & Code Source';

  @override
  String get aboutGovSec3Bullet1Title => 'Authentification :';

  @override
  String get aboutGovSec3Bullet1Text =>
      'Nous ne touchons pas à vos mots de passe. Nous utilisons l\'authentification Google/Apple car leur infrastructure de sécurité est supérieure. Nous ne stockons qu\'un ID utilisateur anonymisé et votre ID de vote pour bloquer les fermes de bots.';

  @override
  String get aboutGovSec3Bullet2Title =>
      'Code Source Disponible (Source Available) :';

  @override
  String get aboutGovSec3Bullet2Text =>
      'Les dépôts principaux sont publics sous la licence Open Source (AGPLv3). Elle protège contre le clonage par des entreprises, mais les adaptateurs de données, les prompts système de l\'IA et la logique sont entièrement visibles pour être audités.';

  @override
  String get aboutGovSec3BoxTitle => 'Nous avons besoin d\'aide.';

  @override
  String get aboutGovSec3BoxText =>
      'Je suis un gars avec un vieil ordinateur portable, qui fait tout. Si vous êtes un développeur, un journaliste ou un citoyen qui veut aider à établir des cellules locales dans votre pays — contactez-moi.';

  @override
  String get aboutGovSec3Contact => 'Contact : jacek@lustra.dev';

  @override
  String get aboutGovSec3Github => 'Profil GitHub';

  @override
  String get termsAppBar => 'Constitution & Confidentialité';

  @override
  String get termsTitle => 'Constitution & Confidentialité';

  @override
  String get termsLastUpdated => 'Dernière mise à jour : 12 mars 2026';

  @override
  String get termsAlertTitle =>
      'Transparence Radicale : Ce que nous collectons réellement';

  @override
  String get termsAlertP1 =>
      'Vous vous dites peut-être : \"Je ne vais pas donner mes données à des inconnus.\" Nous sommes d\'accord. C\'est pourquoi votre vie privée ne nous intéresse pas. Nous voulons seulement vérifier que vous êtes un véritable humain votant sur de véritables lois.';

  @override
  String get termsAlertP2 =>
      'Voici la structure de données exacte que nous stockons pour votre profil utilisateur dans notre base de données Google Cloud Firestore. Aucun champ caché. Aucun cookie de suivi.';

  @override
  String get termsAlertCode =>
      '[\n  \'uid\': \'0A21rfdsTs1F3kYsx3252352\', // Généré par Firebase Auth\n  \'email\': \'citoyen@example.com\', // Vos seules Données Personnelles\n  \'createdAt\': \'February 15, 2026 at 8:23:31 PM UTC\',\n  \'marketingConsent\': true, // Pour les actus du projet (optionnel)\n  \'primaryParliamentId\': \'Assemblée Nationale Française\'\n]';

  @override
  String get termsAlertH4 =>
      'Attendez, où sont mes votes et les lois que je suis ?';

  @override
  String get termsAlertP3 =>
      'Pour protéger votre vie privée et assurer une mise à l\'échelle efficace de notre base de données, vos interactions sont séparées (sharded) de votre profil principal :';

  @override
  String get termsAlertB1Title => 'Lois Suivies :';

  @override
  String get termsAlertB1Text =>
      'Stockées dans une sous-collection privée. Seul vous (et votre appareil) pouvez demander à voir la liste des lois que vous suivez.';

  @override
  String get termsAlertB2Title => 'Vos Votes (Hachage Cryptographique) :';

  @override
  String get termsAlertB2Text =>
      'Lorsque vous votez, nous N\'ATTACHONS PAS votre UID directement au registre public des votes. Au lieu de cela, le serveur génère un Hash cryptographique (ex: a1b2c3d4...) en utilisant un \"sel\" (salt) secret du serveur. Cela pseudonymise fortement votre vote. Si un pirate vole la base de données, il ne peut pas voir qui a voté pour quoi. Bien que mathématiquement il s\'agisse d\'une fonction à sens unique, dans un esprit de transparence absolue, vous devez savoir que les opérateurs du système (qui détiennent le sel secret) pourraient théoriquement vérifier un vote pour auditer le système en cas de fraude ou pour se conformer à une décision de justice valide. Cependant, vos votes sont strictement séparés de votre profil quotidien et ne sont jamais affichés publiquement avec votre identité.';

  @override
  String get termsAlertP4 =>
      'C\'est tout. Le reste n\'est que de l\'analyse anonyme (Firebase Analytics) pour corriger les bugs, et App Check pour empêcher les fermes de bots de truquer les votes. Nous ne vendons pas de données. Nous ne diffusons pas de publicités.';

  @override
  String get termsTocTitle => 'Table des Matières';

  @override
  String get termsPart1Title =>
      'Partie 1 : Politique de Confidentialité (Minimisation des Données)';

  @override
  String get termsPart1Intro =>
      'Nous ne faisons pas commerce de votre attention. Nous ne collectons que ce qui est techniquement nécessaire pour opérer une infrastructure civique sécurisée.';

  @override
  String get termsP1S1Title => '1. Contrôleur des Données';

  @override
  String get termsP1S1Text =>
      'L\'opérateur légal est temporairement FO&WO VENTURES SP. Z O.O. (SARL), basée à Wrocław, Pologne. Contact : jacek@lustra.dev';

  @override
  String get termsP1S2Title => '2. Ce Que Nous Collectons';

  @override
  String get termsP1S2B1Title => 'Compte (Email/UID) :';

  @override
  String get termsP1S2B1Text =>
      'Nécessaire pour la connexion sécurisée via Firebase Authentication.';

  @override
  String get termsP1S2B2Title => 'Votes & Sondages (Anonymisés) :';

  @override
  String get termsP1S2B2Text =>
      'Vos votes construisent les statistiques. Ils sont liés à votre compte uniquement pour bloquer les fermes de bots et les votes en double. Publiquement, vos votes sont affichés UNIQUEMENT sous forme d\'agrégats anonymes. L\'enregistrement réel du vote est haché cryptographiquement pour séparer votre identité de votre choix politique.';

  @override
  String get termsP1S2B3Title => 'Lois Suivies & Notifications Push :';

  @override
  String get termsP1S2B3Text =>
      'Si vous choisissez de suivre une loi ou de vous abonner à une Liste Curatée, nous utilisons les Topics Firebase Cloud Messaging (FCM) de Google. Cela nous permet de vous envoyer des notifications push concernant les changements de statut sans suivre en permanence votre position ou l\'identité de votre appareil.';

  @override
  String get termsP1S2B4Title => 'Conservation des Votes :';

  @override
  String get termsP1S2B4Text =>
      'Les données de vote sont stockées pour la durée du mandat parlementaire plus 5 ans à des fins d\'archivage et de recherche.';

  @override
  String get termsP1S2B5Title => 'Communication :';

  @override
  String get termsP1S2B5Text =>
      'Si vous y consentez explicitement, nous vous enverrons des mises à jour du projet par email. Vous pouvez retirer votre consentement à tout moment.';

  @override
  String get termsP1S2B6Title => 'Projets Citoyens :';

  @override
  String get termsP1S2B6Text =>
      'Le contenu des projets de loi soumis par vos soins est entièrement public.';

  @override
  String get termsP1S2Highlight =>
      '3. CE QUE NOUS NE FAISONS PAS :\n\n❌ Nous NE vendons PAS de données aux courtiers en données.\n❌ Nous N\'utilisons PAS de suivi publicitaire.\n❌ Nous NE vous profilons PAS politiquement à des fins commerciales.';

  @override
  String get termsP1S3Title => '4. Infrastructure & Sécurité';

  @override
  String get termsP1S3B1Title => 'Localisation :';

  @override
  String get termsP1S3B1Text =>
      'Les données sont hébergées en toute sécurité sur Google Cloud Platform, Europe-West9 (Paris).';

  @override
  String get termsP1S3B2Title => 'Anti-Bot :';

  @override
  String get termsP1S3B2Text =>
      'Nous utilisons Firebase App Check pour vérifier l\'authenticité de l\'application et empêcher les manipulations automatisées.';

  @override
  String get termsP1S3B3Title => 'Confidentialité IA :';

  @override
  String get termsP1S3B3Text =>
      'Nous n\'envoyons que les documents gouvernementaux publics aux modèles d\'IA pour en faire des résumés. Vos données privées ne vont JAMAIS à l\'IA.';

  @override
  String get termsP1S4Title => '5. Enfants & Suppression de Compte';

  @override
  String get termsP1S4P1 =>
      'Le service est destiné aux utilisateurs de 16 ans et plus. Nous ne collectons pas sciemment les données des enfants.';

  @override
  String get termsP1S4P2 =>
      'Pour supprimer vos données : Utilisez le bouton \"Supprimer le compte\" directement dans les paramètres de l\'application pour retirer immédiatement vos données d\'identification, votre email et toutes vos sous-collections de nos serveurs.';

  @override
  String get termsP1S5Title => '6. Vos Droits';

  @override
  String get termsP1S5Text =>
      'Conformément au RGPD, vous avez le droit d\'accéder, de rectifier, d\'effacer et de vous opposer au traitement de vos données. Contactez-nous à l\'email fourni ci-dessus.';

  @override
  String get termsPart2Title =>
      'Partie 2 : Règles de la Communauté (Conditions d\'Utilisation)';

  @override
  String get termsP2S1Title => '1. Opérateur et Mission';

  @override
  String get termsP2S1Text =>
      'Lustra est une infrastructure publique numérique. L\'entreprise agit comme un incubateur : elle ne verse aucun dividende, n\'a aucun investisseur externe et réinvestit directement tous les revenus dans la maintenance de l\'infrastructure.';

  @override
  String get termsP2S2Title => '2. Code et Licence (Source Available)';

  @override
  String get termsP2S2Intro =>
      'Le code de Lustra est un bien commun protégé de l\'exploitation par les entreprises.';

  @override
  String get termsP2S2B1Title => 'Modèle :';

  @override
  String get termsP2S2B1Text => 'Licence Open Source (AGPLv3).';

  @override
  String get termsP2S2B2Title => 'Autorisé :';

  @override
  String get termsP2S2B2Text =>
      'Utilisation éducative, de recherche et à but non lucratif/civique.';

  @override
  String get termsP2S2B3Title => 'Interdit :';

  @override
  String get termsP2S2B3Text =>
      'Les entreprises ne peuvent pas utiliser ou tirer profit de notre travail sans le consentement explicite de la communauté.';

  @override
  String get termsP2S3Title => '3. Feuille de Route de la Gouvernance';

  @override
  String get termsP2S3Intro =>
      'Notre objectif à long terme est une décentralisation totale.';

  @override
  String get termsP2S3B1Title => 'État actuel :';

  @override
  String get termsP2S3B1Text =>
      'Le Fondateur agit en tant qu\'Architecte Principal.';

  @override
  String get termsP2S3B2Title => 'Bientôt :';

  @override
  String get termsP2S3B2Text =>
      'Création d\'un Conseil Civique élu directement par les utilisateurs.';

  @override
  String get termsP2S3B3Title => 'Objectif :';

  @override
  String get termsP2S3B3Text =>
      'Mettre en œuvre des mécanismes techniques et juridiques pour que la communauté prenne le contrôle de la plateforme en cas de trahison de la mission.';

  @override
  String get termsP2S4Title =>
      '4. Programme de Projets Citoyens (Incubateur de Lois)';

  @override
  String get termsP2S4Intro =>
      'Nous fournissons un espace pour que les citoyens rédigent les lois.';

  @override
  String get termsP2S4B1Title => 'Procédure :';

  @override
  String get termsP2S4B1Text =>
      'Les projets sont soumis via un formulaire et vérifiés formellement par l\'Opérateur.';

  @override
  String get termsP2S4B2Title => 'Domaine Public :';

  @override
  String get termsP2S4B2Text =>
      'En soumettant un projet, vous le publiez sous la Licence CC0 (Domaine Public). La loi appartient à tout le monde.';

  @override
  String get termsP2S4B3Title => 'Liberté d\'Expression :';

  @override
  String get termsP2S4B3Text =>
      'Nous ne jugeons pas les opinions ou les tendances politiques. Nous ne rejetons que les projets violant le droit pénal ou incitant à la violence.';

  @override
  String get termsP2S4B4Title => 'Vérification :';

  @override
  String get termsP2S4B4Text =>
      'Vous devez être citoyen du pays où vous soumettez un projet de loi.';

  @override
  String get termsP2S5Title => '5. IA et Hiérarchie des Sources';

  @override
  String get termsP2S5Text =>
      'L\'IA est un outil, pas un oracle. L\'IA aide à naviguer dans le langage juridique complexe mais peut faire des erreurs. L\'autorité suprême est TOUJOURS le document PDF/XML original lié en bas de chaque résumé dans l\'application.';

  @override
  String get termsP2S6Title => '6. Sécurité & Dispositions Finales';

  @override
  String get termsP2S6Text =>
      'Les attaques sur l\'infrastructure, les DDoS et le scraping commercial sont strictement interdits. Les questions non réglementées par les présentes sont régies par le droit polonais.';

  @override
  String get bpAppBar => 'Architecture du Système';

  @override
  String get bpTitle =>
      'Comment Nous Reprenons le Contrôle de la Démocratie avec le Parlement Miroir : Manuel du Citoyen';

  @override
  String get bpIntroBig =>
      'Vue d\'Ensemble : Le système démocratique actuel est un \"téléphone arabe\" cassé. Nous réparons le signal en connectant les citoyens directement au processus législatif via le Parlement Miroir (Lustra).';

  @override
  String get bpIntroSmall =>
      'Pourquoi c\'est important : Actuellement, nous ne votons que tous les quelques années. Entre les élections, nous avons zéro contrôle. Lustra nous donne \"une place à la table\" chaque jour.';

  @override
  String get bpS1Title => '1. LE PROBLÈME : Une Boucle Brisée';

  @override
  String get bpS1P1 =>
      'L\'information circule dans un seul sens et se déforme.';

  @override
  String get bpS1Code =>
      'Les citoyens élisent des politiciens\n   ↓\nLes politiciens forment un Gouvernement\n   ↓\nLes médias interprètent sélectivement les actions du gouvernement\n   ↓\nLes citoyens reçoivent des retours (déformés)';

  @override
  String get bpS1Highlight =>
      'Résultat : Nous ne savons pas ce qui se passe réellement à cause du jargon juridique et du bruit médiatique.';

  @override
  String get bpS2Title => '2. LA SOLUTION : Réparer le Flux d\'Information';

  @override
  String get bpS2P1 =>
      'Lustra supprime les intermédiaires. Il simule un véritable siège du pouvoir où votre voix est enregistrée sur des lois spécifiques, pas seulement des sondages généraux.';

  @override
  String get bpS2FlowMedia => 'MÉDIAS (observateur optionnel)';

  @override
  String get bpS2Flow1 => 'Les citoyens voient un projet de loi et l\'évaluent';

  @override
  String get bpS2Flow2 =>
      'Les politiciens voient le résultat de la volonté citoyenne';

  @override
  String get bpS2Flow3 =>
      'Les politiciens votent (surveillés par rapport aux données)';

  @override
  String get bpS2Flow4 =>
      'Les citoyens vérifient : Le politicien a-t-il respecté les données ?';

  @override
  String get bpS2Flow5 =>
      'Les citoyens choisissent les politiciens en fonction de leur \"Score d\'Obéissance\" (Obedience Score)';

  @override
  String get bpS2Flow6 => 'Un nouveau Gouvernement est formé.';

  @override
  String get bpS2FlowLoop => 'LE CYCLE SE RÉPÈTE';

  @override
  String get bpS3Title => '3. COMMENT ÇA MARCHE';

  @override
  String get bpS3ATitle =>
      'Étape A : Supprimer la Barrière de la Langue (Traduction)';

  @override
  String get bpS3AP1 =>
      'La plupart des lois sont ennuyeuses et illisibles. Lustra comble le Fossé de l\'Accessibilité.';

  @override
  String get bpS3AP2 =>
      'Avantage : 20 secondes pour comprendre les faits. Pas de jargon.';

  @override
  String get bpS3BTitle =>
      'Étape B : Distribution des Connaissances (La Carte Info)';

  @override
  String get bpS3BP1 =>
      'Lustra n\'a pas besoin de millions d\'utilisateurs pour fonctionner. Il suffit que Vous soyez là.';

  @override
  String get bpS3BList1Title => 'Votre action :';

  @override
  String get bpS3BList1Text =>
      'Vous entrez, voyez un sujet et générez une Carte Info (Fact Card) en un clic.';

  @override
  String get bpS3BList2Title => 'Portée :';

  @override
  String get bpS3BList2Text =>
      'Partage automatique sur vos réseaux sociaux (FB, X, IG, etc.).';

  @override
  String get bpS3BList3Title => 'Effet :';

  @override
  String get bpS3BList3Text =>
      'Vos amis reçoivent un \"plat préparé\" vérifié par les faits sans avoir besoin de l\'application. Vous devenez une source d\'information indépendante.';

  @override
  String get bpS3BExample => 'Exemple :';

  @override
  String get bpS3CTitle => 'Étape C : Reprendre le Contrôle (La Pression)';

  @override
  String get bpS3CP1 =>
      'Les politiciens et les entreprises ignorent les \"tempêtes sur internet\" car elles sont chaotiques, faciles à censurer et disparaissent rapidement.';

  @override
  String get bpS3CList1Title => 'Solution :';

  @override
  String get bpS3CList1Text =>
      'Sondages Sociaux Vérifiés. Votre vote est rattaché à un ID de document législatif officiel et spécifique.';

  @override
  String get bpS3CList2Title => 'Différence :';

  @override
  String get bpS3CList2Text =>
      'Ce ne sont pas des pétitions qui expirent. Ce sont des signatures solides provenant de comptes vérifiés.';

  @override
  String get bpS3CP2 =>
      'Si 50 000 personnes votent contre une loi, une preuve irréfutable du manque de soutien social est créée. Cela ne peut pas être \"étouffé\" par un narratif télévisé.';

  @override
  String get bpS4Title => '4. OFFENSIVE CIVIQUE : Nous Écrivons les Lois';

  @override
  String get bpS4P1 =>
      'Le gouvernement ignore un problème ? Nous n\'attendons pas.';

  @override
  String get bpS4List1Title => 'Projets Citoyens :';

  @override
  String get bpS4List1Text =>
      'Nous créons nos propres projets de loi et collectons des signatures numériques.';

  @override
  String get bpS4List2Title => 'Le Piège :';

  @override
  String get bpS4List2Text =>
      'S\'ils rejettent une loi populaire sur des détails techniques, nous appliquons des amendements et la soumettons à nouveau.';

  @override
  String get bpS4List3Title => 'Le Choix :';

  @override
  String get bpS4List3Text =>
      'Ignorer une solution prête et populaire prouve la mauvaise foi. Cela donne à l\'opposition une arme gratuite pour s\'emparer de l\'électorat.';

  @override
  String get bpS4CtaTitle => 'Soutenez ces Projets Citoyens MAINTENANT !';

  @override
  String get bpS4CtaP1 =>
      'Cliquez ci-dessous pour examiner et voter sur la législation proposée :';

  @override
  String get bpS4Card1Title => 'Loi de Coupe des Fonds de la Classe Epstein';

  @override
  String get bpS4Card1Desc =>
      'Coupe les financements publics pour les personnalités impliquées dans le trafic et les violations des droits de l\'homme.';

  @override
  String get bpS4Card2Title => 'Amendement sur la Limitation des Mandats';

  @override
  String get bpS4Card2Desc =>
      'Établit un plafond strict sur la durée des carrières au Parlement.';

  @override
  String get bpS4Card3Title => 'Loi sur l\'Éthique Parlementaire';

  @override
  String get bpS4Card3Desc =>
      'Met en œuvre une interdiction de délit d\'initié (Stock Trading Ban) pour les membres actifs du Parlement.';

  @override
  String get bpS5Title => '5. RÉSULTAT FINAL : Nettoyage Politique';

  @override
  String get bpS5P1 =>
      'Fini de se cacher. Le débat retourne là où sont les gens : sur les réseaux sociaux, mais avec de nouvelles règles. C\'est l\'accomplissement de la promesse originelle d\'internet que le système craignait : le contrôle décentralisé du pouvoir.';

  @override
  String get bpS5P2 =>
      'Le Parlement Miroir allume la lumière dans une pièce sombre, nous forçons la TRANSPARENCE. Un politicien ne peut plus mentir en disant que \"les gens veulent ça\" quand les données montrent le contraire. Les nouvelles lois servent l\'intérêt général, pas le capital.';

  @override
  String get bpS5P3 =>
      'Nous ne demandons pas aux politiciens de changer. Nous créons un système où mentir sur le soutien public devient impossible. C\'est la démocratie pilotée par les données.';

  @override
  String get bpS5Highlight =>
      'Ceci est une introduction à la démocratie directe, basée sur un vote conscient et informé, et non sur les émotions.';

  @override
  String get caAppBar => 'Audit Civique';

  @override
  String get caTitle =>
      'Audit Civique : Un Nouveau Système pour une Meilleure Démocratie';

  @override
  String get caIntro =>
      'Personne n\'évalue le processus législatif à part quelques personnes à huis clos et le rare journaliste indépendant exposant la corruption. En conséquence, la législation se déconnecte fréquemment des besoins citoyens, priorisant les intérêts politiques ou corporatistes sur l\'adaptation sociétale. Notre objectif final est simple : une société qui vote sur des politiques réelles, et non plus qui élit de simples politiciens en espérant qu\'ils tiennent leurs promesses. Le Parlement Miroir a été construit pour rendre cette transition facile et réalisable.';

  @override
  String get caS1Title =>
      'En quoi l\'Audit Civique est-il différent des Pétitions ?';

  @override
  String get caS1PetitionsTitle => 'Pétitions Traditionnelles';

  @override
  String get caS1PetitionsText =>
      'Les pétitions fonctionnent rarement en raison de leur nature éphémère. Après avoir collecté les signatures, la campagne se termine. Il s\'agit essentiellement d\'une demande polie envers une personne au pouvoir. Parce que ce sont des campagnes limitées dans le temps reposant sur un cycle médiatique court, les politiciens peuvent facilement les écarter. Ils attendent simplement que les médias changent de narratif, et la pétition est oubliée.';

  @override
  String get caS1LustraTitle => 'Volonté Civique Lustra';

  @override
  String get caS1LustraText =>
      'Nous ne demandons pas. Dans Lustra, votre vote n\'est pas juste une signature - il est ancré en permanence à un ID législatif officiel et solide. Il marque votre position exacte sur une politique spécifique. Tous ces votes se combinent pour créer la Volonté Civique : un compteur en temps réel montrant exactement comment les citoyens évaluent un projet, fermant ainsi la boucle de l\'Audit Civique.';

  @override
  String get caS2Title =>
      'Pourquoi les Politiciens Devraient-ils s\'en Soucier ?';

  @override
  String get caS2Text =>
      'Parce qu\'ils ne peuvent plus se cacher.\n\nNous enregistrons chacun de leurs votes officiels au gouvernement et le comparons directement à la Volonté Civique. Ils ne peuvent plus mentir en disant que \"les gens veulent ça\" juste parce qu\'ils ont mené une habile campagne médiatique. S\'ils votent sur quelque chose qui profite à un groupe de lobby plutôt qu\'aux citoyens, nous le découvrons immédiatement. Plus les gens utilisent Lustra pour exposer ces failles, plus il devient difficile pour les politiciens de manipuler le narratif. Nous reprenons le contrôle.';

  @override
  String get caS3Title => 'La Meilleure Partie : Le Pouvoir Asymétrique';

  @override
  String get caS3P1 =>
      'Nous n\'avons pas besoin des médias traditionnels comme le font les lobbyistes. Nous n\'avons même pas besoin de 5 millions d\'utilisateurs dans l\'application pour mettre à jour la démocratie. Nous avons juste besoin de Vous.\n\nVous avez déjà une portée en dehors de Lustra : sur Facebook, TikTok, X, ou ailleurs. Nous pouvons enfin transformer les réseaux sociaux en quelque chose de significatif. Un utilisateur partageant une loi peut facilement générer 100 à 1 000 vues avec presque aucun effort. C\'est un petit stade de personnes qui s\'informent sur un texte de loi crucial ou une initiative citoyenne.';

  @override
  String get caS3MathSubtitle => 'MATHÉMATIQUES DE LA GUERRE ASYMÉTRIQUE';

  @override
  String get caS3P2 =>
      'Pensez aux mathématiques : un think tank d\'entreprise actif ou un groupe de lobbying peut représenter 10 à 15 personnes dont le seul levier est l\'argent pour acheter des faveurs politiques. Vos 10 000 votes vérifiés de vrais citoyens peuvent les dominer. Nous pouvons faire exactement ce que font les lobbyistes, mais plus vite, de manière transparente et avec un nombre écrasant. Les temps ont changé.';

  @override
  String get caS4Title => 'Qui Contrôle le Fil d\'Actualité ? C\'est Vous.';

  @override
  String get caS4Text =>
      'Les médias traditionnels et les algorithmes de la Big Tech optimisent pour l\'indignation afin de vendre des publicités. L\'algorithme de Lustra est strictement démocratique. Nous n\'avons pas de rédacteurs qui décident de ce qui est \"important\". Notre flux principal évalue automatiquement les 30 derniers jours de législation, isole les 5 lois ayant le plus fort engagement citoyen et les met en lumière. Vos votes dictent la hiérarchie de l\'information. Vous contrôlez l\'algorithme.';

  @override
  String get caS5Title =>
      'L\'Arsenal : Comment utiliser les \"Cartes Factuelles\"';

  @override
  String get caS5Intro =>
      'La législation est intentionnellement ennuyeuse. Elle n\'a jamais été conçue pour être grand public. C\'est pourquoi les médias créent des narratifs émotionnels autour pour vendre des publicités. Vous pouvez aussi créer des narratifs - mais les vôtres seront construits sur des données brutes, résumées et vérifiées.\n\nLustra produit des Cartes Factuelles (Fact Cards). Chaque fois que vous cliquez sur \"Partager\", une image propre est générée en utilisant des données officielles. En soi, ce n\'est qu\'un fait. Sur les réseaux sociaux, les faits ont besoin d\'être expliqués. Vous êtes l\'explicateur. Voici exactement comment les utiliser pour créer du contenu viral à fort impact :';

  @override
  String get caS5A_Title => 'A/ L\'Accroche (Créez l\'Angle)';

  @override
  String get caS5A_Text =>
      'L\'option la plus facile est généralement la plus parlante. Vous avez trouvé une nouvelle loi de censure d\'internet dans l\'application ? Ne compliquez pas les choses. Créez un titre fort (une \"accroche\"), dites aux gens exactement comment cela les affecte, et déposez le lien direct vers Lustra pour qu\'ils puissent voter.';

  @override
  String get caS5B_Title => 'B/ La Preuve (Pour les Essais & les Threads)';

  @override
  String get caS5B_Text =>
      'Les images sont d\'excellents ajouts pour les posts plus longs. Vous voulez souligner des failles critiques dans un projet de loi proposé ou confronter le résumé officiel du gouvernement ? Joignez la Carte Factuelle comme preuve indéniable. Laissez les gens lire les données stérilisées par eux-mêmes en 15 secondes.';

  @override
  String get caS5C_Title => 'C/ La Diffusion (TikTok/Reels)';

  @override
  String get caS5C_Text =>
      'Utilisez l\'image de la Carte Factuelle avec un effet \"fond vert\" sur TikTok ou Instagram. Mettez les données de Lustra en arrière-plan et filmez-vous en train d\'expliquer le problème. C\'est le contenu court parfait et vérifiable.';

  @override
  String get caS5D_Title => 'D/ Le Réseau (Messages Directs)';

  @override
  String get caS5D_Text =>
      'Cliquez simplement sur partager et envoyez l\'image directement à vos amis et groupes familiaux. Dites-leur clairement : \"Voici ce qui se passe actuellement au gouvernement\" ou \"Voici ce sur quoi les médias sont silencieux en ce moment.\"';

  @override
  String get caS5Outro =>
      'La production de contenu est facile, et Lustra est votre moteur de découverte. Vous n\'êtes pas juste un utilisateur. Vous êtes un pionnier de la nouvelle ère de la démocratie sans corruption. Vous avez les mêmes outils qu\'un lobbyiste – utilisez-les.';

  @override
  String get caSkepticTitle =>
      'Sceptique quant aux fermes de bots ou à la confidentialité des données ?';

  @override
  String get caSkepticText =>
      'Tant mieux. Ne croyez pas nos mots - auditez notre système. Lisez exactement comment nous utilisons le hachage cryptographique, Firebase App Check et la Licence Open Source (AGPLv3) pour protéger votre identité et l\'intégrité de la Volonté Civique.';

  @override
  String get caSkepticBtnGov => 'Transparenz & Gouvernance';

  @override
  String get caSkepticBtnPriv => 'Constitution & Confidentialité';

  @override
  String get clAppBar => 'Listes Curatées';

  @override
  String get clTitle => 'Listes Curatées : Médias Civiques Décentralisés';

  @override
  String get clIntro =>
      'Les gouvernements utilisent le volume même de la législation comme une arme. Ils font passer des centaines de pages de lois complexes, enterrant souvent des actes controversés derrière des titres ennuyeux ou les faisant passer par la \"porte de derrière\" pendant que les médias sont distraits par le dernier scandale politique. Les citoyens perdent le fil de la situation globale car il est physiquement impossible de tout surveiller seul.';

  @override
  String get clS1Title => 'Reconnaissance des Schémas & Mobilisation de Masse';

  @override
  String get clS1P1 =>
      'Les Listes Curatées (Watchlists) vous permettent d\'organiser le chaos et d\'agir comme un nœud d\'information indépendant. Vous pouvez mélanger des projets de loi officiels du gouvernement avec des projets civiques citoyens, les regrouper par sujets spécifiques, et inviter d\'autres personnes à s\'y abonner.';

  @override
  String get clS1P2 =>
      'De manière cruciale, une Liste Curatée agit comme un multiplicateur pour l\'Audit Civique. Vous ne rassemblez pas de soutien pour une seule loi isolée. En regroupant jusqu\'à 80 éléments, votre liste devient un flux dédié et ciblé pour vos abonnés. Ils peuvent entrer dans votre liste et voter sur plusieurs lois en une seule session, générant massivement des données dures et de la Volonté Civique pour tout un secteur politique.';

  @override
  String get clS2Title =>
      'Comment utiliser les Listes Curatées comme une Arme :';

  @override
  String get clS2A_Title => 'Chiens de Garde du Gouvernement (Watchdogs)';

  @override
  String get clS2A_Text =>
      'Vous remarquez que le gouvernement essaie de faire passer discrètement une série de lois technologiques envahissant la vie privée ? Regroupez-les dans une \"Liste de Surveillance de la Surveillance Numérique\". Montrez à vos abonnés l\'agenda caché que les médias ont raté et laissez-les voter contre tous ces projets au même endroit. Demandez-leur d\'amplifier en partageant.';

  @override
  String get clS2B_Title => 'Plateforme pour la Réforme';

  @override
  String get clS2B_Text =>
      'Ne vous contentez pas de vous plaindre de l\'économie. Construisez une \"Liste de Réformes Économiques\" complète et multi-lois, mêlant vos propres projets citoyens aux amendements officiels. Présentez un programme politique entièrement structuré.';

  @override
  String get clS2C_Title => 'Les Projecteurs';

  @override
  String get clS2C_Text =>
      'Vous pouvez épingler une loi spécifique comme \"Favorite\" sur votre liste pour diriger une attention civique maximale et une puissance de vote exactement là où c\'est le plus nécessaire.';

  @override
  String get clS3Title => 'La Meilleure Partie : Vous Possédez la Diffusion';

  @override
  String get clS3Text =>
      'Les algorithmes des réseaux sociaux suppriment constamment les liens externes pour garder les utilisateurs sur leur application. Lustra contourne cela. Lorsque les gens s\'abonnent à votre Liste Curatée, vous contournez complètement la Big Tech. Vous disposez d\'un bouton \"Push\" manuel. Une fois toutes les 24 heures, vous pouvez déclencher une notification mobile directe à tous vos abonnés, les alertant de vérifier votre liste car un vote critique a lieu ou une nouvelle loi a été ajoutée. Vous contrôlez la distribution.';

  @override
  String get clS4Title => 'L\'Économie des Créateurs pour la Démocratie';

  @override
  String get clS4Text =>
      'Une bonne curation a une valeur inestimable. Filtrer le bruit politique prend du temps et de l\'expertise. C\'est pourquoi Lustra vous permet d\'attacher votre Boîte à Pourboires (Tip Jar) personnelle directement à votre Liste Curatée. Si vous faites le travail difficile de surveiller le gouvernement et d\'éduquer le public, vos abonnés peuvent financer vos efforts directement. Nous ne prenons aucune commission.';

  @override
  String get clS5Title => 'Déploiement : Comment Commencer';

  @override
  String get clS5Intro =>
      'Ce n\'est pas une fonctionnalité passive. Vous devez la construire activement. Voici les instructions exactes pour déployer votre première Liste Curatée :';

  @override
  String get clStep1Title => 'Étape 1 : Initialiser';

  @override
  String get clStep1Text =>
      'Naviguez vers l\'écran principal et cliquez sur l\'Icône d\'Engrenage (Paramètres) dans le coin supérieur. Sélectionnez l\'option pour créer votre première Liste Curatée. Donnez-lui un titre clair.';

  @override
  String get clStep2Title => 'Étape 2 : Mode Curateur';

  @override
  String get clStep2Text =>
      'Une fois votre liste initialisée, le système vous accorde le statut de Curateur. Maintenant, parcourez le flux principal. À l\'intérieur de l\'écran de détails de chaque loi ou projet citoyen, un nouveau bouton \"Ajouter à la liste\" apparaîtra. Cliquez dessus pour injecter cette loi spécifique directement dans votre liste.';

  @override
  String get clStep3Title => 'Étape 3 : Injection dans le Flux';

  @override
  String get clStep3Text =>
      'Votre Liste Curatée n\'inonde pas le flux principal. Au lieu de cela, la loi unique que vous avez sélectionnée comme \"Favorite\" agit comme votre ambassadeur. Cette seule carte est injectée directement dans les flux quotidiens de vos abonnés, parfaitement entrelacée avec la législation gouvernementale officielle. Elle est affichée avec la même priorité que les lois gouvernementales. Nous plaçons la surveillance citoyenne sur un pied d\'égalité avec l\'État.';

  @override
  String get clLimitsTitle => 'LIMITES DU SYSTÈME (LE SIGNAL SUR LE BRUIT)';

  @override
  String get clLimit1Label => 'AUTORAT';

  @override
  String get clLimit1Desc =>
      'Max de listes actives par gouvernement (Vous pouvez les supprimer et en déployer de nouvelles à tout moment).';

  @override
  String get clLimit2Label => 'CAPACITÉ';

  @override
  String get clLimit2Desc =>
      'Max de lois par liste (Plus que suffisant pour exposer un schéma, assez strict pour empêcher la surcharge d\'informations).';

  @override
  String get clLimit3Label => 'ABONNEMENTS';

  @override
  String get clLimit3Desc =>
      'Max de listes que vous pouvez observer chez d\'autres créateurs.';

  @override
  String get clOutro =>
      'Lustra n\'est pas un réseau social qui génère une portée algorithmique gratuite pour votre liste. Les Listes Curatées sont sur invitation uniquement. Vous devez partager votre lien unique en externe. Amenez votre public depuis X, YouTube, TikTok ou votre newsletter. Nous ne vous donnons pas de followers ; nous vous donnons l\'infrastructure pour transformer vos abonnés existants en une force civique vérifiée et votante - et un moyen d\'être directement financé pour votre travail acharné. Arrêtez de demander des \"likes\" à votre public. Donnez-leur un outil pour agir.';

  @override
  String get supportFundTitle =>
      'Phase 1 : Lancement de l\'Entité à But Non Lucratif';

  @override
  String get supportFundDesc =>
      'Pour ouvrir officiellement la Fondation Lustra, protéger la propriété intellectuelle et couvrir les frais juridiques de création, nous devons rassembler un capital initial. Aidez-nous à rendre ce système indépendant pour toujours.';

  @override
  String get supportFundDisclaimer =>
      'Transparence des données : En raison des différentes passerelles de paiement et des coûts d\'infrastructure, cette barre de progression est mise à jour manuellement par le fondateur (max une fois par semaine).';
}

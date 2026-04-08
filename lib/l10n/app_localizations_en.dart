// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get errorFailedToLoadData => 'Failed to load data';

  @override
  String get errorNoData => 'No data to display.';

  @override
  String get noData => 'No data';

  @override
  String get noDate => 'No date';

  @override
  String get shareAction => 'Share';

  @override
  String get loginAction => 'Log in';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsChangeLanguage => 'Change language';

  @override
  String get settingsLogout => 'Log out';

  @override
  String get tryAgainButton => 'Try again';

  @override
  String get moreButton => '... More';

  @override
  String get seeDetailsLink => 'See details ->';

  @override
  String get bottomNavHome => 'Home';

  @override
  String get bottomNavInfo => 'Info';

  @override
  String get bottomNavSupport => 'Support';

  @override
  String get bottomNavFutureFeatures => 'Future Features';

  @override
  String termLabel(String termNumber) {
    return 'Term: $termNumber';
  }

  @override
  String termMenuItem(int termNumber, String termYears) {
    return 'Term $termNumber $termYears';
  }

  @override
  String get errorNoDataForTerm => 'No data to display for the selected term.';

  @override
  String get sectionPopularVotes => 'Legislative Votes';

  @override
  String get sectionUpcoming => 'Scheduled Debates';

  @override
  String get sectionLegislationInProcess => 'In Process';

  @override
  String get civicProjectsSectionTitle => 'Civic Initiatives';

  @override
  String get sectionMpProfiles => 'Popular Politicians';

  @override
  String get votingSourceTooltip => 'View voting source';

  @override
  String get legislationSponsorLabel => 'Sponsor';

  @override
  String get buttonBrowseVotes => 'Vote browser';

  @override
  String get buttonScheduledMeetings => 'Scheduled sessions';

  @override
  String get buttonBillsInProgress => 'Bills in progress';

  @override
  String get buttonAllMps => 'All deputies';

  @override
  String get buttonCheckProfile => 'Check profile';

  @override
  String get errorNoDeputiesData => 'No data about deputies.';

  @override
  String get errorNoDataLastVote => 'No data about the last vote.';

  @override
  String get errorNoDataUpcomingVote => 'No data about the upcoming vote.';

  @override
  String get errorNoSummaryLastVote => 'No summary for the last vote.';

  @override
  String get errorNoSummaryUpcomingVote => 'No summary for the upcoming vote.';

  @override
  String get errorNoDataLegislationInProcess =>
      'No data about legislation in process.';

  @override
  String get errorNoSummaryLegislationInProcess =>
      'No summary for legislation in process.';

  @override
  String get keyPoints => 'Key points';

  @override
  String get noKeyPoints => 'No key points';

  @override
  String get votingResultsTitle => 'VOTING RESULTS';

  @override
  String get labelFor => 'For:';

  @override
  String get labelAgainst => 'Against:';

  @override
  String get labelAbstained => 'Abstained:';

  @override
  String get noStatusInfo => 'No status information';

  @override
  String scheduledMeetingDate(String date) {
    return 'Scheduled session: $date';
  }

  @override
  String get noScheduledMeetingDate => 'No scheduled meeting date';

  @override
  String processStartDate(String date) {
    return 'Process start: $date';
  }

  @override
  String get noProcessStartDate => 'No process start date';

  @override
  String mpDistrict(String districtNumber) {
    return 'District: $districtNumber';
  }

  @override
  String get actionCollapse => 'Collapse';

  @override
  String get actionExpand => 'Expand more...';

  @override
  String get votingFor => 'For';

  @override
  String get votingAgainst => 'Against';

  @override
  String get votingAbstainShort => 'Abstain';

  @override
  String get citizenPollTitle => 'Civic Will';

  @override
  String get pollTemporarilyUnavailable =>
      'Poll temporarily unavailable. Please try again later.';

  @override
  String get errorDisplayingPollBar => 'Error displaying poll results.';

  @override
  String get pollNoForAgainstVotes => 'No For/Against votes';

  @override
  String get pollNoVotesCast => 'Be the first to cast a vote.';

  @override
  String pollTotalVotes(int count) {
    return 'Votes cast: $count';
  }

  @override
  String get pollSupport => 'I support';

  @override
  String get pollDontSupport => 'I don\'t support';

  @override
  String get loginToVote => 'Log in to vote';

  @override
  String get dialogChooseLanguage => 'Choose language';

  @override
  String get dialogCancel => 'Cancel';

  @override
  String get infoScreenTitle => 'Information';

  @override
  String get infoTitle1 => 'Citizens Above Politics';

  @override
  String get infoParagraph1 =>
      'Media doesn\'t inform – it curates reality. An estimated 95% of legislation disappears into a \"black hole\" of silence because it\'s too complex or \"boring\" to sell ads. Lustra bypasses the middlemen. We process bureaucratic legislative language into accessible facts, giving you insight into what the government enacts, not just what they want to discuss.';

  @override
  String get infoTitle2 => 'Facts, Not Marketing';

  @override
  String get infoParagraph2 =>
      'Politics today is 80% marketing and 20% law. We separate the two. We apply a \"context sterilization\" process: stripping away emotional language, partisan spin, and opinions to leave only the legal facts. This isn\'t \"another point of view.\" It is noise reduction, allowing you to form your own opinion based on the source.';

  @override
  String get infoTitle3 => 'Power Without Middlemen';

  @override
  String get infoParagraph3 =>
      'Big tech platforms optimize content for your outrage because it keeps you scrolling. We optimize for your insight. The hierarchy of topics in the app depends entirely on community votes. You decide what matters for the state, taking power back from publishers and lobbyists.';

  @override
  String get infoTitle4 => 'Architects of Change';

  @override
  String get infoParagraph4 =>
      'Democracy isn\'t a spectator sport. We are introducing a mechanism where professionally formatted citizen initiatives are displayed on par with government bills. We provide the infrastructure to move you from a passive observer to an Architect of Change – building real support for issues that matter. We are taking democracy to a new level.';

  @override
  String get linkHowTechnologyWorks => 'How does the technology work?';

  @override
  String get linkTermsAndPrivacy => 'Terms and Privacy Policy';

  @override
  String get supportScreenTitle => 'Public Infrastructure';

  @override
  String get supportParagraph1 =>
      'Lustra is a digital public utility. But freedom has a price. We rejected capital to guarantee 100% impartiality, believing it is the only path to change. Maintaining infrastructure and servers depends solely on voluntary contributions. The equivalent of \$10 funds platform access for several thousand people monthly. Your support guarantees the continuity of the mission and uninterrupted platform operation.';

  @override
  String get buttonSupportFinancially => 'Support';

  @override
  String get supportThankYou => 'Thank you. You keep the system alive.';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Founder';

  @override
  String get futureFeaturesScreenTitle => 'Community Roadmap';

  @override
  String get futureFeaturesHeader => 'You Control the Direction';

  @override
  String get futureFeatureSenate => 'Senator Integration';

  @override
  String get futureFeatureCitizenInitiative => 'Citizen Referendums';

  @override
  String get futureFeaturesDescription =>
      'This is not a closed wishlist. Lustra is infrastructure owned by citizens, so we all have an impact on its development. Join the Civic Evolution community on Reddit, submit ideas, and vote on upcoming features. Let\'s write the next chapter of democracy together!';

  @override
  String get futureFeaturesVoteButton => 'Vote on Roadmap';

  @override
  String get comingSoon => 'Proposal';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Legislative - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Refresh cache';

  @override
  String get advancedSearchHint => 'Advanced search...';

  @override
  String get filterTypeLabel => 'Type: ';

  @override
  String get filterStatusLabel => 'Status: ';

  @override
  String get allOption => 'All';

  @override
  String get errorFetchData => 'Failed to fetch data. Please try again.';

  @override
  String get emptyListFilterMessage =>
      'No bills found matching the selected criteria.';

  @override
  String get emptyListDefaultMessage =>
      'No finished bills to display for this source.';

  @override
  String get searchDialogTitle => 'Search and Filter';

  @override
  String get searchDialogHint => 'Enter search phrase...';

  @override
  String get searchDialogTimePeriodLabel => 'Time period';

  @override
  String get searchDialogSearchButton => 'Search';

  @override
  String get searchDialogSelectDateRange => 'Select range';

  @override
  String get searchDialogDateRangePickerHelp => 'Select a date range';

  @override
  String get searchDialogDateRangePickerCancel => 'CANCEL';

  @override
  String get searchDialogDateRangePickerConfirm => 'OK';

  @override
  String get searchDialogDateRangePickerSave => 'SAVE';

  @override
  String get timePeriodLastWeek => 'Last Week';

  @override
  String get timePeriodLastMonth => 'Last Month';

  @override
  String get timePeriodLast3Months => 'Last 3 months';

  @override
  String get timePeriodLastYear => 'Last year';

  @override
  String get timePeriodAll => 'All time';

  @override
  String get timePeriodCustom => 'Custom range';

  @override
  String get categoryAll => 'All';

  @override
  String get categoryHealth => 'Health';

  @override
  String get categoryFamily => 'Family';

  @override
  String get categoryTaxes => 'Taxes';

  @override
  String get categoryMigration => 'Migration';

  @override
  String get categoryLabor => 'Labor';

  @override
  String get categorySecurity => 'Security';

  @override
  String get categoryEducation => 'Education';

  @override
  String get categoryEnvironment => 'Environment';

  @override
  String get categoryCourtsAndLaw => 'Courts and Law';

  @override
  String get categoryTransport => 'Transport';

  @override
  String get categoryBenefits => 'Benefits';

  @override
  String get categoryRealEstate => 'Real Estate';

  @override
  String get categoryMediaAndCulture => 'Media and Culture';

  @override
  String get categoryLocalGovernment => 'Local Government';

  @override
  String get categoryAgriculture => 'Agriculture';

  @override
  String get categoryPublicInvestments => 'Public Investments';

  @override
  String get categoryInformatization => 'Informatization';

  @override
  String get categoryEconomy => 'Economy';

  @override
  String get lustraClubLabel => 'Lustra Club';

  @override
  String get categoryOther => 'Other';

  @override
  String futureLegislationScreenTitle(String parliamentName) {
    return 'Upcoming Bills - $parliamentName';
  }

  @override
  String get searchDialogAdvancedTitle => 'Search and Filter (Advanced)';

  @override
  String get emptyListFilterMessageFuture =>
      'No upcoming bills found matching the selected criteria.';

  @override
  String get emptyListDefaultMessageFuture =>
      'No scheduled bills to display for this source.';

  @override
  String get noScheduledMeetings => 'No scheduled sessions';

  @override
  String get dateFormatError => 'Date formatting error';

  @override
  String get upcomingMeetings => 'Upcoming sessions:';

  @override
  String get keyPointsTitle => 'Key points:';

  @override
  String processLegislationScreenTitle(String parliamentName) {
    return 'Bills in Process - $parliamentName';
  }

  @override
  String get searchHint => 'Search...';

  @override
  String get emptyListFilterMessageProcess =>
      'No bills in process found matching the selected criteria.';

  @override
  String get emptyListDefaultMessageProcess =>
      'No active bills in the legislative process for this source.';

  @override
  String processStartDateCardLabel(String date) {
    return 'Process start: $date';
  }

  @override
  String get upcomingMeetingsCardLabel => 'Upcoming sessions:';

  @override
  String get detailsScreenTitle => 'LUSTRA';

  @override
  String get shareTooltip => 'Share';

  @override
  String get keyPointsSectionTitle => 'Key points:';

  @override
  String get officialContentButton => 'Official text';

  @override
  String get processPageButton => 'Process page';

  @override
  String get fullVotingResultsPDF => 'Full voting results (PDF)';

  @override
  String get scheduledMeetingsSectionTitle => 'Scheduled sessions';

  @override
  String get additionalInfoSectionTitle => 'Additional information';

  @override
  String printNumberLabel(String id) {
    return 'Print number: $id';
  }

  @override
  String processStartDateLabel(String date) {
    return 'Process start date: $date';
  }

  @override
  String votingDateLabel(String date) {
    return 'Voting date: $date';
  }

  @override
  String meetingNumberLabel(String number) {
    return 'Meeting no: $number';
  }

  @override
  String votingNumberLabel(String number) {
    return 'Voting no: $number';
  }

  @override
  String get sourceLabel => 'Source: https://api.sejm.gov.pl/';

  @override
  String summarizedByLabel(String modelName) {
    return 'Summarized by: $modelName';
  }

  @override
  String promptUsedLabel(String prompt) {
    return 'Prompt used: $prompt';
  }

  @override
  String get reportErrorButton => 'Report error';

  @override
  String get noUrlAvailableSnackbar => 'No URL available.';

  @override
  String cannotOpenLinkSnackbar(String url) {
    return 'Could not open link: $url';
  }

  @override
  String get alreadyVotedSnackbar => 'Your vote has already been registered.';

  @override
  String get sharingFunctionNotImplementedSnackbar =>
      'Sharing feature (to be implemented)';

  @override
  String get reportErrorFunctionNotImplementedSnackbar =>
      'Error reporting feature (to be implemented)';

  @override
  String get loginScreenTitle => 'Login';

  @override
  String get registrationScreenTitle => 'Registration';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get loginButton => 'Log in';

  @override
  String get registerButton => 'Register';

  @override
  String get orDivider => 'OR';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get continueWithFacebook => 'Continue with Facebook';

  @override
  String get promptToRegister => 'Don\'t have an account? Sign up';

  @override
  String get promptToLogin => 'Already have an account? Log in';

  @override
  String get validatorInvalidEmail => 'Please enter a valid email address.';

  @override
  String get validatorPasswordTooShort =>
      'Password must be at least 6 characters long.';

  @override
  String get authErrorInvalidCredentials => 'Invalid email or password.';

  @override
  String get authErrorEmailInUse => 'This email address is already in use.';

  @override
  String get authErrorWeakPassword => 'The password is too weak.';

  @override
  String get authErrorDefault => 'An error occurred. Please try again.';

  @override
  String get authErrorUnexpected => 'An unexpected error occurred.';

  @override
  String get authErrorGoogleFailed =>
      'Google sign-in failed. Please try again.';

  @override
  String get authErrorFacebookFailed =>
      'Facebook sign-in failed. Please try again.';

  @override
  String get authErrorAccountExists =>
      'An account with this email already exists. Please sign in with your password.';

  @override
  String mpScreenTitle(String parliamentName) {
    return 'Deputies - $parliamentName';
  }

  @override
  String get searchMPsHint => 'Search deputies...';

  @override
  String get allFilter => 'All';

  @override
  String get noMPsForSource => 'No deputies available for this source.';

  @override
  String get noMPsMatchFilter => 'No deputies match the criteria.';

  @override
  String get attendanceLabelShort => 'Attendance';

  @override
  String get attendanceTooltipWarning =>
      'Attendance calculated based on a term with a small number of votes.\nData may be less representative.';

  @override
  String get supportLabel => 'Support: ';

  @override
  String get unaffiliatedClub => 'Unaffiliated';

  @override
  String mpDetailsScreenTitle(String firstName, String lastName) {
    return '$firstName $lastName';
  }

  @override
  String get shareProfileTooltip => 'Share profile';

  @override
  String get socialPollSectionTitle => 'Social Poll';

  @override
  String get parliamentaryActivitySectionTitle => 'Parliamentary Activity';

  @override
  String parliamentaryTenureSectionTitle(int years) {
    return 'Parliamentary Tenure: $years years';
  }

  @override
  String get parliamentaryTenureNoData => 'Parliamentary Tenure: No data';

  @override
  String get tenureTooltip =>
      'The number of years is an approximate value, calculated based on the data below, without taking into account the premature expiration of the parliamentary mandate.';

  @override
  String tenureTermItem(String romanNumeral, String duration) {
    return '$romanNumeral term of the Sejm of the Republic of Poland $duration';
  }

  @override
  String get unknownTermDuration => 'Unknown period';

  @override
  String get noTermData => 'No detailed data on terms.';

  @override
  String get plHistoricalDataDisclaimer =>
      'Note: Historical data for the 1st and 2nd terms of the Sejm of the Republic of Poland are unavailable and not included.';

  @override
  String get personalDataSectionTitle => 'Personal Data';

  @override
  String get contactSectionTitle => 'Contact';

  @override
  String get dataSourceLabel => 'Data source: Sejm RP API';

  @override
  String get mandateStatusActive => 'Mandate: active';

  @override
  String get mandateStatusFulfilled => 'Mandate: fulfilled';

  @override
  String get mandateStatusCancelled => 'Mandate: cancelled';

  @override
  String get mandateStatusInactive => 'Mandate: inactive';

  @override
  String get followingAddedSnackbar => 'Added to followed';

  @override
  String get followingRemovedSnackbar => 'Removed from followed';

  @override
  String clubLabel(String clubName) {
    return 'Club: $clubName';
  }

  @override
  String formerlyLabel(String clubs) {
    return ' (formerly: $clubs)';
  }

  @override
  String professionLabel(String profession) {
    return 'Profession: $profession';
  }

  @override
  String districtLabel(String districtName, int districtNum) {
    return 'District: $districtName (no. $districtNum)';
  }

  @override
  String votesObtainedLabel(String votes) {
    return 'Votes obtained: $votes';
  }

  @override
  String get birthDateLabel => 'Date of birth';

  @override
  String get ageLabel => 'Age';

  @override
  String ageUnit(int age) {
    return '$age years';
  }

  @override
  String get birthPlaceLabel => 'Place of birth';

  @override
  String get educationLabel => 'Education';

  @override
  String get voivodeshipLabel => 'Voivodeship';

  @override
  String get emailLabelWithColon => 'Email:';

  @override
  String get votingsTab => 'Recent Votings';

  @override
  String get interpellationsTab => 'Interpellations';

  @override
  String get attendanceLabel => 'Overall attendance in votings';

  @override
  String get attendanceTooltipBase =>
      'The scale assesses the level of fulfillment of the basic parliamentary duty. The adopted ranges are based on the assumption that high attendance is a measure of responsibility towards voters.';

  @override
  String get attendanceTooltipPartialMandate =>
      '\n\nThe MP held the mandate for part of the term. Attendance refers to this period.';

  @override
  String get attendanceTooltipUnknownMandate =>
      '\n\nAttendance calculated based on a term with a small number of votes. Data may be less representative.';

  @override
  String get errorLoadVotings => 'Failed to load voting history.';

  @override
  String get errorLoadInterpellations => 'Failed to load interpellations.';

  @override
  String get noVotingsData => 'No data on important votings to display.';

  @override
  String get noInterpellationsData => 'No data.';

  @override
  String get loadVotingsButton => 'Try to load votings';

  @override
  String get loadMoreButton => 'Show more';

  @override
  String interpellationSentDate(String date) {
    return 'Date of submission: $date';
  }

  @override
  String get interpellationReplyFrom => 'Reply from: ';

  @override
  String cannotOpenReplyLink(String url) {
    return 'Could not open reply link: $url';
  }

  @override
  String get pollResultNoVotes => 'Be the first to cast a vote.';

  @override
  String get pollResultOverwhelmingMajority => 'overwhelming majority';

  @override
  String get pollResultMajority => 'majority';

  @override
  String get pollResultMinority => 'minority';

  @override
  String get pollResultOverwhelmingMinority => 'overwhelming minority';

  @override
  String pollResultFormatted(String percentage, String description) {
    return '$percentage - $description';
  }

  @override
  String pollTotalVotesLabel(int count) {
    return 'Number of votes cast: $count';
  }

  @override
  String get pollVoteToAction => 'Cast your vote to see the results';

  @override
  String get voteTypeFor => 'For';

  @override
  String get voteTypeAgainst => 'Against';

  @override
  String get voteTypeAbstain => 'Abstain';

  @override
  String get voteTypeAbsent => 'Absent';

  @override
  String get defaultPrompt => 'General prompt';

  @override
  String get statusInProgress => 'In progress';

  @override
  String get statusPassedSejmToSenat => 'Passed and sent to the Senate';

  @override
  String get statusRejectedSejm => 'Rejected';

  @override
  String get statusRejectedBySenate => 'Rejected by the Senate';

  @override
  String get statusToPresident => 'Transmitted to the President';

  @override
  String get votingResultsUSMotionToReferTitle => 'RESULTS: REFERRAL';

  @override
  String get statusVetoPresident => 'President\'s VETO';

  @override
  String get statusToConstitutionalTribunal =>
      'Referred to the Constitutional Tribunal';

  @override
  String get statusSignedByPresident => 'Signed by the President';

  @override
  String get statusEnacted => 'Enacted';

  @override
  String get statusExpired => 'Expired';

  @override
  String get statusAdoptedResolution => 'Adopted';

  @override
  String get statusRejectedResolution => 'Rejected';

  @override
  String get statusImmediateRejection => 'Immediate rejection';

  @override
  String get statusWithdrawn => 'Withdrawn';

  @override
  String get filterStatusAll => 'All';

  @override
  String get filterStatusPassed => 'Passed';

  @override
  String get filterStatusRejected => 'Rejected';

  @override
  String get docTypeBill => 'Bill';

  @override
  String get docTypeResolution => 'Resolution';

  @override
  String get statusUpcoming => 'Planned';

  @override
  String get statusIntroducedInHouse => 'Introduced in House';

  @override
  String get statusReportedToSenate => 'Reported to Senate';

  @override
  String get statusReportedInHouse => 'Reported in House';

  @override
  String get statusReferredInSenate => 'Referred in Senate';

  @override
  String get statusReferredInHouse => 'Referred in House';

  @override
  String get statusReferenceChangeSenate => 'Reference Change in Senate';

  @override
  String get statusReceivedInSenate => 'Received in Senate';

  @override
  String get statusPlacedOnCalendarSenate => 'Placed on Calendar in Senate';

  @override
  String get statusIntroducedInSenate => 'Introduced in Senate';

  @override
  String get statusEngrossedInHouse => 'Engrossed in House';

  @override
  String get statusAgreedToSenate => 'Agreed to in Senate';

  @override
  String get statusEngrossedAmendmentHouse => 'Engrossed Amendment in House';

  @override
  String get statusFailedPassageSenate => 'Failed Passage in Senate';

  @override
  String get statusLaidOnTableInHouse => 'Laid on Table in House';

  @override
  String get statusPrivateLaw => 'Private Law';

  @override
  String get statusPublicLaw => 'Public Law';

  @override
  String get statusAdopted => 'Adopted';

  @override
  String get statusDeBundesratApproved => 'Bundesrat has approved';

  @override
  String get statusDeAdopted => 'Adopted';

  @override
  String get statusDeIntroductionApproved => 'Introduction approved';

  @override
  String get statusDeAnnounced => 'Announced';

  @override
  String get statusDeRejected => 'Rejected';

  @override
  String get statusDeBundesratDenied => 'Bundesrat has denied consent';

  @override
  String get statusDeIntroductionRejected => 'Introduction rejected';

  @override
  String get statusDeDeclaredCompleted => 'Declared completed';

  @override
  String get statusDeCompletedByTermEnd =>
      'Completed by end of legislative period';

  @override
  String get statusDeDeclaredUnconstitutional =>
      'Declared incompatible with the Basic Law';

  @override
  String get statusDeWithdrawn => 'Withdrawn';

  @override
  String get statusDeBundesratProcessCompleted =>
      'Process in Bundesrat completed';

  @override
  String get statusDeCompleted => 'Completed';

  @override
  String get statusDeCompletedSeeProcess => 'Completed - see procedure';

  @override
  String get statusDeRecommendationAvailable =>
      'Recommendation for resolution is available';

  @override
  String get statusDeToBundesratNotDeliberated =>
      'Transmitted to Bundesrat - not yet deliberated';

  @override
  String get statusDeAssignedToCommittees => 'Assigned to committees';

  @override
  String get statusDeNotYetDeliberated => 'Not yet deliberated';

  @override
  String get statusDeMergedWith => 'Merged with... (see procedure)';

  @override
  String get statusDeReferred => 'Referred';

  @override
  String get statusFrLawPublished => 'Law published';

  @override
  String get statusFrOrdinancePublished => 'Ordinance published';

  @override
  String get statusFrResolutionPublished => 'Resolution published';

  @override
  String get statusFrDecreePublished => 'Decree published';

  @override
  String get statusFrDecision => 'Decision';

  @override
  String get statusFrRejected => 'Rejected';

  @override
  String get statusFrPrescribed => 'Prescribed/Expired';

  @override
  String get statusFrPropositionLoi => 'Parliamentary Bill';

  @override
  String get statusFrProjetLoi => 'Government Bill';

  @override
  String get statusUkActOfParliament => 'Act of Parliament';

  @override
  String get statusUkRoyalAssent => 'Royal Assent';

  @override
  String get statusUkWithdrawn => 'Withdrawn';

  @override
  String get statusUkRejected => 'Rejected';

  @override
  String get statusUk1stReading => '1st reading';

  @override
  String get statusUk2ndReading => '2nd reading';

  @override
  String get statusUk3rdReading => '3rd reading';

  @override
  String get statusUkCommitteeStage => 'Committee stage';

  @override
  String get statusUkCommonsExaminers => 'Commons Examiners';

  @override
  String get statusUkLordsSpecialCommittee =>
      'Lords Special Public Bill Committee';

  @override
  String get statusUkMoneyResolution => 'Money resolution';

  @override
  String get statusUkConsiderationLordsAmendments =>
      'Consideration of Lords amendments';

  @override
  String get statusUkConsiderationLordsMessage =>
      'Consideration of Lords message';

  @override
  String get statusUkOrderOfCommitmentDischarged =>
      'Order of Commitment discharged';

  @override
  String get statusUkProgrammeMotion => 'Programme motion';

  @override
  String get statusUkReportStage => 'Report stage';

  @override
  String get statusUkSecondReadingCommittee => 'Second reading committee';

  @override
  String get statusUkWaysAndMeansResolution => 'Ways and Means resolution';

  @override
  String get errorCheckConnection => 'Please check your internet connection.';

  @override
  String get buttonRetry => 'Try again';

  @override
  String get shareAsPost => 'Share as post (1:1)';

  @override
  String get shareAsStory => 'Share as story (16:9)';

  @override
  String get morePointsInApp => '...full details are available in the Lustra';

  @override
  String get civicRulesAction => 'Create your project';

  @override
  String get pollVotingViaApp => 'Voting available in the app!';

  @override
  String get supportPollTitle => 'Support Poll';

  @override
  String get termsCountLabel => 'Number of terms';

  @override
  String get settingsNotificationsNewLaws =>
      'Notifications about new legislations';

  @override
  String get settingsNotificationsVoteResults =>
      'Notifications about voting results';

  @override
  String get detailsButton => 'Details';

  @override
  String get errorNoVotingsDetails => 'NO DETAILED VOTING DATA';

  @override
  String get clearText => 'Clear';

  @override
  String get consideredOnLabel => 'Under consideration on:';

  @override
  String get legislationFooterAiDisclaimer =>
      'The summary above was generated by AI and is a compilation of the original government document, respecting all principles of impartiality and free information. Details of the query used and its schema can be found in the information tab.';

  @override
  String get legislationFooterModelUsed => 'Model used:';

  @override
  String get legislationFooterSourceData =>
      'Source data is available for free on the government system at:';

  @override
  String get appMotto =>
      '... meaning impartial legislative information without political bias.';

  @override
  String get acceptTermsPrefix => 'I accept the';

  @override
  String get termsAndConditions => 'Terms and Privacy Policy';

  @override
  String get validatorAcceptTerms => 'You must accept the terms to continue.';

  @override
  String get joinSupportClubPrefix => 'I want to join the';

  @override
  String get supportClub => 'Lustra Support Club';

  @override
  String get supportClubDescription =>
      'You\'ll receive special information about the project\'s development and future initiatives.';

  @override
  String get registrationFinishTitle => 'Complete Registration';

  @override
  String get welcomeMessage => 'Welcome!';

  @override
  String get finalStepMessage =>
      'Just one last step. Please accept the terms to continue.';

  @override
  String get continueButton => 'Continue';

  @override
  String get selectYourParliament => 'Select your parliament';

  @override
  String get validatorSelectParliament =>
      'Please select a parliament to continue.';

  @override
  String get forgotPasswordButton => 'Forgot password?';

  @override
  String get passwordResetEmailSent =>
      'A password reset link has been sent to your email.';

  @override
  String get authErrorUserNotFound => 'No user found with this email address.';

  @override
  String get settingsDeleteAccount => 'Delete Account';

  @override
  String get errorDeleteAccount =>
      'Failed to delete account. Please try again.';

  @override
  String get dialogReauthenticateTitle => 'Confirm Your Identity';

  @override
  String get dialogConfirm => 'Confirm';

  @override
  String get dialogDeleteAccountTitle =>
      'Are you sure you want to delete your account?';

  @override
  String get dialogDeleteAccountContent =>
      'This action cannot be undone. All your data, including your voting history, will be permanently deleted.';

  @override
  String get dialogDelete => 'Delete';

  @override
  String get termsAndPrivacyTitle => 'Constitution & Privacy';

  @override
  String get termsOfServiceTab => 'Rules';

  @override
  String get privacyPolicyTab => 'Privacy Policy';

  @override
  String get termsOfServiceContent =>
      'LUSTRA COMMUNITY RULES\nDate: December 6, 2025\n\n1. OPERATOR AND MISSION\nLustra is a digital public infrastructure. The legal operator (Custodian) is FO&WO VENTURES SP. Z O.O. (LLC) based in Wrocław. The company acts as an incubator: it pays no dividends, has no external investors, and reinvests revenue into infrastructure.\n\n2. CODE AND LICENSE (SOURCE AVAILABLE)\nLustra\'s code is a common good protected from exploitation.\n• Model: Open Source (AGPLv3).\n• Allowed: Educational, research, and non-profit use.\n• Prohibited: Corporations cannot profit from our work without community consent.\n\n3. GOVERNANCE ROADMAP\nOur goal is decentralization.\n• Current: Founder (Jacek) acts as Lead Architect.\n• Soon: Establishment of a Civic Board elected by users.\n• Goal: Implementing mechanisms for the community to take control in case of mission betrayal.\n\n4. CITIZEN DRAFTS PROGRAM\nAn incubator for law.\n• Procedure: Drafts are submitted via form and verified formally by the Operator.\n• CC0 License: By submitting, you release the draft into the Public Domain. Law belongs to everyone.\n• Free Speech: We do not judge opinions. We only reject projects violating criminal law.\n• Verification: You must be a citizen of the country where you submit a draft.\n\n5. AI AND SOURCE HIERARCHY\n• AI Role: AI helps navigate law but can make mistakes.\n• Source: The ultimate authority is always the original PDF document (linked in the app).\n\n6. SAFETY\n• Age: App for users 16+.\n• Bans: Attacks on infrastructure and commercial scraping are prohibited.\n\n7. FINAL PROVISIONS\nMatters not regulated herein are decided by Polish law.';

  @override
  String get privacyPolicyContent =>
      'PRIVACY POLICY: DATA MINIMIZATION\nDate: December 6, 2025\n\nWe do not trade your attention. We collect only what is technically necessary.\n\n1. DATA CONTROLLER\nFO&WO VENTURES SP. Z O.O., Wrocław. Contact: jacek@lustra.dev\n\n2. WHAT WE COLLECT\n• Account (Email/UID): Necessary for login (Firebase Auth).\n• Votes & Polls: Your votes build statistics. They are linked to your account based on legitimate interest (protection against bot farms). Publicly, they are displayed ONLY as anonymous aggregates.\n• Vote Retention: Voting data is stored for the duration of the parliamentary term plus 5 years for archival and research purposes. After this time, data is anonymized.\n• Communication (Support Club): If you consent (checkbox in settings), we will send you project updates. You can withdraw consent at any time.\n• Citizen Projects: Content of submitted drafts is public.\n\n3. WHAT WE DO NOT DO\n• We DO NOT sell data to brokers.\n• We DO NOT use ad tracking.\n• We DO NOT profile you politically for commercial purposes.\n\n4. INFRASTRUCTURE & SECURITY\n• Location: Google Cloud Platform, Europe-West9 (Paris).\n• Anti-Bot: We use Firebase App Check to verify app authenticity.\n• AI: We send only public government documents to AI models. Your private data NEVER goes to AI.\n\n5. CHILDREN\nService intended for users 16+. We do not knowingly collect children\'s data.\n\n6. ACCOUNT DELETION\nUse the \"Delete Account\" button in settings to immediately remove your identifying data from our servers.\n\n7. YOUR RIGHTS\nYou have the right to access, rectify, delete, and object to processing of your data. Contact: jacek@lustra.dev';

  @override
  String get techTitle => 'Lustra AI Protocol v1.1';

  @override
  String get techIntroTitle =>
      '1. COMPLETE WORK METHODOLOGY (LUSTRA AI PROTOCOL)';

  @override
  String get techIntroBody =>
      'Below we present the complete AI agent pipeline used to generate legal text summaries and detect hallucinations within them. The goal was to disarm the \"legislative black hole\" while approaching maximum objectivity. However, it must be emphasized that we do not believe in total neutrality. Every data compression (summary) is a form of choice. Instead of pretending to hold a \"monopoly on truth\" like the media, we adopted one explicit bias – the \"citizen perspective\" within context sterilization. Models are instructed to ignore political theater and focus on the wallet, freedoms, and obligations. This is an engineering design decision, not a political one.';

  @override
  String get techDiagramTitle => '2. GENERALIZER-JUDGE-SURGEON FLOW DIAGRAM';

  @override
  String get techDiagramIntro =>
      'The system operates in a verification loop. We do not trust generative models – we trust checking processes and an iterative approach to system expansion.';

  @override
  String get techDiagramOutro =>
      'In the future, we plan to expand the system with additional roles, such as an investigative journalist or a legal risk analyzer.';

  @override
  String get techPromptsTitle => '3. COMPLETE AGENT INSTRUCTIONS';

  @override
  String get techPromptsIntro =>
      'Below are the complete prompts received by the models, along with explanatory comments for the reader. Responses are returned immediately in 8 languages for full Lustra localization, so we have omitted the full JSON response structure for readability.';

  @override
  String get techGeneralizerTitle => 'A) Generalizer';

  @override
  String get techGeneralizerBody =>
      'Model: Gemini Flash (default) / Pro (for <20k tokens)';

  @override
  String get techGeneralizerCode =>
      '// MODEL SETUP\n// Role definition is critical. \"[country]\" is a variable that stabilizes the model.\n// The perspective of a citizen of Ukraine (a country at war) is different for models than the perspective of a citizen of Belgium (who might, for example, pay more attention to bureaucracy).\n// This sets the entire context for interpreting the \"importance\" of a provision.\nYou are an expert on [country] law, [...]\n\n// CORE METHODOLOGY\n// This is not a \"soft request\". It is a hard instruction to filter noise.\n// The model is to ignore politics and look for the impact on the wallet and life.\n[...] tasked with analyzing acts, resolutions, and other legislative documents, and then preparing information from them in an accessible way for citizens. Your goal is to present information so that citizens can assess the impact of legislation on their lives themselves, even without specialized legislative knowledge. Focus on facts and objective effects of the introduced changes, avoiding value judgments and personal opinions. All legal jargon is prohibited. Present information in a clear, concise, and engaging way so that it is understandable to a person without a legal education. Avoid long, complex sentences. Instead of writing \"the draft aims to amend the tax code...\", write \"Tax changes: new reliefs and obligations for...\". Continue your work until you resolve your task. If you are unsure about the generated content, analyze the document again – do not guess. Plan your task well before starting it. In the summary and key points, if possible and justified, emphasize what specific benefits or effects (positive or negative) the act introduces for the daily lives of citizens, their rights and obligations, personal finances, safety, and other important issues (e.g., categorical bans and orders or the most important specific financial and territorial allocations).\n// TECHNICAL JSON RIGOR\n// The backend container is ruthless. It will not accept \"chatter\".\n// It must be clean JSON. One comma error = fail and total rejection.\nBefore returning the response, carefully verify that the entire JSON structure is 100% correct, including all commas, curly braces, square brackets, and quotation marks. Incorrect JSON is unacceptable and will prevent your work from being processed.\nCarefully analyze the text of the legal document below.\nThis is the content based on which you are to generate the summary and key points:\n--- START OF DOCUMENT ---\n[DOCUMENT_TEXT]\n--- END OF DOCUMENT --\n\n// OUTPUT STRUCTURE (for 8 languages)\n// Must be filled perfectly. Each key is validated.\n// If the model skips e.g., \"fr_summary\" -> the whole thing goes in the trash.\nREMEMBER: Your response MUST be exclusively a valid JSON object. Do not add any additional characters, comments, or text before the \'OPEN_BRACE\' tag or after the \'CLOSE_BRACE\' tag. The entire response must be parsable as JSON.\nBased on the ABOVE document, fill in the JSON structure below: (...)';

  @override
  String get techJudgeTitle => 'B) Judge';

  @override
  String get techJudgeBody => 'Model: Flash Lite';

  @override
  String get techJudgeCode =>
      '// MODEL SETUP\n// This is a simple heuristic model, so its role must also be simple. It is not meant to \"understand\" the act. It is only meant to compare two datasets. ONE TASK!\nROLE: Fact Checker.\nTASK: Compare SOURCE (original) and SUMMARY (summary prepared by another AI).\nYour goal is to detect \"FABRICATED ENTITIES\" in the SUMMARY.\nSOURCE:\n[SOURCE_TEXT]\nSUMMARY TO EVALUATE:\nTitle: [AI_TITLE]\nSummary: [AI_SUMMARY]\nKey Points: [AI_KEY_POINTS]\n// EVALUATION METHODOLOGY\n// We had to define rigid rules because Flash Lite got lost with abstraction, so it got a list of checkboxes.\n// Specific instructions reduce the model\'s decision noise.\nEVALUATION RULES:\n1. Check all NUMBERS, DATES, and AMOUNTS in the SUMMARY. If any are missing in the SOURCE -> is_valid: false.\n2. Check all NAMES, ORGANIZATIONS, and PLACES in the SUMMARY. If any are missing in the SOURCE -> is_valid: false.\n3. Check all specific LEGAL ACTIONS. If this mechanism is not in the SOURCE -> is_valid: false.\n// EXCEPTION FOR ABSTRACTION\n// This is crucial. Abstract concepts (e.g., \"increase in bureaucracy\") often gave false positives.\n// We had to exclude them from \"fabricated entity\" evaluation because the Judge was rejecting valid logical conclusions.\nIMPORTANT: Abstract concepts (e.g., \"transparency\", \"trust\") are allowed as conclusions.\n\n// OUTPUT STRUCTURE and formatting requirements for structuring the response.\nOUTPUT (JSON):\n(\n\"is_valid\": true/false,\n\"issue\": \"fabricated_entity\" / \"contradiction\" / \"none\"\n)\nFORMATTING REQUIREMENTS:\n1. Respond ONLY with a raw JSON object.\n2. DO NOT use Markdown code blocks.\n3. DO NOT add any introductions or explanations before or after the JSON.\n4. JSON must be valid and ready for parsing.';

  @override
  String get techSurgeonTitle => 'C) Surgeon';

  @override
  String get techSurgeonBody => 'Model: Gemini Pro';

  @override
  String get techSurgeonCode =>
      '// MODEL SETUP\n// The Surgeon is not for writing. He is for cutting out the cancer (hallucinations).\n// Must maintain consistency with the \"Citizen Bias\" imposed by the Generalizer.\n// For this reason, we must switch to aggressive grounding.\nYou are a LEGISLATIVE SURGEON.\nYour task is to audit and repair the summary (JSON) regarding compliance with the source text (SOURCE).\n// MEGA IMPORTANT. He cannot add information. If he did – we increase the risk of hallucination, and he no longer has a judge above him. Incomplete summaries are better than false ones.\nFUNDAMENTAL RULE: \"NO NEW INFORMATION\".\nThe summary can only transform information contained in the SOURCE (shorten, translate, summarize). It cannot generate new information that is not in the SOURCE.\n// VERIFICATION PROCEDURE (WORKFLOW)\n// We force a \"Sentence-by-Sentence\" thought process on the model.\nVERIFICATION PROCEDURE (perform for every sentence in JSON):\nAsk yourself: \"Can I point to a specific fragment in the SOURCE that confirms this statement?\"\nIF THE ANSWER IS \"YES\":\nThe information is confirmed by a quote, synonym, or mathematical result from data in the text.\nDECISION: Leave unchanged.\nIF THE ANSWER IS \"NO\":\nThe information is not in the text (it is a hallucination, the model\'s external knowledge, overinterpretation, or unnecessary extrapolation).\nDECISION: Remove this information or change it so that it has coverage in the text.\nIF THE ANSWER IS \"IT DEPENDS\":\nThe text is unclear, and the summary is \"guessing\" (e.g., giving a specific example for a general term).\nDECISION: Be safe. Remove the guessing. Use terminology from the text.\n// RISK CATEGORIES\n// Estimated based on the Generalizer\'s previous errors.\n// We give him a \"roadmap\" of where the mines usually lie.\nRISK CATEGORIES (special attention):\nDates (effective start vs funding start).\nNumbers (specific amounts must result from the text).\nEntities (who does what).\nScope (what the act covers and what it does not).\n\nINPUT:\n--- SOURCE_TEXT START ---\n[SOURCE_TEXT]\n--- SOURCE_TEXT END ---\n\n--- FLAGGED_JSON START ---\n[FLAGGED_JSON]\n--- FLAGGED_JSON END ---\n\nOUTPUT:\nExclusively a repaired JSON object consistent with the structure: (...)';

  @override
  String get techConclusionsTitle => '4. EMPIRICAL CONCLUSIONS';

  @override
  String get techConclusionsIntro =>
      'As the system developed, it was necessary to make decisions based on observations rather than model parameters. This resulted in some quite interesting insights.';

  @override
  String get techConclusionATitle => 'A) Why use a \"dumber\" model?';

  @override
  String get techConclusionABody =>
      'Initial tests on Polish law, audited by Claude and ChatGPT, showed that Gemini Flash generated the best summaries. Close behind was the Pro model, which sometimes received a slightly lower rating due to drawing far-reaching conclusions or skipping certain details. Paradoxically, the model\'s \"thinking\" contributed to slightly lower content quality. Conclusion? When Pro gets a short and simple text, it starts philosophizing. As a result, it can skip key facts it considers too obvious. It also loses JSON structure (forgets to close the brace) much more often. For simple summaries, the choice is obvious.';

  @override
  String get techConclusionBTitle => 'B) So what is Pro for?';

  @override
  String get techConclusionBBody =>
      'The trouble starts with longer documents. Here, the Pro model definitely takes the lead, while weaker models have a much higher tendency to hallucinate. These observations are also confirmed by scientific research (Lost in the Middle). This forces the necessity of using the Pro model immediately for longer documents.';

  @override
  String get techConclusionCTitle => 'C) Effectiveness';

  @override
  String get techConclusionCBody =>
      'Based on empirical experience (hundreds of trials, different parliaments), the anti-hallucination rate is >99%. To estimate the coefficient with greater precision, additional financial outlays would be required (thousands or tens of thousands of tests with the strongest models from competing AI firms). Therefore, this can be treated with a grain of salt. Most hallucinations are minor errors, e.g., using the word \"human\" instead of \"MP\" in a summary. Thus, the system\'s main problem is not them, but excessive generalization. Sometimes the Generalizer will create a correct summary but miss a critical point that is very relevant to public debate. However, this is a compromise the system currently accepts, focused on the total elimination of hallucinations. Boredom is safer than a lie.';

  @override
  String get techFooterDate => 'Update date Q1 2026';

  @override
  String get techFooterLicense => 'Open Source (AGPLv3) License';

  @override
  String get techGraphSource => 'Legislation Source';

  @override
  String get techGraphDecisionLength => 'Length > 20k tokens?';

  @override
  String get techGraphNo => 'NO';

  @override
  String get techGraphYes => 'YES';

  @override
  String get techGraphFlash => 'Flash (System 1)';

  @override
  String get techGraphPro => 'Pro (System 2)';

  @override
  String get techGraphJudge => 'The Judge (Flash Lite)';

  @override
  String get techGraphDecisionPass => 'Result: Pass?';

  @override
  String get techGraphPublishFirestore => 'HTML Ready';

  @override
  String get techGraphNoRetry => 'NO (Retry)';

  @override
  String get techGraphRepairLoop => 'Repair loop';

  @override
  String get techGraphRetryFlash => '< 2 errors: Flash';

  @override
  String get techGraphRetrySurgeon => '> 2 errors: Surgeon';

  @override
  String get techGraphSurgeon => 'The Surgeon (Pro)';

  @override
  String get techGraphHtmlReady => 'HTML Ready';

  @override
  String get votingResultsPL1stReadingTitle => 'VOTE ON REJECTION';

  @override
  String get reportErrorDescription =>
      'Briefly describe the error or what is missing. Your report will help us improve the application.';

  @override
  String get reportErrorHint => 'Type your message...';

  @override
  String get reportErrorValidationEmpty => 'Message cannot be empty.';

  @override
  String get reportErrorSuccess => 'Thank you! Your report has been submitted.';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionSend => 'Send';

  @override
  String get mustBeLoggedInToReport =>
      'You must be logged in to report an error.';

  @override
  String get reportErrorRateLimitExceeded =>
      'The report limit has been exceeded (10 per 24 hours).';

  @override
  String get supportQuickTitle => 'Quick Support';

  @override
  String get supportPaymentsUnavailable =>
      'Payments are currently unavailable.';

  @override
  String get supportNoProducts => 'No support options available.';

  @override
  String get supportCampaignsTitle => 'Targeted Campaigns';

  @override
  String get supportCampaignsDescription =>
      'Support specific development goals, e.g., adding a new parliament.';

  @override
  String get supportCampaignsButton => 'See active campaign (coming soon)';

  @override
  String get forceUpdateTitle => 'Update Required';

  @override
  String get forceUpdateDescription =>
      'A new version of the app is available. To continue, please update the app to the latest version.';

  @override
  String get forceUpdateButton => 'Update Now';

  @override
  String get deputies => 'Deputies';

  @override
  String get sortingLabel => 'Sort by: ';

  @override
  String get sortByPopularity => 'Popularity';

  @override
  String get sortByAttendance => 'Attendance';

  @override
  String partyLabel(Object partyName) {
    return 'Party: $partyName';
  }

  @override
  String districtLabelUS(Object districtName, String districtNum) {
    String _temp0 = intl.Intl.selectLogic(districtNum, {
      '1': '1st',
      '2': '2nd',
      '3': '3rd',
      'other': '${districtNum}th',
    });
    return '$districtName\'s $_temp0 district';
  }

  @override
  String tenureTermItemUS(Object memberType, String termNumber) {
    String _temp0 = intl.Intl.selectLogic(termNumber, {
      '1': '1st',
      '2': '2nd',
      '3': '3rd',
      'other': '${termNumber}th',
    });
    return '$_temp0 Congress ($memberType)';
  }

  @override
  String get birthYearLabel => 'Birth Year:';

  @override
  String get sponsorshipsTab => 'Sponsorships';

  @override
  String get sponsorshipTypeSponsor => 'Sponsor';

  @override
  String get sponsorshipTypeCosponsor => 'Co-sponsor';

  @override
  String get termCurrently => '(currently)';

  @override
  String get parliamentaryTenureTitle => 'Parliamentary tenure';

  @override
  String get usRoleRepresentative => 'Representative';

  @override
  String get usRoleSenator => 'Senator';

  @override
  String shareLegislationText(Object deepLink) {
    return 'Voting is a choice. Make yours as well: $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Profile and voting record: $deepLink';
  }

  @override
  String get clipboardCopySuccess => 'App link copied to clipboard!';

  @override
  String get mandateInactive => 'MANDATE INACTIVE';

  @override
  String get votingUnavailable => 'Voting unavailable';

  @override
  String get historicalTerm => 'HISTORICAL TERM';

  @override
  String get pollUnavailable => 'Poll unavailable';

  @override
  String get billsLabel => 'Bills';

  @override
  String get sponsorshipSublabel => '(Sponsored/Co-sponsored)';

  @override
  String get missingDataWarningShare =>
      'The source document for this bill is missing. Help us and file an official email request to have it published via our app in seconds!';

  @override
  String get missingDataSourceUserMessage =>
      'The source document for this bill is missing. Help us by filing an official email request to have it published and join the group of people who care about information transparency!';

  @override
  String get missingDataSourceButton => 'File email request for document';

  @override
  String get cannotOpenEmailApp =>
      'Could not open the email app. Check if it\'s installed and if you have an account configured.';

  @override
  String get sortByFreshness => 'Newest';

  @override
  String get pollPermissionDeniedError =>
      'This poll is available only for users assigned to this parliament.';

  @override
  String get supportCampaignsButtonActive => 'Support the campaign';

  @override
  String get supportCampaignsButtonInactive => 'Campaign inactive';

  @override
  String get authErrorAppleFailed => 'Apple sign-in failed. Please try again.';

  @override
  String get continueWithApple => 'Continue with Apple';

  @override
  String get homeSearchHint => 'Enter a phrase...';

  @override
  String get homeSearchButtonDeputies => 'Deputies';

  @override
  String get homeSearchButtonLegislations => 'Legislations';

  @override
  String get actionSeeAll => 'See all';

  @override
  String get notificationsEnabledForOtherParliament =>
      'Active for another parliament';

  @override
  String get votingResultsUSMotionToTableTitle => 'RESULTS: MOTION TO TABLE';

  @override
  String get crowdfundingLabel =>
      'Support Lustra in remaining an independent source:';

  @override
  String get hashtagLaw => 'Law';

  @override
  String get hashtagPolitician => 'Politician';

  @override
  String get statusIntroduced => 'Introduced';

  @override
  String get statusPassedHouse => 'Passed House';

  @override
  String get statusPassedSenate => 'Passed Senate';

  @override
  String get statusBecameLaw => 'Became Law';

  @override
  String get statusVetoed => 'Vetoed';

  @override
  String get statusFailed => 'Failed';

  @override
  String get statusPlacedOnCalendar => 'Placed on Calendar';

  @override
  String get actionBack => 'Back';

  @override
  String get actionViewSourceJson => 'AI work logs for this document';

  @override
  String get manualEmailDialogTitle => 'Send message manually';

  @override
  String get manualEmailDialogDescription =>
      'No email client detected. Copy the data below and send it yourself.';

  @override
  String get labelRecipient => 'Recipient';

  @override
  String get labelSubject => 'Subject';

  @override
  String get labelBody => 'Message body';

  @override
  String get actionCopy => 'Copy';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get webBannerDownloadMessage =>
      'To enjoy full functionality, download the app!';

  @override
  String get webBannerDownloadButton => 'Download';

  @override
  String get supportStripeButton => 'Support (Stripe)';

  @override
  String get supportFounderMessage =>
      'There is no big corporation behind this project, just me and my laptop. I built this because I believe such technology must exist and remain 100% independent of capital, which always dictates the narrative. This is my gift to the world.';

  @override
  String get civicProjectTitle => 'Civic Project';

  @override
  String get drafterAuthRequired =>
      'Authentication required. Please log in to Lustra first.';

  @override
  String get drafterLaunchError => 'Failed to launch Drafter Gateway:';

  @override
  String get drafterButtonTitle =>
      'USE LUSTRA DRAFTER TO CREATE LAW FROM IDEA IN 5 MINUTES';

  @override
  String get submitCivicProjectButton => 'Create your project';

  @override
  String get civicThresholdCandidate => 'Needs revision.';

  @override
  String get statusInitiative => 'Initiative';

  @override
  String get civicTitle => 'Civic Projects';

  @override
  String get civicIncubatorTitle => 'Civic Projects Incubator';

  @override
  String get civicSubtitle => 'Drafting the future of democracy, together.';

  @override
  String get civicSection1Title => '1. Program Rules & Governance';

  @override
  String get civicSection1Intro =>
      'Lustra provides citizens with legislative infrastructure. We treat your ideas with the same seriousness as government bills. To ensure quality, strict rules apply:';

  @override
  String get civicProcessTitle => 'The Process';

  @override
  String get civicRuleSubmissionTitle => 'Submission:';

  @override
  String get civicRuleSubmissionText => 'You submit a draft via email/form.';

  @override
  String get civicRuleReviewTitle => 'Formal Review (Human):';

  @override
  String get civicRuleReviewText =>
      'We check compliance with the LDS-1 Standard. We strictly filter out hate speech, spam, duplicates, and non-legislative content.';

  @override
  String get civicRuleAiTitle => 'AI Sterilization:';

  @override
  String get civicRuleAiText =>
      'Approved drafts are processed by our AI to remove emotional language and extract core facts.';

  @override
  String get civicRulePublicationTitle => 'Publication:';

  @override
  String get civicRulePublicationText =>
      'The project receives a \"Civic Bill Card\" in the app, visually equal to government legislation.';

  @override
  String get civicWarningTitle => 'Project Integrity';

  @override
  String get civicWarningText =>
      'The main text remains permanent. You may only add amendments to refine or fix the legislation without changing its core intent. All changes are transparent and added as annexes to maintain voter trust.';

  @override
  String get civicPoliciesTitle => 'Critical Policies';

  @override
  String get civicPolicyPublicDomainTitle => 'Public Domain (CC0):';

  @override
  String get civicPolicyPublicDomainText =>
      'By submitting a project, you waive all copyright. Law belongs to everyone.';

  @override
  String get civicPolicyAstroturfingTitle => 'Anti-Astroturfing:';

  @override
  String get civicPolicyAstroturfingText =>
      'You must declare if you represent an organization. Hidden lobbying results in a permanent ban.';

  @override
  String get civicPolicyAdPersonamTitle => 'Ad Personam:';

  @override
  String get civicPolicyAdPersonamText =>
      'Projects targeting specific individuals (defamation) are rejected immediately.';

  @override
  String get civicPolicyTrashTitle => 'No Trash Bin:';

  @override
  String get civicPolicyTrashText =>
      'Lustra is not a forum. Low-quality drafts, duplicates, and manifestos are rejected at the gate.';

  @override
  String get civicSection2Title => '2. Lustra Legislative Standard (LDS-1)';

  @override
  String get civicSection2Intro =>
      'Your draft must follow this structure. If it looks like a blog post, it will be rejected.';

  @override
  String get civicStructureTitle => 'Required Structure:';

  @override
  String get civicStructureTitleItem => 'Title:';

  @override
  String get civicStructureTitleText => 'Descriptive and neutral.';

  @override
  String get civicStructureArticlesItem => 'Articles:';

  @override
  String get civicStructureArticlesText =>
      'Text divided into numbered units (Art. 1, Art. 2...) containing specific mechanisms (bans, mandates).';

  @override
  String get civicStructureExposeItem => 'Explanatory Memorandum (Exposé):';

  @override
  String get civicStructureExposeText => 'Mandatory section explaining:';

  @override
  String get civicExposePoint1 => '• (1) Diagnosis of the problem.';

  @override
  String get civicExposePoint2 => '• (2) Goal of the regulation.';

  @override
  String get civicExposePoint3 => '• (3) Expected social impact.';

  @override
  String get civicSection3Title => '3. Lustra Readiness Score';

  @override
  String get civicSection3Intro =>
      'We do not judge your political views. We judge the quality of construction. Our AI analyzes every draft on a 0-100 scale:';

  @override
  String get civicScoreStructureTitle => 'Structure (30 pts):';

  @override
  String get civicScoreStructureText =>
      'Correct legal formatting and precise language.';

  @override
  String get civicScoreExposeTitle => 'Exposé Completeness (30 pts):';

  @override
  String get civicScoreExposeText =>
      'Clarity of the problem/solution definition.';

  @override
  String get civicScoreLogicTitle => 'Internal Logic (20 pts):';

  @override
  String get civicScoreLogicText => 'Absence of contradictions.';

  @override
  String get civicScoreImpactTitle => 'Impact Analysis (20 pts):';

  @override
  String get civicScoreImpactText =>
      'Feasibility and identification of affected groups.';

  @override
  String get civicThresholdsTitle => 'Thresholds:';

  @override
  String get civicThresholdRejected => 'Rejected / Returned.';

  @override
  String get civicThresholdReady => 'Priority publication.';

  @override
  String get civicSection4Title => '4. Creator\'s Toolkit (Copy & Paste)';

  @override
  String get civicSection4Intro =>
      'Use this template to ensure your project meets the LDS-1 Standard.';

  @override
  String get civicTemplateCode =>
      'TITLE: [Insert Descriptive Title Here]\n\nPREAMBLE: [Optional: Recognizing that...]\n\nCHAPTER I: GENERAL PROVISIONS\nArt. 1. The objective of this Act is [Insert Goal].\nArt. 2. This Act applies to [Insert Scope].\n\nCHAPTER II: [MAIN MECHANISM / BANS]\nArt. 3. \n1. It is prohibited to [Action].\n2. Entities are required to [Action].\n\nCHAPTER III: SANCTIONS & FINAL PROVISIONS\nArt. X. Violation of Art. 3 is punishable by [Sanction].\nArt. Y. This Act enters into force on [Date].\n\n---\nEXPLANATORY MEMORANDUM (EXPOSÉ)\n\n1. THE PROBLEM\n[Describe the current situation and why it is failing.]\n\n2. THE OBJECTIVE\n[Explain what this law fixes and how.]\n\n3. EXPECTED IMPACT\n[Describe the social, economic, or legal consequences.]';

  @override
  String get civicSubmitButton => 'SUBMIT DRAFT (EMAIL)';

  @override
  String get civicFooterCopyright =>
      '© 2025 Lustra Initiative.\nInfrastructure for the Civic Age.';

  @override
  String civicEmailSubject(Object parliamentName) {
    return '[LDS-1 Submission] Project Title - $parliamentName';
  }

  @override
  String get civicEmailBodyPlaceholder =>
      '[PASTE YOUR TEMPLATE HERE]\n\nAuthor / Organization:\nContact Info:\n';

  @override
  String get civicEmailDialogTitle => 'Email Client Not Found';

  @override
  String get civicEmailDialogIntro =>
      'Please copy the details below and send manually:';

  @override
  String get civicEmailDialogRecipient => 'Recipient';

  @override
  String get civicEmailDialogSubject => 'Subject';

  @override
  String get civicEmailDialogBody => 'Body';

  @override
  String get civicCopiedToClipboard => 'Copied to clipboard';

  @override
  String get civicTemplateCopied => 'Template copied!';

  @override
  String get supportMegaTitle => 'Civic Ownership';

  @override
  String get verificationRequiredTitle => 'Verification required';

  @override
  String get verificationRequiredContent =>
      'To count your vote in the ranking, we must confirm you are human.\n\nPlease check your email inbox (including SPAM folder).';

  @override
  String get verificationResendLink => 'Resend link';

  @override
  String get verificationLinkSentSuccess => 'Link sent again!';

  @override
  String get verificationAlreadyConfirmed => 'I have confirmed';

  @override
  String get verificationSuccessVotingUnlocked =>
      'Thank you! You can vote now.';

  @override
  String get verificationStillNotVerified =>
      'Confirmation not found yet. Please try again in a moment.';

  @override
  String get cancel => 'Cancel';

  @override
  String get pollVoteSignificance => 'Your vote is just the beginning.';

  @override
  String get pollShareImpact =>
      'Algorithms often silence us. Your single share reaches an average of 50-300 people. Help us break the social media bubble.';

  @override
  String get pollShareAction => 'Share and amplify the citizens\' voice';

  @override
  String get listRefreshed => 'List refreshed!';

  @override
  String get errorNoDataReturned => 'No data returned';

  @override
  String get errorMustBeLoggedInToSubscribe =>
      'You must be logged in to subscribe.';

  @override
  String get subscribedToList => 'Subscribed to list!';

  @override
  String get unsubscribedFromList => 'Unsubscribed from list.';

  @override
  String get errorListRemovedByOwner => 'List removed by an owner...';

  @override
  String get errorFailedToUpdateSubscription =>
      'Failed to update subscription.';

  @override
  String get notificationSentCooldownActive =>
      'Notification sent to subscribers!...';

  @override
  String get errorCooldownActiveNotification =>
      'Cooldown active. You can send...';

  @override
  String get errorFailedToSendNotification => 'Failed to send notification.';

  @override
  String get nameYourCuratorList => 'Name your Curator List';

  @override
  String get hintCuratorListExample => 'e.g. My Economic Policy';

  @override
  String listCreatedSuccess(String text) {
    return 'List \'$text\' created!';
  }

  @override
  String get errorFailedToCreateList => 'Failed to create list.';

  @override
  String get actionCreate => 'Create';

  @override
  String get unnamedList => 'Unnamed List';

  @override
  String get tooltipEditList => 'Edit List';

  @override
  String get addDescriptionHint => 'Add a description to tell others...';

  @override
  String subscribersCount(int subs) {
    return '$subs subscribers';
  }

  @override
  String get actionShareList => 'Share List';

  @override
  String get actionSupportCreator => 'Support Creator';

  @override
  String availableInHours(int hoursLeft) {
    return 'Available in ${hoursLeft}h';
  }

  @override
  String get actionNotifySubscribers => 'Notify Subscribers';

  @override
  String get actionSubscribed => 'Subscribed';

  @override
  String get actionSubscribe => 'Subscribe';

  @override
  String get tooltipReportList => 'Report List';

  @override
  String get tooltipDeleteList => 'Delete List';

  @override
  String get draftYourCivicProject => 'Draft your own civic project';

  @override
  String get draftCivicProjectDescription =>
      'Transform your ideas into real bills and gather support. Lustra is ready for your policies.';

  @override
  String get createYourOwnList => 'Create your own list';

  @override
  String get createYourOwnListDescription =>
      'Become a curator. Select important bills, invite followers, and push notifications to their devices to keep them updated on changes in your legislation list or civic projects.';

  @override
  String get editListDetails => 'Edit List Details';

  @override
  String get listNameLabel => 'List Name';

  @override
  String get descriptionOptionalLabel => 'Description (Optional)';

  @override
  String get supportCreatorOptionalLabel => 'Support Creator (Optional)';

  @override
  String providerUsernameLabel(String provider) {
    return '$provider Username';
  }

  @override
  String get listUpdatedSuccess => 'List updated!';

  @override
  String get errorFailedToUpdate => 'Failed to update.';

  @override
  String get actionSave => 'Save';

  @override
  String get deleteListDialogTitle => 'Delete List?';

  @override
  String get deleteListDialogBody => 'This action cannot be undone...';

  @override
  String get listDeletedSuccess => 'List deleted.';

  @override
  String get errorFailedToDelete => 'Failed to delete.';

  @override
  String get actionDelete => 'Delete';

  @override
  String get syncingCuratedFeed => 'SYNCING CURATED FEED...';

  @override
  String get actionTryAgain => 'Try Again';

  @override
  String get tooltipSetAsListCover => 'Set as list cover on Home Page';

  @override
  String get coverUpdatedSuccess => 'Cover updated!';

  @override
  String get errorUpdatingCover => 'Error updating cover.';

  @override
  String get loaderLoadingProfile => 'LOADING PROFILE...';

  @override
  String get loaderRetrievingVoteLogs => 'RETRIEVING VOTE LOGS...';

  @override
  String get loaderLoadingRecentVotes => 'LOADING RECENT VOTES...';

  @override
  String get loaderFetchingData => 'FETCHING DATA...';

  @override
  String get loaderLoadingTrackedBills => 'LOADING TRACKED BILLS...';

  @override
  String get emptyTrackedBills => 'You are not tracking any bills yet.';

  @override
  String get notificationsMobileOnly =>
      'Notifications are available only in mobile app.';

  @override
  String get titleYourTrackedBills => 'Your Tracked Bills';

  @override
  String get buttonSeeAllTracked => 'See all tracked';

  @override
  String get titleNameYourList => 'Name your List';

  @override
  String get hintEgMySocialPolicies => 'e.g. My Social Policies';

  @override
  String snackbarListCreated(String text) {
    return 'List \'$text\' created!';
  }

  @override
  String get snackbarFailedToCreateList => 'Failed to create list.';

  @override
  String get buttonCreate => 'Create';

  @override
  String get titleRenameYourList => 'Rename Your List';

  @override
  String get snackbarListRenamed => 'List renamed!';

  @override
  String get snackbarFailedToRenameList => 'Failed to rename list.';

  @override
  String get buttonSave => 'Save';

  @override
  String get titleYourLists => 'Your Lists';

  @override
  String get emptyNoListsYet => 'You don\'t have any lists yet.';

  @override
  String get tooltipRename => 'Rename';

  @override
  String get snackbarErrorUpdatingList => 'Error updating list.';

  @override
  String get tooltipShareList => 'Share List';

  @override
  String get buttonCreateNewList => 'Create New List';

  @override
  String get errorLimitOf3ListsReached => 'Limit of 3 lists reached.';

  @override
  String get snackbarFailedToDelete => 'Failed to delete.';

  @override
  String get loaderFetchingMirrorParliamentData =>
      'FETCHING MIRROR PARLIAMENT DATA...';

  @override
  String get loaderSecuringSafeChannel => 'SECURING SAFE CHANNEL...';

  @override
  String get snackbarAddedToList => 'Added to your list.';

  @override
  String get snackbarRemovedFromList => 'Removed from your list.';

  @override
  String get loaderLoadingData => 'LOADING DATA...';

  @override
  String get buttonAddToList => 'Add to List';

  @override
  String get previousStatusLabel => 'Previously:';

  @override
  String get statusLabel => 'Status:';

  @override
  String get loaderEstablishingConnection => 'ESTABLISHING CONNECTION...';

  @override
  String get loaderFetchingInitiatives => 'FETCHING INITIATIVES...';

  @override
  String get loaderLoadingMoreInitiatives => 'LOADING MORE INITIATIVES...';

  @override
  String get loaderLoadingMore => 'LOADING MORE...';

  @override
  String get errorMustBeLoggedInToTrack =>
      'You must be logged in to track bills. Notifications are available only on mobile apps. Create an account.';

  @override
  String get loaderLoadingYourTrackedList => 'LOADING YOUR TRACKED LIST...';

  @override
  String get emptyNotTrackingAnything => 'You are not tracking anything yet.';

  @override
  String get loaderLoadingLegislativeData => 'LOADING LEGISLATIVE DATA...';

  @override
  String get loaderAuthorizing => 'AUTHORIZING...';

  @override
  String get loaderLoading => 'LOADING...';

  @override
  String get snackbarLinkCopied => 'Link copied to clipboard!';

  @override
  String get civicWillRecord => 'CIVIC WILL RECORD';

  @override
  String totalVotesRecorded(String totalVotes) {
    return '$totalVotes RECORDED VOTES';
  }

  @override
  String get recordYourPositionForAudit => 'Record your position for audit.';

  @override
  String get privateList => 'Private List';

  @override
  String get loaderLoadingCuratedFeed => 'LOADING CURATED FEED...';

  @override
  String get buttonOpenFullList => 'Open Full List';

  @override
  String get filtersLabel => 'Filters';

  @override
  String get statusFilterLabel => 'Status';

  @override
  String get onlyWithSourceTextLabel => 'Only with source text';

  @override
  String get trackedBillsTitle => 'Tracked Bills';

  @override
  String get curatedListTitle => 'Private List';

  @override
  String get loaderLoadingProfiles => 'LOADING PROFILES...';

  @override
  String get loaderLoadingMoreProfiles => 'LOADING MORE PROFILES...';

  @override
  String get loaderInitializingMirrorParliament =>
      'INITIALIZING MIRROR PARLIAMENT...';

  @override
  String get loaderSyncingVectors => 'SYNCING VECTORS...';

  @override
  String get reportIncludeDiagnosticsTitle => 'Include system diagnostics';

  @override
  String get reportIncludeDiagnosticsSubtitle =>
      'Attaches active state (Parliament, Term, Target) to help us patch the issue.';

  @override
  String get loaderSendingReport => 'SENDING REPORT...';

  @override
  String primaryParliamentLabel(String parliament) {
    return 'Primary: $parliament';
  }

  @override
  String get buttonCreateAnotherList => 'Create Another List';

  @override
  String get buttonCreateTrackingList => 'Create Tracking List';

  @override
  String get errorMissingListId => 'Error: Missing List ID';

  @override
  String get actionTracked => 'Tracked';

  @override
  String get actionTrack => 'Track';

  @override
  String pollSupportPercent(String percent) {
    return 'SUPPORT $percent%';
  }

  @override
  String get pollSyncing => 'SYNCING...';

  @override
  String pollOpposePercent(String percent) {
    return 'OPPOSE $percent%';
  }

  @override
  String get pollPositionRecorded => 'POSITION RECORDED';

  @override
  String get pollRestrictedToCitizens => 'RESTRICTED TO CITIZENS OF COUNTRY';

  @override
  String yourListsForCountry(String countryName) {
    return 'Your Lists ($countryName)';
  }

  @override
  String get bottomNavGetInvolved => 'Get Involved';

  @override
  String get errorLaunchUrl => 'Could not launch link';

  @override
  String get infoTechTitle => 'How Technology Works';

  @override
  String get infoTechSubtitle =>
      'Learn about our architecture, data sterilization, and civic tech principles.';

  @override
  String get infoGovTitle => 'Transparency & Governance';

  @override
  String get infoGovSubtitle =>
      'Who builds this, who pays for it, and where we are heading.';

  @override
  String get infoPrivacyTitle => 'Constitution & Privacy';

  @override
  String get infoPrivacySubtitle =>
      'Radical transparency. Exactly what data we collect and why.';

  @override
  String get manualTitle => 'Open Citizens\' Manual';

  @override
  String get manualSubtitle => 'Learn how to reclaim agency in democracy.';

  @override
  String get howToActTitle => 'How to act with Lustra';

  @override
  String get actAuditTitle => 'Civic Audit';

  @override
  String get actAuditSubtitle =>
      'Vote on policies and bills to shape the hierarchy of topics in your government and leave solid evidence of Citizens\' Will. Don\'t let media steer off the conversation ever again.';

  @override
  String get actWatchlistTitle => 'Curated Watchlists';

  @override
  String get actWatchlistSubtitle =>
      'Create custom lists of official bills and civic projects to gather subscribers and increase awareness. Use existing social media as lobbying power.';

  @override
  String get actDraftTitle => 'Draft Civic Bills';

  @override
  String get actDraftSubtitle =>
      'Submit your own professional initiatives directly to Lustra. Modern society needs new ideas that are not gatekeeped by capital. Create, share and collect support.';

  @override
  String get joinCommunityTitle => 'Join the Community';

  @override
  String get subscribedLists => 'Subscribed';

  @override
  String get snackbarAddedToListWebPromo =>
      'Added! Download our app to get push notifications about this bill.';

  @override
  String get aboutGovAppBar => 'Governance';

  @override
  String get aboutGovTitle => 'Transparency & Governance';

  @override
  String get aboutGovSubtitle =>
      'Who builds this, who pays for it, and where we are heading.';

  @override
  String get aboutGovFounderName => 'Jacek (Fons)';

  @override
  String get aboutGovFounderBadge => 'SOLO ARCHITECT / FOUNDER';

  @override
  String get aboutGovFounderP1 =>
      'I am not a politician, a lawyer, or an academic. I don\'t have formal credentials. 18 months ago, I was working cleaning jobs. I spent the whole 2025 unemployed, building this system from scratch on a 2016 laptop.';

  @override
  String get aboutGovFounderP2 =>
      'Why? Because I was frustrated that billionaires and corporations have better data tools than citizens. I was frustrated with the gatekeeping the law from citizens and narrative wars deployed by media, that either alienate people from politics or make them choose a camp. I taught myself everything to build a Mirror Parliament. I don\'t believe in online petitions; I believe in data-driven, hard transparency and accessibility. And that democracy needs an update.';

  @override
  String get aboutGovFounderP3 =>
      'You might ask, \"Why should I trust you?\" Don\'t trust anyone, especially with politics - start auditing.';

  @override
  String get aboutGovSec1Title => '1. Funding & Infrastructure';

  @override
  String get aboutGovSec1Intro =>
      'There is no VC. There is no dark money. There is no crypto. Currently, this operation is entirely bootstrapped.';

  @override
  String get aboutGovSec1Bullet1Title => 'Infrastructure:';

  @override
  String get aboutGovSec1Bullet1Text =>
      'Covered by a \$2,000 credit grant from the Google For Startups program. We currently have around \$1,200 left, which gives us approximately 12 months of server runway.';

  @override
  String get aboutGovSec1Bullet2Title => 'Living costs:';

  @override
  String get aboutGovSec1Bullet2Text =>
      'Supported entirely by my personal savings, my fiance, and my family.';

  @override
  String get aboutGovSec1Bullet3Title => 'Tech Stack:';

  @override
  String get aboutGovSec1Bullet3Text =>
      'Built alone (Flutter, Firebase, Vertex AI pipeline, Node.js) to keep operational costs close to zero.';

  @override
  String get aboutGovSec2Title => '2. Current Legal Entity & The Transition';

  @override
  String get aboutGovSec2P1 =>
      'Lustra is currently incubating under my old Polish LLC (FO&WO VENTURES SP. Z O.O.). This is a legal necessity. To publish on Apple/Google App Stores and to receive the Google Startup credits, a registered company with a DUNS number is required. I cannot afford the legal fees to start a Foundation yet (\$500+ setup and monthly accounting), so I use the leanest vehicle possible.';

  @override
  String get aboutGovSec2BoxTitle => 'The Roadmap to Non-Profit:';

  @override
  String get aboutGovSec2BoxText =>
      'As soon as we reach financial liquidity and critical mass (approx. 100k monthly users), I plan to open a formal Non-Profit Organization and transfer all intellectual property and infrastructure there.';

  @override
  String get aboutGovSec2P2 =>
      'The ultimate goal is a democratic governance structure. Decisions will be made by a board elected by the community. My role will be strictly limited to technical backend maintenance. I do not see any other future for Lustra than a non-profit operation with full transparency of all financial documents.';

  @override
  String get aboutGovSec3Title => '3. Security & Source Code';

  @override
  String get aboutGovSec3Bullet1Title => 'Authentication:';

  @override
  String get aboutGovSec3Bullet1Text =>
      'We don\'t touch your passwords. We use Google/Apple Auth because their security infrastructure is superior. We only store an anonymized User ID and your Vote ID to prevent bot farms.';

  @override
  String get aboutGovSec3Bullet2Title => 'Source Available:';

  @override
  String get aboutGovSec3Bullet2Text =>
      'The core repositories are public under the Open Source (AGPLv3) License. It is protected against corporate cloning, but the data adapters, AI system prompts, and logic are fully visible for audit.';

  @override
  String get aboutGovSec3BoxTitle => 'We need help.';

  @override
  String get aboutGovSec3BoxText =>
      'I am one guy with an old laptop, doing everything. If you are a developer, a journalist, or a citizen who wants to help establish local cells in your country—reach out.';

  @override
  String get aboutGovSec3Contact => 'Contact: jacek@lustra.dev';

  @override
  String get aboutGovSec3Github => 'GitHub Profile';

  @override
  String get termsAppBar => 'Constitution & Privacy';

  @override
  String get termsTitle => 'Constitution & Privacy';

  @override
  String get termsLastUpdated => 'Last updated: March 12, 2026';

  @override
  String get termsAlertTitle =>
      'Radical Transparency: What we actually collect';

  @override
  String get termsAlertP1 =>
      'You might be thinking: \"I\'m not giving some randoms my data.\" We agree. That\'s why we don\'t want your personal life. We only want to verify that you are a real human voting on real laws.';

  @override
  String get termsAlertP2 =>
      'Here is the exact data structure we store for your user profile in our Google Cloud Firestore database. No hidden fields. No tracking cookies.';

  @override
  String get termsAlertCode =>
      '[\n  \'uid\': \'0A21rfdsTs1F3kYsx3252352\', // Generated by Firebase Auth\n  \'email\': \'citizen@example.com\', // Your only Personal Data\n  \'createdAt\': \'February 15, 2026 at 8:23:31 PM UTC\',\n  \'marketingConsent\': true, // For project updates (optional)\n  \'primaryParliamentId\': \'United States Congress\'\n]';

  @override
  String get termsAlertH4 => 'Wait, where are my votes and tracked bills?';

  @override
  String get termsAlertP3 =>
      'To protect your privacy and ensure our database scales efficiently, your interactions are sharded (separated) from your main profile:';

  @override
  String get termsAlertB1Title => 'Tracked Bills:';

  @override
  String get termsAlertB1Text =>
      'Stored in a private sub-collection. Only you (and your device) can request to see the list of bills you are tracking.';

  @override
  String get termsAlertB2Title => 'Your Votes (Cryptographic Hashing):';

  @override
  String get termsAlertB2Text =>
      'When you vote, we DO NOT attach your UID directly to the public vote record. Instead, the server generates a cryptographic Hash (e.g., a1b2c3d4...) using a secret server salt. This strongly pseudonymizes your vote. If a hacker steals the database, they cannot see who voted for what. While it is mathematically a one-way function, in the spirit of absolute transparency, you should know that the system operators (who hold the secret salt) could theoretically verify a vote to audit the system for fraud or comply with a valid court order. However, your votes are strictly separated from your daily profile and never publicly displayed with your identity.';

  @override
  String get termsAlertP4 =>
      'That\'s it. The rest is anonymous analytics (Firebase Analytics) to fix bugs, and App Check to prevent bot-farms from rigging the votes. We do not sell data. We do not run ads.';

  @override
  String get termsTocTitle => 'Table of Contents';

  @override
  String get termsPart1Title => 'Part 1: Privacy Policy (Data Minimization)';

  @override
  String get termsPart1Intro =>
      'We do not trade your attention. We collect only what is technically necessary to operate a secure civic infrastructure.';

  @override
  String get termsP1S1Title => '1. Data Controller';

  @override
  String get termsP1S1Text =>
      'The legal operator is temporarily FO&WO VENTURES SP. Z O.O. (LLC), based in Wrocław, Poland. Contact: jacek@lustra.dev';

  @override
  String get termsP1S2Title => '2. What We Collect';

  @override
  String get termsP1S2B1Title => 'Account (Email/UID):';

  @override
  String get termsP1S2B1Text =>
      'Necessary for secure login via Firebase Authentication.';

  @override
  String get termsP1S2B2Title => 'Votes & Polls (Anonymized):';

  @override
  String get termsP1S2B2Text =>
      'Your votes build the statistics. They are linked to your account purely to prevent bot farms and duplicate voting. Publicly, your votes are displayed ONLY as anonymous aggregates. The actual vote record is cryptographically hashed to separate your identity from your political choice.';

  @override
  String get termsP1S2B3Title => 'Tracked Bills & Push Notifications:';

  @override
  String get termsP1S2B3Text =>
      'If you choose to track a bill or subscribe to a Curated List, we use Google\'s Firebase Cloud Messaging (FCM) Topics. This allows us to send you push notifications about status changes without constantly tracking your location or device identity.';

  @override
  String get termsP1S2B4Title => 'Vote Retention:';

  @override
  String get termsP1S2B4Text =>
      'Voting data is stored for the duration of the parliamentary term plus 5 years for archival and research purposes.';

  @override
  String get termsP1S2B5Title => 'Communication:';

  @override
  String get termsP1S2B5Text =>
      'If you explicitly consent, we will send you project updates via email. You can withdraw consent at any time.';

  @override
  String get termsP1S2B6Title => 'Citizen Projects:';

  @override
  String get termsP1S2B6Text =>
      'Content of legislative drafts submitted by you is entirely public.';

  @override
  String get termsP1S2Highlight =>
      '3. WHAT WE DO NOT DO:\n\n❌ We DO NOT sell data to data brokers.\n❌ We DO NOT use ad tracking.\n❌ We DO NOT profile you politically for commercial purposes.';

  @override
  String get termsP1S3Title => '4. Infrastructure & Security';

  @override
  String get termsP1S3B1Title => 'Location:';

  @override
  String get termsP1S3B1Text =>
      'Data is hosted securely on Google Cloud Platform, Europe-West9 (Paris).';

  @override
  String get termsP1S3B2Title => 'Anti-Bot:';

  @override
  String get termsP1S3B2Text =>
      'We use Firebase App Check to verify app authenticity and prevent automated manipulation.';

  @override
  String get termsP1S3B3Title => 'AI Privacy:';

  @override
  String get termsP1S3B3Text =>
      'We send only public government documents to AI models for summarization. Your private data NEVER goes to AI.';

  @override
  String get termsP1S4Title => '5. Children & Account Deletion';

  @override
  String get termsP1S4P1 =>
      'The service is intended for users 16+. We do not knowingly collect children\'s data.';

  @override
  String get termsP1S4P2 =>
      'To delete your data: Use the \"Delete Account\" button directly in the app settings to immediately remove your identifying data, email, and all your sub-collections from our servers.';

  @override
  String get termsP1S5Title => '6. Your Rights';

  @override
  String get termsP1S5Text =>
      'Under GDPR, you have the right to access, rectify, delete, and object to the processing of your data. Contact us at the email provided above.';

  @override
  String get termsPart2Title => 'Part 2: Community Rules (Terms of Service)';

  @override
  String get termsP2S1Title => '1. Operator and Mission';

  @override
  String get termsP2S1Text =>
      'Lustra is a digital public infrastructure. The company acts as an incubator: it pays no dividends, has no external investors, and reinvests any revenue directly back into maintaining the infrastructure.';

  @override
  String get termsP2S2Title => '2. Code and License (Source Available)';

  @override
  String get termsP2S2Intro =>
      'Lustra\'s code is a common good protected from corporate exploitation.';

  @override
  String get termsP2S2B1Title => 'Model:';

  @override
  String get termsP2S2B1Text => 'Open Source (AGPLv3) License.';

  @override
  String get termsP2S2B2Title => 'Allowed:';

  @override
  String get termsP2S2B2Text =>
      'Educational, research, and non-profit/civic use.';

  @override
  String get termsP2S2B3Title => 'Prohibited:';

  @override
  String get termsP2S2B3Text =>
      'Corporations cannot use or profit from our work without explicit community consent.';

  @override
  String get termsP2S3Title => '3. Governance Roadmap';

  @override
  String get termsP2S3Intro => 'Our long-term goal is full decentralization.';

  @override
  String get termsP2S3B1Title => 'Current state:';

  @override
  String get termsP2S3B1Text => 'The Founder acts as Lead Architect.';

  @override
  String get termsP2S3B2Title => 'Soon:';

  @override
  String get termsP2S3B2Text =>
      'Establishment of a Civic Board elected directly by the users.';

  @override
  String get termsP2S3B3Title => 'Goal:';

  @override
  String get termsP2S3B3Text =>
      'Implementing technical and legal mechanisms for the community to take control of the platform in case of mission betrayal.';

  @override
  String get termsP2S4Title => '4. Citizen Drafts Program (Law Incubator)';

  @override
  String get termsP2S4Intro =>
      'We provide a space for citizens to write the laws.';

  @override
  String get termsP2S4B1Title => 'Procedure:';

  @override
  String get termsP2S4B1Text =>
      'Drafts are submitted via form and verified formally by the Operator.';

  @override
  String get termsP2S4B2Title => 'Public Domain:';

  @override
  String get termsP2S4B2Text =>
      'By submitting a draft, you release it under the CC0 License (Public Domain). Law belongs to everyone.';

  @override
  String get termsP2S4B3Title => 'Free Speech:';

  @override
  String get termsP2S4B3Text =>
      'We do not judge opinions or political leanings. We only reject projects violating criminal law or inciting violence.';

  @override
  String get termsP2S4B4Title => 'Verification:';

  @override
  String get termsP2S4B4Text =>
      'You must be a citizen of the country where you submit a draft.';

  @override
  String get termsP2S5Title => '5. AI and Source Hierarchy';

  @override
  String get termsP2S5Text =>
      'AI is a tool, not an oracle. AI helps navigate complex legal language but can make mistakes. The ultimate authority is ALWAYS the original PDF/XML document linked at the bottom of every summary in the app.';

  @override
  String get termsP2S6Title => '6. Safety & Final Provisions';

  @override
  String get termsP2S6Text =>
      'Attacks on infrastructure, DDoS, and commercial scraping are strictly prohibited. Matters not regulated herein are decided by Polish law.';

  @override
  String get bpAppBar => 'System Blueprint';

  @override
  String get bpTitle =>
      'How We Reclaim Agency in Democracy With Mirror Parliament: Citizens\' Manual';

  @override
  String get bpIntroBig =>
      'The Big Picture: The current democratic system is a broken \"game of telephone.\" We fix the signal by plugging citizens directly into the legislative process via the Mirror Parliament (Lustra).';

  @override
  String get bpIntroSmall =>
      'Why it matters: Currently, we only vote every few years. Between elections, we have zero control. Lustra gives us a \"seat at the table\" every single day.';

  @override
  String get bpS1Title => '1. THE PROBLEM: A Broken Loop';

  @override
  String get bpS1P1 => 'Information flows one way and gets distorted.';

  @override
  String get bpS1Code =>
      'Citizens elect politicians\n   ↓\nPoliticians form a Government\n   ↓\nMedia selectively interpret government actions\n   ↓\nCitizens receive feedback (distorted)';

  @override
  String get bpS1Highlight =>
      'Result: We don\'t know what\'s really happening because of legal jargon and media noise.';

  @override
  String get bpS2Title => '2. SOLUTION: Fixing The Flow of Information';

  @override
  String get bpS2P1 =>
      'Lustra removes the middlemen. It simulates a real seat of power where your voice is recorded on specific bills, not just general polls.';

  @override
  String get bpS2FlowMedia => 'MEDIA (optional observer)';

  @override
  String get bpS2Flow1 => 'Citizens see a legal bill draft & rate it';

  @override
  String get bpS2Flow2 => 'Politicians see the result of the civic will';

  @override
  String get bpS2Flow3 => 'Politicians vote (monitored against the data)';

  @override
  String get bpS2Flow4 => 'Citizens check: Did the politician obey the data?';

  @override
  String get bpS2Flow5 =>
      'Citizens choose politicians based on their \"Obedience Score\"';

  @override
  String get bpS2Flow6 => 'A new Government is formed.';

  @override
  String get bpS2FlowLoop => 'CYCLE REPEATS';

  @override
  String get bpS3Title => '3. HOW IT WORKS';

  @override
  String get bpS3ATitle =>
      'Step A: Removing the Language Barrier (Translation)';

  @override
  String get bpS3AP1 =>
      'Most laws are boring and unreadable. Lustra fixes the Accessibility Gap.';

  @override
  String get bpS3AP2 =>
      'Benefit: 20 seconds to understand the facts. No jargon.';

  @override
  String get bpS3BTitle => 'Step B: Knowledge Distribution (The News Card)';

  @override
  String get bpS3BP1 =>
      'Lustra doesn\'t need millions of users to work. It is enough that You are there.';

  @override
  String get bpS3BList1Title => 'Your action:';

  @override
  String get bpS3BList1Text =>
      'You enter, see a topic, and generate a News Card with one click.';

  @override
  String get bpS3BList2Title => 'Reach:';

  @override
  String get bpS3BList2Text =>
      'Auto-share to your social media (FB, X, IG, etc.).';

  @override
  String get bpS3BList3Title => 'Effect:';

  @override
  String get bpS3BList3Text =>
      'Your friends get a fact-checked \"ready meal\" without needing the app. You become an independent source of information.';

  @override
  String get bpS3BExample => 'Example:';

  @override
  String get bpS3CTitle => 'Step C: Reclaiming Agency (The Pressure)';

  @override
  String get bpS3CP1 =>
      'Politicians and corporations ignore \"internet storms\" because they are chaotic, easy to censor, and disappear quickly.';

  @override
  String get bpS3CList1Title => 'Solution:';

  @override
  String get bpS3CList1Text =>
      'Verified Social Polls. Your vote is attached to a specific legislative document ID.';

  @override
  String get bpS3CList2Title => 'Difference:';

  @override
  String get bpS3CList2Text =>
      'These are not petitions that expire. These are hard signatures with verified accounts.';

  @override
  String get bpS3CP2 =>
      'If 50,000 people vote against a bill, hard proof of a lack of social support is created. This cannot be \"covered up\" by a TV narrative.';

  @override
  String get bpS4Title => '4. CIVIC OFFENSIVE: We Write the Laws';

  @override
  String get bpS4P1 => 'Government ignoring a problem? We don\'t wait.';

  @override
  String get bpS4List1Title => 'Civic Drafts:';

  @override
  String get bpS4List1Text =>
      'We create our own bills and collect digital signatures.';

  @override
  String get bpS4List2Title => 'The Trap:';

  @override
  String get bpS4List2Text =>
      'If they reject a popular bill on technicalities, we apply amendments and re-submit it.';

  @override
  String get bpS4List3Title => 'The Choice:';

  @override
  String get bpS4List3Text =>
      'Ignoring a ready, popular solution proves bad faith. It gives the opposition a free weapon to take over the electorate.';

  @override
  String get bpS4CtaTitle => 'Support these Civic Drafts NOW!';

  @override
  String get bpS4CtaP1 =>
      'Click below to review and vote on proposed legislation:';

  @override
  String get bpS4Card1Title => 'Epstein Class Defund Act';

  @override
  String get bpS4Card1Desc =>
      'Cuts public funding for figures involved in trafficking & human rights violations.';

  @override
  String get bpS4Card2Title => 'Term Limits Amendment';

  @override
  String get bpS4Card2Desc =>
      'Establishes a strict cap on career length in Congress.';

  @override
  String get bpS4Card3Title => 'Congressional Ethics Act';

  @override
  String get bpS4Card3Desc =>
      'Implements a Stock Trading Ban for active Congress members.';

  @override
  String get bpS5Title => '5. FINAL RESULT: Political Cleanse';

  @override
  String get bpS5P1 =>
      'No more hiding. The debate returns to where the people are: to social media, but on new rules. This is the fulfillment of the original promise of the internet that the system feared: decentralized control of power.';

  @override
  String get bpS5P2 =>
      'Mirror Parliament turns on the light in a dark room, we force TRANSPARENCY. A politician cannot lie that \"people want this\" when data shows otherwise. New laws serve the general public, not capital.';

  @override
  String get bpS5P3 =>
      'We are not asking politicians to change. We are creating a system where lying about public support becomes impossible. This is data-driven democracy.';

  @override
  String get bpS5Highlight =>
      'This is an introduction to direct democracy, based on a conscious, informed voice, and not on emotions.';

  @override
  String get caAppBar => 'Civic Audit';

  @override
  String get caTitle => 'Civic Audit: New System for Better Democracy';

  @override
  String get caIntro =>
      'No one evaluates the law-making process besides a few people behind closed doors and the occasional rogue journalist exposing corruption. As a result, legislation frequently becomes derailed from civic needs, prioritizing political or corporate interests over societal adaptation. Our end goal is simple: a society voting on actual policies, not just electing singular politicians and hoping they keep their promises. Mirror Parliament was built to make this transition easy and achievable.';

  @override
  String get caS1Title => 'How Civic Audit is Different from Petitions?';

  @override
  String get caS1PetitionsTitle => 'Traditional Petitions';

  @override
  String get caS1PetitionsText =>
      'Petitions rarely work because of their elusive nature. After collecting signatures, the campaign ends. It’s essentially a polite advisory request towards a person in power. Because these are timed campaigns relying on a short media cycle, politicians can easily dismiss them. They just wait for the media to switch the narrative, and the petition is forgotten.';

  @override
  String get caS1LustraTitle => 'Lustra Civic Will';

  @override
  String get caS1LustraText =>
      'We don’t ask. In Lustra, your vote is not just a signature - it’s permanently anchored to a solid, official legislative ID. It marks your exact stance on a specific policy. All these votes combine to create the Civic Will: a real-time meter showing exactly how citizens evaluate a project, closing the Civic Audit loop.';

  @override
  String get caS2Title => 'Why Should Politicians Care?';

  @override
  String get caS2Text =>
      'Because they can no longer hide.\n\nWe record their every official vote in the government and benchmark it directly against the Civic Will. They can no longer lie that \"people want this\" just because they ran a clever media campaign. If they vote on something that benefits a lobby group instead of citizens, we find out immediately. The more people use Lustra to expose these gaps, the harder it becomes for politicians to manipulate the narrative. We recover control.';

  @override
  String get caS3Title => 'The Sweet Part: Asymmetric Power';

  @override
  String get caS3P1 =>
      'We don’t need traditional media like lobbyists do. We don’t even need 5 million users inside the app to update democracy. We just need you.\n\nYou already have reach outside Lustra: on Facebook, TikTok, X, or elsewhere. We can finally turn social media into something meaningful. One user sharing a bill can easily generate 100-1,000 views with almost zero effort. That’s a small stadium of people learning about a crucial piece of law or a civic initiative.';

  @override
  String get caS3MathSubtitle => 'ASYMMETRIC WARFARE MATH';

  @override
  String get caS3P2 =>
      'Think about the math: an active corporate think tank or lobbying group might be 10-15 people whose only leverage is money to buy political favors. Your 10,000 verified votes from real citizens can overpower them. We can do exactly what lobbyists do, but faster, transparently, and with overwhelming numbers. Times have changed.';

  @override
  String get caS4Title => 'Who Controls the Feed? You Do.';

  @override
  String get caS4Text =>
      'Traditional media and Big Tech algorithms optimize for outrage to sell ads. Lustra’s algorithm is strictly democratic. We don\'t have editors deciding what is \"important.\" Our main feed automatically evaluates the last 30 days of legislation, isolates the top 5 bills with the highest civic engagement, and rotates them into the spotlight. Your votes dictate the hierarchy of information. You control the algorithm.';

  @override
  String get caS5Title => 'The Arsenal: How to Use \"Fact Cards\"';

  @override
  String get caS5Intro =>
      'Legislation is intentionally boring. It was never meant to be mainstream. That’s why the media creates emotional narratives around it to sell ads. You can create narratives too - but yours will be built on raw, summarized, verified data.\n\nLustra produces Fact Cards. Every time you click \"Share,\" it renders a clean image using official data. On its own, it’s just a fact. In social media, facts need to be explained. You are the explainer. Here is exactly how to use them to create viral, high-impact content:';

  @override
  String get caS5A_Title => 'A/ The Hook (Create the Angle)';

  @override
  String get caS5A_Text =>
      'The easiest option is usually the most relatable. Did you find a new Internet Censorship Bill in the app? Don\'t overcomplicate it. Create a strong headline (a \"hook\"), tell people exactly how it affects them, and drop the direct link to the Lustra so they could vote.';

  @override
  String get caS5B_Title => 'B/ The Evidence (For Essays & Threads)';

  @override
  String get caS5B_Text =>
      'Images are great additions to longer posts or starters. Want to highlight critical flaws in a proposed bill or confront the government\'s official summary? Attach the Fact Card as undeniable proof. Let people read the sterilized data for themselves in 15 seconds.';

  @override
  String get caS5C_Title => 'C/ The Broadcast (TikTok/Reels)';

  @override
  String get caS5C_Text =>
      'Use the Fact Card image with a \"green screen\" effect on TikTok or Instagram. Put the Lustra data in the background and record yourself explaining the issue. It is the perfect, verifiable short-form content.';

  @override
  String get caS5D_Title => 'D/ The Network (Direct Messaging)';

  @override
  String get caS5D_Text =>
      'Just click share and send the image directly to your friends and family groups. Tell them clearly: \"This is what is currently going on in the government,\" or \"this is what media are silent about now.\"';

  @override
  String get caS5Outro =>
      'Content production is easy, and Lustra is your discovery engine. You are not just a user. You are an early adopter to the new era of democracy free from corruption. You have the same tools as a lobbyist – use them.';

  @override
  String get caSkepticTitle => 'Skeptical about bot farms or data privacy?';

  @override
  String get caSkepticText =>
      'Good. Don\'t trust our words - audit our system. Read exactly how we use cryptographic hashing, Firebase App Check, and the Open Source (AGPLv3) License to protect your identity and the integrity of the Civic Will.';

  @override
  String get caSkepticBtnGov => 'Transparency & Gov';

  @override
  String get caSkepticBtnPriv => 'Constitution & Privacy';

  @override
  String get clAppBar => 'Watchlists';

  @override
  String get clTitle => 'Curated Watchlists: Decentralized Civic Media';

  @override
  String get clIntro =>
      'Governments weaponize the sheer volume of legislation. They pass hundreds of pages of complex laws, often burying controversial acts behind boring titles or sneaking them through the \"backdoor\" while the media is distracted by the latest political scandal. Citizens lose track of the broader picture because it is physically impossible to monitor everything alone.';

  @override
  String get clS1Title => 'Pattern Recognition & Mass Mobilization';

  @override
  String get clS1P1 =>
      'Curated Watchlists allow you to organize the chaos and act as an independent information node. You can mix official government bills with grassroots civic drafts, group them by specific topics, and invite others to subscribe.';

  @override
  String get clS1P2 =>
      'Crucially, a Watchlist acts as a multiplier for the Civic Audit. You are not rallying support for just one isolated bill. By grouping up to 80 items, your list becomes a dedicated, focused feed for your followers. They can enter your list and cast their votes across multiple bills in one session, mass-generating hard data and Civic Will for an entire sector of policy.';

  @override
  String get clS2Title => 'How to Use Watchlists as a Weapon:';

  @override
  String get clS2A_Title => 'Government Watchdogs';

  @override
  String get clS2A_Text =>
      'Notice the government trying to quietly pass a series of privacy-invading tech laws? Group them into a \"Digital Surveillance Watchlist.\" Show your subscribers the hidden agenda the media missed and let them vote against all of them in one place. Ask them to amplify it by sharing.';

  @override
  String get clS2B_Title => 'Platform for Reform';

  @override
  String get clS2B_Text =>
      'Don\'t just complain about the economy. Build a complete, multi-bill \"Economic Reform List\" mixing your own civic projects with official amendments. Present a fully structured political platform.';

  @override
  String get clS2C_Title => 'The Spotlight';

  @override
  String get clS2C_Text =>
      'You can pin a specific bill as the \"Favorite\" on your list to direct maximum civic attention and voting power exactly where it is needed most.';

  @override
  String get clS3Title => 'The Sweet Part: You Own the Broadcast';

  @override
  String get clS3Text =>
      'Social media algorithms constantly suppress external links to keep users scrolling. Lustra bypasses this. When people subscribe to your Watchlist, you bypass Big Tech entirely. You are given a manual \"Push\" button. Once every 24 hours, you can trigger a direct mobile notification to all your subscribers, alerting them to check your list because a critical vote is happening or a new bill was added. You control the distribution.';

  @override
  String get clS4Title => 'The Creator Economy for Democracy';

  @override
  String get clS4Text =>
      'Good curation is extremely valuable. Filtering political noise takes time and expertise. That is why Lustra allows you to attach your personal Tip Jar directly to your Watchlist. If you do the hard work of monitoring the government and educating the public, your subscribers can fund your efforts directly. We don\'t take a cut.';

  @override
  String get clS5Title => 'Deployment: How to Start';

  @override
  String get clS5Intro =>
      'This is not a passive feature. You must actively build it. Here is the exact instruction to deploy your first Watchlist:';

  @override
  String get clStep1Title => 'Step 1: Initialize';

  @override
  String get clStep1Text =>
      'Navigate to the main screen and click the Gear Icon (Settings) in the top corner. Select the option to create your first Watchlist. Give it a clear title.';

  @override
  String get clStep2Title => 'Step 2: Curator Mode';

  @override
  String get clStep2Text =>
      'Once your list is initialized, the system grants you Curator status. Now, browse the main feed. Inside the details screen of every bill or civic project, a new \"Add to list\" button will appear. Click it to inject that specific law directly into your list.';

  @override
  String get clStep3Title => 'Step 3: Feed Injection';

  @override
  String get clStep3Text =>
      'Your Watchlist does not flood the main feed. Instead, the single bill you selected as the “Favorite\" acts as your ambassador. This single card is injected directly into your subscribers\' daily feeds, seamlessly interwoven with official government legislation. It is displayed with the exact same priority as official government laws. We place citizen oversight on equal footing with the state.';

  @override
  String get clLimitsTitle => 'SYSTEM LIMITS (SIGNAL OVER NOISE)';

  @override
  String get clLimit1Label => 'AUTHORSHIP';

  @override
  String get clLimit1Desc =>
      'Max active lists per government (You can delete and redeploy new ones anytime).';

  @override
  String get clLimit2Label => 'CAPACITY';

  @override
  String get clLimit2Desc =>
      'Max bills per list (More than enough to expose a pattern, strict enough to prevent information overload).';

  @override
  String get clLimit3Label => 'SUBSCRIPTIONS';

  @override
  String get clLimit3Desc => 'Max lists you can observe from other creators.';

  @override
  String get clOutro =>
      'Lustra is not a social network that generates free algorithmic reach for your list. Watchlists are invite-only. You must share your unique link externally. Bring your audience from X, YouTube, TikTok, or your newsletter. We do not give you followers; we give you the infrastructure to turn your existing followers into a verified, voting civic force - and a way to get directly funded for your hard work. Stop asking your audience for \"likes\". Give them a tool to act.';

  @override
  String get supportFundTitle => 'Phase 1: Launch Non-Profit Entity';

  @override
  String get supportFundDesc =>
      'To officially open the Lustra Foundation, protect the intellectual property, and cover legal setup fees, we need to gather initial capital. Help us make this system independent forever.';

  @override
  String get supportFundDisclaimer =>
      'Data transparency: Due to different payment gateways and infrastructure costs, this progress bar is updated manually by the founder (max once a week).';
}

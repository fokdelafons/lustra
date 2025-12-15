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
  String get sectionPopularVotes => 'Popular Votes';

  @override
  String get sectionUpcoming => 'Coming Soon';

  @override
  String get sectionLegislationInProcess => 'Legislation in Process';

  @override
  String get sectionMpProfiles => 'MP Profiles';

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
  String get citizenPollTitle => 'Citizen Poll';

  @override
  String get pollTemporarilyUnavailable =>
      'Poll temporarily unavailable. Please try again later.';

  @override
  String get errorDisplayingPollBar => 'Error displaying poll results.';

  @override
  String get pollNoForAgainstVotes => 'No For/Against votes';

  @override
  String get pollNoVotesCast => 'No votes cast';

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
  String get infoTitle1 => 'Separating Politics from Media';

  @override
  String get infoParagraph1 =>
      'Lustra is an application for tracking politics using official data. With AI technology, summaries of bills and voting results are presented concisely, clearly, and impartially. Following politics no longer requires effort or time - just a few clicks.';

  @override
  String get infoTitle2 => 'Common Interests Above Divisions';

  @override
  String get infoParagraph2 =>
      'As a society, we share common goals like freedom, security, and prosperity. Differences in views are a natural part of democracy - they shape debate and allow for different perspectives. With access to reliable information, we can make more informed decisions and participate in public life based on facts, not emotions or media narratives.';

  @override
  String get infoTitle3 => 'Deeds, Not Words';

  @override
  String get infoParagraph3 =>
      'You no longer have to trust election promises - you can review the voting history of individual MPs and analyze their decisions. Each politician\'s profile includes a bulleted list, enabling a quick and independent assessment of their record. The complete work history will be expanded as the application develops.';

  @override
  String get infoTitle4 => 'People, Not Parties';

  @override
  String get infoParagraph4 =>
      'MPs should consider the interests of their constituents, not just vote along party lines. The party system divides society, but everything can be changed with small steps. The first is public awareness. Use the app, talk, share votes, participate in polls, and stay informed. Politics affects almost every aspect of our lives, so there\'s no reason for the few to decide everything.';

  @override
  String get linkHowTechnologyWorks => 'How does the technology work?';

  @override
  String get linkTermsAndPrivacy => 'Terms and Privacy Policy';

  @override
  String get supportScreenTitle => 'Support the Project';

  @override
  String get supportParagraph1 =>
      'Lustra is my personal pro bono project. The application will always be free, with no paid features, extensions, ads, or limitations. I believe everyone should have unrestricted access to accessible information - without opinionated commentary or filters. If you agree with the mission, I encourage you to support it with a donation of any amount. Every contribution, no matter how small, will help me maintain the app and develop it further.';

  @override
  String get buttonSupportFinancially => 'Support financially';

  @override
  String get supportThankYou =>
      'Thank you for your trust and every form of engagement';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Application Creator';

  @override
  String get leaderboardTitle => 'Top Donors (Last Month)';

  @override
  String get futureFeaturesScreenTitle => 'Future Features';

  @override
  String get futureFeaturesHeader => 'Planned Functionalities';

  @override
  String get futureFeatureReferendum => 'Calling a referendum';

  @override
  String get futureFeatureSenate => 'Senate and senators';

  @override
  String get futureFeatureCitizenInitiative =>
      'Citizen\'s legislative initiative - bill projects';

  @override
  String get futureFeatureIndependentCandidates =>
      'Independent candidates for parliament';

  @override
  String get futureFeaturePetitions => 'Petitions to the parliament';

  @override
  String get comingSoon => 'Soon';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Finished - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Refresh data';

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
  String get mandateStatusActive => 'MP mandate: active';

  @override
  String get mandateStatusFulfilled => 'MP mandate: fulfilled';

  @override
  String get mandateStatusCancelled => 'MP mandate: cancelled';

  @override
  String get mandateStatusInactive => 'MP mandate: inactive';

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
  String get pollResultNoVotes => 'no votes';

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
  String get morePointsInApp =>
      '...full details are available in the Lustra app';

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
  String get termsOfServiceContent =>
      '<b>\"Lustra\" App Terms of Service</b>\n\nLast updated: August 10, 2025\n\nHi! This is the creator of the Lustra app.\nI\'m glad you\'re here. I created Lustra because I believe that every one of us deserves simple and transparent access to information about how the laws that affect our lives are made.\n\nThis document is the terms of service – a kind of agreement between you and me. I wrote it in plain language so you know exactly what the rules of the app are. Please read it carefully. By using Lustra, you confirm that you accept these rules.\n\n<b>1. Glossary, i.e., who and what we\'re talking about</b>\n•\t<b>I, my, me</b> – that\'s me, Jacek, the app\'s creator, operating under the company FO&WO VENTURES SP. Z O.O. based in Wrocław.\n•\t<b>You, your</b> – that\'s you, the person using the app.\n•\t<b>App</b> or <b>Lustra</b> – the mobile application \"Lustra\" you are currently using.\n•\t<b>Account</b> – your personal account in the app, which you can create to use additional features.\n•\t<b>Terms</b> – this very document.\n\n<b>2. What is Lustra about? (Main principles)</b>\n•\tLustra is a free app aimed at providing you with accessible information about legislative processes in selected parliaments. Here you\'ll find summaries of bills, voting results, and information about MPs.\n•\tYou must be at least 16 years old to use the app. If you create an Account, you confirm that you meet this condition.\n•\tUsing the basic informational features does not require creating an Account.\n\n<b>3. Your Account in the app</b>\n•\tYou can create an Account using your e-mail address. This will allow you to use additional features, such as voting in polls or receiving personalized notifications.\n•\tPlease remember that you can only have one Account.\n•\tYou are responsible for keeping your password confidential and for everything that happens on your Account.\n\n<b>4. How can you use the content? (License)</b>\n•\tAll source data (e.g., full texts of laws, voting results, MPs\' data) come from official, public sources and are public information.\n•\tThe content I create using my proprietary system and AI technology (i.e., summaries, simplified titles, key points) is provided to you for free use for informational, educational, and private purposes. You can read and share it as screenshots.\n•\tI kindly ask you – do not copy this data automatically (do not scrape it). Creating and maintaining this system costs me time and money. Therefore, to protect this project, the Terms forbid you from:\n\t\to\tAutomatically downloading and creating your own database based on the content generated in the app.\n\t\to\tUsing the app\'s content for commercial purposes.\n\t\to\tAttempting to break security, decompile the app, or disrupt its operation.\n•\tHave an idea for using Lustra\'s data in an interesting way? I\'m open to collaboration! Write to me at jacek@lustra.dev – I\'d be happy to talk about it.\n\n<b>5. Polls and data accuracy</b>\n•\tOne of the app\'s features is polls where you can express your support for a given bill. To make the results of these polls as reliable as possible, please select the parliament of the country you are a citizen of in the settings (if it is available on the list).\n\n<b>6. My liability (or rather, the lack of it)</b>\n•\tI provide the app \"as is\". I make every effort to ensure the data is current and correct, but it comes from external, government APIs, which may contain errors. Therefore, I cannot be held responsible for any inaccuracies in the source data.\n•\tLustra is a pro bono project that I maintain with my own funds. I will do my best to keep it running without interruption, but I must reserve that technical breaks may occur. I also reserve the right to terminate the service, for example, if I run out of funds to maintain it.\n•\tThe content in the app, especially that generated by AI, is for informational and educational purposes. It does not constitute legal advice.\n\n<b>7. Lustra Support Club</b>\n•\tYou can join the \"Lustra Support Club\" by giving separate, voluntary consent. This means I will be able to send you emails about the app\'s development, new features, and also ask for support in discussions about the project\'s future or for financial help if needed. You can find more details about this in the Privacy Policy.\n\n<b>8. Termination of our agreement</b>\n•\tYou can terminate it at any time. Just use the \"Delete Account\" option in the app\'s settings. This will permanently delete your Account and its associated data.\n•\tI can block or delete your Account if you grossly violate these Terms, for example, by trying to harm the app\'s operation.\n\n<b>9. Changes to the Terms</b>\n•\tThe world changes, and so will the app. I reserve the right to change these Terms. I will inform you of any important changes in advance, for example, through a message in the app. Continued use of Lustra after the changes are introduced will mean you accept them.\n\n<b>10. Contact and final provisions</b>\n•\tIf you have any questions, feel free to write to: jacek@lustra.dev.\n•\tIn all matters not regulated by these Terms, Polish law shall apply.\n\nThanks for being here and helping to create a transparent state!';

  @override
  String get termsAndPrivacyTitle => 'Terms & Privacy Policy';

  @override
  String get termsOfServiceTab => 'Terms of Service';

  @override
  String get privacyPolicyTab => 'Privacy Policy';

  @override
  String get privacyPolicyContent =>
      '<b>\"Lustra\" App Privacy Policy</b>\n\nLast updated: August 10, 2025\n\nThis document is the Privacy Policy. I know such texts can be long and complicated, so I\'ve done my best to write it simply.\nYour privacy and trust are my absolute priority. In this policy, I will explain what data I collect, why I do it, and how I protect it.\n\n<b>1. Who takes care of your data? (Data Controller)</b>\nI, Jacek, operating as FO&WO VENTURES SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ (ul. Wapienna 13/7, 50-518 Wrocław, NIP: 6343002817), am the controller of your personal data.\nIf you have any questions about your data, write to me directly at: jacek@lustra.dev.\n\n<b>2. What data do I collect and why?</b>\nI only collect data that is necessary for the app to function or for which you give separate, voluntary consent. Here is a detailed list:\n•\t<b>When you create an Account:</b>\n\to\t<b>Your email address:</b> I need it to create and securely maintain your Account, allow you to log in, and let you reset your password if you forget it.\n\to\t<b>Unique User ID (UID):</b> This is a random string of characters automatically assigned by the Firebase system, which allows me to securely link your data to your Account.\n•\t<b>When you use the app\'s features (as a logged-in user):</b>\n\to\t<b>Your votes in polls (\"support\" / \"oppose\"):</b> I save them to create aggregate, fully anonymous statistics of support for individual laws, which you see in the app. Your individual vote is never publicly displayed anywhere.\n\to\t<b>Your list of followed legislation:</b> I store it so you have easy access to it and so I can (in the future) send you notifications about their progress.\n\to\t<b>Your chosen parliament:</b> I save this information so you can participate in the relevant polls and (in the future) receive notifications for the correct country.\n•\t<b>When you join the Lustra Support Club (completely voluntary):</b>\n\to\t<b>Information about your consent (true/false):</b> I save it to know if you want to receive additional messages from me. I write more about the Club in section 5.\n•\t<b>When you report a bug:</b>\n\to\tIf you decide to send a data error report, I will save the content of your report to analyze and fix the problem.\nWhat I do <b>NOT</b> collect: I do not use any external analytical tools (like Google Analytics) to track your activity in the app.\n\n<b>3. Who do I entrust your data to? (My technology partners)</b>\nFor Lustra to work, I use the services of trusted technology partners to whom I entrust the processing of some data. They are:\n•\t<b>Google (as part of the Firebase service):</b> This is the technological backbone of the entire app. Google provides me with the infrastructure for:\n\to\t<b>Authentication (Firebase Authentication):</b> Secure login and management of your Account.\n\to\t<b>Database (Cloud Firestore):</b> Storing data related to your Account (e.g., poll votes, list of followed legislation).\n•\t<b>Google (as part of the Gemini AI service):</b> This is the tool I use to analyze legislative texts. I want to be absolutely clear: I only send publicly available texts of laws and documents to the AI. Your personal data (like email or UID) is never sent there.\nAll data is stored on Google servers located within the European Economic Area.\n\n<b>4. How long do I store your data?</b>\nShort and simple: I store your data as long as you have an Account with me. If you decide to delete it, all your personal data will be permanently erased.\n\n<b>5. The Lustra Support Club – what is it?</b>\nThis is a special place for people who want to be closer to the project. Joining is completely voluntary and requires checking a separate consent box. If you join, it means you agree to me occasionally sending you emails about:\n•\tapp development and planned new features,\n•\tspecial events, e.g., discussion panels about the future of Lustra,\n•\tother, similar mission-driven projects I might create in the future,\n•\trequests for financial support if the project finds itself in a difficult situation.\nYou can withdraw your consent at any time in the app\'s settings.\n\n<b>6. Your rights – you are in full control</b>\nGDPR gives you a range of rights, and I want you to be able to exercise them easily. You have the right to:\n•\tAccess your data: To know what data I hold about you.\n•\tRectify (correct) your data.\n•\tErase your data (the right to be forgotten): You can do this at any time using the \"Delete Account\" option in the app\'s settings.\n•\tRestrict the processing of your data.\n•\tData portability.\n•\tObject to the processing of your data.\n•\tWithdraw consent (e.g., for being in the Lustra Support Club).\n•\tLodge a complaint with the President of the Personal Data Protection Office (UODO) if you believe I am processing your data unlawfully.\nTo exercise most of these rights, just write to me at jacek@lustra.dev.\n\n<b>7. Security of your data</b>\nI take security very seriously. I use solutions provided by Google Firebase, which apply modern security standards, including data encryption both during transmission (SSL protocol) and storage on servers.\n\n<b>8. Children\'s data</b>\nAs mentioned in the Terms of Service, the app is intended for people who are 16 years of age or older. I do not knowingly collect or process data from younger individuals.\n\n<b>9. Changes to this policy</b>\nI may update this policy in the future. I will inform you of any significant changes in advance within the app.\n\nThank you for your trust.\nJacek';

  @override
  String get techPageTitle => 'About Technology and Impartiality';

  @override
  String get techPageIntro =>
      'Behind every simplified title and summary of a law, there is a language model. Here, I want to explain to you with full transparency how it works and how I ensure that the information you receive is always pure and unbiased.';

  @override
  String get techPageWhyAiTitle => 'Why Do I Use AI?';

  @override
  String get techPageWhyAiBody =>
      'The texts of laws and parliamentary documents are written in complicated legal jargon. Reading and understanding even a short act is a challenge, even for a lawyer.\n\nMy goal was to create a tool that would translate this hermetic language \'from legal to human\'. Manually analyzing hundreds of documents daily would be impossible for one person. That\'s why I turned to AI – as a powerful tool for text analysis and simplification, which allows me to deliver information to you quickly and in an accessible form.';

  @override
  String get techPageWhatForTitle => 'What Exactly Do I Use AI For?';

  @override
  String get techPageWhatForBody =>
      'Artificial Intelligence performs three specific tasks:\n  • It simplifies official titles into ones that immediately tell you what the document is about.\n  • It creates short, 2-3 sentence summaries that focus on the impact of the changes on the daily lives of citizens.\n  • It extracts a few key points from the dense text, meaning the most important changes and solutions.\n\nAll other data, such as voting results or information about MPs, comes directly from official, government APIs.';

  @override
  String get techPageBiasTitle =>
      'How Do I Ensure Impartiality? Instructions for the AI';

  @override
  String get techPageBiasBody =>
      'This is the most important part. The AI follows specific commands. These commands (called a \'prompt\' in computer science) are a kind of very precise instruction that is the foundation of the entire application\'s impartiality.\n\nHere are the key principles I have drilled into my AI system:\n  • <b>Role of a neutral expert:</b> I instruct the AI to take on the role of an apolitical legal expert whose sole purpose is to analyze and explain, not to judge or comment.\n  • <b>Just the facts, no opinions:</b> The instructions explicitly forbid the AI from expressing its own opinions, making value judgments, or using language that could suggest whether a given change is \'good\' or \'bad\'. It is to focus solely on the facts.\n  • <b>Perspective of the common person:</b> Instead of analyzing a law from a lawyer\'s perspective, the AI is tasked with answering the question: \'What does this change mean for me, an ordinary citizen? How will it affect my finances, health, rights, and duties?\'.';

  @override
  String get techPagePromiseTitle =>
      'Full, Transparent Instructions for Review';

  @override
  String get techPagePromiseBody =>
      'Don\'t just take my word for it. Below is the exact content of the instruction (prompt) that I pass to the AI model (Google Gemini) when analyzing each document, making sure that the creativity parameters are also set to 0 (so the AI doesn\'t make things up during analysis). This is the \'brain\' of the operation.\n\n(Note: This prompt will evolve and be improved over time to continuously increase the quality of the summaries.)';

  @override
  String techPagePromptCode(Object DOCUMENT_TEXT, Object country) {
    return 'You are an expert in $country law, tasked with analyzing legislative documents, resolutions, and other legal acts, and then preparing information from them in an accessible way for citizens. Your goal is to present the information so that citizens can assess the impact of the legislation on their lives themselves, even without specialized legislative knowledge. Focus on the facts and consequences of the changes being introduced, avoiding value judgments and personal opinions. All legal jargon is forbidden. Present the information in a clear, concise, and engaging manner, so that it is understandable to a person without a legal background. Avoid long, complex sentences. Instead of writing \'the project aims to implement the directive regarding waste segregation...\', write \'New rules for waste segregation: use of special bags, etc....\'. Continue your work until you have completed your task. If you are unsure about the generated content, analyze the document again – do not guess. Plan your task well before you begin. In the summary and key points, if possible and justified, highlight what specific benefits or consequences (positive or negative) the act introduces for the daily lives of citizens, their rights and duties, personal finances, security, and other important issues.\n\nYour response MUST be in JSON format - and contain the following keys.\nBefore returning the response, carefully verify that the entire JSON structure is 100% correct, including all commas, curly braces, square brackets, and quotation marks. Incorrect JSON is unacceptable and will prevent your work from being processed.\n\nAnalyze the following legal document text carefully. This is the content based on which you are to generate the summary and key points:\n--- START OF DOCUMENT ---\n$DOCUMENT_TEXT\n--- END OF DOCUMENT ---\n\nREMEMBER: Your response MUST be exclusively a valid JSON object. Do not add any extra characters, comments, or text before the \'OPEN_BRACE\' tag or after the \'CLOSE_BRACE\' tag. The entire response must be parsable as JSON.\nBased on the ABOVE document, fill in the following JSON structure:\nHere is the JSON structure I expect (fill it with content):\n__OPEN_BRACE__\n  \"ai_title\": \"A new, short title for the legal act in English, capturing the essence of the introduced changes (e.g., a maximum of 10-12 words).\",\n  \"summary\": \"A 2-3 sentence concise summary of the legal act\'s content in English, written from the perspective of its impact on citizens\' daily lives.\",\n  \"key_points\": [\n    \"First short point in English about the most important solutions or changes being introduced.\",\n    \"Second short point in English...\"\n  ],\n \"category\": [\"Categorize the document by default into one category, based on the field it mainly concerns. Choose up to 3 if the document also addresses SIGNIFICANT issues from other categories. You MUST choose categories EXCLUSIVELY from the following list: Health, Education, Family, Taxes, Work, Security, Environment, Courts and Law, Transport, Benefits, Real Estate, Media and Culture, Local Government, Migration, Agriculture, Public Investments, Digitization, Economy. If the document definitely does not fit into any of them, you MUST use \'Other\'. If you use \'Other\', it should be the ONLY category selected. DO NOT create new categories. The response must be an array of strings, e.g., [\\\"Taxes\\\", \\\"Family\\\"].\", \"Second category (optional)\", \"Third category (optional)\"]\n__CLOSE_BRACE__';
  }

  @override
  String get techPageFlawlessTitle => 'Is AI Infallible?';

  @override
  String get techPageFlawlessBody =>
      'Of course not. Like any technology, it can make a mistake or misinterpret something. That\'s why in the application, you will find a mechanism to report an error in the data – every such report is extremely valuable to me and helps me improve the system.\n\nMy long-term goal is to further develop this technology, and even to run my own local model without any restrictions, to further increase the precision and independence of the application.';

  @override
  String get techPageOutro =>
      'Thank you for your trust. I hope that thanks to this transparency, using Lustra will be even more valuable for you.';

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
    return 'See the details of this bill in the Lustra app! $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'See and rate this MP\'s work in the Lustra app! $deepLink';
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
}

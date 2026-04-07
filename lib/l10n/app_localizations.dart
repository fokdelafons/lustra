import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
  ];

  /// No description provided for @errorFailedToLoadData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load data'**
  String get errorFailedToLoadData;

  /// No description provided for @errorNoData.
  ///
  /// In en, this message translates to:
  /// **'No data to display.'**
  String get errorNoData;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @noDate.
  ///
  /// In en, this message translates to:
  /// **'No date'**
  String get noDate;

  /// No description provided for @shareAction.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareAction;

  /// No description provided for @loginAction.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginAction;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get settingsChangeLanguage;

  /// No description provided for @settingsLogout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get settingsLogout;

  /// No description provided for @tryAgainButton.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgainButton;

  /// No description provided for @moreButton.
  ///
  /// In en, this message translates to:
  /// **'... More'**
  String get moreButton;

  /// No description provided for @seeDetailsLink.
  ///
  /// In en, this message translates to:
  /// **'See details ->'**
  String get seeDetailsLink;

  /// No description provided for @bottomNavHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomNavHome;

  /// No description provided for @bottomNavInfo.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get bottomNavInfo;

  /// No description provided for @bottomNavSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get bottomNavSupport;

  /// No description provided for @bottomNavFutureFeatures.
  ///
  /// In en, this message translates to:
  /// **'Future Features'**
  String get bottomNavFutureFeatures;

  /// No description provided for @termLabel.
  ///
  /// In en, this message translates to:
  /// **'Term: {termNumber}'**
  String termLabel(String termNumber);

  /// No description provided for @termMenuItem.
  ///
  /// In en, this message translates to:
  /// **'Term {termNumber} {termYears}'**
  String termMenuItem(int termNumber, String termYears);

  /// No description provided for @errorNoDataForTerm.
  ///
  /// In en, this message translates to:
  /// **'No data to display for the selected term.'**
  String get errorNoDataForTerm;

  /// No description provided for @sectionPopularVotes.
  ///
  /// In en, this message translates to:
  /// **'Legislative Votes'**
  String get sectionPopularVotes;

  /// No description provided for @sectionUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Scheduled Debates'**
  String get sectionUpcoming;

  /// No description provided for @sectionLegislationInProcess.
  ///
  /// In en, this message translates to:
  /// **'In Process'**
  String get sectionLegislationInProcess;

  /// No description provided for @civicProjectsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Civic Initiatives'**
  String get civicProjectsSectionTitle;

  /// No description provided for @sectionMpProfiles.
  ///
  /// In en, this message translates to:
  /// **'Popular Politicians'**
  String get sectionMpProfiles;

  /// No description provided for @votingSourceTooltip.
  ///
  /// In en, this message translates to:
  /// **'View voting source'**
  String get votingSourceTooltip;

  /// No description provided for @legislationSponsorLabel.
  ///
  /// In en, this message translates to:
  /// **'Sponsor'**
  String get legislationSponsorLabel;

  /// No description provided for @buttonBrowseVotes.
  ///
  /// In en, this message translates to:
  /// **'Vote browser'**
  String get buttonBrowseVotes;

  /// No description provided for @buttonScheduledMeetings.
  ///
  /// In en, this message translates to:
  /// **'Scheduled sessions'**
  String get buttonScheduledMeetings;

  /// No description provided for @buttonBillsInProgress.
  ///
  /// In en, this message translates to:
  /// **'Bills in progress'**
  String get buttonBillsInProgress;

  /// No description provided for @buttonAllMps.
  ///
  /// In en, this message translates to:
  /// **'All deputies'**
  String get buttonAllMps;

  /// No description provided for @buttonCheckProfile.
  ///
  /// In en, this message translates to:
  /// **'Check profile'**
  String get buttonCheckProfile;

  /// No description provided for @errorNoDeputiesData.
  ///
  /// In en, this message translates to:
  /// **'No data about deputies.'**
  String get errorNoDeputiesData;

  /// No description provided for @errorNoDataLastVote.
  ///
  /// In en, this message translates to:
  /// **'No data about the last vote.'**
  String get errorNoDataLastVote;

  /// No description provided for @errorNoDataUpcomingVote.
  ///
  /// In en, this message translates to:
  /// **'No data about the upcoming vote.'**
  String get errorNoDataUpcomingVote;

  /// No description provided for @errorNoSummaryLastVote.
  ///
  /// In en, this message translates to:
  /// **'No summary for the last vote.'**
  String get errorNoSummaryLastVote;

  /// No description provided for @errorNoSummaryUpcomingVote.
  ///
  /// In en, this message translates to:
  /// **'No summary for the upcoming vote.'**
  String get errorNoSummaryUpcomingVote;

  /// No description provided for @errorNoDataLegislationInProcess.
  ///
  /// In en, this message translates to:
  /// **'No data about legislation in process.'**
  String get errorNoDataLegislationInProcess;

  /// No description provided for @errorNoSummaryLegislationInProcess.
  ///
  /// In en, this message translates to:
  /// **'No summary for legislation in process.'**
  String get errorNoSummaryLegislationInProcess;

  /// No description provided for @keyPoints.
  ///
  /// In en, this message translates to:
  /// **'Key points'**
  String get keyPoints;

  /// No description provided for @noKeyPoints.
  ///
  /// In en, this message translates to:
  /// **'No key points'**
  String get noKeyPoints;

  /// No description provided for @votingResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'VOTING RESULTS'**
  String get votingResultsTitle;

  /// No description provided for @labelFor.
  ///
  /// In en, this message translates to:
  /// **'For:'**
  String get labelFor;

  /// No description provided for @labelAgainst.
  ///
  /// In en, this message translates to:
  /// **'Against:'**
  String get labelAgainst;

  /// No description provided for @labelAbstained.
  ///
  /// In en, this message translates to:
  /// **'Abstained:'**
  String get labelAbstained;

  /// No description provided for @noStatusInfo.
  ///
  /// In en, this message translates to:
  /// **'No status information'**
  String get noStatusInfo;

  /// No description provided for @scheduledMeetingDate.
  ///
  /// In en, this message translates to:
  /// **'Scheduled session: {date}'**
  String scheduledMeetingDate(String date);

  /// No description provided for @noScheduledMeetingDate.
  ///
  /// In en, this message translates to:
  /// **'No scheduled meeting date'**
  String get noScheduledMeetingDate;

  /// No description provided for @processStartDate.
  ///
  /// In en, this message translates to:
  /// **'Process start: {date}'**
  String processStartDate(String date);

  /// No description provided for @noProcessStartDate.
  ///
  /// In en, this message translates to:
  /// **'No process start date'**
  String get noProcessStartDate;

  /// No description provided for @mpDistrict.
  ///
  /// In en, this message translates to:
  /// **'District: {districtNumber}'**
  String mpDistrict(String districtNumber);

  /// No description provided for @actionCollapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get actionCollapse;

  /// No description provided for @actionExpand.
  ///
  /// In en, this message translates to:
  /// **'Expand more...'**
  String get actionExpand;

  /// No description provided for @votingFor.
  ///
  /// In en, this message translates to:
  /// **'For'**
  String get votingFor;

  /// No description provided for @votingAgainst.
  ///
  /// In en, this message translates to:
  /// **'Against'**
  String get votingAgainst;

  /// No description provided for @votingAbstainShort.
  ///
  /// In en, this message translates to:
  /// **'Abstain'**
  String get votingAbstainShort;

  /// No description provided for @citizenPollTitle.
  ///
  /// In en, this message translates to:
  /// **'Civic Will'**
  String get citizenPollTitle;

  /// No description provided for @pollTemporarilyUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Poll temporarily unavailable. Please try again later.'**
  String get pollTemporarilyUnavailable;

  /// No description provided for @errorDisplayingPollBar.
  ///
  /// In en, this message translates to:
  /// **'Error displaying poll results.'**
  String get errorDisplayingPollBar;

  /// No description provided for @pollNoForAgainstVotes.
  ///
  /// In en, this message translates to:
  /// **'No For/Against votes'**
  String get pollNoForAgainstVotes;

  /// No description provided for @pollNoVotesCast.
  ///
  /// In en, this message translates to:
  /// **'Be the first to cast a vote.'**
  String get pollNoVotesCast;

  /// No description provided for @pollTotalVotes.
  ///
  /// In en, this message translates to:
  /// **'Votes cast: {count}'**
  String pollTotalVotes(int count);

  /// No description provided for @pollSupport.
  ///
  /// In en, this message translates to:
  /// **'I support'**
  String get pollSupport;

  /// No description provided for @pollDontSupport.
  ///
  /// In en, this message translates to:
  /// **'I don\'t support'**
  String get pollDontSupport;

  /// No description provided for @loginToVote.
  ///
  /// In en, this message translates to:
  /// **'Log in to vote'**
  String get loginToVote;

  /// No description provided for @dialogChooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get dialogChooseLanguage;

  /// No description provided for @dialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get dialogCancel;

  /// No description provided for @infoScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get infoScreenTitle;

  /// No description provided for @infoTitle1.
  ///
  /// In en, this message translates to:
  /// **'Citizens Above Politics'**
  String get infoTitle1;

  /// No description provided for @infoParagraph1.
  ///
  /// In en, this message translates to:
  /// **'Media doesn\'t inform – it curates reality. An estimated 95% of legislation disappears into a \"black hole\" of silence because it\'s too complex or \"boring\" to sell ads. Lustra bypasses the middlemen. We process bureaucratic legislative language into accessible facts, giving you insight into what the government enacts, not just what they want to discuss.'**
  String get infoParagraph1;

  /// No description provided for @infoTitle2.
  ///
  /// In en, this message translates to:
  /// **'Facts, Not Marketing'**
  String get infoTitle2;

  /// No description provided for @infoParagraph2.
  ///
  /// In en, this message translates to:
  /// **'Politics today is 80% marketing and 20% law. We separate the two. We apply a \"context sterilization\" process: stripping away emotional language, partisan spin, and opinions to leave only the legal facts. This isn\'t \"another point of view.\" It is noise reduction, allowing you to form your own opinion based on the source.'**
  String get infoParagraph2;

  /// No description provided for @infoTitle3.
  ///
  /// In en, this message translates to:
  /// **'Power Without Middlemen'**
  String get infoTitle3;

  /// No description provided for @infoParagraph3.
  ///
  /// In en, this message translates to:
  /// **'Big tech platforms optimize content for your outrage because it keeps you scrolling. We optimize for your insight. The hierarchy of topics in the app depends entirely on community votes. You decide what matters for the state, taking power back from publishers and lobbyists.'**
  String get infoParagraph3;

  /// No description provided for @infoTitle4.
  ///
  /// In en, this message translates to:
  /// **'Architects of Change'**
  String get infoTitle4;

  /// No description provided for @infoParagraph4.
  ///
  /// In en, this message translates to:
  /// **'Democracy isn\'t a spectator sport. We are introducing a mechanism where professionally formatted citizen initiatives are displayed on par with government bills. We provide the infrastructure to move you from a passive observer to an Architect of Change – building real support for issues that matter. We are taking democracy to a new level.'**
  String get infoParagraph4;

  /// No description provided for @linkHowTechnologyWorks.
  ///
  /// In en, this message translates to:
  /// **'How does the technology work?'**
  String get linkHowTechnologyWorks;

  /// No description provided for @linkTermsAndPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Terms and Privacy Policy'**
  String get linkTermsAndPrivacy;

  /// No description provided for @supportScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Public Infrastructure'**
  String get supportScreenTitle;

  /// No description provided for @supportParagraph1.
  ///
  /// In en, this message translates to:
  /// **'Lustra is a digital public utility. But freedom has a price. We rejected capital to guarantee 100% impartiality, believing it is the only path to change. Maintaining infrastructure and servers depends solely on voluntary contributions. The equivalent of \$10 funds platform access for several thousand people monthly. Your support guarantees the continuity of the mission and uninterrupted platform operation.'**
  String get supportParagraph1;

  /// No description provided for @buttonSupportFinancially.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get buttonSupportFinancially;

  /// No description provided for @supportThankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank you. You keep the system alive.'**
  String get supportThankYou;

  /// No description provided for @creatorName.
  ///
  /// In en, this message translates to:
  /// **'Jacek Michałowski'**
  String get creatorName;

  /// No description provided for @creatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Founder'**
  String get creatorTitle;

  /// No description provided for @futureFeaturesScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Community Roadmap'**
  String get futureFeaturesScreenTitle;

  /// No description provided for @futureFeaturesHeader.
  ///
  /// In en, this message translates to:
  /// **'You Control the Direction'**
  String get futureFeaturesHeader;

  /// No description provided for @futureFeatureSenate.
  ///
  /// In en, this message translates to:
  /// **'Senator Integration'**
  String get futureFeatureSenate;

  /// No description provided for @futureFeatureCitizenInitiative.
  ///
  /// In en, this message translates to:
  /// **'Citizen Referendums'**
  String get futureFeatureCitizenInitiative;

  /// No description provided for @futureFeaturesDescription.
  ///
  /// In en, this message translates to:
  /// **'This is not a closed wishlist. Lustra is infrastructure owned by citizens, so we all have an impact on its development. Join the Civic Evolution community on Reddit, submit ideas, and vote on upcoming features. Let\'s write the next chapter of democracy together!'**
  String get futureFeaturesDescription;

  /// No description provided for @futureFeaturesVoteButton.
  ///
  /// In en, this message translates to:
  /// **'Vote on Roadmap'**
  String get futureFeaturesVoteButton;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Proposal'**
  String get comingSoon;

  /// No description provided for @legislationScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Legislative - {parliamentName}'**
  String legislationScreenTitle(String parliamentName);

  /// No description provided for @refreshDataTooltip.
  ///
  /// In en, this message translates to:
  /// **'Refresh cache'**
  String get refreshDataTooltip;

  /// No description provided for @advancedSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Advanced search...'**
  String get advancedSearchHint;

  /// No description provided for @filterTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Type: '**
  String get filterTypeLabel;

  /// No description provided for @filterStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status: '**
  String get filterStatusLabel;

  /// No description provided for @allOption.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allOption;

  /// No description provided for @errorFetchData.
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch data. Please try again.'**
  String get errorFetchData;

  /// No description provided for @emptyListFilterMessage.
  ///
  /// In en, this message translates to:
  /// **'No bills found matching the selected criteria.'**
  String get emptyListFilterMessage;

  /// No description provided for @emptyListDefaultMessage.
  ///
  /// In en, this message translates to:
  /// **'No finished bills to display for this source.'**
  String get emptyListDefaultMessage;

  /// No description provided for @searchDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Search and Filter'**
  String get searchDialogTitle;

  /// No description provided for @searchDialogHint.
  ///
  /// In en, this message translates to:
  /// **'Enter search phrase...'**
  String get searchDialogHint;

  /// No description provided for @searchDialogTimePeriodLabel.
  ///
  /// In en, this message translates to:
  /// **'Time period'**
  String get searchDialogTimePeriodLabel;

  /// No description provided for @searchDialogSearchButton.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchDialogSearchButton;

  /// No description provided for @searchDialogSelectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select range'**
  String get searchDialogSelectDateRange;

  /// No description provided for @searchDialogDateRangePickerHelp.
  ///
  /// In en, this message translates to:
  /// **'Select a date range'**
  String get searchDialogDateRangePickerHelp;

  /// No description provided for @searchDialogDateRangePickerCancel.
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get searchDialogDateRangePickerCancel;

  /// No description provided for @searchDialogDateRangePickerConfirm.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get searchDialogDateRangePickerConfirm;

  /// No description provided for @searchDialogDateRangePickerSave.
  ///
  /// In en, this message translates to:
  /// **'SAVE'**
  String get searchDialogDateRangePickerSave;

  /// No description provided for @timePeriodLastWeek.
  ///
  /// In en, this message translates to:
  /// **'Last Week'**
  String get timePeriodLastWeek;

  /// No description provided for @timePeriodLastMonth.
  ///
  /// In en, this message translates to:
  /// **'Last Month'**
  String get timePeriodLastMonth;

  /// No description provided for @timePeriodLast3Months.
  ///
  /// In en, this message translates to:
  /// **'Last 3 months'**
  String get timePeriodLast3Months;

  /// No description provided for @timePeriodLastYear.
  ///
  /// In en, this message translates to:
  /// **'Last year'**
  String get timePeriodLastYear;

  /// No description provided for @timePeriodAll.
  ///
  /// In en, this message translates to:
  /// **'All time'**
  String get timePeriodAll;

  /// No description provided for @timePeriodCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom range'**
  String get timePeriodCustom;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @categoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get categoryHealth;

  /// No description provided for @categoryFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get categoryFamily;

  /// No description provided for @categoryTaxes.
  ///
  /// In en, this message translates to:
  /// **'Taxes'**
  String get categoryTaxes;

  /// No description provided for @categoryMigration.
  ///
  /// In en, this message translates to:
  /// **'Migration'**
  String get categoryMigration;

  /// No description provided for @categoryLabor.
  ///
  /// In en, this message translates to:
  /// **'Labor'**
  String get categoryLabor;

  /// No description provided for @categorySecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get categorySecurity;

  /// No description provided for @categoryEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get categoryEducation;

  /// No description provided for @categoryEnvironment.
  ///
  /// In en, this message translates to:
  /// **'Environment'**
  String get categoryEnvironment;

  /// No description provided for @categoryCourtsAndLaw.
  ///
  /// In en, this message translates to:
  /// **'Courts and Law'**
  String get categoryCourtsAndLaw;

  /// No description provided for @categoryTransport.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get categoryTransport;

  /// No description provided for @categoryBenefits.
  ///
  /// In en, this message translates to:
  /// **'Benefits'**
  String get categoryBenefits;

  /// No description provided for @categoryRealEstate.
  ///
  /// In en, this message translates to:
  /// **'Real Estate'**
  String get categoryRealEstate;

  /// No description provided for @categoryMediaAndCulture.
  ///
  /// In en, this message translates to:
  /// **'Media and Culture'**
  String get categoryMediaAndCulture;

  /// No description provided for @categoryLocalGovernment.
  ///
  /// In en, this message translates to:
  /// **'Local Government'**
  String get categoryLocalGovernment;

  /// No description provided for @categoryAgriculture.
  ///
  /// In en, this message translates to:
  /// **'Agriculture'**
  String get categoryAgriculture;

  /// No description provided for @categoryPublicInvestments.
  ///
  /// In en, this message translates to:
  /// **'Public Investments'**
  String get categoryPublicInvestments;

  /// No description provided for @categoryInformatization.
  ///
  /// In en, this message translates to:
  /// **'Informatization'**
  String get categoryInformatization;

  /// No description provided for @categoryEconomy.
  ///
  /// In en, this message translates to:
  /// **'Economy'**
  String get categoryEconomy;

  /// No description provided for @lustraClubLabel.
  ///
  /// In en, this message translates to:
  /// **'Lustra Club'**
  String get lustraClubLabel;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @futureLegislationScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Bills - {parliamentName}'**
  String futureLegislationScreenTitle(String parliamentName);

  /// No description provided for @searchDialogAdvancedTitle.
  ///
  /// In en, this message translates to:
  /// **'Search and Filter (Advanced)'**
  String get searchDialogAdvancedTitle;

  /// No description provided for @emptyListFilterMessageFuture.
  ///
  /// In en, this message translates to:
  /// **'No upcoming bills found matching the selected criteria.'**
  String get emptyListFilterMessageFuture;

  /// No description provided for @emptyListDefaultMessageFuture.
  ///
  /// In en, this message translates to:
  /// **'No scheduled bills to display for this source.'**
  String get emptyListDefaultMessageFuture;

  /// No description provided for @noScheduledMeetings.
  ///
  /// In en, this message translates to:
  /// **'No scheduled sessions'**
  String get noScheduledMeetings;

  /// No description provided for @dateFormatError.
  ///
  /// In en, this message translates to:
  /// **'Date formatting error'**
  String get dateFormatError;

  /// No description provided for @upcomingMeetings.
  ///
  /// In en, this message translates to:
  /// **'Upcoming sessions:'**
  String get upcomingMeetings;

  /// No description provided for @keyPointsTitle.
  ///
  /// In en, this message translates to:
  /// **'Key points:'**
  String get keyPointsTitle;

  /// No description provided for @processLegislationScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Bills in Process - {parliamentName}'**
  String processLegislationScreenTitle(String parliamentName);

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searchHint;

  /// No description provided for @emptyListFilterMessageProcess.
  ///
  /// In en, this message translates to:
  /// **'No bills in process found matching the selected criteria.'**
  String get emptyListFilterMessageProcess;

  /// No description provided for @emptyListDefaultMessageProcess.
  ///
  /// In en, this message translates to:
  /// **'No active bills in the legislative process for this source.'**
  String get emptyListDefaultMessageProcess;

  /// No description provided for @processStartDateCardLabel.
  ///
  /// In en, this message translates to:
  /// **'Process start: {date}'**
  String processStartDateCardLabel(String date);

  /// No description provided for @upcomingMeetingsCardLabel.
  ///
  /// In en, this message translates to:
  /// **'Upcoming sessions:'**
  String get upcomingMeetingsCardLabel;

  /// No description provided for @detailsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'LUSTRA'**
  String get detailsScreenTitle;

  /// No description provided for @shareTooltip.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareTooltip;

  /// No description provided for @keyPointsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Key points:'**
  String get keyPointsSectionTitle;

  /// No description provided for @officialContentButton.
  ///
  /// In en, this message translates to:
  /// **'Official text'**
  String get officialContentButton;

  /// No description provided for @processPageButton.
  ///
  /// In en, this message translates to:
  /// **'Process page'**
  String get processPageButton;

  /// No description provided for @fullVotingResultsPDF.
  ///
  /// In en, this message translates to:
  /// **'Full voting results (PDF)'**
  String get fullVotingResultsPDF;

  /// No description provided for @scheduledMeetingsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Scheduled sessions'**
  String get scheduledMeetingsSectionTitle;

  /// No description provided for @additionalInfoSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Additional information'**
  String get additionalInfoSectionTitle;

  /// No description provided for @printNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Print number: {id}'**
  String printNumberLabel(String id);

  /// No description provided for @processStartDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Process start date: {date}'**
  String processStartDateLabel(String date);

  /// No description provided for @votingDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Voting date: {date}'**
  String votingDateLabel(String date);

  /// No description provided for @meetingNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Meeting no: {number}'**
  String meetingNumberLabel(String number);

  /// No description provided for @votingNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Voting no: {number}'**
  String votingNumberLabel(String number);

  /// No description provided for @sourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Source: https://api.sejm.gov.pl/'**
  String get sourceLabel;

  /// No description provided for @summarizedByLabel.
  ///
  /// In en, this message translates to:
  /// **'Summarized by: {modelName}'**
  String summarizedByLabel(String modelName);

  /// No description provided for @promptUsedLabel.
  ///
  /// In en, this message translates to:
  /// **'Prompt used: {prompt}'**
  String promptUsedLabel(String prompt);

  /// No description provided for @reportErrorButton.
  ///
  /// In en, this message translates to:
  /// **'Report error'**
  String get reportErrorButton;

  /// No description provided for @noUrlAvailableSnackbar.
  ///
  /// In en, this message translates to:
  /// **'No URL available.'**
  String get noUrlAvailableSnackbar;

  /// No description provided for @cannotOpenLinkSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Could not open link: {url}'**
  String cannotOpenLinkSnackbar(String url);

  /// No description provided for @alreadyVotedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Your vote has already been registered.'**
  String get alreadyVotedSnackbar;

  /// No description provided for @sharingFunctionNotImplementedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Sharing feature (to be implemented)'**
  String get sharingFunctionNotImplementedSnackbar;

  /// No description provided for @reportErrorFunctionNotImplementedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Error reporting feature (to be implemented)'**
  String get reportErrorFunctionNotImplementedSnackbar;

  /// No description provided for @loginScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginScreenTitle;

  /// No description provided for @registrationScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get registrationScreenTitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginButton;

  /// No description provided for @registerButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerButton;

  /// No description provided for @orDivider.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get orDivider;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get continueWithFacebook;

  /// No description provided for @promptToRegister.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign up'**
  String get promptToRegister;

  /// No description provided for @promptToLogin.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Log in'**
  String get promptToLogin;

  /// No description provided for @validatorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get validatorInvalidEmail;

  /// No description provided for @validatorPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long.'**
  String get validatorPasswordTooShort;

  /// No description provided for @authErrorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password.'**
  String get authErrorInvalidCredentials;

  /// No description provided for @authErrorEmailInUse.
  ///
  /// In en, this message translates to:
  /// **'This email address is already in use.'**
  String get authErrorEmailInUse;

  /// No description provided for @authErrorWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'The password is too weak.'**
  String get authErrorWeakPassword;

  /// No description provided for @authErrorDefault.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again.'**
  String get authErrorDefault;

  /// No description provided for @authErrorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get authErrorUnexpected;

  /// No description provided for @authErrorGoogleFailed.
  ///
  /// In en, this message translates to:
  /// **'Google sign-in failed. Please try again.'**
  String get authErrorGoogleFailed;

  /// No description provided for @authErrorFacebookFailed.
  ///
  /// In en, this message translates to:
  /// **'Facebook sign-in failed. Please try again.'**
  String get authErrorFacebookFailed;

  /// No description provided for @authErrorAccountExists.
  ///
  /// In en, this message translates to:
  /// **'An account with this email already exists. Please sign in with your password.'**
  String get authErrorAccountExists;

  /// No description provided for @mpScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Deputies - {parliamentName}'**
  String mpScreenTitle(String parliamentName);

  /// No description provided for @searchMPsHint.
  ///
  /// In en, this message translates to:
  /// **'Search deputies...'**
  String get searchMPsHint;

  /// No description provided for @allFilter.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allFilter;

  /// No description provided for @noMPsForSource.
  ///
  /// In en, this message translates to:
  /// **'No deputies available for this source.'**
  String get noMPsForSource;

  /// No description provided for @noMPsMatchFilter.
  ///
  /// In en, this message translates to:
  /// **'No deputies match the criteria.'**
  String get noMPsMatchFilter;

  /// No description provided for @attendanceLabelShort.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendanceLabelShort;

  /// No description provided for @attendanceTooltipWarning.
  ///
  /// In en, this message translates to:
  /// **'Attendance calculated based on a term with a small number of votes.\nData may be less representative.'**
  String get attendanceTooltipWarning;

  /// No description provided for @supportLabel.
  ///
  /// In en, this message translates to:
  /// **'Support: '**
  String get supportLabel;

  /// No description provided for @unaffiliatedClub.
  ///
  /// In en, this message translates to:
  /// **'Unaffiliated'**
  String get unaffiliatedClub;

  /// No description provided for @mpDetailsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'{firstName} {lastName}'**
  String mpDetailsScreenTitle(String firstName, String lastName);

  /// No description provided for @shareProfileTooltip.
  ///
  /// In en, this message translates to:
  /// **'Share profile'**
  String get shareProfileTooltip;

  /// No description provided for @socialPollSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Social Poll'**
  String get socialPollSectionTitle;

  /// No description provided for @parliamentaryActivitySectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Parliamentary Activity'**
  String get parliamentaryActivitySectionTitle;

  /// No description provided for @parliamentaryTenureSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Parliamentary Tenure: {years} years'**
  String parliamentaryTenureSectionTitle(int years);

  /// No description provided for @parliamentaryTenureNoData.
  ///
  /// In en, this message translates to:
  /// **'Parliamentary Tenure: No data'**
  String get parliamentaryTenureNoData;

  /// No description provided for @tenureTooltip.
  ///
  /// In en, this message translates to:
  /// **'The number of years is an approximate value, calculated based on the data below, without taking into account the premature expiration of the parliamentary mandate.'**
  String get tenureTooltip;

  /// No description provided for @tenureTermItem.
  ///
  /// In en, this message translates to:
  /// **'{romanNumeral} term of the Sejm of the Republic of Poland {duration}'**
  String tenureTermItem(String romanNumeral, String duration);

  /// No description provided for @unknownTermDuration.
  ///
  /// In en, this message translates to:
  /// **'Unknown period'**
  String get unknownTermDuration;

  /// No description provided for @noTermData.
  ///
  /// In en, this message translates to:
  /// **'No detailed data on terms.'**
  String get noTermData;

  /// No description provided for @plHistoricalDataDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Note: Historical data for the 1st and 2nd terms of the Sejm of the Republic of Poland are unavailable and not included.'**
  String get plHistoricalDataDisclaimer;

  /// No description provided for @personalDataSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Data'**
  String get personalDataSectionTitle;

  /// No description provided for @contactSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactSectionTitle;

  /// No description provided for @dataSourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Data source: Sejm RP API'**
  String get dataSourceLabel;

  /// No description provided for @mandateStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Mandate: active'**
  String get mandateStatusActive;

  /// No description provided for @mandateStatusFulfilled.
  ///
  /// In en, this message translates to:
  /// **'Mandate: fulfilled'**
  String get mandateStatusFulfilled;

  /// No description provided for @mandateStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Mandate: cancelled'**
  String get mandateStatusCancelled;

  /// No description provided for @mandateStatusInactive.
  ///
  /// In en, this message translates to:
  /// **'Mandate: inactive'**
  String get mandateStatusInactive;

  /// No description provided for @followingAddedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Added to followed'**
  String get followingAddedSnackbar;

  /// No description provided for @followingRemovedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Removed from followed'**
  String get followingRemovedSnackbar;

  /// No description provided for @clubLabel.
  ///
  /// In en, this message translates to:
  /// **'Club: {clubName}'**
  String clubLabel(String clubName);

  /// No description provided for @formerlyLabel.
  ///
  /// In en, this message translates to:
  /// **' (formerly: {clubs})'**
  String formerlyLabel(String clubs);

  /// No description provided for @professionLabel.
  ///
  /// In en, this message translates to:
  /// **'Profession: {profession}'**
  String professionLabel(String profession);

  /// No description provided for @districtLabel.
  ///
  /// In en, this message translates to:
  /// **'District: {districtName} (no. {districtNum})'**
  String districtLabel(String districtName, int districtNum);

  /// No description provided for @votesObtainedLabel.
  ///
  /// In en, this message translates to:
  /// **'Votes obtained: {votes}'**
  String votesObtainedLabel(String votes);

  /// No description provided for @birthDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get birthDateLabel;

  /// No description provided for @ageLabel.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get ageLabel;

  /// No description provided for @ageUnit.
  ///
  /// In en, this message translates to:
  /// **'{age} years'**
  String ageUnit(int age);

  /// No description provided for @birthPlaceLabel.
  ///
  /// In en, this message translates to:
  /// **'Place of birth'**
  String get birthPlaceLabel;

  /// No description provided for @educationLabel.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get educationLabel;

  /// No description provided for @voivodeshipLabel.
  ///
  /// In en, this message translates to:
  /// **'Voivodeship'**
  String get voivodeshipLabel;

  /// No description provided for @emailLabelWithColon.
  ///
  /// In en, this message translates to:
  /// **'Email:'**
  String get emailLabelWithColon;

  /// No description provided for @votingsTab.
  ///
  /// In en, this message translates to:
  /// **'Recent Votings'**
  String get votingsTab;

  /// No description provided for @interpellationsTab.
  ///
  /// In en, this message translates to:
  /// **'Interpellations'**
  String get interpellationsTab;

  /// No description provided for @attendanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Overall attendance in votings'**
  String get attendanceLabel;

  /// No description provided for @attendanceTooltipBase.
  ///
  /// In en, this message translates to:
  /// **'The scale assesses the level of fulfillment of the basic parliamentary duty. The adopted ranges are based on the assumption that high attendance is a measure of responsibility towards voters.'**
  String get attendanceTooltipBase;

  /// No description provided for @attendanceTooltipPartialMandate.
  ///
  /// In en, this message translates to:
  /// **'\n\nThe MP held the mandate for part of the term. Attendance refers to this period.'**
  String get attendanceTooltipPartialMandate;

  /// No description provided for @attendanceTooltipUnknownMandate.
  ///
  /// In en, this message translates to:
  /// **'\n\nAttendance calculated based on a term with a small number of votes. Data may be less representative.'**
  String get attendanceTooltipUnknownMandate;

  /// No description provided for @errorLoadVotings.
  ///
  /// In en, this message translates to:
  /// **'Failed to load voting history.'**
  String get errorLoadVotings;

  /// No description provided for @errorLoadInterpellations.
  ///
  /// In en, this message translates to:
  /// **'Failed to load interpellations.'**
  String get errorLoadInterpellations;

  /// No description provided for @noVotingsData.
  ///
  /// In en, this message translates to:
  /// **'No data on important votings to display.'**
  String get noVotingsData;

  /// No description provided for @noInterpellationsData.
  ///
  /// In en, this message translates to:
  /// **'No data.'**
  String get noInterpellationsData;

  /// No description provided for @loadVotingsButton.
  ///
  /// In en, this message translates to:
  /// **'Try to load votings'**
  String get loadVotingsButton;

  /// No description provided for @loadMoreButton.
  ///
  /// In en, this message translates to:
  /// **'Show more'**
  String get loadMoreButton;

  /// No description provided for @interpellationSentDate.
  ///
  /// In en, this message translates to:
  /// **'Date of submission: {date}'**
  String interpellationSentDate(String date);

  /// No description provided for @interpellationReplyFrom.
  ///
  /// In en, this message translates to:
  /// **'Reply from: '**
  String get interpellationReplyFrom;

  /// No description provided for @cannotOpenReplyLink.
  ///
  /// In en, this message translates to:
  /// **'Could not open reply link: {url}'**
  String cannotOpenReplyLink(String url);

  /// No description provided for @pollResultNoVotes.
  ///
  /// In en, this message translates to:
  /// **'Be the first to cast a vote.'**
  String get pollResultNoVotes;

  /// No description provided for @pollResultOverwhelmingMajority.
  ///
  /// In en, this message translates to:
  /// **'overwhelming majority'**
  String get pollResultOverwhelmingMajority;

  /// No description provided for @pollResultMajority.
  ///
  /// In en, this message translates to:
  /// **'majority'**
  String get pollResultMajority;

  /// No description provided for @pollResultMinority.
  ///
  /// In en, this message translates to:
  /// **'minority'**
  String get pollResultMinority;

  /// No description provided for @pollResultOverwhelmingMinority.
  ///
  /// In en, this message translates to:
  /// **'overwhelming minority'**
  String get pollResultOverwhelmingMinority;

  /// No description provided for @pollResultFormatted.
  ///
  /// In en, this message translates to:
  /// **'{percentage} - {description}'**
  String pollResultFormatted(String percentage, String description);

  /// No description provided for @pollTotalVotesLabel.
  ///
  /// In en, this message translates to:
  /// **'Number of votes cast: {count}'**
  String pollTotalVotesLabel(int count);

  /// No description provided for @pollVoteToAction.
  ///
  /// In en, this message translates to:
  /// **'Cast your vote to see the results'**
  String get pollVoteToAction;

  /// No description provided for @voteTypeFor.
  ///
  /// In en, this message translates to:
  /// **'For'**
  String get voteTypeFor;

  /// No description provided for @voteTypeAgainst.
  ///
  /// In en, this message translates to:
  /// **'Against'**
  String get voteTypeAgainst;

  /// No description provided for @voteTypeAbstain.
  ///
  /// In en, this message translates to:
  /// **'Abstain'**
  String get voteTypeAbstain;

  /// No description provided for @voteTypeAbsent.
  ///
  /// In en, this message translates to:
  /// **'Absent'**
  String get voteTypeAbsent;

  /// No description provided for @defaultPrompt.
  ///
  /// In en, this message translates to:
  /// **'General prompt'**
  String get defaultPrompt;

  /// No description provided for @statusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get statusInProgress;

  /// No description provided for @statusPassedSejmToSenat.
  ///
  /// In en, this message translates to:
  /// **'Passed and sent to the Senate'**
  String get statusPassedSejmToSenat;

  /// No description provided for @statusRejectedSejm.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejectedSejm;

  /// No description provided for @statusRejectedBySenate.
  ///
  /// In en, this message translates to:
  /// **'Rejected by the Senate'**
  String get statusRejectedBySenate;

  /// No description provided for @statusToPresident.
  ///
  /// In en, this message translates to:
  /// **'Transmitted to the President'**
  String get statusToPresident;

  /// No description provided for @votingResultsUSMotionToReferTitle.
  ///
  /// In en, this message translates to:
  /// **'RESULTS: REFERRAL'**
  String get votingResultsUSMotionToReferTitle;

  /// No description provided for @statusVetoPresident.
  ///
  /// In en, this message translates to:
  /// **'President\'s VETO'**
  String get statusVetoPresident;

  /// No description provided for @statusToConstitutionalTribunal.
  ///
  /// In en, this message translates to:
  /// **'Referred to the Constitutional Tribunal'**
  String get statusToConstitutionalTribunal;

  /// No description provided for @statusSignedByPresident.
  ///
  /// In en, this message translates to:
  /// **'Signed by the President'**
  String get statusSignedByPresident;

  /// No description provided for @statusEnacted.
  ///
  /// In en, this message translates to:
  /// **'Enacted'**
  String get statusEnacted;

  /// No description provided for @statusExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get statusExpired;

  /// No description provided for @statusAdoptedResolution.
  ///
  /// In en, this message translates to:
  /// **'Adopted'**
  String get statusAdoptedResolution;

  /// No description provided for @statusRejectedResolution.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejectedResolution;

  /// No description provided for @statusImmediateRejection.
  ///
  /// In en, this message translates to:
  /// **'Immediate rejection'**
  String get statusImmediateRejection;

  /// No description provided for @statusWithdrawn.
  ///
  /// In en, this message translates to:
  /// **'Withdrawn'**
  String get statusWithdrawn;

  /// No description provided for @filterStatusAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterStatusAll;

  /// No description provided for @filterStatusPassed.
  ///
  /// In en, this message translates to:
  /// **'Passed'**
  String get filterStatusPassed;

  /// No description provided for @filterStatusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get filterStatusRejected;

  /// No description provided for @docTypeBill.
  ///
  /// In en, this message translates to:
  /// **'Bill'**
  String get docTypeBill;

  /// No description provided for @docTypeResolution.
  ///
  /// In en, this message translates to:
  /// **'Resolution'**
  String get docTypeResolution;

  /// No description provided for @statusUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Planned'**
  String get statusUpcoming;

  /// No description provided for @statusIntroducedInHouse.
  ///
  /// In en, this message translates to:
  /// **'Introduced in House'**
  String get statusIntroducedInHouse;

  /// No description provided for @statusReportedToSenate.
  ///
  /// In en, this message translates to:
  /// **'Reported to Senate'**
  String get statusReportedToSenate;

  /// No description provided for @statusReportedInHouse.
  ///
  /// In en, this message translates to:
  /// **'Reported in House'**
  String get statusReportedInHouse;

  /// No description provided for @statusReferredInSenate.
  ///
  /// In en, this message translates to:
  /// **'Referred in Senate'**
  String get statusReferredInSenate;

  /// No description provided for @statusReferredInHouse.
  ///
  /// In en, this message translates to:
  /// **'Referred in House'**
  String get statusReferredInHouse;

  /// No description provided for @statusReferenceChangeSenate.
  ///
  /// In en, this message translates to:
  /// **'Reference Change in Senate'**
  String get statusReferenceChangeSenate;

  /// No description provided for @statusReceivedInSenate.
  ///
  /// In en, this message translates to:
  /// **'Received in Senate'**
  String get statusReceivedInSenate;

  /// No description provided for @statusPlacedOnCalendarSenate.
  ///
  /// In en, this message translates to:
  /// **'Placed on Calendar in Senate'**
  String get statusPlacedOnCalendarSenate;

  /// No description provided for @statusIntroducedInSenate.
  ///
  /// In en, this message translates to:
  /// **'Introduced in Senate'**
  String get statusIntroducedInSenate;

  /// No description provided for @statusEngrossedInHouse.
  ///
  /// In en, this message translates to:
  /// **'Engrossed in House'**
  String get statusEngrossedInHouse;

  /// No description provided for @statusAgreedToSenate.
  ///
  /// In en, this message translates to:
  /// **'Agreed to in Senate'**
  String get statusAgreedToSenate;

  /// No description provided for @statusEngrossedAmendmentHouse.
  ///
  /// In en, this message translates to:
  /// **'Engrossed Amendment in House'**
  String get statusEngrossedAmendmentHouse;

  /// No description provided for @statusFailedPassageSenate.
  ///
  /// In en, this message translates to:
  /// **'Failed Passage in Senate'**
  String get statusFailedPassageSenate;

  /// No description provided for @statusLaidOnTableInHouse.
  ///
  /// In en, this message translates to:
  /// **'Laid on Table in House'**
  String get statusLaidOnTableInHouse;

  /// No description provided for @statusPrivateLaw.
  ///
  /// In en, this message translates to:
  /// **'Private Law'**
  String get statusPrivateLaw;

  /// No description provided for @statusPublicLaw.
  ///
  /// In en, this message translates to:
  /// **'Public Law'**
  String get statusPublicLaw;

  /// No description provided for @statusAdopted.
  ///
  /// In en, this message translates to:
  /// **'Adopted'**
  String get statusAdopted;

  /// No description provided for @statusDeBundesratApproved.
  ///
  /// In en, this message translates to:
  /// **'Bundesrat has approved'**
  String get statusDeBundesratApproved;

  /// No description provided for @statusDeAdopted.
  ///
  /// In en, this message translates to:
  /// **'Adopted'**
  String get statusDeAdopted;

  /// No description provided for @statusDeIntroductionApproved.
  ///
  /// In en, this message translates to:
  /// **'Introduction approved'**
  String get statusDeIntroductionApproved;

  /// No description provided for @statusDeAnnounced.
  ///
  /// In en, this message translates to:
  /// **'Announced'**
  String get statusDeAnnounced;

  /// No description provided for @statusDeRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusDeRejected;

  /// No description provided for @statusDeBundesratDenied.
  ///
  /// In en, this message translates to:
  /// **'Bundesrat has denied consent'**
  String get statusDeBundesratDenied;

  /// No description provided for @statusDeIntroductionRejected.
  ///
  /// In en, this message translates to:
  /// **'Introduction rejected'**
  String get statusDeIntroductionRejected;

  /// No description provided for @statusDeDeclaredCompleted.
  ///
  /// In en, this message translates to:
  /// **'Declared completed'**
  String get statusDeDeclaredCompleted;

  /// No description provided for @statusDeCompletedByTermEnd.
  ///
  /// In en, this message translates to:
  /// **'Completed by end of legislative period'**
  String get statusDeCompletedByTermEnd;

  /// No description provided for @statusDeDeclaredUnconstitutional.
  ///
  /// In en, this message translates to:
  /// **'Declared incompatible with the Basic Law'**
  String get statusDeDeclaredUnconstitutional;

  /// No description provided for @statusDeWithdrawn.
  ///
  /// In en, this message translates to:
  /// **'Withdrawn'**
  String get statusDeWithdrawn;

  /// No description provided for @statusDeBundesratProcessCompleted.
  ///
  /// In en, this message translates to:
  /// **'Process in Bundesrat completed'**
  String get statusDeBundesratProcessCompleted;

  /// No description provided for @statusDeCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusDeCompleted;

  /// No description provided for @statusDeCompletedSeeProcess.
  ///
  /// In en, this message translates to:
  /// **'Completed - see procedure'**
  String get statusDeCompletedSeeProcess;

  /// No description provided for @statusDeRecommendationAvailable.
  ///
  /// In en, this message translates to:
  /// **'Recommendation for resolution is available'**
  String get statusDeRecommendationAvailable;

  /// No description provided for @statusDeToBundesratNotDeliberated.
  ///
  /// In en, this message translates to:
  /// **'Transmitted to Bundesrat - not yet deliberated'**
  String get statusDeToBundesratNotDeliberated;

  /// No description provided for @statusDeAssignedToCommittees.
  ///
  /// In en, this message translates to:
  /// **'Assigned to committees'**
  String get statusDeAssignedToCommittees;

  /// No description provided for @statusDeNotYetDeliberated.
  ///
  /// In en, this message translates to:
  /// **'Not yet deliberated'**
  String get statusDeNotYetDeliberated;

  /// No description provided for @statusDeMergedWith.
  ///
  /// In en, this message translates to:
  /// **'Merged with... (see procedure)'**
  String get statusDeMergedWith;

  /// No description provided for @statusDeReferred.
  ///
  /// In en, this message translates to:
  /// **'Referred'**
  String get statusDeReferred;

  /// No description provided for @statusFrLawPublished.
  ///
  /// In en, this message translates to:
  /// **'Law published'**
  String get statusFrLawPublished;

  /// No description provided for @statusFrOrdinancePublished.
  ///
  /// In en, this message translates to:
  /// **'Ordinance published'**
  String get statusFrOrdinancePublished;

  /// No description provided for @statusFrResolutionPublished.
  ///
  /// In en, this message translates to:
  /// **'Resolution published'**
  String get statusFrResolutionPublished;

  /// No description provided for @statusFrDecreePublished.
  ///
  /// In en, this message translates to:
  /// **'Decree published'**
  String get statusFrDecreePublished;

  /// No description provided for @statusFrDecision.
  ///
  /// In en, this message translates to:
  /// **'Decision'**
  String get statusFrDecision;

  /// No description provided for @statusFrRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusFrRejected;

  /// No description provided for @statusFrPrescribed.
  ///
  /// In en, this message translates to:
  /// **'Prescribed/Expired'**
  String get statusFrPrescribed;

  /// No description provided for @statusFrPropositionLoi.
  ///
  /// In en, this message translates to:
  /// **'Parliamentary Bill'**
  String get statusFrPropositionLoi;

  /// No description provided for @statusFrProjetLoi.
  ///
  /// In en, this message translates to:
  /// **'Government Bill'**
  String get statusFrProjetLoi;

  /// No description provided for @statusUkActOfParliament.
  ///
  /// In en, this message translates to:
  /// **'Act of Parliament'**
  String get statusUkActOfParliament;

  /// No description provided for @statusUkRoyalAssent.
  ///
  /// In en, this message translates to:
  /// **'Royal Assent'**
  String get statusUkRoyalAssent;

  /// No description provided for @statusUkWithdrawn.
  ///
  /// In en, this message translates to:
  /// **'Withdrawn'**
  String get statusUkWithdrawn;

  /// No description provided for @statusUkRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusUkRejected;

  /// No description provided for @statusUk1stReading.
  ///
  /// In en, this message translates to:
  /// **'1st reading'**
  String get statusUk1stReading;

  /// No description provided for @statusUk2ndReading.
  ///
  /// In en, this message translates to:
  /// **'2nd reading'**
  String get statusUk2ndReading;

  /// No description provided for @statusUk3rdReading.
  ///
  /// In en, this message translates to:
  /// **'3rd reading'**
  String get statusUk3rdReading;

  /// No description provided for @statusUkCommitteeStage.
  ///
  /// In en, this message translates to:
  /// **'Committee stage'**
  String get statusUkCommitteeStage;

  /// No description provided for @statusUkCommonsExaminers.
  ///
  /// In en, this message translates to:
  /// **'Commons Examiners'**
  String get statusUkCommonsExaminers;

  /// No description provided for @statusUkLordsSpecialCommittee.
  ///
  /// In en, this message translates to:
  /// **'Lords Special Public Bill Committee'**
  String get statusUkLordsSpecialCommittee;

  /// No description provided for @statusUkMoneyResolution.
  ///
  /// In en, this message translates to:
  /// **'Money resolution'**
  String get statusUkMoneyResolution;

  /// No description provided for @statusUkConsiderationLordsAmendments.
  ///
  /// In en, this message translates to:
  /// **'Consideration of Lords amendments'**
  String get statusUkConsiderationLordsAmendments;

  /// No description provided for @statusUkConsiderationLordsMessage.
  ///
  /// In en, this message translates to:
  /// **'Consideration of Lords message'**
  String get statusUkConsiderationLordsMessage;

  /// No description provided for @statusUkOrderOfCommitmentDischarged.
  ///
  /// In en, this message translates to:
  /// **'Order of Commitment discharged'**
  String get statusUkOrderOfCommitmentDischarged;

  /// No description provided for @statusUkProgrammeMotion.
  ///
  /// In en, this message translates to:
  /// **'Programme motion'**
  String get statusUkProgrammeMotion;

  /// No description provided for @statusUkReportStage.
  ///
  /// In en, this message translates to:
  /// **'Report stage'**
  String get statusUkReportStage;

  /// No description provided for @statusUkSecondReadingCommittee.
  ///
  /// In en, this message translates to:
  /// **'Second reading committee'**
  String get statusUkSecondReadingCommittee;

  /// No description provided for @statusUkWaysAndMeansResolution.
  ///
  /// In en, this message translates to:
  /// **'Ways and Means resolution'**
  String get statusUkWaysAndMeansResolution;

  /// No description provided for @errorCheckConnection.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection.'**
  String get errorCheckConnection;

  /// No description provided for @buttonRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get buttonRetry;

  /// No description provided for @shareAsPost.
  ///
  /// In en, this message translates to:
  /// **'Share as post (1:1)'**
  String get shareAsPost;

  /// No description provided for @shareAsStory.
  ///
  /// In en, this message translates to:
  /// **'Share as story (16:9)'**
  String get shareAsStory;

  /// No description provided for @morePointsInApp.
  ///
  /// In en, this message translates to:
  /// **'...full details are available in the Lustra'**
  String get morePointsInApp;

  /// No description provided for @civicRulesAction.
  ///
  /// In en, this message translates to:
  /// **'Create your project'**
  String get civicRulesAction;

  /// No description provided for @pollVotingViaApp.
  ///
  /// In en, this message translates to:
  /// **'Voting available in the app!'**
  String get pollVotingViaApp;

  /// No description provided for @supportPollTitle.
  ///
  /// In en, this message translates to:
  /// **'Support Poll'**
  String get supportPollTitle;

  /// No description provided for @termsCountLabel.
  ///
  /// In en, this message translates to:
  /// **'Number of terms'**
  String get termsCountLabel;

  /// No description provided for @settingsNotificationsNewLaws.
  ///
  /// In en, this message translates to:
  /// **'Notifications about new legislations'**
  String get settingsNotificationsNewLaws;

  /// No description provided for @settingsNotificationsVoteResults.
  ///
  /// In en, this message translates to:
  /// **'Notifications about voting results'**
  String get settingsNotificationsVoteResults;

  /// No description provided for @detailsButton.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get detailsButton;

  /// No description provided for @errorNoVotingsDetails.
  ///
  /// In en, this message translates to:
  /// **'NO DETAILED VOTING DATA'**
  String get errorNoVotingsDetails;

  /// No description provided for @clearText.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearText;

  /// No description provided for @consideredOnLabel.
  ///
  /// In en, this message translates to:
  /// **'Under consideration on:'**
  String get consideredOnLabel;

  /// No description provided for @legislationFooterAiDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'The summary above was generated by AI and is a compilation of the original government document, respecting all principles of impartiality and free information. Details of the query used and its schema can be found in the information tab.'**
  String get legislationFooterAiDisclaimer;

  /// No description provided for @legislationFooterModelUsed.
  ///
  /// In en, this message translates to:
  /// **'Model used:'**
  String get legislationFooterModelUsed;

  /// No description provided for @legislationFooterSourceData.
  ///
  /// In en, this message translates to:
  /// **'Source data is available for free on the government system at:'**
  String get legislationFooterSourceData;

  /// No description provided for @appMotto.
  ///
  /// In en, this message translates to:
  /// **'... meaning impartial legislative information without political bias.'**
  String get appMotto;

  /// No description provided for @acceptTermsPrefix.
  ///
  /// In en, this message translates to:
  /// **'I accept the'**
  String get acceptTermsPrefix;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Privacy Policy'**
  String get termsAndConditions;

  /// No description provided for @validatorAcceptTerms.
  ///
  /// In en, this message translates to:
  /// **'You must accept the terms to continue.'**
  String get validatorAcceptTerms;

  /// No description provided for @joinSupportClubPrefix.
  ///
  /// In en, this message translates to:
  /// **'I want to join the'**
  String get joinSupportClubPrefix;

  /// No description provided for @supportClub.
  ///
  /// In en, this message translates to:
  /// **'Lustra Support Club'**
  String get supportClub;

  /// No description provided for @supportClubDescription.
  ///
  /// In en, this message translates to:
  /// **'You\'ll receive special information about the project\'s development and future initiatives.'**
  String get supportClubDescription;

  /// No description provided for @registrationFinishTitle.
  ///
  /// In en, this message translates to:
  /// **'Complete Registration'**
  String get registrationFinishTitle;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcomeMessage;

  /// No description provided for @finalStepMessage.
  ///
  /// In en, this message translates to:
  /// **'Just one last step. Please accept the terms to continue.'**
  String get finalStepMessage;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @selectYourParliament.
  ///
  /// In en, this message translates to:
  /// **'Select your parliament'**
  String get selectYourParliament;

  /// No description provided for @validatorSelectParliament.
  ///
  /// In en, this message translates to:
  /// **'Please select a parliament to continue.'**
  String get validatorSelectParliament;

  /// No description provided for @forgotPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPasswordButton;

  /// No description provided for @passwordResetEmailSent.
  ///
  /// In en, this message translates to:
  /// **'A password reset link has been sent to your email.'**
  String get passwordResetEmailSent;

  /// No description provided for @authErrorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'No user found with this email address.'**
  String get authErrorUserNotFound;

  /// No description provided for @settingsDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get settingsDeleteAccount;

  /// No description provided for @errorDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete account. Please try again.'**
  String get errorDeleteAccount;

  /// No description provided for @dialogReauthenticateTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Your Identity'**
  String get dialogReauthenticateTitle;

  /// No description provided for @dialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get dialogConfirm;

  /// No description provided for @dialogDeleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get dialogDeleteAccountTitle;

  /// No description provided for @dialogDeleteAccountContent.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. All your data, including your voting history, will be permanently deleted.'**
  String get dialogDeleteAccountContent;

  /// No description provided for @dialogDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get dialogDelete;

  /// No description provided for @termsAndPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Constitution & Privacy'**
  String get termsAndPrivacyTitle;

  /// No description provided for @termsOfServiceTab.
  ///
  /// In en, this message translates to:
  /// **'Rules'**
  String get termsOfServiceTab;

  /// No description provided for @privacyPolicyTab.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTab;

  /// No description provided for @termsOfServiceContent.
  ///
  /// In en, this message translates to:
  /// **'LUSTRA COMMUNITY RULES\nDate: December 6, 2025\n\n1. OPERATOR AND MISSION\nLustra is a digital public infrastructure. The legal operator (Custodian) is FO&WO VENTURES SP. Z O.O. (LLC) based in Wrocław. The company acts as an incubator: it pays no dividends, has no external investors, and reinvests revenue into infrastructure.\n\n2. CODE AND LICENSE (SOURCE AVAILABLE)\nLustra\'s code is a common good protected from exploitation.\n• Model: PolyForm Noncommercial.\n• Allowed: Educational, research, and non-profit use.\n• Prohibited: Corporations cannot profit from our work without community consent.\n\n3. GOVERNANCE ROADMAP\nOur goal is decentralization.\n• Current: Founder (Jacek) acts as Lead Architect.\n• Soon: Establishment of a Civic Board elected by users.\n• Goal: Implementing mechanisms for the community to take control in case of mission betrayal.\n\n4. CITIZEN DRAFTS PROGRAM\nAn incubator for law.\n• Procedure: Drafts are submitted via form and verified formally by the Operator.\n• CC0 License: By submitting, you release the draft into the Public Domain. Law belongs to everyone.\n• Free Speech: We do not judge opinions. We only reject projects violating criminal law.\n• Verification: You must be a citizen of the country where you submit a draft.\n\n5. AI AND SOURCE HIERARCHY\n• AI Role: AI helps navigate law but can make mistakes.\n• Source: The ultimate authority is always the original PDF document (linked in the app).\n\n6. SAFETY\n• Age: App for users 16+.\n• Bans: Attacks on infrastructure and commercial scraping are prohibited.\n\n7. FINAL PROVISIONS\nMatters not regulated herein are decided by Polish law.'**
  String get termsOfServiceContent;

  /// No description provided for @privacyPolicyContent.
  ///
  /// In en, this message translates to:
  /// **'PRIVACY POLICY: DATA MINIMIZATION\nDate: December 6, 2025\n\nWe do not trade your attention. We collect only what is technically necessary.\n\n1. DATA CONTROLLER\nFO&WO VENTURES SP. Z O.O., Wrocław. Contact: jacek@lustra.dev\n\n2. WHAT WE COLLECT\n• Account (Email/UID): Necessary for login (Firebase Auth).\n• Votes & Polls: Your votes build statistics. They are linked to your account based on legitimate interest (protection against bot farms). Publicly, they are displayed ONLY as anonymous aggregates.\n• Vote Retention: Voting data is stored for the duration of the parliamentary term plus 5 years for archival and research purposes. After this time, data is anonymized.\n• Communication (Support Club): If you consent (checkbox in settings), we will send you project updates. You can withdraw consent at any time.\n• Citizen Projects: Content of submitted drafts is public.\n\n3. WHAT WE DO NOT DO\n• We DO NOT sell data to brokers.\n• We DO NOT use ad tracking.\n• We DO NOT profile you politically for commercial purposes.\n\n4. INFRASTRUCTURE & SECURITY\n• Location: Google Cloud Platform, Europe-West9 (Paris).\n• Anti-Bot: We use Firebase App Check to verify app authenticity.\n• AI: We send only public government documents to AI models. Your private data NEVER goes to AI.\n\n5. CHILDREN\nService intended for users 16+. We do not knowingly collect children\'s data.\n\n6. ACCOUNT DELETION\nUse the \"Delete Account\" button in settings to immediately remove your identifying data from our servers.\n\n7. YOUR RIGHTS\nYou have the right to access, rectify, delete, and object to processing of your data. Contact: jacek@lustra.dev'**
  String get privacyPolicyContent;

  /// No description provided for @techTitle.
  ///
  /// In en, this message translates to:
  /// **'Lustra AI Protocol v1.1'**
  String get techTitle;

  /// No description provided for @techIntroTitle.
  ///
  /// In en, this message translates to:
  /// **'1. COMPLETE WORK METHODOLOGY (LUSTRA AI PROTOCOL)'**
  String get techIntroTitle;

  /// No description provided for @techIntroBody.
  ///
  /// In en, this message translates to:
  /// **'Below we present the complete AI agent pipeline used to generate legal text summaries and detect hallucinations within them. The goal was to disarm the \"legislative black hole\" while approaching maximum objectivity. However, it must be emphasized that we do not believe in total neutrality. Every data compression (summary) is a form of choice. Instead of pretending to hold a \"monopoly on truth\" like the media, we adopted one explicit bias – the \"citizen perspective\" within context sterilization. Models are instructed to ignore political theater and focus on the wallet, freedoms, and obligations. This is an engineering design decision, not a political one.'**
  String get techIntroBody;

  /// No description provided for @techDiagramTitle.
  ///
  /// In en, this message translates to:
  /// **'2. GENERALIZER-JUDGE-SURGEON FLOW DIAGRAM'**
  String get techDiagramTitle;

  /// No description provided for @techDiagramIntro.
  ///
  /// In en, this message translates to:
  /// **'The system operates in a verification loop. We do not trust generative models – we trust checking processes and an iterative approach to system expansion.'**
  String get techDiagramIntro;

  /// No description provided for @techDiagramOutro.
  ///
  /// In en, this message translates to:
  /// **'In the future, we plan to expand the system with additional roles, such as an investigative journalist or a legal risk analyzer.'**
  String get techDiagramOutro;

  /// No description provided for @techPromptsTitle.
  ///
  /// In en, this message translates to:
  /// **'3. COMPLETE AGENT INSTRUCTIONS'**
  String get techPromptsTitle;

  /// No description provided for @techPromptsIntro.
  ///
  /// In en, this message translates to:
  /// **'Below are the complete prompts received by the models, along with explanatory comments for the reader. Responses are returned immediately in 8 languages for full Lustra localization, so we have omitted the full JSON response structure for readability.'**
  String get techPromptsIntro;

  /// No description provided for @techGeneralizerTitle.
  ///
  /// In en, this message translates to:
  /// **'A) Generalizer'**
  String get techGeneralizerTitle;

  /// No description provided for @techGeneralizerBody.
  ///
  /// In en, this message translates to:
  /// **'Model: Gemini Flash (default) / Pro (for <20k tokens)'**
  String get techGeneralizerBody;

  /// No description provided for @techGeneralizerCode.
  ///
  /// In en, this message translates to:
  /// **'// MODEL SETUP\n// Role definition is critical. \"[country]\" is a variable that stabilizes the model.\n// The perspective of a citizen of Ukraine (a country at war) is different for models than the perspective of a citizen of Belgium (who might, for example, pay more attention to bureaucracy).\n// This sets the entire context for interpreting the \"importance\" of a provision.\nYou are an expert on [country] law, [...]\n\n// CORE METHODOLOGY\n// This is not a \"soft request\". It is a hard instruction to filter noise.\n// The model is to ignore politics and look for the impact on the wallet and life.\n[...] tasked with analyzing acts, resolutions, and other legislative documents, and then preparing information from them in an accessible way for citizens. Your goal is to present information so that citizens can assess the impact of legislation on their lives themselves, even without specialized legislative knowledge. Focus on facts and objective effects of the introduced changes, avoiding value judgments and personal opinions. All legal jargon is prohibited. Present information in a clear, concise, and engaging way so that it is understandable to a person without a legal education. Avoid long, complex sentences. Instead of writing \"the draft aims to amend the tax code...\", write \"Tax changes: new reliefs and obligations for...\". Continue your work until you resolve your task. If you are unsure about the generated content, analyze the document again – do not guess. Plan your task well before starting it. In the summary and key points, if possible and justified, emphasize what specific benefits or effects (positive or negative) the act introduces for the daily lives of citizens, their rights and obligations, personal finances, safety, and other important issues (e.g., categorical bans and orders or the most important specific financial and territorial allocations).\n// TECHNICAL JSON RIGOR\n// The backend container is ruthless. It will not accept \"chatter\".\n// It must be clean JSON. One comma error = fail and total rejection.\nBefore returning the response, carefully verify that the entire JSON structure is 100% correct, including all commas, curly braces, square brackets, and quotation marks. Incorrect JSON is unacceptable and will prevent your work from being processed.\nCarefully analyze the text of the legal document below.\nThis is the content based on which you are to generate the summary and key points:\n--- START OF DOCUMENT ---\n[DOCUMENT_TEXT]\n--- END OF DOCUMENT --\n\n// OUTPUT STRUCTURE (for 8 languages)\n// Must be filled perfectly. Each key is validated.\n// If the model skips e.g., \"fr_summary\" -> the whole thing goes in the trash.\nREMEMBER: Your response MUST be exclusively a valid JSON object. Do not add any additional characters, comments, or text before the \'OPEN_BRACE\' tag or after the \'CLOSE_BRACE\' tag. The entire response must be parsable as JSON.\nBased on the ABOVE document, fill in the JSON structure below: (...)'**
  String get techGeneralizerCode;

  /// No description provided for @techJudgeTitle.
  ///
  /// In en, this message translates to:
  /// **'B) Judge'**
  String get techJudgeTitle;

  /// No description provided for @techJudgeBody.
  ///
  /// In en, this message translates to:
  /// **'Model: Flash Lite'**
  String get techJudgeBody;

  /// No description provided for @techJudgeCode.
  ///
  /// In en, this message translates to:
  /// **'// MODEL SETUP\n// This is a simple heuristic model, so its role must also be simple. It is not meant to \"understand\" the act. It is only meant to compare two datasets. ONE TASK!\nROLE: Fact Checker.\nTASK: Compare SOURCE (original) and SUMMARY (summary prepared by another AI).\nYour goal is to detect \"FABRICATED ENTITIES\" in the SUMMARY.\nSOURCE:\n[SOURCE_TEXT]\nSUMMARY TO EVALUATE:\nTitle: [AI_TITLE]\nSummary: [AI_SUMMARY]\nKey Points: [AI_KEY_POINTS]\n// EVALUATION METHODOLOGY\n// We had to define rigid rules because Flash Lite got lost with abstraction, so it got a list of checkboxes.\n// Specific instructions reduce the model\'s decision noise.\nEVALUATION RULES:\n1. Check all NUMBERS, DATES, and AMOUNTS in the SUMMARY. If any are missing in the SOURCE -> is_valid: false.\n2. Check all NAMES, ORGANIZATIONS, and PLACES in the SUMMARY. If any are missing in the SOURCE -> is_valid: false.\n3. Check all specific LEGAL ACTIONS. If this mechanism is not in the SOURCE -> is_valid: false.\n// EXCEPTION FOR ABSTRACTION\n// This is crucial. Abstract concepts (e.g., \"increase in bureaucracy\") often gave false positives.\n// We had to exclude them from \"fabricated entity\" evaluation because the Judge was rejecting valid logical conclusions.\nIMPORTANT: Abstract concepts (e.g., \"transparency\", \"trust\") are allowed as conclusions.\n\n// OUTPUT STRUCTURE and formatting requirements for structuring the response.\nOUTPUT (JSON):\n(\n\"is_valid\": true/false,\n\"issue\": \"fabricated_entity\" / \"contradiction\" / \"none\"\n)\nFORMATTING REQUIREMENTS:\n1. Respond ONLY with a raw JSON object.\n2. DO NOT use Markdown code blocks.\n3. DO NOT add any introductions or explanations before or after the JSON.\n4. JSON must be valid and ready for parsing.'**
  String get techJudgeCode;

  /// No description provided for @techSurgeonTitle.
  ///
  /// In en, this message translates to:
  /// **'C) Surgeon'**
  String get techSurgeonTitle;

  /// No description provided for @techSurgeonBody.
  ///
  /// In en, this message translates to:
  /// **'Model: Gemini Pro'**
  String get techSurgeonBody;

  /// No description provided for @techSurgeonCode.
  ///
  /// In en, this message translates to:
  /// **'// MODEL SETUP\n// The Surgeon is not for writing. He is for cutting out the cancer (hallucinations).\n// Must maintain consistency with the \"Citizen Bias\" imposed by the Generalizer.\n// For this reason, we must switch to aggressive grounding.\nYou are a LEGISLATIVE SURGEON.\nYour task is to audit and repair the summary (JSON) regarding compliance with the source text (SOURCE).\n// MEGA IMPORTANT. He cannot add information. If he did – we increase the risk of hallucination, and he no longer has a judge above him. Incomplete summaries are better than false ones.\nFUNDAMENTAL RULE: \"NO NEW INFORMATION\".\nThe summary can only transform information contained in the SOURCE (shorten, translate, summarize). It cannot generate new information that is not in the SOURCE.\n// VERIFICATION PROCEDURE (WORKFLOW)\n// We force a \"Sentence-by-Sentence\" thought process on the model.\nVERIFICATION PROCEDURE (perform for every sentence in JSON):\nAsk yourself: \"Can I point to a specific fragment in the SOURCE that confirms this statement?\"\nIF THE ANSWER IS \"YES\":\nThe information is confirmed by a quote, synonym, or mathematical result from data in the text.\nDECISION: Leave unchanged.\nIF THE ANSWER IS \"NO\":\nThe information is not in the text (it is a hallucination, the model\'s external knowledge, overinterpretation, or unnecessary extrapolation).\nDECISION: Remove this information or change it so that it has coverage in the text.\nIF THE ANSWER IS \"IT DEPENDS\":\nThe text is unclear, and the summary is \"guessing\" (e.g., giving a specific example for a general term).\nDECISION: Be safe. Remove the guessing. Use terminology from the text.\n// RISK CATEGORIES\n// Estimated based on the Generalizer\'s previous errors.\n// We give him a \"roadmap\" of where the mines usually lie.\nRISK CATEGORIES (special attention):\nDates (effective start vs funding start).\nNumbers (specific amounts must result from the text).\nEntities (who does what).\nScope (what the act covers and what it does not).\n\nINPUT:\n--- SOURCE_TEXT START ---\n[SOURCE_TEXT]\n--- SOURCE_TEXT END ---\n\n--- FLAGGED_JSON START ---\n[FLAGGED_JSON]\n--- FLAGGED_JSON END ---\n\nOUTPUT:\nExclusively a repaired JSON object consistent with the structure: (...)'**
  String get techSurgeonCode;

  /// No description provided for @techConclusionsTitle.
  ///
  /// In en, this message translates to:
  /// **'4. EMPIRICAL CONCLUSIONS'**
  String get techConclusionsTitle;

  /// No description provided for @techConclusionsIntro.
  ///
  /// In en, this message translates to:
  /// **'As the system developed, it was necessary to make decisions based on observations rather than model parameters. This resulted in some quite interesting insights.'**
  String get techConclusionsIntro;

  /// No description provided for @techConclusionATitle.
  ///
  /// In en, this message translates to:
  /// **'A) Why use a \"dumber\" model?'**
  String get techConclusionATitle;

  /// No description provided for @techConclusionABody.
  ///
  /// In en, this message translates to:
  /// **'Initial tests on Polish law, audited by Claude and ChatGPT, showed that Gemini Flash generated the best summaries. Close behind was the Pro model, which sometimes received a slightly lower rating due to drawing far-reaching conclusions or skipping certain details. Paradoxically, the model\'s \"thinking\" contributed to slightly lower content quality. Conclusion? When Pro gets a short and simple text, it starts philosophizing. As a result, it can skip key facts it considers too obvious. It also loses JSON structure (forgets to close the brace) much more often. For simple summaries, the choice is obvious.'**
  String get techConclusionABody;

  /// No description provided for @techConclusionBTitle.
  ///
  /// In en, this message translates to:
  /// **'B) So what is Pro for?'**
  String get techConclusionBTitle;

  /// No description provided for @techConclusionBBody.
  ///
  /// In en, this message translates to:
  /// **'The trouble starts with longer documents. Here, the Pro model definitely takes the lead, while weaker models have a much higher tendency to hallucinate. These observations are also confirmed by scientific research (Lost in the Middle). This forces the necessity of using the Pro model immediately for longer documents.'**
  String get techConclusionBBody;

  /// No description provided for @techConclusionCTitle.
  ///
  /// In en, this message translates to:
  /// **'C) Effectiveness'**
  String get techConclusionCTitle;

  /// No description provided for @techConclusionCBody.
  ///
  /// In en, this message translates to:
  /// **'Based on empirical experience (hundreds of trials, different parliaments), the anti-hallucination rate is >99%. To estimate the coefficient with greater precision, additional financial outlays would be required (thousands or tens of thousands of tests with the strongest models from competing AI firms). Therefore, this can be treated with a grain of salt. Most hallucinations are minor errors, e.g., using the word \"human\" instead of \"MP\" in a summary. Thus, the system\'s main problem is not them, but excessive generalization. Sometimes the Generalizer will create a correct summary but miss a critical point that is very relevant to public debate. However, this is a compromise the system currently accepts, focused on the total elimination of hallucinations. Boredom is safer than a lie.'**
  String get techConclusionCBody;

  /// No description provided for @techFooterDate.
  ///
  /// In en, this message translates to:
  /// **'Update date Q1 2026'**
  String get techFooterDate;

  /// No description provided for @techFooterLicense.
  ///
  /// In en, this message translates to:
  /// **'PolyForm Noncommercial License'**
  String get techFooterLicense;

  /// No description provided for @techGraphSource.
  ///
  /// In en, this message translates to:
  /// **'Legislation Source'**
  String get techGraphSource;

  /// No description provided for @techGraphDecisionLength.
  ///
  /// In en, this message translates to:
  /// **'Length > 20k tokens?'**
  String get techGraphDecisionLength;

  /// No description provided for @techGraphNo.
  ///
  /// In en, this message translates to:
  /// **'NO'**
  String get techGraphNo;

  /// No description provided for @techGraphYes.
  ///
  /// In en, this message translates to:
  /// **'YES'**
  String get techGraphYes;

  /// No description provided for @techGraphFlash.
  ///
  /// In en, this message translates to:
  /// **'Flash (System 1)'**
  String get techGraphFlash;

  /// No description provided for @techGraphPro.
  ///
  /// In en, this message translates to:
  /// **'Pro (System 2)'**
  String get techGraphPro;

  /// No description provided for @techGraphJudge.
  ///
  /// In en, this message translates to:
  /// **'The Judge (Flash Lite)'**
  String get techGraphJudge;

  /// No description provided for @techGraphDecisionPass.
  ///
  /// In en, this message translates to:
  /// **'Result: Pass?'**
  String get techGraphDecisionPass;

  /// No description provided for @techGraphPublishFirestore.
  ///
  /// In en, this message translates to:
  /// **'HTML Ready'**
  String get techGraphPublishFirestore;

  /// No description provided for @techGraphNoRetry.
  ///
  /// In en, this message translates to:
  /// **'NO (Retry)'**
  String get techGraphNoRetry;

  /// No description provided for @techGraphRepairLoop.
  ///
  /// In en, this message translates to:
  /// **'Repair loop'**
  String get techGraphRepairLoop;

  /// No description provided for @techGraphRetryFlash.
  ///
  /// In en, this message translates to:
  /// **'< 2 errors: Flash'**
  String get techGraphRetryFlash;

  /// No description provided for @techGraphRetrySurgeon.
  ///
  /// In en, this message translates to:
  /// **'> 2 errors: Surgeon'**
  String get techGraphRetrySurgeon;

  /// No description provided for @techGraphSurgeon.
  ///
  /// In en, this message translates to:
  /// **'The Surgeon (Pro)'**
  String get techGraphSurgeon;

  /// No description provided for @techGraphHtmlReady.
  ///
  /// In en, this message translates to:
  /// **'HTML Ready'**
  String get techGraphHtmlReady;

  /// No description provided for @votingResultsPL1stReadingTitle.
  ///
  /// In en, this message translates to:
  /// **'VOTE ON REJECTION'**
  String get votingResultsPL1stReadingTitle;

  /// No description provided for @reportErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Briefly describe the error or what is missing. Your report will help us improve the application.'**
  String get reportErrorDescription;

  /// No description provided for @reportErrorHint.
  ///
  /// In en, this message translates to:
  /// **'Type your message...'**
  String get reportErrorHint;

  /// No description provided for @reportErrorValidationEmpty.
  ///
  /// In en, this message translates to:
  /// **'Message cannot be empty.'**
  String get reportErrorValidationEmpty;

  /// No description provided for @reportErrorSuccess.
  ///
  /// In en, this message translates to:
  /// **'Thank you! Your report has been submitted.'**
  String get reportErrorSuccess;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get actionSend;

  /// No description provided for @mustBeLoggedInToReport.
  ///
  /// In en, this message translates to:
  /// **'You must be logged in to report an error.'**
  String get mustBeLoggedInToReport;

  /// No description provided for @reportErrorRateLimitExceeded.
  ///
  /// In en, this message translates to:
  /// **'The report limit has been exceeded (10 per 24 hours).'**
  String get reportErrorRateLimitExceeded;

  /// No description provided for @supportQuickTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick Support'**
  String get supportQuickTitle;

  /// No description provided for @supportPaymentsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Payments are currently unavailable.'**
  String get supportPaymentsUnavailable;

  /// No description provided for @supportNoProducts.
  ///
  /// In en, this message translates to:
  /// **'No support options available.'**
  String get supportNoProducts;

  /// No description provided for @supportCampaignsTitle.
  ///
  /// In en, this message translates to:
  /// **'Targeted Campaigns'**
  String get supportCampaignsTitle;

  /// No description provided for @supportCampaignsDescription.
  ///
  /// In en, this message translates to:
  /// **'Support specific development goals, e.g., adding a new parliament.'**
  String get supportCampaignsDescription;

  /// No description provided for @supportCampaignsButton.
  ///
  /// In en, this message translates to:
  /// **'See active campaign (coming soon)'**
  String get supportCampaignsButton;

  /// No description provided for @forceUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Required'**
  String get forceUpdateTitle;

  /// No description provided for @forceUpdateDescription.
  ///
  /// In en, this message translates to:
  /// **'A new version of the app is available. To continue, please update the app to the latest version.'**
  String get forceUpdateDescription;

  /// No description provided for @forceUpdateButton.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get forceUpdateButton;

  /// No description provided for @deputies.
  ///
  /// In en, this message translates to:
  /// **'Deputies'**
  String get deputies;

  /// No description provided for @sortingLabel.
  ///
  /// In en, this message translates to:
  /// **'Sort by: '**
  String get sortingLabel;

  /// No description provided for @sortByPopularity.
  ///
  /// In en, this message translates to:
  /// **'Popularity'**
  String get sortByPopularity;

  /// No description provided for @sortByAttendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get sortByAttendance;

  /// No description provided for @partyLabel.
  ///
  /// In en, this message translates to:
  /// **'Party: {partyName}'**
  String partyLabel(Object partyName);

  /// No description provided for @districtLabelUS.
  ///
  /// In en, this message translates to:
  /// **'{districtName}\'s {districtNum, select, 1{1st} 2{2nd} 3{3rd} other{{districtNum}th}} district'**
  String districtLabelUS(Object districtName, String districtNum);

  /// No description provided for @tenureTermItemUS.
  ///
  /// In en, this message translates to:
  /// **'{termNumber, select, 1{1st} 2{2nd} 3{3rd} other{{termNumber}th}} Congress ({memberType})'**
  String tenureTermItemUS(Object memberType, String termNumber);

  /// No description provided for @birthYearLabel.
  ///
  /// In en, this message translates to:
  /// **'Birth Year:'**
  String get birthYearLabel;

  /// No description provided for @sponsorshipsTab.
  ///
  /// In en, this message translates to:
  /// **'Sponsorships'**
  String get sponsorshipsTab;

  /// No description provided for @sponsorshipTypeSponsor.
  ///
  /// In en, this message translates to:
  /// **'Sponsor'**
  String get sponsorshipTypeSponsor;

  /// No description provided for @sponsorshipTypeCosponsor.
  ///
  /// In en, this message translates to:
  /// **'Co-sponsor'**
  String get sponsorshipTypeCosponsor;

  /// No description provided for @termCurrently.
  ///
  /// In en, this message translates to:
  /// **'(currently)'**
  String get termCurrently;

  /// No description provided for @parliamentaryTenureTitle.
  ///
  /// In en, this message translates to:
  /// **'Parliamentary tenure'**
  String get parliamentaryTenureTitle;

  /// No description provided for @usRoleRepresentative.
  ///
  /// In en, this message translates to:
  /// **'Representative'**
  String get usRoleRepresentative;

  /// No description provided for @usRoleSenator.
  ///
  /// In en, this message translates to:
  /// **'Senator'**
  String get usRoleSenator;

  /// No description provided for @shareLegislationText.
  ///
  /// In en, this message translates to:
  /// **'Voting is a choice. Make yours as well: {deepLink}'**
  String shareLegislationText(Object deepLink);

  /// No description provided for @shareDeputyText.
  ///
  /// In en, this message translates to:
  /// **'Profile and voting record: {deepLink}'**
  String shareDeputyText(Object deepLink);

  /// No description provided for @clipboardCopySuccess.
  ///
  /// In en, this message translates to:
  /// **'App link copied to clipboard!'**
  String get clipboardCopySuccess;

  /// No description provided for @mandateInactive.
  ///
  /// In en, this message translates to:
  /// **'MANDATE INACTIVE'**
  String get mandateInactive;

  /// No description provided for @votingUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Voting unavailable'**
  String get votingUnavailable;

  /// No description provided for @historicalTerm.
  ///
  /// In en, this message translates to:
  /// **'HISTORICAL TERM'**
  String get historicalTerm;

  /// No description provided for @pollUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Poll unavailable'**
  String get pollUnavailable;

  /// No description provided for @billsLabel.
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get billsLabel;

  /// No description provided for @sponsorshipSublabel.
  ///
  /// In en, this message translates to:
  /// **'(Sponsored/Co-sponsored)'**
  String get sponsorshipSublabel;

  /// No description provided for @missingDataWarningShare.
  ///
  /// In en, this message translates to:
  /// **'The source document for this bill is missing. Help us and file an official email request to have it published via our app in seconds!'**
  String get missingDataWarningShare;

  /// No description provided for @missingDataSourceUserMessage.
  ///
  /// In en, this message translates to:
  /// **'The source document for this bill is missing. Help us by filing an official email request to have it published and join the group of people who care about information transparency!'**
  String get missingDataSourceUserMessage;

  /// No description provided for @missingDataSourceButton.
  ///
  /// In en, this message translates to:
  /// **'File email request for document'**
  String get missingDataSourceButton;

  /// No description provided for @cannotOpenEmailApp.
  ///
  /// In en, this message translates to:
  /// **'Could not open the email app. Check if it\'s installed and if you have an account configured.'**
  String get cannotOpenEmailApp;

  /// No description provided for @sortByFreshness.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get sortByFreshness;

  /// No description provided for @pollPermissionDeniedError.
  ///
  /// In en, this message translates to:
  /// **'This poll is available only for users assigned to this parliament.'**
  String get pollPermissionDeniedError;

  /// No description provided for @supportCampaignsButtonActive.
  ///
  /// In en, this message translates to:
  /// **'Support the campaign'**
  String get supportCampaignsButtonActive;

  /// No description provided for @supportCampaignsButtonInactive.
  ///
  /// In en, this message translates to:
  /// **'Campaign inactive'**
  String get supportCampaignsButtonInactive;

  /// No description provided for @authErrorAppleFailed.
  ///
  /// In en, this message translates to:
  /// **'Apple sign-in failed. Please try again.'**
  String get authErrorAppleFailed;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @homeSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Enter a phrase...'**
  String get homeSearchHint;

  /// No description provided for @homeSearchButtonDeputies.
  ///
  /// In en, this message translates to:
  /// **'Deputies'**
  String get homeSearchButtonDeputies;

  /// No description provided for @homeSearchButtonLegislations.
  ///
  /// In en, this message translates to:
  /// **'Legislations'**
  String get homeSearchButtonLegislations;

  /// No description provided for @actionSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get actionSeeAll;

  /// No description provided for @notificationsEnabledForOtherParliament.
  ///
  /// In en, this message translates to:
  /// **'Active for another parliament'**
  String get notificationsEnabledForOtherParliament;

  /// No description provided for @votingResultsUSMotionToTableTitle.
  ///
  /// In en, this message translates to:
  /// **'RESULTS: MOTION TO TABLE'**
  String get votingResultsUSMotionToTableTitle;

  /// No description provided for @crowdfundingLabel.
  ///
  /// In en, this message translates to:
  /// **'Support Lustra in remaining an independent source:'**
  String get crowdfundingLabel;

  /// No description provided for @hashtagLaw.
  ///
  /// In en, this message translates to:
  /// **'Law'**
  String get hashtagLaw;

  /// No description provided for @hashtagPolitician.
  ///
  /// In en, this message translates to:
  /// **'Politician'**
  String get hashtagPolitician;

  /// No description provided for @statusIntroduced.
  ///
  /// In en, this message translates to:
  /// **'Introduced'**
  String get statusIntroduced;

  /// No description provided for @statusPassedHouse.
  ///
  /// In en, this message translates to:
  /// **'Passed House'**
  String get statusPassedHouse;

  /// No description provided for @statusPassedSenate.
  ///
  /// In en, this message translates to:
  /// **'Passed Senate'**
  String get statusPassedSenate;

  /// No description provided for @statusBecameLaw.
  ///
  /// In en, this message translates to:
  /// **'Became Law'**
  String get statusBecameLaw;

  /// No description provided for @statusVetoed.
  ///
  /// In en, this message translates to:
  /// **'Vetoed'**
  String get statusVetoed;

  /// No description provided for @statusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get statusFailed;

  /// No description provided for @statusPlacedOnCalendar.
  ///
  /// In en, this message translates to:
  /// **'Placed on Calendar'**
  String get statusPlacedOnCalendar;

  /// No description provided for @actionBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get actionBack;

  /// No description provided for @actionViewSourceJson.
  ///
  /// In en, this message translates to:
  /// **'AI work logs for this document'**
  String get actionViewSourceJson;

  /// No description provided for @manualEmailDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Send message manually'**
  String get manualEmailDialogTitle;

  /// No description provided for @manualEmailDialogDescription.
  ///
  /// In en, this message translates to:
  /// **'No email client detected. Copy the data below and send it yourself.'**
  String get manualEmailDialogDescription;

  /// No description provided for @labelRecipient.
  ///
  /// In en, this message translates to:
  /// **'Recipient'**
  String get labelRecipient;

  /// No description provided for @labelSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get labelSubject;

  /// No description provided for @labelBody.
  ///
  /// In en, this message translates to:
  /// **'Message body'**
  String get labelBody;

  /// No description provided for @actionCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get actionCopy;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @webBannerDownloadMessage.
  ///
  /// In en, this message translates to:
  /// **'To enjoy full functionality, download the app!'**
  String get webBannerDownloadMessage;

  /// No description provided for @webBannerDownloadButton.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get webBannerDownloadButton;

  /// No description provided for @supportStripeButton.
  ///
  /// In en, this message translates to:
  /// **'Support (Stripe)'**
  String get supportStripeButton;

  /// No description provided for @supportFounderMessage.
  ///
  /// In en, this message translates to:
  /// **'There is no big corporation behind this project, just me and my laptop. I built this because I believe such technology must exist and remain 100% independent of capital, which always dictates the narrative. This is my gift to the world.'**
  String get supportFounderMessage;

  /// No description provided for @civicProjectTitle.
  ///
  /// In en, this message translates to:
  /// **'Civic Project'**
  String get civicProjectTitle;

  /// No description provided for @drafterAuthRequired.
  ///
  /// In en, this message translates to:
  /// **'Authentication required. Please log in to Lustra first.'**
  String get drafterAuthRequired;

  /// No description provided for @drafterLaunchError.
  ///
  /// In en, this message translates to:
  /// **'Failed to launch Drafter Gateway:'**
  String get drafterLaunchError;

  /// No description provided for @drafterButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'USE LUSTRA DRAFTER TO CREATE LAW FROM IDEA IN 5 MINUTES'**
  String get drafterButtonTitle;

  /// No description provided for @submitCivicProjectButton.
  ///
  /// In en, this message translates to:
  /// **'Create your project'**
  String get submitCivicProjectButton;

  /// No description provided for @civicThresholdCandidate.
  ///
  /// In en, this message translates to:
  /// **'Needs revision.'**
  String get civicThresholdCandidate;

  /// No description provided for @statusInitiative.
  ///
  /// In en, this message translates to:
  /// **'Initiative'**
  String get statusInitiative;

  /// No description provided for @civicTitle.
  ///
  /// In en, this message translates to:
  /// **'Civic Projects'**
  String get civicTitle;

  /// No description provided for @civicIncubatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Civic Projects Incubator'**
  String get civicIncubatorTitle;

  /// No description provided for @civicSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Drafting the future of democracy, together.'**
  String get civicSubtitle;

  /// No description provided for @civicSection1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Program Rules & Governance'**
  String get civicSection1Title;

  /// No description provided for @civicSection1Intro.
  ///
  /// In en, this message translates to:
  /// **'Lustra provides citizens with legislative infrastructure. We treat your ideas with the same seriousness as government bills. To ensure quality, strict rules apply:'**
  String get civicSection1Intro;

  /// No description provided for @civicProcessTitle.
  ///
  /// In en, this message translates to:
  /// **'The Process'**
  String get civicProcessTitle;

  /// No description provided for @civicRuleSubmissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Submission:'**
  String get civicRuleSubmissionTitle;

  /// No description provided for @civicRuleSubmissionText.
  ///
  /// In en, this message translates to:
  /// **'You submit a draft via email/form.'**
  String get civicRuleSubmissionText;

  /// No description provided for @civicRuleReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Formal Review (Human):'**
  String get civicRuleReviewTitle;

  /// No description provided for @civicRuleReviewText.
  ///
  /// In en, this message translates to:
  /// **'We check compliance with the LDS-1 Standard. We strictly filter out hate speech, spam, duplicates, and non-legislative content.'**
  String get civicRuleReviewText;

  /// No description provided for @civicRuleAiTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Sterilization:'**
  String get civicRuleAiTitle;

  /// No description provided for @civicRuleAiText.
  ///
  /// In en, this message translates to:
  /// **'Approved drafts are processed by our AI to remove emotional language and extract core facts.'**
  String get civicRuleAiText;

  /// No description provided for @civicRulePublicationTitle.
  ///
  /// In en, this message translates to:
  /// **'Publication:'**
  String get civicRulePublicationTitle;

  /// No description provided for @civicRulePublicationText.
  ///
  /// In en, this message translates to:
  /// **'The project receives a \"Civic Bill Card\" in the app, visually equal to government legislation.'**
  String get civicRulePublicationText;

  /// No description provided for @civicWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Project Integrity'**
  String get civicWarningTitle;

  /// No description provided for @civicWarningText.
  ///
  /// In en, this message translates to:
  /// **'The main text remains permanent. You may only add amendments to refine or fix the legislation without changing its core intent. All changes are transparent and added as annexes to maintain voter trust.'**
  String get civicWarningText;

  /// No description provided for @civicPoliciesTitle.
  ///
  /// In en, this message translates to:
  /// **'Critical Policies'**
  String get civicPoliciesTitle;

  /// No description provided for @civicPolicyPublicDomainTitle.
  ///
  /// In en, this message translates to:
  /// **'Public Domain (CC0):'**
  String get civicPolicyPublicDomainTitle;

  /// No description provided for @civicPolicyPublicDomainText.
  ///
  /// In en, this message translates to:
  /// **'By submitting a project, you waive all copyright. Law belongs to everyone.'**
  String get civicPolicyPublicDomainText;

  /// No description provided for @civicPolicyAstroturfingTitle.
  ///
  /// In en, this message translates to:
  /// **'Anti-Astroturfing:'**
  String get civicPolicyAstroturfingTitle;

  /// No description provided for @civicPolicyAstroturfingText.
  ///
  /// In en, this message translates to:
  /// **'You must declare if you represent an organization. Hidden lobbying results in a permanent ban.'**
  String get civicPolicyAstroturfingText;

  /// No description provided for @civicPolicyAdPersonamTitle.
  ///
  /// In en, this message translates to:
  /// **'Ad Personam:'**
  String get civicPolicyAdPersonamTitle;

  /// No description provided for @civicPolicyAdPersonamText.
  ///
  /// In en, this message translates to:
  /// **'Projects targeting specific individuals (defamation) are rejected immediately.'**
  String get civicPolicyAdPersonamText;

  /// No description provided for @civicPolicyTrashTitle.
  ///
  /// In en, this message translates to:
  /// **'No Trash Bin:'**
  String get civicPolicyTrashTitle;

  /// No description provided for @civicPolicyTrashText.
  ///
  /// In en, this message translates to:
  /// **'Lustra is not a forum. Low-quality drafts, duplicates, and manifestos are rejected at the gate.'**
  String get civicPolicyTrashText;

  /// No description provided for @civicSection2Title.
  ///
  /// In en, this message translates to:
  /// **'2. Lustra Legislative Standard (LDS-1)'**
  String get civicSection2Title;

  /// No description provided for @civicSection2Intro.
  ///
  /// In en, this message translates to:
  /// **'Your draft must follow this structure. If it looks like a blog post, it will be rejected.'**
  String get civicSection2Intro;

  /// No description provided for @civicStructureTitle.
  ///
  /// In en, this message translates to:
  /// **'Required Structure:'**
  String get civicStructureTitle;

  /// No description provided for @civicStructureTitleItem.
  ///
  /// In en, this message translates to:
  /// **'Title:'**
  String get civicStructureTitleItem;

  /// No description provided for @civicStructureTitleText.
  ///
  /// In en, this message translates to:
  /// **'Descriptive and neutral.'**
  String get civicStructureTitleText;

  /// No description provided for @civicStructureArticlesItem.
  ///
  /// In en, this message translates to:
  /// **'Articles:'**
  String get civicStructureArticlesItem;

  /// No description provided for @civicStructureArticlesText.
  ///
  /// In en, this message translates to:
  /// **'Text divided into numbered units (Art. 1, Art. 2...) containing specific mechanisms (bans, mandates).'**
  String get civicStructureArticlesText;

  /// No description provided for @civicStructureExposeItem.
  ///
  /// In en, this message translates to:
  /// **'Explanatory Memorandum (Exposé):'**
  String get civicStructureExposeItem;

  /// No description provided for @civicStructureExposeText.
  ///
  /// In en, this message translates to:
  /// **'Mandatory section explaining:'**
  String get civicStructureExposeText;

  /// No description provided for @civicExposePoint1.
  ///
  /// In en, this message translates to:
  /// **'• (1) Diagnosis of the problem.'**
  String get civicExposePoint1;

  /// No description provided for @civicExposePoint2.
  ///
  /// In en, this message translates to:
  /// **'• (2) Goal of the regulation.'**
  String get civicExposePoint2;

  /// No description provided for @civicExposePoint3.
  ///
  /// In en, this message translates to:
  /// **'• (3) Expected social impact.'**
  String get civicExposePoint3;

  /// No description provided for @civicSection3Title.
  ///
  /// In en, this message translates to:
  /// **'3. Lustra Readiness Score'**
  String get civicSection3Title;

  /// No description provided for @civicSection3Intro.
  ///
  /// In en, this message translates to:
  /// **'We do not judge your political views. We judge the quality of construction. Our AI analyzes every draft on a 0-100 scale:'**
  String get civicSection3Intro;

  /// No description provided for @civicScoreStructureTitle.
  ///
  /// In en, this message translates to:
  /// **'Structure (30 pts):'**
  String get civicScoreStructureTitle;

  /// No description provided for @civicScoreStructureText.
  ///
  /// In en, this message translates to:
  /// **'Correct legal formatting and precise language.'**
  String get civicScoreStructureText;

  /// No description provided for @civicScoreExposeTitle.
  ///
  /// In en, this message translates to:
  /// **'Exposé Completeness (30 pts):'**
  String get civicScoreExposeTitle;

  /// No description provided for @civicScoreExposeText.
  ///
  /// In en, this message translates to:
  /// **'Clarity of the problem/solution definition.'**
  String get civicScoreExposeText;

  /// No description provided for @civicScoreLogicTitle.
  ///
  /// In en, this message translates to:
  /// **'Internal Logic (20 pts):'**
  String get civicScoreLogicTitle;

  /// No description provided for @civicScoreLogicText.
  ///
  /// In en, this message translates to:
  /// **'Absence of contradictions.'**
  String get civicScoreLogicText;

  /// No description provided for @civicScoreImpactTitle.
  ///
  /// In en, this message translates to:
  /// **'Impact Analysis (20 pts):'**
  String get civicScoreImpactTitle;

  /// No description provided for @civicScoreImpactText.
  ///
  /// In en, this message translates to:
  /// **'Feasibility and identification of affected groups.'**
  String get civicScoreImpactText;

  /// No description provided for @civicThresholdsTitle.
  ///
  /// In en, this message translates to:
  /// **'Thresholds:'**
  String get civicThresholdsTitle;

  /// No description provided for @civicThresholdRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected / Returned.'**
  String get civicThresholdRejected;

  /// No description provided for @civicThresholdReady.
  ///
  /// In en, this message translates to:
  /// **'Priority publication.'**
  String get civicThresholdReady;

  /// No description provided for @civicSection4Title.
  ///
  /// In en, this message translates to:
  /// **'4. Creator\'s Toolkit (Copy & Paste)'**
  String get civicSection4Title;

  /// No description provided for @civicSection4Intro.
  ///
  /// In en, this message translates to:
  /// **'Use this template to ensure your project meets the LDS-1 Standard.'**
  String get civicSection4Intro;

  /// No description provided for @civicTemplateCode.
  ///
  /// In en, this message translates to:
  /// **'TITLE: [Insert Descriptive Title Here]\n\nPREAMBLE: [Optional: Recognizing that...]\n\nCHAPTER I: GENERAL PROVISIONS\nArt. 1. The objective of this Act is [Insert Goal].\nArt. 2. This Act applies to [Insert Scope].\n\nCHAPTER II: [MAIN MECHANISM / BANS]\nArt. 3. \n1. It is prohibited to [Action].\n2. Entities are required to [Action].\n\nCHAPTER III: SANCTIONS & FINAL PROVISIONS\nArt. X. Violation of Art. 3 is punishable by [Sanction].\nArt. Y. This Act enters into force on [Date].\n\n---\nEXPLANATORY MEMORANDUM (EXPOSÉ)\n\n1. THE PROBLEM\n[Describe the current situation and why it is failing.]\n\n2. THE OBJECTIVE\n[Explain what this law fixes and how.]\n\n3. EXPECTED IMPACT\n[Describe the social, economic, or legal consequences.]'**
  String get civicTemplateCode;

  /// No description provided for @civicSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT DRAFT (EMAIL)'**
  String get civicSubmitButton;

  /// No description provided for @civicFooterCopyright.
  ///
  /// In en, this message translates to:
  /// **'© 2025 Lustra Initiative.\nInfrastructure for the Civic Age.'**
  String get civicFooterCopyright;

  /// No description provided for @civicEmailSubject.
  ///
  /// In en, this message translates to:
  /// **'[LDS-1 Submission] Project Title - {parliamentName}'**
  String civicEmailSubject(Object parliamentName);

  /// No description provided for @civicEmailBodyPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'[PASTE YOUR TEMPLATE HERE]\n\nAuthor / Organization:\nContact Info:\n'**
  String get civicEmailBodyPlaceholder;

  /// No description provided for @civicEmailDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Email Client Not Found'**
  String get civicEmailDialogTitle;

  /// No description provided for @civicEmailDialogIntro.
  ///
  /// In en, this message translates to:
  /// **'Please copy the details below and send manually:'**
  String get civicEmailDialogIntro;

  /// No description provided for @civicEmailDialogRecipient.
  ///
  /// In en, this message translates to:
  /// **'Recipient'**
  String get civicEmailDialogRecipient;

  /// No description provided for @civicEmailDialogSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get civicEmailDialogSubject;

  /// No description provided for @civicEmailDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Body'**
  String get civicEmailDialogBody;

  /// No description provided for @civicCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get civicCopiedToClipboard;

  /// No description provided for @civicTemplateCopied.
  ///
  /// In en, this message translates to:
  /// **'Template copied!'**
  String get civicTemplateCopied;

  /// No description provided for @supportMegaTitle.
  ///
  /// In en, this message translates to:
  /// **'Civic Ownership'**
  String get supportMegaTitle;

  /// No description provided for @verificationRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Verification required'**
  String get verificationRequiredTitle;

  /// No description provided for @verificationRequiredContent.
  ///
  /// In en, this message translates to:
  /// **'To count your vote in the ranking, we must confirm you are human.\n\nPlease check your email inbox (including SPAM folder).'**
  String get verificationRequiredContent;

  /// No description provided for @verificationResendLink.
  ///
  /// In en, this message translates to:
  /// **'Resend link'**
  String get verificationResendLink;

  /// No description provided for @verificationLinkSentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Link sent again!'**
  String get verificationLinkSentSuccess;

  /// No description provided for @verificationAlreadyConfirmed.
  ///
  /// In en, this message translates to:
  /// **'I have confirmed'**
  String get verificationAlreadyConfirmed;

  /// No description provided for @verificationSuccessVotingUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Thank you! You can vote now.'**
  String get verificationSuccessVotingUnlocked;

  /// No description provided for @verificationStillNotVerified.
  ///
  /// In en, this message translates to:
  /// **'Confirmation not found yet. Please try again in a moment.'**
  String get verificationStillNotVerified;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @pollVoteSignificance.
  ///
  /// In en, this message translates to:
  /// **'Your vote is just the beginning.'**
  String get pollVoteSignificance;

  /// No description provided for @pollShareImpact.
  ///
  /// In en, this message translates to:
  /// **'Algorithms often silence us. Your single share reaches an average of 50-300 people. Help us break the social media bubble.'**
  String get pollShareImpact;

  /// No description provided for @pollShareAction.
  ///
  /// In en, this message translates to:
  /// **'Share and amplify the citizens\' voice'**
  String get pollShareAction;

  /// No description provided for @listRefreshed.
  ///
  /// In en, this message translates to:
  /// **'List refreshed!'**
  String get listRefreshed;

  /// No description provided for @errorNoDataReturned.
  ///
  /// In en, this message translates to:
  /// **'No data returned'**
  String get errorNoDataReturned;

  /// No description provided for @errorMustBeLoggedInToSubscribe.
  ///
  /// In en, this message translates to:
  /// **'You must be logged in to subscribe.'**
  String get errorMustBeLoggedInToSubscribe;

  /// No description provided for @subscribedToList.
  ///
  /// In en, this message translates to:
  /// **'Subscribed to list!'**
  String get subscribedToList;

  /// No description provided for @unsubscribedFromList.
  ///
  /// In en, this message translates to:
  /// **'Unsubscribed from list.'**
  String get unsubscribedFromList;

  /// No description provided for @errorListRemovedByOwner.
  ///
  /// In en, this message translates to:
  /// **'List removed by an owner...'**
  String get errorListRemovedByOwner;

  /// No description provided for @errorFailedToUpdateSubscription.
  ///
  /// In en, this message translates to:
  /// **'Failed to update subscription.'**
  String get errorFailedToUpdateSubscription;

  /// No description provided for @notificationSentCooldownActive.
  ///
  /// In en, this message translates to:
  /// **'Notification sent to subscribers!...'**
  String get notificationSentCooldownActive;

  /// No description provided for @errorCooldownActiveNotification.
  ///
  /// In en, this message translates to:
  /// **'Cooldown active. You can send...'**
  String get errorCooldownActiveNotification;

  /// No description provided for @errorFailedToSendNotification.
  ///
  /// In en, this message translates to:
  /// **'Failed to send notification.'**
  String get errorFailedToSendNotification;

  /// No description provided for @nameYourCuratorList.
  ///
  /// In en, this message translates to:
  /// **'Name your Curator List'**
  String get nameYourCuratorList;

  /// No description provided for @hintCuratorListExample.
  ///
  /// In en, this message translates to:
  /// **'e.g. My Economic Policy'**
  String get hintCuratorListExample;

  /// No description provided for @listCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'List \'{text}\' created!'**
  String listCreatedSuccess(String text);

  /// No description provided for @errorFailedToCreateList.
  ///
  /// In en, this message translates to:
  /// **'Failed to create list.'**
  String get errorFailedToCreateList;

  /// No description provided for @actionCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get actionCreate;

  /// No description provided for @unnamedList.
  ///
  /// In en, this message translates to:
  /// **'Unnamed List'**
  String get unnamedList;

  /// No description provided for @tooltipEditList.
  ///
  /// In en, this message translates to:
  /// **'Edit List'**
  String get tooltipEditList;

  /// No description provided for @addDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Add a description to tell others...'**
  String get addDescriptionHint;

  /// No description provided for @subscribersCount.
  ///
  /// In en, this message translates to:
  /// **'{subs} subscribers'**
  String subscribersCount(int subs);

  /// No description provided for @actionShareList.
  ///
  /// In en, this message translates to:
  /// **'Share List'**
  String get actionShareList;

  /// No description provided for @actionSupportCreator.
  ///
  /// In en, this message translates to:
  /// **'Support Creator'**
  String get actionSupportCreator;

  /// No description provided for @availableInHours.
  ///
  /// In en, this message translates to:
  /// **'Available in {hoursLeft}h'**
  String availableInHours(int hoursLeft);

  /// No description provided for @actionNotifySubscribers.
  ///
  /// In en, this message translates to:
  /// **'Notify Subscribers'**
  String get actionNotifySubscribers;

  /// No description provided for @actionSubscribed.
  ///
  /// In en, this message translates to:
  /// **'Subscribed'**
  String get actionSubscribed;

  /// No description provided for @actionSubscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get actionSubscribe;

  /// No description provided for @tooltipReportList.
  ///
  /// In en, this message translates to:
  /// **'Report List'**
  String get tooltipReportList;

  /// No description provided for @tooltipDeleteList.
  ///
  /// In en, this message translates to:
  /// **'Delete List'**
  String get tooltipDeleteList;

  /// No description provided for @draftYourCivicProject.
  ///
  /// In en, this message translates to:
  /// **'Draft your own civic project'**
  String get draftYourCivicProject;

  /// No description provided for @draftCivicProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'Transform your ideas into real bills and gather support. Lustra is ready for your policies.'**
  String get draftCivicProjectDescription;

  /// No description provided for @createYourOwnList.
  ///
  /// In en, this message translates to:
  /// **'Create your own list'**
  String get createYourOwnList;

  /// No description provided for @createYourOwnListDescription.
  ///
  /// In en, this message translates to:
  /// **'Become a curator. Select important bills, invite followers, and push notifications to their devices to keep them updated on changes in your legislation list or civic projects.'**
  String get createYourOwnListDescription;

  /// No description provided for @editListDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit List Details'**
  String get editListDetails;

  /// No description provided for @listNameLabel.
  ///
  /// In en, this message translates to:
  /// **'List Name'**
  String get listNameLabel;

  /// No description provided for @descriptionOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get descriptionOptionalLabel;

  /// No description provided for @supportCreatorOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Support Creator (Optional)'**
  String get supportCreatorOptionalLabel;

  /// No description provided for @providerUsernameLabel.
  ///
  /// In en, this message translates to:
  /// **'{provider} Username'**
  String providerUsernameLabel(String provider);

  /// No description provided for @listUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'List updated!'**
  String get listUpdatedSuccess;

  /// No description provided for @errorFailedToUpdate.
  ///
  /// In en, this message translates to:
  /// **'Failed to update.'**
  String get errorFailedToUpdate;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @deleteListDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete List?'**
  String get deleteListDialogTitle;

  /// No description provided for @deleteListDialogBody.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone...'**
  String get deleteListDialogBody;

  /// No description provided for @listDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'List deleted.'**
  String get listDeletedSuccess;

  /// No description provided for @errorFailedToDelete.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete.'**
  String get errorFailedToDelete;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @syncingCuratedFeed.
  ///
  /// In en, this message translates to:
  /// **'SYNCING CURATED FEED...'**
  String get syncingCuratedFeed;

  /// No description provided for @actionTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get actionTryAgain;

  /// No description provided for @tooltipSetAsListCover.
  ///
  /// In en, this message translates to:
  /// **'Set as list cover on Home Page'**
  String get tooltipSetAsListCover;

  /// No description provided for @coverUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Cover updated!'**
  String get coverUpdatedSuccess;

  /// No description provided for @errorUpdatingCover.
  ///
  /// In en, this message translates to:
  /// **'Error updating cover.'**
  String get errorUpdatingCover;

  /// No description provided for @loaderLoadingProfile.
  ///
  /// In en, this message translates to:
  /// **'LOADING PROFILE...'**
  String get loaderLoadingProfile;

  /// No description provided for @loaderRetrievingVoteLogs.
  ///
  /// In en, this message translates to:
  /// **'RETRIEVING VOTE LOGS...'**
  String get loaderRetrievingVoteLogs;

  /// No description provided for @loaderLoadingRecentVotes.
  ///
  /// In en, this message translates to:
  /// **'LOADING RECENT VOTES...'**
  String get loaderLoadingRecentVotes;

  /// No description provided for @loaderFetchingData.
  ///
  /// In en, this message translates to:
  /// **'FETCHING DATA...'**
  String get loaderFetchingData;

  /// No description provided for @loaderLoadingTrackedBills.
  ///
  /// In en, this message translates to:
  /// **'LOADING TRACKED BILLS...'**
  String get loaderLoadingTrackedBills;

  /// No description provided for @emptyTrackedBills.
  ///
  /// In en, this message translates to:
  /// **'You are not tracking any bills yet.'**
  String get emptyTrackedBills;

  /// No description provided for @notificationsMobileOnly.
  ///
  /// In en, this message translates to:
  /// **'Notifications are available only in mobile app.'**
  String get notificationsMobileOnly;

  /// No description provided for @titleYourTrackedBills.
  ///
  /// In en, this message translates to:
  /// **'Your Tracked Bills'**
  String get titleYourTrackedBills;

  /// No description provided for @buttonSeeAllTracked.
  ///
  /// In en, this message translates to:
  /// **'See all tracked'**
  String get buttonSeeAllTracked;

  /// No description provided for @titleNameYourList.
  ///
  /// In en, this message translates to:
  /// **'Name your List'**
  String get titleNameYourList;

  /// No description provided for @hintEgMySocialPolicies.
  ///
  /// In en, this message translates to:
  /// **'e.g. My Social Policies'**
  String get hintEgMySocialPolicies;

  /// No description provided for @snackbarListCreated.
  ///
  /// In en, this message translates to:
  /// **'List \'{text}\' created!'**
  String snackbarListCreated(String text);

  /// No description provided for @snackbarFailedToCreateList.
  ///
  /// In en, this message translates to:
  /// **'Failed to create list.'**
  String get snackbarFailedToCreateList;

  /// No description provided for @buttonCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get buttonCreate;

  /// No description provided for @titleRenameYourList.
  ///
  /// In en, this message translates to:
  /// **'Rename Your List'**
  String get titleRenameYourList;

  /// No description provided for @snackbarListRenamed.
  ///
  /// In en, this message translates to:
  /// **'List renamed!'**
  String get snackbarListRenamed;

  /// No description provided for @snackbarFailedToRenameList.
  ///
  /// In en, this message translates to:
  /// **'Failed to rename list.'**
  String get snackbarFailedToRenameList;

  /// No description provided for @buttonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get buttonSave;

  /// No description provided for @titleYourLists.
  ///
  /// In en, this message translates to:
  /// **'Your Lists'**
  String get titleYourLists;

  /// No description provided for @emptyNoListsYet.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any lists yet.'**
  String get emptyNoListsYet;

  /// No description provided for @tooltipRename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get tooltipRename;

  /// No description provided for @snackbarErrorUpdatingList.
  ///
  /// In en, this message translates to:
  /// **'Error updating list.'**
  String get snackbarErrorUpdatingList;

  /// No description provided for @tooltipShareList.
  ///
  /// In en, this message translates to:
  /// **'Share List'**
  String get tooltipShareList;

  /// No description provided for @buttonCreateNewList.
  ///
  /// In en, this message translates to:
  /// **'Create New List'**
  String get buttonCreateNewList;

  /// No description provided for @errorLimitOf3ListsReached.
  ///
  /// In en, this message translates to:
  /// **'Limit of 3 lists reached.'**
  String get errorLimitOf3ListsReached;

  /// No description provided for @snackbarFailedToDelete.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete.'**
  String get snackbarFailedToDelete;

  /// No description provided for @loaderFetchingMirrorParliamentData.
  ///
  /// In en, this message translates to:
  /// **'FETCHING MIRROR PARLIAMENT DATA...'**
  String get loaderFetchingMirrorParliamentData;

  /// No description provided for @loaderSecuringSafeChannel.
  ///
  /// In en, this message translates to:
  /// **'SECURING SAFE CHANNEL...'**
  String get loaderSecuringSafeChannel;

  /// No description provided for @snackbarAddedToList.
  ///
  /// In en, this message translates to:
  /// **'Added to your list.'**
  String get snackbarAddedToList;

  /// No description provided for @snackbarRemovedFromList.
  ///
  /// In en, this message translates to:
  /// **'Removed from your list.'**
  String get snackbarRemovedFromList;

  /// No description provided for @loaderLoadingData.
  ///
  /// In en, this message translates to:
  /// **'LOADING DATA...'**
  String get loaderLoadingData;

  /// No description provided for @buttonAddToList.
  ///
  /// In en, this message translates to:
  /// **'Add to List'**
  String get buttonAddToList;

  /// No description provided for @previousStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Previously:'**
  String get previousStatusLabel;

  /// No description provided for @statusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status:'**
  String get statusLabel;

  /// No description provided for @loaderEstablishingConnection.
  ///
  /// In en, this message translates to:
  /// **'ESTABLISHING CONNECTION...'**
  String get loaderEstablishingConnection;

  /// No description provided for @loaderFetchingInitiatives.
  ///
  /// In en, this message translates to:
  /// **'FETCHING INITIATIVES...'**
  String get loaderFetchingInitiatives;

  /// No description provided for @loaderLoadingMoreInitiatives.
  ///
  /// In en, this message translates to:
  /// **'LOADING MORE INITIATIVES...'**
  String get loaderLoadingMoreInitiatives;

  /// No description provided for @loaderLoadingMore.
  ///
  /// In en, this message translates to:
  /// **'LOADING MORE...'**
  String get loaderLoadingMore;

  /// No description provided for @errorMustBeLoggedInToTrack.
  ///
  /// In en, this message translates to:
  /// **'You must be logged in to track bills. Notifications are available only on mobile apps. Create an account.'**
  String get errorMustBeLoggedInToTrack;

  /// No description provided for @loaderLoadingYourTrackedList.
  ///
  /// In en, this message translates to:
  /// **'LOADING YOUR TRACKED LIST...'**
  String get loaderLoadingYourTrackedList;

  /// No description provided for @emptyNotTrackingAnything.
  ///
  /// In en, this message translates to:
  /// **'You are not tracking anything yet.'**
  String get emptyNotTrackingAnything;

  /// No description provided for @loaderLoadingLegislativeData.
  ///
  /// In en, this message translates to:
  /// **'LOADING LEGISLATIVE DATA...'**
  String get loaderLoadingLegislativeData;

  /// No description provided for @loaderAuthorizing.
  ///
  /// In en, this message translates to:
  /// **'AUTHORIZING...'**
  String get loaderAuthorizing;

  /// No description provided for @loaderLoading.
  ///
  /// In en, this message translates to:
  /// **'LOADING...'**
  String get loaderLoading;

  /// No description provided for @snackbarLinkCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied to clipboard!'**
  String get snackbarLinkCopied;

  /// No description provided for @civicWillRecord.
  ///
  /// In en, this message translates to:
  /// **'CIVIC WILL RECORD'**
  String get civicWillRecord;

  /// No description provided for @totalVotesRecorded.
  ///
  /// In en, this message translates to:
  /// **'{totalVotes} RECORDED VOTES'**
  String totalVotesRecorded(String totalVotes);

  /// No description provided for @recordYourPositionForAudit.
  ///
  /// In en, this message translates to:
  /// **'Record your position for audit.'**
  String get recordYourPositionForAudit;

  /// No description provided for @privateList.
  ///
  /// In en, this message translates to:
  /// **'Private List'**
  String get privateList;

  /// No description provided for @loaderLoadingCuratedFeed.
  ///
  /// In en, this message translates to:
  /// **'LOADING CURATED FEED...'**
  String get loaderLoadingCuratedFeed;

  /// No description provided for @buttonOpenFullList.
  ///
  /// In en, this message translates to:
  /// **'Open Full List'**
  String get buttonOpenFullList;

  /// No description provided for @filtersLabel.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filtersLabel;

  /// No description provided for @statusFilterLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get statusFilterLabel;

  /// No description provided for @onlyWithSourceTextLabel.
  ///
  /// In en, this message translates to:
  /// **'Only with source text'**
  String get onlyWithSourceTextLabel;

  /// No description provided for @trackedBillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Tracked Bills'**
  String get trackedBillsTitle;

  /// No description provided for @curatedListTitle.
  ///
  /// In en, this message translates to:
  /// **'Private List'**
  String get curatedListTitle;

  /// No description provided for @loaderLoadingProfiles.
  ///
  /// In en, this message translates to:
  /// **'LOADING PROFILES...'**
  String get loaderLoadingProfiles;

  /// No description provided for @loaderLoadingMoreProfiles.
  ///
  /// In en, this message translates to:
  /// **'LOADING MORE PROFILES...'**
  String get loaderLoadingMoreProfiles;

  /// No description provided for @loaderInitializingMirrorParliament.
  ///
  /// In en, this message translates to:
  /// **'INITIALIZING MIRROR PARLIAMENT...'**
  String get loaderInitializingMirrorParliament;

  /// No description provided for @loaderSyncingVectors.
  ///
  /// In en, this message translates to:
  /// **'SYNCING VECTORS...'**
  String get loaderSyncingVectors;

  /// No description provided for @reportIncludeDiagnosticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Include system diagnostics'**
  String get reportIncludeDiagnosticsTitle;

  /// No description provided for @reportIncludeDiagnosticsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Attaches active state (Parliament, Term, Target) to help us patch the issue.'**
  String get reportIncludeDiagnosticsSubtitle;

  /// No description provided for @loaderSendingReport.
  ///
  /// In en, this message translates to:
  /// **'SENDING REPORT...'**
  String get loaderSendingReport;

  /// No description provided for @primaryParliamentLabel.
  ///
  /// In en, this message translates to:
  /// **'Primary: {parliament}'**
  String primaryParliamentLabel(String parliament);

  /// No description provided for @buttonCreateAnotherList.
  ///
  /// In en, this message translates to:
  /// **'Create Another List'**
  String get buttonCreateAnotherList;

  /// No description provided for @buttonCreateTrackingList.
  ///
  /// In en, this message translates to:
  /// **'Create Tracking List'**
  String get buttonCreateTrackingList;

  /// No description provided for @errorMissingListId.
  ///
  /// In en, this message translates to:
  /// **'Error: Missing List ID'**
  String get errorMissingListId;

  /// No description provided for @actionTracked.
  ///
  /// In en, this message translates to:
  /// **'Tracked'**
  String get actionTracked;

  /// No description provided for @actionTrack.
  ///
  /// In en, this message translates to:
  /// **'Track'**
  String get actionTrack;

  /// No description provided for @pollSupportPercent.
  ///
  /// In en, this message translates to:
  /// **'SUPPORT {percent}%'**
  String pollSupportPercent(String percent);

  /// No description provided for @pollSyncing.
  ///
  /// In en, this message translates to:
  /// **'SYNCING...'**
  String get pollSyncing;

  /// No description provided for @pollOpposePercent.
  ///
  /// In en, this message translates to:
  /// **'OPPOSE {percent}%'**
  String pollOpposePercent(String percent);

  /// No description provided for @pollPositionRecorded.
  ///
  /// In en, this message translates to:
  /// **'POSITION RECORDED'**
  String get pollPositionRecorded;

  /// No description provided for @pollRestrictedToCitizens.
  ///
  /// In en, this message translates to:
  /// **'RESTRICTED TO CITIZENS OF COUNTRY'**
  String get pollRestrictedToCitizens;

  /// No description provided for @yourListsForCountry.
  ///
  /// In en, this message translates to:
  /// **'Your Lists ({countryName})'**
  String yourListsForCountry(String countryName);

  /// No description provided for @bottomNavGetInvolved.
  ///
  /// In en, this message translates to:
  /// **'Get Involved'**
  String get bottomNavGetInvolved;

  /// No description provided for @errorLaunchUrl.
  ///
  /// In en, this message translates to:
  /// **'Could not launch link'**
  String get errorLaunchUrl;

  /// No description provided for @infoTechTitle.
  ///
  /// In en, this message translates to:
  /// **'How Technology Works'**
  String get infoTechTitle;

  /// No description provided for @infoTechSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn about our architecture, data sterilization, and civic tech principles.'**
  String get infoTechSubtitle;

  /// No description provided for @infoGovTitle.
  ///
  /// In en, this message translates to:
  /// **'Transparency & Governance'**
  String get infoGovTitle;

  /// No description provided for @infoGovSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Who builds this, who pays for it, and where we are heading.'**
  String get infoGovSubtitle;

  /// No description provided for @infoPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Constitution & Privacy'**
  String get infoPrivacyTitle;

  /// No description provided for @infoPrivacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Radical transparency. Exactly what data we collect and why.'**
  String get infoPrivacySubtitle;

  /// No description provided for @manualTitle.
  ///
  /// In en, this message translates to:
  /// **'Open Citizens\' Manual'**
  String get manualTitle;

  /// No description provided for @manualSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn how to reclaim agency in democracy.'**
  String get manualSubtitle;

  /// No description provided for @howToActTitle.
  ///
  /// In en, this message translates to:
  /// **'How to act with Lustra'**
  String get howToActTitle;

  /// No description provided for @actAuditTitle.
  ///
  /// In en, this message translates to:
  /// **'Civic Audit'**
  String get actAuditTitle;

  /// No description provided for @actAuditSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Vote on policies and bills to shape the hierarchy of topics in your government and leave solid evidence of Citizens\' Will. Don\'t let media steer off the conversation ever again.'**
  String get actAuditSubtitle;

  /// No description provided for @actWatchlistTitle.
  ///
  /// In en, this message translates to:
  /// **'Curated Watchlists'**
  String get actWatchlistTitle;

  /// No description provided for @actWatchlistSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create custom lists of official bills and civic projects to gather subscribers and increase awareness. Use existing social media as lobbying power.'**
  String get actWatchlistSubtitle;

  /// No description provided for @actDraftTitle.
  ///
  /// In en, this message translates to:
  /// **'Draft Civic Bills'**
  String get actDraftTitle;

  /// No description provided for @actDraftSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Submit your own professional initiatives directly to Lustra. Modern society needs new ideas that are not gatekeeped by capital. Create, share and collect support.'**
  String get actDraftSubtitle;

  /// No description provided for @joinCommunityTitle.
  ///
  /// In en, this message translates to:
  /// **'Join the Community'**
  String get joinCommunityTitle;

  /// No description provided for @subscribedLists.
  ///
  /// In en, this message translates to:
  /// **'Subscribed'**
  String get subscribedLists;

  /// No description provided for @snackbarAddedToListWebPromo.
  ///
  /// In en, this message translates to:
  /// **'Added! Download our app to get push notifications about this bill.'**
  String get snackbarAddedToListWebPromo;

  /// No description provided for @aboutGovAppBar.
  ///
  /// In en, this message translates to:
  /// **'Governance'**
  String get aboutGovAppBar;

  /// No description provided for @aboutGovTitle.
  ///
  /// In en, this message translates to:
  /// **'Transparency & Governance'**
  String get aboutGovTitle;

  /// No description provided for @aboutGovSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Who builds this, who pays for it, and where we are heading.'**
  String get aboutGovSubtitle;

  /// No description provided for @aboutGovFounderName.
  ///
  /// In en, this message translates to:
  /// **'Jacek (Fons)'**
  String get aboutGovFounderName;

  /// No description provided for @aboutGovFounderBadge.
  ///
  /// In en, this message translates to:
  /// **'SOLO ARCHITECT / FOUNDER'**
  String get aboutGovFounderBadge;

  /// No description provided for @aboutGovFounderP1.
  ///
  /// In en, this message translates to:
  /// **'I am not a politician, a lawyer, or an academic. I don\'t have formal credentials. 18 months ago, I was working cleaning jobs. I spent the whole 2025 unemployed, building this system from scratch on a 2016 laptop.'**
  String get aboutGovFounderP1;

  /// No description provided for @aboutGovFounderP2.
  ///
  /// In en, this message translates to:
  /// **'Why? Because I was frustrated that billionaires and corporations have better data tools than citizens. I was frustrated with the gatekeeping the law from citizens and narrative wars deployed by media, that either alienate people from politics or make them choose a camp. I taught myself everything to build a Mirror Parliament. I don\'t believe in online petitions; I believe in data-driven, hard transparency and accessibility. And that democracy needs an update.'**
  String get aboutGovFounderP2;

  /// No description provided for @aboutGovFounderP3.
  ///
  /// In en, this message translates to:
  /// **'You might ask, \"Why should I trust you?\" Don\'t trust anyone, especially with politics - start auditing.'**
  String get aboutGovFounderP3;

  /// No description provided for @aboutGovSec1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Funding & Infrastructure'**
  String get aboutGovSec1Title;

  /// No description provided for @aboutGovSec1Intro.
  ///
  /// In en, this message translates to:
  /// **'There is no VC. There is no dark money. There is no crypto. Currently, this operation is entirely bootstrapped.'**
  String get aboutGovSec1Intro;

  /// No description provided for @aboutGovSec1Bullet1Title.
  ///
  /// In en, this message translates to:
  /// **'Infrastructure:'**
  String get aboutGovSec1Bullet1Title;

  /// No description provided for @aboutGovSec1Bullet1Text.
  ///
  /// In en, this message translates to:
  /// **'Covered by a \$2,000 credit grant from the Google For Startups program. We currently have around \$1,200 left, which gives us approximately 12 months of server runway.'**
  String get aboutGovSec1Bullet1Text;

  /// No description provided for @aboutGovSec1Bullet2Title.
  ///
  /// In en, this message translates to:
  /// **'Living costs:'**
  String get aboutGovSec1Bullet2Title;

  /// No description provided for @aboutGovSec1Bullet2Text.
  ///
  /// In en, this message translates to:
  /// **'Supported entirely by my personal savings, my fiance, and my family.'**
  String get aboutGovSec1Bullet2Text;

  /// No description provided for @aboutGovSec1Bullet3Title.
  ///
  /// In en, this message translates to:
  /// **'Tech Stack:'**
  String get aboutGovSec1Bullet3Title;

  /// No description provided for @aboutGovSec1Bullet3Text.
  ///
  /// In en, this message translates to:
  /// **'Built alone (Flutter, Firebase, Vertex AI pipeline, Node.js) to keep operational costs close to zero.'**
  String get aboutGovSec1Bullet3Text;

  /// No description provided for @aboutGovSec2Title.
  ///
  /// In en, this message translates to:
  /// **'2. Current Legal Entity & The Transition'**
  String get aboutGovSec2Title;

  /// No description provided for @aboutGovSec2P1.
  ///
  /// In en, this message translates to:
  /// **'Lustra is currently incubating under my old Polish LLC (FO&WO VENTURES SP. Z O.O.). This is a legal necessity. To publish on Apple/Google App Stores and to receive the Google Startup credits, a registered company with a DUNS number is required. I cannot afford the legal fees to start a Foundation yet (\$500+ setup and monthly accounting), so I use the leanest vehicle possible.'**
  String get aboutGovSec2P1;

  /// No description provided for @aboutGovSec2BoxTitle.
  ///
  /// In en, this message translates to:
  /// **'The Roadmap to Non-Profit:'**
  String get aboutGovSec2BoxTitle;

  /// No description provided for @aboutGovSec2BoxText.
  ///
  /// In en, this message translates to:
  /// **'As soon as we reach financial liquidity and critical mass (approx. 100k monthly users), I plan to open a formal Non-Profit Organization and transfer all intellectual property and infrastructure there.'**
  String get aboutGovSec2BoxText;

  /// No description provided for @aboutGovSec2P2.
  ///
  /// In en, this message translates to:
  /// **'The ultimate goal is a democratic governance structure. Decisions will be made by a board elected by the community. My role will be strictly limited to technical backend maintenance. I do not see any other future for Lustra than a non-profit operation with full transparency of all financial documents.'**
  String get aboutGovSec2P2;

  /// No description provided for @aboutGovSec3Title.
  ///
  /// In en, this message translates to:
  /// **'3. Security & Source Code'**
  String get aboutGovSec3Title;

  /// No description provided for @aboutGovSec3Bullet1Title.
  ///
  /// In en, this message translates to:
  /// **'Authentication:'**
  String get aboutGovSec3Bullet1Title;

  /// No description provided for @aboutGovSec3Bullet1Text.
  ///
  /// In en, this message translates to:
  /// **'We don\'t touch your passwords. We use Google/Apple Auth because their security infrastructure is superior. We only store an anonymized User ID and your Vote ID to prevent bot farms.'**
  String get aboutGovSec3Bullet1Text;

  /// No description provided for @aboutGovSec3Bullet2Title.
  ///
  /// In en, this message translates to:
  /// **'Source Available:'**
  String get aboutGovSec3Bullet2Title;

  /// No description provided for @aboutGovSec3Bullet2Text.
  ///
  /// In en, this message translates to:
  /// **'The core repositories are public under the PolyForm Noncommercial License. It is protected against corporate cloning, but the data adapters, AI system prompts, and logic are fully visible for audit.'**
  String get aboutGovSec3Bullet2Text;

  /// No description provided for @aboutGovSec3BoxTitle.
  ///
  /// In en, this message translates to:
  /// **'We need help.'**
  String get aboutGovSec3BoxTitle;

  /// No description provided for @aboutGovSec3BoxText.
  ///
  /// In en, this message translates to:
  /// **'I am one guy with an old laptop, doing everything. If you are a developer, a journalist, or a citizen who wants to help establish local cells in your country—reach out.'**
  String get aboutGovSec3BoxText;

  /// No description provided for @aboutGovSec3Contact.
  ///
  /// In en, this message translates to:
  /// **'Contact: jacek@lustra.dev'**
  String get aboutGovSec3Contact;

  /// No description provided for @aboutGovSec3Github.
  ///
  /// In en, this message translates to:
  /// **'GitHub Profile'**
  String get aboutGovSec3Github;

  /// No description provided for @termsAppBar.
  ///
  /// In en, this message translates to:
  /// **'Constitution & Privacy'**
  String get termsAppBar;

  /// No description provided for @termsTitle.
  ///
  /// In en, this message translates to:
  /// **'Constitution & Privacy'**
  String get termsTitle;

  /// No description provided for @termsLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: March 12, 2026'**
  String get termsLastUpdated;

  /// No description provided for @termsAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Radical Transparency: What we actually collect'**
  String get termsAlertTitle;

  /// No description provided for @termsAlertP1.
  ///
  /// In en, this message translates to:
  /// **'You might be thinking: \"I\'m not giving some randoms my data.\" We agree. That\'s why we don\'t want your personal life. We only want to verify that you are a real human voting on real laws.'**
  String get termsAlertP1;

  /// No description provided for @termsAlertP2.
  ///
  /// In en, this message translates to:
  /// **'Here is the exact data structure we store for your user profile in our Google Cloud Firestore database. No hidden fields. No tracking cookies.'**
  String get termsAlertP2;

  /// No description provided for @termsAlertCode.
  ///
  /// In en, this message translates to:
  /// **'[\n  \'uid\': \'0A21rfdsTs1F3kYsx3252352\', // Generated by Firebase Auth\n  \'email\': \'citizen@example.com\', // Your only Personal Data\n  \'createdAt\': \'February 15, 2026 at 8:23:31 PM UTC\',\n  \'marketingConsent\': true, // For project updates (optional)\n  \'primaryParliamentId\': \'United States Congress\'\n]'**
  String get termsAlertCode;

  /// No description provided for @termsAlertH4.
  ///
  /// In en, this message translates to:
  /// **'Wait, where are my votes and tracked bills?'**
  String get termsAlertH4;

  /// No description provided for @termsAlertP3.
  ///
  /// In en, this message translates to:
  /// **'To protect your privacy and ensure our database scales efficiently, your interactions are sharded (separated) from your main profile:'**
  String get termsAlertP3;

  /// No description provided for @termsAlertB1Title.
  ///
  /// In en, this message translates to:
  /// **'Tracked Bills:'**
  String get termsAlertB1Title;

  /// No description provided for @termsAlertB1Text.
  ///
  /// In en, this message translates to:
  /// **'Stored in a private sub-collection. Only you (and your device) can request to see the list of bills you are tracking.'**
  String get termsAlertB1Text;

  /// No description provided for @termsAlertB2Title.
  ///
  /// In en, this message translates to:
  /// **'Your Votes (Cryptographic Hashing):'**
  String get termsAlertB2Title;

  /// No description provided for @termsAlertB2Text.
  ///
  /// In en, this message translates to:
  /// **'When you vote, we DO NOT attach your UID directly to the public vote record. Instead, the server generates a cryptographic Hash (e.g., a1b2c3d4...) using a secret server salt. This strongly pseudonymizes your vote. If a hacker steals the database, they cannot see who voted for what. While it is mathematically a one-way function, in the spirit of absolute transparency, you should know that the system operators (who hold the secret salt) could theoretically verify a vote to audit the system for fraud or comply with a valid court order. However, your votes are strictly separated from your daily profile and never publicly displayed with your identity.'**
  String get termsAlertB2Text;

  /// No description provided for @termsAlertP4.
  ///
  /// In en, this message translates to:
  /// **'That\'s it. The rest is anonymous analytics (Firebase Analytics) to fix bugs, and App Check to prevent bot-farms from rigging the votes. We do not sell data. We do not run ads.'**
  String get termsAlertP4;

  /// No description provided for @termsTocTitle.
  ///
  /// In en, this message translates to:
  /// **'Table of Contents'**
  String get termsTocTitle;

  /// No description provided for @termsPart1Title.
  ///
  /// In en, this message translates to:
  /// **'Part 1: Privacy Policy (Data Minimization)'**
  String get termsPart1Title;

  /// No description provided for @termsPart1Intro.
  ///
  /// In en, this message translates to:
  /// **'We do not trade your attention. We collect only what is technically necessary to operate a secure civic infrastructure.'**
  String get termsPart1Intro;

  /// No description provided for @termsP1S1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Data Controller'**
  String get termsP1S1Title;

  /// No description provided for @termsP1S1Text.
  ///
  /// In en, this message translates to:
  /// **'The legal operator is temporarily FO&WO VENTURES SP. Z O.O. (LLC), based in Wrocław, Poland. Contact: jacek@lustra.dev'**
  String get termsP1S1Text;

  /// No description provided for @termsP1S2Title.
  ///
  /// In en, this message translates to:
  /// **'2. What We Collect'**
  String get termsP1S2Title;

  /// No description provided for @termsP1S2B1Title.
  ///
  /// In en, this message translates to:
  /// **'Account (Email/UID):'**
  String get termsP1S2B1Title;

  /// No description provided for @termsP1S2B1Text.
  ///
  /// In en, this message translates to:
  /// **'Necessary for secure login via Firebase Authentication.'**
  String get termsP1S2B1Text;

  /// No description provided for @termsP1S2B2Title.
  ///
  /// In en, this message translates to:
  /// **'Votes & Polls (Anonymized):'**
  String get termsP1S2B2Title;

  /// No description provided for @termsP1S2B2Text.
  ///
  /// In en, this message translates to:
  /// **'Your votes build the statistics. They are linked to your account purely to prevent bot farms and duplicate voting. Publicly, your votes are displayed ONLY as anonymous aggregates. The actual vote record is cryptographically hashed to separate your identity from your political choice.'**
  String get termsP1S2B2Text;

  /// No description provided for @termsP1S2B3Title.
  ///
  /// In en, this message translates to:
  /// **'Tracked Bills & Push Notifications:'**
  String get termsP1S2B3Title;

  /// No description provided for @termsP1S2B3Text.
  ///
  /// In en, this message translates to:
  /// **'If you choose to track a bill or subscribe to a Curated List, we use Google\'s Firebase Cloud Messaging (FCM) Topics. This allows us to send you push notifications about status changes without constantly tracking your location or device identity.'**
  String get termsP1S2B3Text;

  /// No description provided for @termsP1S2B4Title.
  ///
  /// In en, this message translates to:
  /// **'Vote Retention:'**
  String get termsP1S2B4Title;

  /// No description provided for @termsP1S2B4Text.
  ///
  /// In en, this message translates to:
  /// **'Voting data is stored for the duration of the parliamentary term plus 5 years for archival and research purposes.'**
  String get termsP1S2B4Text;

  /// No description provided for @termsP1S2B5Title.
  ///
  /// In en, this message translates to:
  /// **'Communication:'**
  String get termsP1S2B5Title;

  /// No description provided for @termsP1S2B5Text.
  ///
  /// In en, this message translates to:
  /// **'If you explicitly consent, we will send you project updates via email. You can withdraw consent at any time.'**
  String get termsP1S2B5Text;

  /// No description provided for @termsP1S2B6Title.
  ///
  /// In en, this message translates to:
  /// **'Citizen Projects:'**
  String get termsP1S2B6Title;

  /// No description provided for @termsP1S2B6Text.
  ///
  /// In en, this message translates to:
  /// **'Content of legislative drafts submitted by you is entirely public.'**
  String get termsP1S2B6Text;

  /// No description provided for @termsP1S2Highlight.
  ///
  /// In en, this message translates to:
  /// **'3. WHAT WE DO NOT DO:\n\n❌ We DO NOT sell data to data brokers.\n❌ We DO NOT use ad tracking.\n❌ We DO NOT profile you politically for commercial purposes.'**
  String get termsP1S2Highlight;

  /// No description provided for @termsP1S3Title.
  ///
  /// In en, this message translates to:
  /// **'4. Infrastructure & Security'**
  String get termsP1S3Title;

  /// No description provided for @termsP1S3B1Title.
  ///
  /// In en, this message translates to:
  /// **'Location:'**
  String get termsP1S3B1Title;

  /// No description provided for @termsP1S3B1Text.
  ///
  /// In en, this message translates to:
  /// **'Data is hosted securely on Google Cloud Platform, Europe-West9 (Paris).'**
  String get termsP1S3B1Text;

  /// No description provided for @termsP1S3B2Title.
  ///
  /// In en, this message translates to:
  /// **'Anti-Bot:'**
  String get termsP1S3B2Title;

  /// No description provided for @termsP1S3B2Text.
  ///
  /// In en, this message translates to:
  /// **'We use Firebase App Check to verify app authenticity and prevent automated manipulation.'**
  String get termsP1S3B2Text;

  /// No description provided for @termsP1S3B3Title.
  ///
  /// In en, this message translates to:
  /// **'AI Privacy:'**
  String get termsP1S3B3Title;

  /// No description provided for @termsP1S3B3Text.
  ///
  /// In en, this message translates to:
  /// **'We send only public government documents to AI models for summarization. Your private data NEVER goes to AI.'**
  String get termsP1S3B3Text;

  /// No description provided for @termsP1S4Title.
  ///
  /// In en, this message translates to:
  /// **'5. Children & Account Deletion'**
  String get termsP1S4Title;

  /// No description provided for @termsP1S4P1.
  ///
  /// In en, this message translates to:
  /// **'The service is intended for users 16+. We do not knowingly collect children\'s data.'**
  String get termsP1S4P1;

  /// No description provided for @termsP1S4P2.
  ///
  /// In en, this message translates to:
  /// **'To delete your data: Use the \"Delete Account\" button directly in the app settings to immediately remove your identifying data, email, and all your sub-collections from our servers.'**
  String get termsP1S4P2;

  /// No description provided for @termsP1S5Title.
  ///
  /// In en, this message translates to:
  /// **'6. Your Rights'**
  String get termsP1S5Title;

  /// No description provided for @termsP1S5Text.
  ///
  /// In en, this message translates to:
  /// **'Under GDPR, you have the right to access, rectify, delete, and object to the processing of your data. Contact us at the email provided above.'**
  String get termsP1S5Text;

  /// No description provided for @termsPart2Title.
  ///
  /// In en, this message translates to:
  /// **'Part 2: Community Rules (Terms of Service)'**
  String get termsPart2Title;

  /// No description provided for @termsP2S1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Operator and Mission'**
  String get termsP2S1Title;

  /// No description provided for @termsP2S1Text.
  ///
  /// In en, this message translates to:
  /// **'Lustra is a digital public infrastructure. The company acts as an incubator: it pays no dividends, has no external investors, and reinvests any revenue directly back into maintaining the infrastructure.'**
  String get termsP2S1Text;

  /// No description provided for @termsP2S2Title.
  ///
  /// In en, this message translates to:
  /// **'2. Code and License (Source Available)'**
  String get termsP2S2Title;

  /// No description provided for @termsP2S2Intro.
  ///
  /// In en, this message translates to:
  /// **'Lustra\'s code is a common good protected from corporate exploitation.'**
  String get termsP2S2Intro;

  /// No description provided for @termsP2S2B1Title.
  ///
  /// In en, this message translates to:
  /// **'Model:'**
  String get termsP2S2B1Title;

  /// No description provided for @termsP2S2B1Text.
  ///
  /// In en, this message translates to:
  /// **'PolyForm Noncommercial License.'**
  String get termsP2S2B1Text;

  /// No description provided for @termsP2S2B2Title.
  ///
  /// In en, this message translates to:
  /// **'Allowed:'**
  String get termsP2S2B2Title;

  /// No description provided for @termsP2S2B2Text.
  ///
  /// In en, this message translates to:
  /// **'Educational, research, and non-profit/civic use.'**
  String get termsP2S2B2Text;

  /// No description provided for @termsP2S2B3Title.
  ///
  /// In en, this message translates to:
  /// **'Prohibited:'**
  String get termsP2S2B3Title;

  /// No description provided for @termsP2S2B3Text.
  ///
  /// In en, this message translates to:
  /// **'Corporations cannot use or profit from our work without explicit community consent.'**
  String get termsP2S2B3Text;

  /// No description provided for @termsP2S3Title.
  ///
  /// In en, this message translates to:
  /// **'3. Governance Roadmap'**
  String get termsP2S3Title;

  /// No description provided for @termsP2S3Intro.
  ///
  /// In en, this message translates to:
  /// **'Our long-term goal is full decentralization.'**
  String get termsP2S3Intro;

  /// No description provided for @termsP2S3B1Title.
  ///
  /// In en, this message translates to:
  /// **'Current state:'**
  String get termsP2S3B1Title;

  /// No description provided for @termsP2S3B1Text.
  ///
  /// In en, this message translates to:
  /// **'The Founder acts as Lead Architect.'**
  String get termsP2S3B1Text;

  /// No description provided for @termsP2S3B2Title.
  ///
  /// In en, this message translates to:
  /// **'Soon:'**
  String get termsP2S3B2Title;

  /// No description provided for @termsP2S3B2Text.
  ///
  /// In en, this message translates to:
  /// **'Establishment of a Civic Board elected directly by the users.'**
  String get termsP2S3B2Text;

  /// No description provided for @termsP2S3B3Title.
  ///
  /// In en, this message translates to:
  /// **'Goal:'**
  String get termsP2S3B3Title;

  /// No description provided for @termsP2S3B3Text.
  ///
  /// In en, this message translates to:
  /// **'Implementing technical and legal mechanisms for the community to take control of the platform in case of mission betrayal.'**
  String get termsP2S3B3Text;

  /// No description provided for @termsP2S4Title.
  ///
  /// In en, this message translates to:
  /// **'4. Citizen Drafts Program (Law Incubator)'**
  String get termsP2S4Title;

  /// No description provided for @termsP2S4Intro.
  ///
  /// In en, this message translates to:
  /// **'We provide a space for citizens to write the laws.'**
  String get termsP2S4Intro;

  /// No description provided for @termsP2S4B1Title.
  ///
  /// In en, this message translates to:
  /// **'Procedure:'**
  String get termsP2S4B1Title;

  /// No description provided for @termsP2S4B1Text.
  ///
  /// In en, this message translates to:
  /// **'Drafts are submitted via form and verified formally by the Operator.'**
  String get termsP2S4B1Text;

  /// No description provided for @termsP2S4B2Title.
  ///
  /// In en, this message translates to:
  /// **'Public Domain:'**
  String get termsP2S4B2Title;

  /// No description provided for @termsP2S4B2Text.
  ///
  /// In en, this message translates to:
  /// **'By submitting a draft, you release it under the CC0 License (Public Domain). Law belongs to everyone.'**
  String get termsP2S4B2Text;

  /// No description provided for @termsP2S4B3Title.
  ///
  /// In en, this message translates to:
  /// **'Free Speech:'**
  String get termsP2S4B3Title;

  /// No description provided for @termsP2S4B3Text.
  ///
  /// In en, this message translates to:
  /// **'We do not judge opinions or political leanings. We only reject projects violating criminal law or inciting violence.'**
  String get termsP2S4B3Text;

  /// No description provided for @termsP2S4B4Title.
  ///
  /// In en, this message translates to:
  /// **'Verification:'**
  String get termsP2S4B4Title;

  /// No description provided for @termsP2S4B4Text.
  ///
  /// In en, this message translates to:
  /// **'You must be a citizen of the country where you submit a draft.'**
  String get termsP2S4B4Text;

  /// No description provided for @termsP2S5Title.
  ///
  /// In en, this message translates to:
  /// **'5. AI and Source Hierarchy'**
  String get termsP2S5Title;

  /// No description provided for @termsP2S5Text.
  ///
  /// In en, this message translates to:
  /// **'AI is a tool, not an oracle. AI helps navigate complex legal language but can make mistakes. The ultimate authority is ALWAYS the original PDF/XML document linked at the bottom of every summary in the app.'**
  String get termsP2S5Text;

  /// No description provided for @termsP2S6Title.
  ///
  /// In en, this message translates to:
  /// **'6. Safety & Final Provisions'**
  String get termsP2S6Title;

  /// No description provided for @termsP2S6Text.
  ///
  /// In en, this message translates to:
  /// **'Attacks on infrastructure, DDoS, and commercial scraping are strictly prohibited. Matters not regulated herein are decided by Polish law.'**
  String get termsP2S6Text;

  /// No description provided for @bpAppBar.
  ///
  /// In en, this message translates to:
  /// **'System Blueprint'**
  String get bpAppBar;

  /// No description provided for @bpTitle.
  ///
  /// In en, this message translates to:
  /// **'How We Reclaim Agency in Democracy With Mirror Parliament: Citizens\' Manual'**
  String get bpTitle;

  /// No description provided for @bpIntroBig.
  ///
  /// In en, this message translates to:
  /// **'The Big Picture: The current democratic system is a broken \"game of telephone.\" We fix the signal by plugging citizens directly into the legislative process via the Mirror Parliament (Lustra).'**
  String get bpIntroBig;

  /// No description provided for @bpIntroSmall.
  ///
  /// In en, this message translates to:
  /// **'Why it matters: Currently, we only vote every few years. Between elections, we have zero control. Lustra gives us a \"seat at the table\" every single day.'**
  String get bpIntroSmall;

  /// No description provided for @bpS1Title.
  ///
  /// In en, this message translates to:
  /// **'1. THE PROBLEM: A Broken Loop'**
  String get bpS1Title;

  /// No description provided for @bpS1P1.
  ///
  /// In en, this message translates to:
  /// **'Information flows one way and gets distorted.'**
  String get bpS1P1;

  /// No description provided for @bpS1Code.
  ///
  /// In en, this message translates to:
  /// **'Citizens elect politicians\n   ↓\nPoliticians form a Government\n   ↓\nMedia selectively interpret government actions\n   ↓\nCitizens receive feedback (distorted)'**
  String get bpS1Code;

  /// No description provided for @bpS1Highlight.
  ///
  /// In en, this message translates to:
  /// **'Result: We don\'t know what\'s really happening because of legal jargon and media noise.'**
  String get bpS1Highlight;

  /// No description provided for @bpS2Title.
  ///
  /// In en, this message translates to:
  /// **'2. SOLUTION: Fixing The Flow of Information'**
  String get bpS2Title;

  /// No description provided for @bpS2P1.
  ///
  /// In en, this message translates to:
  /// **'Lustra removes the middlemen. It simulates a real seat of power where your voice is recorded on specific bills, not just general polls.'**
  String get bpS2P1;

  /// No description provided for @bpS2FlowMedia.
  ///
  /// In en, this message translates to:
  /// **'MEDIA (optional observer)'**
  String get bpS2FlowMedia;

  /// No description provided for @bpS2Flow1.
  ///
  /// In en, this message translates to:
  /// **'Citizens see a legal bill draft & rate it'**
  String get bpS2Flow1;

  /// No description provided for @bpS2Flow2.
  ///
  /// In en, this message translates to:
  /// **'Politicians see the result of the civic will'**
  String get bpS2Flow2;

  /// No description provided for @bpS2Flow3.
  ///
  /// In en, this message translates to:
  /// **'Politicians vote (monitored against the data)'**
  String get bpS2Flow3;

  /// No description provided for @bpS2Flow4.
  ///
  /// In en, this message translates to:
  /// **'Citizens check: Did the politician obey the data?'**
  String get bpS2Flow4;

  /// No description provided for @bpS2Flow5.
  ///
  /// In en, this message translates to:
  /// **'Citizens choose politicians based on their \"Obedience Score\"'**
  String get bpS2Flow5;

  /// No description provided for @bpS2Flow6.
  ///
  /// In en, this message translates to:
  /// **'A new Government is formed.'**
  String get bpS2Flow6;

  /// No description provided for @bpS2FlowLoop.
  ///
  /// In en, this message translates to:
  /// **'CYCLE REPEATS'**
  String get bpS2FlowLoop;

  /// No description provided for @bpS3Title.
  ///
  /// In en, this message translates to:
  /// **'3. HOW IT WORKS'**
  String get bpS3Title;

  /// No description provided for @bpS3ATitle.
  ///
  /// In en, this message translates to:
  /// **'Step A: Removing the Language Barrier (Translation)'**
  String get bpS3ATitle;

  /// No description provided for @bpS3AP1.
  ///
  /// In en, this message translates to:
  /// **'Most laws are boring and unreadable. Lustra fixes the Accessibility Gap.'**
  String get bpS3AP1;

  /// No description provided for @bpS3AP2.
  ///
  /// In en, this message translates to:
  /// **'Benefit: 20 seconds to understand the facts. No jargon.'**
  String get bpS3AP2;

  /// No description provided for @bpS3BTitle.
  ///
  /// In en, this message translates to:
  /// **'Step B: Knowledge Distribution (The News Card)'**
  String get bpS3BTitle;

  /// No description provided for @bpS3BP1.
  ///
  /// In en, this message translates to:
  /// **'Lustra doesn\'t need millions of users to work. It is enough that You are there.'**
  String get bpS3BP1;

  /// No description provided for @bpS3BList1Title.
  ///
  /// In en, this message translates to:
  /// **'Your action:'**
  String get bpS3BList1Title;

  /// No description provided for @bpS3BList1Text.
  ///
  /// In en, this message translates to:
  /// **'You enter, see a topic, and generate a News Card with one click.'**
  String get bpS3BList1Text;

  /// No description provided for @bpS3BList2Title.
  ///
  /// In en, this message translates to:
  /// **'Reach:'**
  String get bpS3BList2Title;

  /// No description provided for @bpS3BList2Text.
  ///
  /// In en, this message translates to:
  /// **'Auto-share to your social media (FB, X, IG, etc.).'**
  String get bpS3BList2Text;

  /// No description provided for @bpS3BList3Title.
  ///
  /// In en, this message translates to:
  /// **'Effect:'**
  String get bpS3BList3Title;

  /// No description provided for @bpS3BList3Text.
  ///
  /// In en, this message translates to:
  /// **'Your friends get a fact-checked \"ready meal\" without needing the app. You become an independent source of information.'**
  String get bpS3BList3Text;

  /// No description provided for @bpS3BExample.
  ///
  /// In en, this message translates to:
  /// **'Example:'**
  String get bpS3BExample;

  /// No description provided for @bpS3CTitle.
  ///
  /// In en, this message translates to:
  /// **'Step C: Reclaiming Agency (The Pressure)'**
  String get bpS3CTitle;

  /// No description provided for @bpS3CP1.
  ///
  /// In en, this message translates to:
  /// **'Politicians and corporations ignore \"internet storms\" because they are chaotic, easy to censor, and disappear quickly.'**
  String get bpS3CP1;

  /// No description provided for @bpS3CList1Title.
  ///
  /// In en, this message translates to:
  /// **'Solution:'**
  String get bpS3CList1Title;

  /// No description provided for @bpS3CList1Text.
  ///
  /// In en, this message translates to:
  /// **'Verified Social Polls. Your vote is attached to a specific legislative document ID.'**
  String get bpS3CList1Text;

  /// No description provided for @bpS3CList2Title.
  ///
  /// In en, this message translates to:
  /// **'Difference:'**
  String get bpS3CList2Title;

  /// No description provided for @bpS3CList2Text.
  ///
  /// In en, this message translates to:
  /// **'These are not petitions that expire. These are hard signatures with verified accounts.'**
  String get bpS3CList2Text;

  /// No description provided for @bpS3CP2.
  ///
  /// In en, this message translates to:
  /// **'If 50,000 people vote against a bill, hard proof of a lack of social support is created. This cannot be \"covered up\" by a TV narrative.'**
  String get bpS3CP2;

  /// No description provided for @bpS4Title.
  ///
  /// In en, this message translates to:
  /// **'4. CIVIC OFFENSIVE: We Write the Laws'**
  String get bpS4Title;

  /// No description provided for @bpS4P1.
  ///
  /// In en, this message translates to:
  /// **'Government ignoring a problem? We don\'t wait.'**
  String get bpS4P1;

  /// No description provided for @bpS4List1Title.
  ///
  /// In en, this message translates to:
  /// **'Civic Drafts:'**
  String get bpS4List1Title;

  /// No description provided for @bpS4List1Text.
  ///
  /// In en, this message translates to:
  /// **'We create our own bills and collect digital signatures.'**
  String get bpS4List1Text;

  /// No description provided for @bpS4List2Title.
  ///
  /// In en, this message translates to:
  /// **'The Trap:'**
  String get bpS4List2Title;

  /// No description provided for @bpS4List2Text.
  ///
  /// In en, this message translates to:
  /// **'If they reject a popular bill on technicalities, we apply amendments and re-submit it.'**
  String get bpS4List2Text;

  /// No description provided for @bpS4List3Title.
  ///
  /// In en, this message translates to:
  /// **'The Choice:'**
  String get bpS4List3Title;

  /// No description provided for @bpS4List3Text.
  ///
  /// In en, this message translates to:
  /// **'Ignoring a ready, popular solution proves bad faith. It gives the opposition a free weapon to take over the electorate.'**
  String get bpS4List3Text;

  /// No description provided for @bpS4CtaTitle.
  ///
  /// In en, this message translates to:
  /// **'Support these Civic Drafts NOW!'**
  String get bpS4CtaTitle;

  /// No description provided for @bpS4CtaP1.
  ///
  /// In en, this message translates to:
  /// **'Click below to review and vote on proposed legislation:'**
  String get bpS4CtaP1;

  /// No description provided for @bpS4Card1Title.
  ///
  /// In en, this message translates to:
  /// **'Epstein Class Defund Act'**
  String get bpS4Card1Title;

  /// No description provided for @bpS4Card1Desc.
  ///
  /// In en, this message translates to:
  /// **'Cuts public funding for figures involved in trafficking & human rights violations.'**
  String get bpS4Card1Desc;

  /// No description provided for @bpS4Card2Title.
  ///
  /// In en, this message translates to:
  /// **'Term Limits Amendment'**
  String get bpS4Card2Title;

  /// No description provided for @bpS4Card2Desc.
  ///
  /// In en, this message translates to:
  /// **'Establishes a strict cap on career length in Congress.'**
  String get bpS4Card2Desc;

  /// No description provided for @bpS4Card3Title.
  ///
  /// In en, this message translates to:
  /// **'Congressional Ethics Act'**
  String get bpS4Card3Title;

  /// No description provided for @bpS4Card3Desc.
  ///
  /// In en, this message translates to:
  /// **'Implements a Stock Trading Ban for active Congress members.'**
  String get bpS4Card3Desc;

  /// No description provided for @bpS5Title.
  ///
  /// In en, this message translates to:
  /// **'5. FINAL RESULT: Political Cleanse'**
  String get bpS5Title;

  /// No description provided for @bpS5P1.
  ///
  /// In en, this message translates to:
  /// **'No more hiding. The debate returns to where the people are: to social media, but on new rules. This is the fulfillment of the original promise of the internet that the system feared: decentralized control of power.'**
  String get bpS5P1;

  /// No description provided for @bpS5P2.
  ///
  /// In en, this message translates to:
  /// **'Mirror Parliament turns on the light in a dark room, we force TRANSPARENCY. A politician cannot lie that \"people want this\" when data shows otherwise. New laws serve the general public, not capital.'**
  String get bpS5P2;

  /// No description provided for @bpS5P3.
  ///
  /// In en, this message translates to:
  /// **'We are not asking politicians to change. We are creating a system where lying about public support becomes impossible. This is data-driven democracy.'**
  String get bpS5P3;

  /// No description provided for @bpS5Highlight.
  ///
  /// In en, this message translates to:
  /// **'This is an introduction to direct democracy, based on a conscious, informed voice, and not on emotions.'**
  String get bpS5Highlight;

  /// No description provided for @caAppBar.
  ///
  /// In en, this message translates to:
  /// **'Civic Audit'**
  String get caAppBar;

  /// No description provided for @caTitle.
  ///
  /// In en, this message translates to:
  /// **'Civic Audit: New System for Better Democracy'**
  String get caTitle;

  /// No description provided for @caIntro.
  ///
  /// In en, this message translates to:
  /// **'No one evaluates the law-making process besides a few people behind closed doors and the occasional rogue journalist exposing corruption. As a result, legislation frequently becomes derailed from civic needs, prioritizing political or corporate interests over societal adaptation. Our end goal is simple: a society voting on actual policies, not just electing singular politicians and hoping they keep their promises. Mirror Parliament was built to make this transition easy and achievable.'**
  String get caIntro;

  /// No description provided for @caS1Title.
  ///
  /// In en, this message translates to:
  /// **'How Civic Audit is Different from Petitions?'**
  String get caS1Title;

  /// No description provided for @caS1PetitionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Traditional Petitions'**
  String get caS1PetitionsTitle;

  /// No description provided for @caS1PetitionsText.
  ///
  /// In en, this message translates to:
  /// **'Petitions rarely work because of their elusive nature. After collecting signatures, the campaign ends. It’s essentially a polite advisory request towards a person in power. Because these are timed campaigns relying on a short media cycle, politicians can easily dismiss them. They just wait for the media to switch the narrative, and the petition is forgotten.'**
  String get caS1PetitionsText;

  /// No description provided for @caS1LustraTitle.
  ///
  /// In en, this message translates to:
  /// **'Lustra Civic Will'**
  String get caS1LustraTitle;

  /// No description provided for @caS1LustraText.
  ///
  /// In en, this message translates to:
  /// **'We don’t ask. In Lustra, your vote is not just a signature - it’s permanently anchored to a solid, official legislative ID. It marks your exact stance on a specific policy. All these votes combine to create the Civic Will: a real-time meter showing exactly how citizens evaluate a project, closing the Civic Audit loop.'**
  String get caS1LustraText;

  /// No description provided for @caS2Title.
  ///
  /// In en, this message translates to:
  /// **'Why Should Politicians Care?'**
  String get caS2Title;

  /// No description provided for @caS2Text.
  ///
  /// In en, this message translates to:
  /// **'Because they can no longer hide.\n\nWe record their every official vote in the government and benchmark it directly against the Civic Will. They can no longer lie that \"people want this\" just because they ran a clever media campaign. If they vote on something that benefits a lobby group instead of citizens, we find out immediately. The more people use Lustra to expose these gaps, the harder it becomes for politicians to manipulate the narrative. We recover control.'**
  String get caS2Text;

  /// No description provided for @caS3Title.
  ///
  /// In en, this message translates to:
  /// **'The Sweet Part: Asymmetric Power'**
  String get caS3Title;

  /// No description provided for @caS3P1.
  ///
  /// In en, this message translates to:
  /// **'We don’t need traditional media like lobbyists do. We don’t even need 5 million users inside the app to update democracy. We just need you.\n\nYou already have reach outside Lustra: on Facebook, TikTok, X, or elsewhere. We can finally turn social media into something meaningful. One user sharing a bill can easily generate 100-1,000 views with almost zero effort. That’s a small stadium of people learning about a crucial piece of law or a civic initiative.'**
  String get caS3P1;

  /// No description provided for @caS3MathSubtitle.
  ///
  /// In en, this message translates to:
  /// **'ASYMMETRIC WARFARE MATH'**
  String get caS3MathSubtitle;

  /// No description provided for @caS3P2.
  ///
  /// In en, this message translates to:
  /// **'Think about the math: an active corporate think tank or lobbying group might be 10-15 people whose only leverage is money to buy political favors. Your 10,000 verified votes from real citizens can overpower them. We can do exactly what lobbyists do, but faster, transparently, and with overwhelming numbers. Times have changed.'**
  String get caS3P2;

  /// No description provided for @caS4Title.
  ///
  /// In en, this message translates to:
  /// **'Who Controls the Feed? You Do.'**
  String get caS4Title;

  /// No description provided for @caS4Text.
  ///
  /// In en, this message translates to:
  /// **'Traditional media and Big Tech algorithms optimize for outrage to sell ads. Lustra’s algorithm is strictly democratic. We don\'t have editors deciding what is \"important.\" Our main feed automatically evaluates the last 30 days of legislation, isolates the top 5 bills with the highest civic engagement, and rotates them into the spotlight. Your votes dictate the hierarchy of information. You control the algorithm.'**
  String get caS4Text;

  /// No description provided for @caS5Title.
  ///
  /// In en, this message translates to:
  /// **'The Arsenal: How to Use \"Fact Cards\"'**
  String get caS5Title;

  /// No description provided for @caS5Intro.
  ///
  /// In en, this message translates to:
  /// **'Legislation is intentionally boring. It was never meant to be mainstream. That’s why the media creates emotional narratives around it to sell ads. You can create narratives too - but yours will be built on raw, summarized, verified data.\n\nLustra produces Fact Cards. Every time you click \"Share,\" it renders a clean image using official data. On its own, it’s just a fact. In social media, facts need to be explained. You are the explainer. Here is exactly how to use them to create viral, high-impact content:'**
  String get caS5Intro;

  /// No description provided for @caS5A_Title.
  ///
  /// In en, this message translates to:
  /// **'A/ The Hook (Create the Angle)'**
  String get caS5A_Title;

  /// No description provided for @caS5A_Text.
  ///
  /// In en, this message translates to:
  /// **'The easiest option is usually the most relatable. Did you find a new Internet Censorship Bill in the app? Don\'t overcomplicate it. Create a strong headline (a \"hook\"), tell people exactly how it affects them, and drop the direct link to the Lustra so they could vote.'**
  String get caS5A_Text;

  /// No description provided for @caS5B_Title.
  ///
  /// In en, this message translates to:
  /// **'B/ The Evidence (For Essays & Threads)'**
  String get caS5B_Title;

  /// No description provided for @caS5B_Text.
  ///
  /// In en, this message translates to:
  /// **'Images are great additions to longer posts or starters. Want to highlight critical flaws in a proposed bill or confront the government\'s official summary? Attach the Fact Card as undeniable proof. Let people read the sterilized data for themselves in 15 seconds.'**
  String get caS5B_Text;

  /// No description provided for @caS5C_Title.
  ///
  /// In en, this message translates to:
  /// **'C/ The Broadcast (TikTok/Reels)'**
  String get caS5C_Title;

  /// No description provided for @caS5C_Text.
  ///
  /// In en, this message translates to:
  /// **'Use the Fact Card image with a \"green screen\" effect on TikTok or Instagram. Put the Lustra data in the background and record yourself explaining the issue. It is the perfect, verifiable short-form content.'**
  String get caS5C_Text;

  /// No description provided for @caS5D_Title.
  ///
  /// In en, this message translates to:
  /// **'D/ The Network (Direct Messaging)'**
  String get caS5D_Title;

  /// No description provided for @caS5D_Text.
  ///
  /// In en, this message translates to:
  /// **'Just click share and send the image directly to your friends and family groups. Tell them clearly: \"This is what is currently going on in the government,\" or \"this is what media are silent about now.\"'**
  String get caS5D_Text;

  /// No description provided for @caS5Outro.
  ///
  /// In en, this message translates to:
  /// **'Content production is easy, and Lustra is your discovery engine. You are not just a user. You are an early adopter to the new era of democracy free from corruption. You have the same tools as a lobbyist – use them.'**
  String get caS5Outro;

  /// No description provided for @caSkepticTitle.
  ///
  /// In en, this message translates to:
  /// **'Skeptical about bot farms or data privacy?'**
  String get caSkepticTitle;

  /// No description provided for @caSkepticText.
  ///
  /// In en, this message translates to:
  /// **'Good. Don\'t trust our words - audit our system. Read exactly how we use cryptographic hashing, Firebase App Check, and the PolyForm Noncommercial License to protect your identity and the integrity of the Civic Will.'**
  String get caSkepticText;

  /// No description provided for @caSkepticBtnGov.
  ///
  /// In en, this message translates to:
  /// **'Transparency & Gov'**
  String get caSkepticBtnGov;

  /// No description provided for @caSkepticBtnPriv.
  ///
  /// In en, this message translates to:
  /// **'Constitution & Privacy'**
  String get caSkepticBtnPriv;

  /// No description provided for @clAppBar.
  ///
  /// In en, this message translates to:
  /// **'Watchlists'**
  String get clAppBar;

  /// No description provided for @clTitle.
  ///
  /// In en, this message translates to:
  /// **'Curated Watchlists: Decentralized Civic Media'**
  String get clTitle;

  /// No description provided for @clIntro.
  ///
  /// In en, this message translates to:
  /// **'Governments weaponize the sheer volume of legislation. They pass hundreds of pages of complex laws, often burying controversial acts behind boring titles or sneaking them through the \"backdoor\" while the media is distracted by the latest political scandal. Citizens lose track of the broader picture because it is physically impossible to monitor everything alone.'**
  String get clIntro;

  /// No description provided for @clS1Title.
  ///
  /// In en, this message translates to:
  /// **'Pattern Recognition & Mass Mobilization'**
  String get clS1Title;

  /// No description provided for @clS1P1.
  ///
  /// In en, this message translates to:
  /// **'Curated Watchlists allow you to organize the chaos and act as an independent information node. You can mix official government bills with grassroots civic drafts, group them by specific topics, and invite others to subscribe.'**
  String get clS1P1;

  /// No description provided for @clS1P2.
  ///
  /// In en, this message translates to:
  /// **'Crucially, a Watchlist acts as a multiplier for the Civic Audit. You are not rallying support for just one isolated bill. By grouping up to 80 items, your list becomes a dedicated, focused feed for your followers. They can enter your list and cast their votes across multiple bills in one session, mass-generating hard data and Civic Will for an entire sector of policy.'**
  String get clS1P2;

  /// No description provided for @clS2Title.
  ///
  /// In en, this message translates to:
  /// **'How to Use Watchlists as a Weapon:'**
  String get clS2Title;

  /// No description provided for @clS2A_Title.
  ///
  /// In en, this message translates to:
  /// **'Government Watchdogs'**
  String get clS2A_Title;

  /// No description provided for @clS2A_Text.
  ///
  /// In en, this message translates to:
  /// **'Notice the government trying to quietly pass a series of privacy-invading tech laws? Group them into a \"Digital Surveillance Watchlist.\" Show your subscribers the hidden agenda the media missed and let them vote against all of them in one place. Ask them to amplify it by sharing.'**
  String get clS2A_Text;

  /// No description provided for @clS2B_Title.
  ///
  /// In en, this message translates to:
  /// **'Platform for Reform'**
  String get clS2B_Title;

  /// No description provided for @clS2B_Text.
  ///
  /// In en, this message translates to:
  /// **'Don\'t just complain about the economy. Build a complete, multi-bill \"Economic Reform List\" mixing your own civic projects with official amendments. Present a fully structured political platform.'**
  String get clS2B_Text;

  /// No description provided for @clS2C_Title.
  ///
  /// In en, this message translates to:
  /// **'The Spotlight'**
  String get clS2C_Title;

  /// No description provided for @clS2C_Text.
  ///
  /// In en, this message translates to:
  /// **'You can pin a specific bill as the \"Favorite\" on your list to direct maximum civic attention and voting power exactly where it is needed most.'**
  String get clS2C_Text;

  /// No description provided for @clS3Title.
  ///
  /// In en, this message translates to:
  /// **'The Sweet Part: You Own the Broadcast'**
  String get clS3Title;

  /// No description provided for @clS3Text.
  ///
  /// In en, this message translates to:
  /// **'Social media algorithms constantly suppress external links to keep users scrolling. Lustra bypasses this. When people subscribe to your Watchlist, you bypass Big Tech entirely. You are given a manual \"Push\" button. Once every 24 hours, you can trigger a direct mobile notification to all your subscribers, alerting them to check your list because a critical vote is happening or a new bill was added. You control the distribution.'**
  String get clS3Text;

  /// No description provided for @clS4Title.
  ///
  /// In en, this message translates to:
  /// **'The Creator Economy for Democracy'**
  String get clS4Title;

  /// No description provided for @clS4Text.
  ///
  /// In en, this message translates to:
  /// **'Good curation is extremely valuable. Filtering political noise takes time and expertise. That is why Lustra allows you to attach your personal Tip Jar directly to your Watchlist. If you do the hard work of monitoring the government and educating the public, your subscribers can fund your efforts directly. We don\'t take a cut.'**
  String get clS4Text;

  /// No description provided for @clS5Title.
  ///
  /// In en, this message translates to:
  /// **'Deployment: How to Start'**
  String get clS5Title;

  /// No description provided for @clS5Intro.
  ///
  /// In en, this message translates to:
  /// **'This is not a passive feature. You must actively build it. Here is the exact instruction to deploy your first Watchlist:'**
  String get clS5Intro;

  /// No description provided for @clStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Step 1: Initialize'**
  String get clStep1Title;

  /// No description provided for @clStep1Text.
  ///
  /// In en, this message translates to:
  /// **'Navigate to the main screen and click the Gear Icon (Settings) in the top corner. Select the option to create your first Watchlist. Give it a clear title.'**
  String get clStep1Text;

  /// No description provided for @clStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Step 2: Curator Mode'**
  String get clStep2Title;

  /// No description provided for @clStep2Text.
  ///
  /// In en, this message translates to:
  /// **'Once your list is initialized, the system grants you Curator status. Now, browse the main feed. Inside the details screen of every bill or civic project, a new \"Add to list\" button will appear. Click it to inject that specific law directly into your list.'**
  String get clStep2Text;

  /// No description provided for @clStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Step 3: Feed Injection'**
  String get clStep3Title;

  /// No description provided for @clStep3Text.
  ///
  /// In en, this message translates to:
  /// **'Your Watchlist does not flood the main feed. Instead, the single bill you selected as the “Favorite\" acts as your ambassador. This single card is injected directly into your subscribers\' daily feeds, seamlessly interwoven with official government legislation. It is displayed with the exact same priority as official government laws. We place citizen oversight on equal footing with the state.'**
  String get clStep3Text;

  /// No description provided for @clLimitsTitle.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM LIMITS (SIGNAL OVER NOISE)'**
  String get clLimitsTitle;

  /// No description provided for @clLimit1Label.
  ///
  /// In en, this message translates to:
  /// **'AUTHORSHIP'**
  String get clLimit1Label;

  /// No description provided for @clLimit1Desc.
  ///
  /// In en, this message translates to:
  /// **'Max active lists per government (You can delete and redeploy new ones anytime).'**
  String get clLimit1Desc;

  /// No description provided for @clLimit2Label.
  ///
  /// In en, this message translates to:
  /// **'CAPACITY'**
  String get clLimit2Label;

  /// No description provided for @clLimit2Desc.
  ///
  /// In en, this message translates to:
  /// **'Max bills per list (More than enough to expose a pattern, strict enough to prevent information overload).'**
  String get clLimit2Desc;

  /// No description provided for @clLimit3Label.
  ///
  /// In en, this message translates to:
  /// **'SUBSCRIPTIONS'**
  String get clLimit3Label;

  /// No description provided for @clLimit3Desc.
  ///
  /// In en, this message translates to:
  /// **'Max lists you can observe from other creators.'**
  String get clLimit3Desc;

  /// No description provided for @clOutro.
  ///
  /// In en, this message translates to:
  /// **'Lustra is not a social network that generates free algorithmic reach for your list. Watchlists are invite-only. You must share your unique link externally. Bring your audience from X, YouTube, TikTok, or your newsletter. We do not give you followers; we give you the infrastructure to turn your existing followers into a verified, voting civic force - and a way to get directly funded for your hard work. Stop asking your audience for \"likes\". Give them a tool to act.'**
  String get clOutro;

  /// No description provided for @supportFundTitle.
  ///
  /// In en, this message translates to:
  /// **'Phase 1: Launch Non-Profit Entity'**
  String get supportFundTitle;

  /// No description provided for @supportFundDesc.
  ///
  /// In en, this message translates to:
  /// **'To officially open the Lustra Foundation, protect the intellectual property, and cover legal setup fees, we need to gather initial capital. Help us make this system independent forever.'**
  String get supportFundDesc;

  /// No description provided for @supportFundDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Data transparency: Due to different payment gateways and infrastructure costs, this progress bar is updated manually by the founder (max once a week).'**
  String get supportFundDisclaimer;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'it',
    'nl',
    'pl',
    'pt',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

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
  /// **'Popular Votes'**
  String get sectionPopularVotes;

  /// No description provided for @sectionUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get sectionUpcoming;

  /// No description provided for @sectionLegislationInProcess.
  ///
  /// In en, this message translates to:
  /// **'Legislation in Process'**
  String get sectionLegislationInProcess;

  /// No description provided for @sectionMpProfiles.
  ///
  /// In en, this message translates to:
  /// **'MP Profiles'**
  String get sectionMpProfiles;

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
  /// **'Citizen Poll'**
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
  /// **'No votes cast'**
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
  /// **'Separating Politics from Media'**
  String get infoTitle1;

  /// No description provided for @infoParagraph1.
  ///
  /// In en, this message translates to:
  /// **'Lustra is an application for tracking politics using official data. With AI technology, summaries of bills and voting results are presented concisely, clearly, and impartially. Following politics no longer requires effort or time - just a few clicks.'**
  String get infoParagraph1;

  /// No description provided for @infoTitle2.
  ///
  /// In en, this message translates to:
  /// **'Common Interests Above Divisions'**
  String get infoTitle2;

  /// No description provided for @infoParagraph2.
  ///
  /// In en, this message translates to:
  /// **'As a society, we share common goals like freedom, security, and prosperity. Differences in views are a natural part of democracy - they shape debate and allow for different perspectives. With access to reliable information, we can make more informed decisions and participate in public life based on facts, not emotions or media narratives.'**
  String get infoParagraph2;

  /// No description provided for @infoTitle3.
  ///
  /// In en, this message translates to:
  /// **'Deeds, Not Words'**
  String get infoTitle3;

  /// No description provided for @infoParagraph3.
  ///
  /// In en, this message translates to:
  /// **'You no longer have to trust election promises - you can review the voting history of individual MPs and analyze their decisions. Each politician\'s profile includes a bulleted list, enabling a quick and independent assessment of their record. The complete work history will be expanded as the application develops.'**
  String get infoParagraph3;

  /// No description provided for @infoTitle4.
  ///
  /// In en, this message translates to:
  /// **'People, Not Parties'**
  String get infoTitle4;

  /// No description provided for @infoParagraph4.
  ///
  /// In en, this message translates to:
  /// **'MPs should consider the interests of their constituents, not just vote along party lines. The party system divides society, but everything can be changed with small steps. The first is public awareness. Use the app, talk, share votes, participate in polls, and stay informed. Politics affects almost every aspect of our lives, so there\'s no reason for the few to decide everything.'**
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
  /// **'Support the Project'**
  String get supportScreenTitle;

  /// No description provided for @supportParagraph1.
  ///
  /// In en, this message translates to:
  /// **'Lustra is my personal pro bono project. The application will always be free, with no paid features, extensions, ads, or limitations. I believe everyone should have unrestricted access to accessible information - without opinionated commentary or filters. If you agree with the mission, I encourage you to support it with a donation of any amount. Every contribution, no matter how small, will help me maintain the app and develop it further.'**
  String get supportParagraph1;

  /// No description provided for @buttonSupportFinancially.
  ///
  /// In en, this message translates to:
  /// **'Support financially'**
  String get buttonSupportFinancially;

  /// No description provided for @supportThankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your trust and every form of engagement'**
  String get supportThankYou;

  /// No description provided for @creatorName.
  ///
  /// In en, this message translates to:
  /// **'Jacek Michałowski'**
  String get creatorName;

  /// No description provided for @creatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Application Creator'**
  String get creatorTitle;

  /// No description provided for @leaderboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Top Donors (Last Month)'**
  String get leaderboardTitle;

  /// No description provided for @futureFeaturesScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Future Features'**
  String get futureFeaturesScreenTitle;

  /// No description provided for @futureFeaturesHeader.
  ///
  /// In en, this message translates to:
  /// **'Planned Functionalities'**
  String get futureFeaturesHeader;

  /// No description provided for @futureFeatureReferendum.
  ///
  /// In en, this message translates to:
  /// **'Calling a referendum'**
  String get futureFeatureReferendum;

  /// No description provided for @futureFeatureSenate.
  ///
  /// In en, this message translates to:
  /// **'Senate and senators'**
  String get futureFeatureSenate;

  /// No description provided for @futureFeatureCitizenInitiative.
  ///
  /// In en, this message translates to:
  /// **'Citizen\'s legislative initiative - bill projects'**
  String get futureFeatureCitizenInitiative;

  /// No description provided for @futureFeatureIndependentCandidates.
  ///
  /// In en, this message translates to:
  /// **'Independent candidates for parliament'**
  String get futureFeatureIndependentCandidates;

  /// No description provided for @futureFeaturePetitions.
  ///
  /// In en, this message translates to:
  /// **'Petitions to the parliament'**
  String get futureFeaturePetitions;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Soon'**
  String get comingSoon;

  /// No description provided for @legislationScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Finished - {parliamentName}'**
  String legislationScreenTitle(String parliamentName);

  /// No description provided for @refreshDataTooltip.
  ///
  /// In en, this message translates to:
  /// **'Refresh data'**
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
  /// **'MP mandate: active'**
  String get mandateStatusActive;

  /// No description provided for @mandateStatusFulfilled.
  ///
  /// In en, this message translates to:
  /// **'MP mandate: fulfilled'**
  String get mandateStatusFulfilled;

  /// No description provided for @mandateStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'MP mandate: cancelled'**
  String get mandateStatusCancelled;

  /// No description provided for @mandateStatusInactive.
  ///
  /// In en, this message translates to:
  /// **'MP mandate: inactive'**
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
  /// **'no votes'**
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
  /// **'...full details are available in the Lustra app'**
  String get morePointsInApp;

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

  /// No description provided for @termsOfServiceContent.
  ///
  /// In en, this message translates to:
  /// **'<b>\"Lustra\" App Terms of Service</b>\n\nLast updated: August 10, 2025\n\nHi! This is the creator of the Lustra app.\nI\'m glad you\'re here. I created Lustra because I believe that every one of us deserves simple and transparent access to information about how the laws that affect our lives are made.\n\nThis document is the terms of service – a kind of agreement between you and me. I wrote it in plain language so you know exactly what the rules of the app are. Please read it carefully. By using Lustra, you confirm that you accept these rules.\n\n<b>1. Glossary, i.e., who and what we\'re talking about</b>\n•\t<b>I, my, me</b> – that\'s me, Jacek, the app\'s creator, operating under the company FO&WO VENTURES SP. Z O.O. based in Wrocław.\n•\t<b>You, your</b> – that\'s you, the person using the app.\n•\t<b>App</b> or <b>Lustra</b> – the mobile application \"Lustra\" you are currently using.\n•\t<b>Account</b> – your personal account in the app, which you can create to use additional features.\n•\t<b>Terms</b> – this very document.\n\n<b>2. What is Lustra about? (Main principles)</b>\n•\tLustra is a free app aimed at providing you with accessible information about legislative processes in selected parliaments. Here you\'ll find summaries of bills, voting results, and information about MPs.\n•\tYou must be at least 16 years old to use the app. If you create an Account, you confirm that you meet this condition.\n•\tUsing the basic informational features does not require creating an Account.\n\n<b>3. Your Account in the app</b>\n•\tYou can create an Account using your e-mail address. This will allow you to use additional features, such as voting in polls or receiving personalized notifications.\n•\tPlease remember that you can only have one Account.\n•\tYou are responsible for keeping your password confidential and for everything that happens on your Account.\n\n<b>4. How can you use the content? (License)</b>\n•\tAll source data (e.g., full texts of laws, voting results, MPs\' data) come from official, public sources and are public information.\n•\tThe content I create using my proprietary system and AI technology (i.e., summaries, simplified titles, key points) is provided to you for free use for informational, educational, and private purposes. You can read and share it as screenshots.\n•\tI kindly ask you – do not copy this data automatically (do not scrape it). Creating and maintaining this system costs me time and money. Therefore, to protect this project, the Terms forbid you from:\n\t\to\tAutomatically downloading and creating your own database based on the content generated in the app.\n\t\to\tUsing the app\'s content for commercial purposes.\n\t\to\tAttempting to break security, decompile the app, or disrupt its operation.\n•\tHave an idea for using Lustra\'s data in an interesting way? I\'m open to collaboration! Write to me at jacek@lustra.dev – I\'d be happy to talk about it.\n\n<b>5. Polls and data accuracy</b>\n•\tOne of the app\'s features is polls where you can express your support for a given bill. To make the results of these polls as reliable as possible, please select the parliament of the country you are a citizen of in the settings (if it is available on the list).\n\n<b>6. My liability (or rather, the lack of it)</b>\n•\tI provide the app \"as is\". I make every effort to ensure the data is current and correct, but it comes from external, government APIs, which may contain errors. Therefore, I cannot be held responsible for any inaccuracies in the source data.\n•\tLustra is a pro bono project that I maintain with my own funds. I will do my best to keep it running without interruption, but I must reserve that technical breaks may occur. I also reserve the right to terminate the service, for example, if I run out of funds to maintain it.\n•\tThe content in the app, especially that generated by AI, is for informational and educational purposes. It does not constitute legal advice.\n\n<b>7. Lustra Support Club</b>\n•\tYou can join the \"Lustra Support Club\" by giving separate, voluntary consent. This means I will be able to send you emails about the app\'s development, new features, and also ask for support in discussions about the project\'s future or for financial help if needed. You can find more details about this in the Privacy Policy.\n\n<b>8. Termination of our agreement</b>\n•\tYou can terminate it at any time. Just use the \"Delete Account\" option in the app\'s settings. This will permanently delete your Account and its associated data.\n•\tI can block or delete your Account if you grossly violate these Terms, for example, by trying to harm the app\'s operation.\n\n<b>9. Changes to the Terms</b>\n•\tThe world changes, and so will the app. I reserve the right to change these Terms. I will inform you of any important changes in advance, for example, through a message in the app. Continued use of Lustra after the changes are introduced will mean you accept them.\n\n<b>10. Contact and final provisions</b>\n•\tIf you have any questions, feel free to write to: jacek@lustra.dev.\n•\tIn all matters not regulated by these Terms, Polish law shall apply.\n\nThanks for being here and helping to create a transparent state!'**
  String get termsOfServiceContent;

  /// No description provided for @termsAndPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Privacy Policy'**
  String get termsAndPrivacyTitle;

  /// No description provided for @termsOfServiceTab.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfServiceTab;

  /// No description provided for @privacyPolicyTab.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTab;

  /// No description provided for @privacyPolicyContent.
  ///
  /// In en, this message translates to:
  /// **'<b>\"Lustra\" App Privacy Policy</b>\n\nLast updated: August 10, 2025\n\nThis document is the Privacy Policy. I know such texts can be long and complicated, so I\'ve done my best to write it simply.\nYour privacy and trust are my absolute priority. In this policy, I will explain what data I collect, why I do it, and how I protect it.\n\n<b>1. Who takes care of your data? (Data Controller)</b>\nI, Jacek, operating as FO&WO VENTURES SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ (ul. Wapienna 13/7, 50-518 Wrocław, NIP: 6343002817), am the controller of your personal data.\nIf you have any questions about your data, write to me directly at: jacek@lustra.dev.\n\n<b>2. What data do I collect and why?</b>\nI only collect data that is necessary for the app to function or for which you give separate, voluntary consent. Here is a detailed list:\n•\t<b>When you create an Account:</b>\n\to\t<b>Your email address:</b> I need it to create and securely maintain your Account, allow you to log in, and let you reset your password if you forget it.\n\to\t<b>Unique User ID (UID):</b> This is a random string of characters automatically assigned by the Firebase system, which allows me to securely link your data to your Account.\n•\t<b>When you use the app\'s features (as a logged-in user):</b>\n\to\t<b>Your votes in polls (\"support\" / \"oppose\"):</b> I save them to create aggregate, fully anonymous statistics of support for individual laws, which you see in the app. Your individual vote is never publicly displayed anywhere.\n\to\t<b>Your list of followed legislation:</b> I store it so you have easy access to it and so I can (in the future) send you notifications about their progress.\n\to\t<b>Your chosen parliament:</b> I save this information so you can participate in the relevant polls and (in the future) receive notifications for the correct country.\n•\t<b>When you join the Lustra Support Club (completely voluntary):</b>\n\to\t<b>Information about your consent (true/false):</b> I save it to know if you want to receive additional messages from me. I write more about the Club in section 5.\n•\t<b>When you report a bug:</b>\n\to\tIf you decide to send a data error report, I will save the content of your report to analyze and fix the problem.\nWhat I do <b>NOT</b> collect: I do not use any external analytical tools (like Google Analytics) to track your activity in the app.\n\n<b>3. Who do I entrust your data to? (My technology partners)</b>\nFor Lustra to work, I use the services of trusted technology partners to whom I entrust the processing of some data. They are:\n•\t<b>Google (as part of the Firebase service):</b> This is the technological backbone of the entire app. Google provides me with the infrastructure for:\n\to\t<b>Authentication (Firebase Authentication):</b> Secure login and management of your Account.\n\to\t<b>Database (Cloud Firestore):</b> Storing data related to your Account (e.g., poll votes, list of followed legislation).\n•\t<b>Google (as part of the Gemini AI service):</b> This is the tool I use to analyze legislative texts. I want to be absolutely clear: I only send publicly available texts of laws and documents to the AI. Your personal data (like email or UID) is never sent there.\nAll data is stored on Google servers located within the European Economic Area.\n\n<b>4. How long do I store your data?</b>\nShort and simple: I store your data as long as you have an Account with me. If you decide to delete it, all your personal data will be permanently erased.\n\n<b>5. The Lustra Support Club – what is it?</b>\nThis is a special place for people who want to be closer to the project. Joining is completely voluntary and requires checking a separate consent box. If you join, it means you agree to me occasionally sending you emails about:\n•\tapp development and planned new features,\n•\tspecial events, e.g., discussion panels about the future of Lustra,\n•\tother, similar mission-driven projects I might create in the future,\n•\trequests for financial support if the project finds itself in a difficult situation.\nYou can withdraw your consent at any time in the app\'s settings.\n\n<b>6. Your rights – you are in full control</b>\nGDPR gives you a range of rights, and I want you to be able to exercise them easily. You have the right to:\n•\tAccess your data: To know what data I hold about you.\n•\tRectify (correct) your data.\n•\tErase your data (the right to be forgotten): You can do this at any time using the \"Delete Account\" option in the app\'s settings.\n•\tRestrict the processing of your data.\n•\tData portability.\n•\tObject to the processing of your data.\n•\tWithdraw consent (e.g., for being in the Lustra Support Club).\n•\tLodge a complaint with the President of the Personal Data Protection Office (UODO) if you believe I am processing your data unlawfully.\nTo exercise most of these rights, just write to me at jacek@lustra.dev.\n\n<b>7. Security of your data</b>\nI take security very seriously. I use solutions provided by Google Firebase, which apply modern security standards, including data encryption both during transmission (SSL protocol) and storage on servers.\n\n<b>8. Children\'s data</b>\nAs mentioned in the Terms of Service, the app is intended for people who are 16 years of age or older. I do not knowingly collect or process data from younger individuals.\n\n<b>9. Changes to this policy</b>\nI may update this policy in the future. I will inform you of any significant changes in advance within the app.\n\nThank you for your trust.\nJacek'**
  String get privacyPolicyContent;

  /// No description provided for @techPageTitle.
  ///
  /// In en, this message translates to:
  /// **'About Technology and Impartiality'**
  String get techPageTitle;

  /// No description provided for @techPageIntro.
  ///
  /// In en, this message translates to:
  /// **'Behind every simplified title and summary of a law, there is a language model. Here, I want to explain to you with full transparency how it works and how I ensure that the information you receive is always pure and unbiased.'**
  String get techPageIntro;

  /// No description provided for @techPageWhyAiTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Do I Use AI?'**
  String get techPageWhyAiTitle;

  /// No description provided for @techPageWhyAiBody.
  ///
  /// In en, this message translates to:
  /// **'The texts of laws and parliamentary documents are written in complicated legal jargon. Reading and understanding even a short act is a challenge, even for a lawyer.\n\nMy goal was to create a tool that would translate this hermetic language \'from legal to human\'. Manually analyzing hundreds of documents daily would be impossible for one person. That\'s why I turned to AI – as a powerful tool for text analysis and simplification, which allows me to deliver information to you quickly and in an accessible form.'**
  String get techPageWhyAiBody;

  /// No description provided for @techPageWhatForTitle.
  ///
  /// In en, this message translates to:
  /// **'What Exactly Do I Use AI For?'**
  String get techPageWhatForTitle;

  /// No description provided for @techPageWhatForBody.
  ///
  /// In en, this message translates to:
  /// **'Artificial Intelligence performs three specific tasks:\n  • It simplifies official titles into ones that immediately tell you what the document is about.\n  • It creates short, 2-3 sentence summaries that focus on the impact of the changes on the daily lives of citizens.\n  • It extracts a few key points from the dense text, meaning the most important changes and solutions.\n\nAll other data, such as voting results or information about MPs, comes directly from official, government APIs.'**
  String get techPageWhatForBody;

  /// No description provided for @techPageBiasTitle.
  ///
  /// In en, this message translates to:
  /// **'How Do I Ensure Impartiality? Instructions for the AI'**
  String get techPageBiasTitle;

  /// No description provided for @techPageBiasBody.
  ///
  /// In en, this message translates to:
  /// **'This is the most important part. The AI follows specific commands. These commands (called a \'prompt\' in computer science) are a kind of very precise instruction that is the foundation of the entire application\'s impartiality.\n\nHere are the key principles I have drilled into my AI system:\n  • <b>Role of a neutral expert:</b> I instruct the AI to take on the role of an apolitical legal expert whose sole purpose is to analyze and explain, not to judge or comment.\n  • <b>Just the facts, no opinions:</b> The instructions explicitly forbid the AI from expressing its own opinions, making value judgments, or using language that could suggest whether a given change is \'good\' or \'bad\'. It is to focus solely on the facts.\n  • <b>Perspective of the common person:</b> Instead of analyzing a law from a lawyer\'s perspective, the AI is tasked with answering the question: \'What does this change mean for me, an ordinary citizen? How will it affect my finances, health, rights, and duties?\'.'**
  String get techPageBiasBody;

  /// No description provided for @techPagePromiseTitle.
  ///
  /// In en, this message translates to:
  /// **'Full, Transparent Instructions for Review'**
  String get techPagePromiseTitle;

  /// No description provided for @techPagePromiseBody.
  ///
  /// In en, this message translates to:
  /// **'Don\'t just take my word for it. Below is the exact content of the instruction (prompt) that I pass to the AI model (Google Gemini) when analyzing each document, making sure that the creativity parameters are also set to 0 (so the AI doesn\'t make things up during analysis). This is the \'brain\' of the operation.\n\n(Note: This prompt will evolve and be improved over time to continuously increase the quality of the summaries.)'**
  String get techPagePromiseBody;

  /// No description provided for @techPagePromptCode.
  ///
  /// In en, this message translates to:
  /// **'You are an expert in {country} law, tasked with analyzing legislative documents, resolutions, and other legal acts, and then preparing information from them in an accessible way for citizens. Your goal is to present the information so that citizens can assess the impact of the legislation on their lives themselves, even without specialized legislative knowledge. Focus on the facts and consequences of the changes being introduced, avoiding value judgments and personal opinions. All legal jargon is forbidden. Present the information in a clear, concise, and engaging manner, so that it is understandable to a person without a legal background. Avoid long, complex sentences. Instead of writing \'the project aims to implement the directive regarding waste segregation...\', write \'New rules for waste segregation: use of special bags, etc....\'. Continue your work until you have completed your task. If you are unsure about the generated content, analyze the document again – do not guess. Plan your task well before you begin. In the summary and key points, if possible and justified, highlight what specific benefits or consequences (positive or negative) the act introduces for the daily lives of citizens, their rights and duties, personal finances, security, and other important issues.\n\nYour response MUST be in JSON format - and contain the following keys.\nBefore returning the response, carefully verify that the entire JSON structure is 100% correct, including all commas, curly braces, square brackets, and quotation marks. Incorrect JSON is unacceptable and will prevent your work from being processed.\n\nAnalyze the following legal document text carefully. This is the content based on which you are to generate the summary and key points:\n--- START OF DOCUMENT ---\n{DOCUMENT_TEXT}\n--- END OF DOCUMENT ---\n\nREMEMBER: Your response MUST be exclusively a valid JSON object. Do not add any extra characters, comments, or text before the \'OPEN_BRACE\' tag or after the \'CLOSE_BRACE\' tag. The entire response must be parsable as JSON.\nBased on the ABOVE document, fill in the following JSON structure:\nHere is the JSON structure I expect (fill it with content):\n__OPEN_BRACE__\n  \"ai_title\": \"A new, short title for the legal act in English, capturing the essence of the introduced changes (e.g., a maximum of 10-12 words).\",\n  \"summary\": \"A 2-3 sentence concise summary of the legal act\'s content in English, written from the perspective of its impact on citizens\' daily lives.\",\n  \"key_points\": [\n    \"First short point in English about the most important solutions or changes being introduced.\",\n    \"Second short point in English...\"\n  ],\n \"category\": [\"Categorize the document by default into one category, based on the field it mainly concerns. Choose up to 3 if the document also addresses SIGNIFICANT issues from other categories. You MUST choose categories EXCLUSIVELY from the following list: Health, Education, Family, Taxes, Work, Security, Environment, Courts and Law, Transport, Benefits, Real Estate, Media and Culture, Local Government, Migration, Agriculture, Public Investments, Digitization, Economy. If the document definitely does not fit into any of them, you MUST use \'Other\'. If you use \'Other\', it should be the ONLY category selected. DO NOT create new categories. The response must be an array of strings, e.g., [\\\"Taxes\\\", \\\"Family\\\"].\", \"Second category (optional)\", \"Third category (optional)\"]\n__CLOSE_BRACE__'**
  String techPagePromptCode(Object DOCUMENT_TEXT, Object country);

  /// No description provided for @techPageFlawlessTitle.
  ///
  /// In en, this message translates to:
  /// **'Is AI Infallible?'**
  String get techPageFlawlessTitle;

  /// No description provided for @techPageFlawlessBody.
  ///
  /// In en, this message translates to:
  /// **'Of course not. Like any technology, it can make a mistake or misinterpret something. That\'s why in the application, you will find a mechanism to report an error in the data – every such report is extremely valuable to me and helps me improve the system.\n\nMy long-term goal is to further develop this technology, and even to run my own local model without any restrictions, to further increase the precision and independence of the application.'**
  String get techPageFlawlessBody;

  /// No description provided for @techPageOutro.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your trust. I hope that thanks to this transparency, using Lustra will be even more valuable for you.'**
  String get techPageOutro;

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
  /// **'See the details of this bill in the Lustra app! {deepLink}'**
  String shareLegislationText(Object deepLink);

  /// No description provided for @shareDeputyText.
  ///
  /// In en, this message translates to:
  /// **'See and rate this MP\'s work in the Lustra app! {deepLink}'**
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

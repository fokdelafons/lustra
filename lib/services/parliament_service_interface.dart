import 'package:flutter/material.dart';
import '../models/home_screen_data.dart';
import '../models/legislation.dart';
import '../models/mp.dart';
import '../models/parliament_source.dart';

class MPDetailItem {
  final String label; // Będzie zawierać główną, w pełni sformatowaną treść
  final String? value; // Opcjonalna, dodatkowa treść (np. "dawniej: ...")
  final String? tooltip;

  MPDetailItem({required this.label, this.value, this.tooltip});
}

class MPDetailSection {
  final String title;
  final List<MPDetailItem> items;

  MPDetailSection({required this.title, required this.items});
}

class MPActivityTab {
  final String title;
  final String type; // e.g., 'votings', 'interpellations', 'sponsorships'

  MPActivityTab({required this.title, required this.type});
}

class DisplayableStatus {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  DisplayableStatus({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });
}

class TermData {
  final int currentTerm;
  final List<int> availableTerms;
  TermData({required this.currentTerm, required this.availableTerms});
}

class EmailTemplate {
  final String recipient;
  final String subject;
  final String body;

  EmailTemplate({
    required this.recipient,
    required this.subject,
    required this.body,
  });
}

class MissingDataAction {
  final String userMessage;
  final String buttonText;
  final EmailTemplate emailTemplate;

  MissingDataAction({
    required this.userMessage,
    required this.buttonText,
    required this.emailTemplate,
  });
}

abstract class ParliamentServiceInterface with ChangeNotifier {
  Map<int, String> get termDurations;
  ParliamentSource get source;
  String get name; 
  int? get currentTerm;
  List<int> get availableTerms;
  List<String> get clubFilters;
  bool get isLoading;
  String get futureStatusId;

  Future<void> initialize();
  Future<void> changeTerm(int newTerm);
  Future<void> clearCache();

  Future<HomeScreenData> getHomeScreenData(BuildContext context, {bool forceRefresh = false});
  Future<Map<String, dynamic>> getLegislations(BuildContext context, {int limit = 20, String? lastVisibleId, bool forceRefresh = false, String? searchQuery, String? status, List<String>? documentType, bool? active, String? category, String? sortBy, String? processStartDateAfter});
  Future<Legislation?> getLegislationDetails(BuildContext context, String legislationId, {bool forceRefresh = false});
  Future<Map<String, dynamic>> getMPs(BuildContext context, {required int limit, String? lastVisibleId, bool forceRefresh = false, String? searchQuery, String? club, String? sortBy});
  Future<MP?> getMPDetails(BuildContext context, String mpId, {bool forceRefresh = false, String? dataType, Map<String, dynamic>? params});
  Future<MP?> getMPData(BuildContext context, String mpId, {bool forceRefresh = false, String? dataType, Map<String, dynamic>? params});
  String translateVote(BuildContext context, String vote);
  Future<Map<String, String>> getLegislationFilterStatuses(BuildContext context);
  Future<Map<String, String>> getLegislationFilterDocumentTypes(BuildContext context);
  DisplayableStatus getDisplayableStatusInfo(BuildContext context, String? status);
  String getVotingTitle(BuildContext context, Legislation legislation);
  Color getVoteColor(BuildContext context, String translatedVote);
  String? getHistoricalDataDisclaimer(BuildContext context);
  String get flagAssetPath;
  String get governmentApiUrl;
  String get citizenVoteFunctionName;
  String translateStatus(BuildContext context, String? status);
  List<String> get defaultDocumentTypeIds;
  String get processStatusId;
  String? getOfficialUrl(Legislation legislation);
  VoidCallback? getInterpellationTapAction(BuildContext context, InterpellationPreview interp);
  String? getProcessUrl(Legislation legislation);
  String? getVotingPdfUrl(Legislation legislation);
  int calculateTotalTenureInYears(MP mp);
  MissingDataAction? getMissingDataAction(BuildContext context, Legislation legislation);
  List<MPDetailItem> getMPHeaderDetails(BuildContext context, MP mp);
  MPDetailSection? getMPPersonalDetails(BuildContext context, MP mp);
  MPDetailSection? getMPTenureDetails(BuildContext context, MP mp);
  String getTenureTitle(BuildContext context, MP mp);
  List<MPActivityTab> getMPActivityTabs(BuildContext context);
  String getMandateStatusText(BuildContext context, MP mp);
}
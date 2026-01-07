import 'dart:developer' as developer;

DateTime? _parseDateTime(dynamic timestamp) {
  if (timestamp == null) {
    developer.log('Input to _parseDateTime was null.', name: 'HomeScreenDataModel.ParseUtil');
    return null;
  }

  if (timestamp is Map && timestamp.containsKey('_seconds')) {
    try {
      final seconds = timestamp['_seconds'] as int;
      return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
    } catch (e) {
      developer.log('Error parsing Firestore timestamp map: $timestamp, error: $e', name: 'HomeScreenDataModel.ParseUtil');
      return null;
    }
  }

  if (timestamp is String) {
    if (timestamp.isEmpty) {
      developer.log('Input string to _parseDateTime was empty.', name: 'HomeScreenDataModel.ParseUtil');
      return null;
    }
    try {
      return DateTime.parse(timestamp);
    } catch (e) {
      developer.log('Error parsing date string: "$timestamp", error: $e', name: 'HomeScreenDataModel.ParseUtil');
      return null;
    }
  }
  developer.log('Unsupported type or invalid value for DateTime parsing: ${timestamp.runtimeType}, value: "$timestamp"', name: 'HomeScreenDataModel.ParseUtil');
  return null;
}

List<String> _parseStringList(dynamic list) {
  if (list is List) {
    return List<String>.from(list.map((item) => item?.toString() ?? ''));
  }
  return [];
}

List<DateTime> _parseDateTimeList(dynamic list) {
  if (list is List) {
    return list
        .map((item) => _parseDateTime(item))
        .whereType<DateTime>()
        .toList();
  }
  return [];
}

class HomeScreenLegislationItem {
  final String id;
  final String title;
  final String? summary;
  final String status;
  final String? statusText;
  final List<String> keyPoints;
  final int popularity;
  final String? summaryGeneratedBy;
  final int? likes;
  final int? dislikes;
  final DateTime? lastUpdated;

  final int? votesAgainst;
  final DateTime? votingDate;
  final int? votesAbstain;
  final int? votesFor;

  final List<DateTime>? upcomingProceedingDates;
  final String? documentType;
  final DateTime? processStartDate;
  final String? category;

  HomeScreenLegislationItem({
    required this.id,
    required this.title,
    this.summary,
    this.summaryGeneratedBy,
    required this.status,
    required this.keyPoints,
    required this.popularity,
    this.likes,
    this.dislikes,
    this.lastUpdated,
    this.votesAgainst,
    this.votingDate,
    this.votesAbstain,
    this.votesFor,
    this.upcomingProceedingDates,
    this.documentType,
    this.processStartDate,
    this.statusText,
    this.category,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'status': status,
      'statusText': statusText,
      'key_points': keyPoints,
      'popularity': popularity,
      'summaryGeneratedBy': summaryGeneratedBy,
      'likes': likes,
      'dislikes': dislikes,
      'lastUpdated': lastUpdated?.toIso8601String(),
      'votesAgainst': votesAgainst,
      'votingDate': votingDate?.toIso8601String(),
      'votesAbstain': votesAbstain,
      'votesFor': votesFor,
      'upcomingProceedingDates': upcomingProceedingDates?.map((d) => d.toIso8601String()).toList(),
      'documentType': documentType,
      'processStartDate': processStartDate?.toIso8601String(),
      'category': category,
    };
  }
  static HomeScreenLegislationItem? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null; 
    if (json.containsKey('error')) {
      developer.log(
          'API reported error for legislation item: ${json['reason'] ?? 'Unknown reason'} (id: ${json['id'] ?? 'N/A'}). Parsing available data.',
          name: 'HomeScreenDataModel');
    }
    return HomeScreenLegislationItem(
      id: json['id'] as String? ?? json['itemId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String?,
      status: json['status'] as String? ?? '',
      statusText: json['statusText'] as String?,
      keyPoints: _parseStringList(json['key_points']),
      popularity: json['popularity'] as int? ?? 0,
      summaryGeneratedBy: json['summaryGeneratedBy'] as String?,
      likes: json['likes'] as int?,
      dislikes: json['dislikes'] as int?,
      lastUpdated: _parseDateTime(json['lastUpdated']),
      votesAgainst: json['votesAgainst'] as int?,
      votesAbstain: json['votesAbstain'] as int?,
      votesFor: json['votesFor'] as int?,
      upcomingProceedingDates: _parseDateTimeList(json['upcomingProceedingDates']),
      documentType: json['documentType'] as String?,
      processStartDate: _parseDateTime(json['processStartDate']),
      votingDate: _parseDateTime(json['votingDate']),
      category: (json['category'] is List && (json['category'] as List).isNotEmpty)
          ? (json['category'] as List).first.toString()
          : (json['category'] is String ? json['category'] as String : null),
    );
  }
}

class HomeScreenDeputy {
  final String deputyId;
  final String fullName;
  final String imageUrl;
  final String club;
  final String district;
  final int numberOfVotes;
  final List<String> keyPoints;
  Map<String, dynamic> toJson() {
    return {
      'deputyId': deputyId,
      'fullName': fullName,
      'imageUrl': imageUrl,
      'club': club,
      'district': district,
      'numberOfVotes': numberOfVotes,
      'key_points': keyPoints,
    };
  }
  HomeScreenDeputy({
    required this.deputyId,
    required this.fullName,
    required this.imageUrl,
    required this.club,
    required this.district,
    required this.numberOfVotes,
    required this.keyPoints,
  });

  factory HomeScreenDeputy.fromJson(Map<String, dynamic> json) {
    return HomeScreenDeputy(
      deputyId: json['deputyId'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      club: json['club'] as String? ?? 'N/A',
      district: json['district'] as String? ?? 'N/A',
      numberOfVotes: json['numberOfVotes'] as int? ?? 0,
      keyPoints: _parseStringList(json['key_points']),
    );
  }
}

class TopDeputiesSection {
  final List<HomeScreenDeputy> deputies;
  final DateTime? lastUpdated;

  TopDeputiesSection({required this.deputies, this.lastUpdated});
  Map<String, dynamic> toJson() {
    return {
      'deputies': deputies.map((d) => d.toJson()).toList(),
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }
  static TopDeputiesSection? fromJson(Map<String, dynamic>? json) {
     if (json == null) return null;
     return TopDeputiesSection(
      deputies: (json['deputies'] as List? ?? [])
          .map((item) => HomeScreenDeputy.fromJson(item as Map<String, dynamic>))
          .toList(),
      lastUpdated: _parseDateTime(json['lastUpdated']),
    );
  }
}

class HomeScreenData {
  final HomeScreenLegislationItem? popularVoted;
  final HomeScreenLegislationItem? upcomingVote;
  final HomeScreenLegislationItem? popularInProcess;
  final HomeScreenLegislationItem? civicProject;
  final TopDeputiesSection? topDeputies;
  Map<String, dynamic> toJson() {
    return {
      'popularVoted': popularVoted?.toJson(),
      'upcomingVote': upcomingVote?.toJson(),
      'popularInProcess': popularInProcess?.toJson(),
      'civicProject': civicProject?.toJson(),
      'topDeputies': topDeputies?.toJson(),
    };
  }
  HomeScreenData({
    this.popularVoted,
    this.upcomingVote,
    this.popularInProcess,
    this.civicProject,
    this.topDeputies,
  });

  factory HomeScreenData.fromJson(Map<String, dynamic> json) {
    return HomeScreenData(
      popularVoted: HomeScreenLegislationItem.fromJson(json['popularVoted'] as Map<String, dynamic>?),
      upcomingVote: HomeScreenLegislationItem.fromJson(json['upcomingVote'] as Map<String, dynamic>?),
      popularInProcess: HomeScreenLegislationItem.fromJson(json['popularInProcess'] as Map<String, dynamic>?),
      civicProject: HomeScreenLegislationItem.fromJson(json['civicProject'] as Map<String, dynamic>?),
      topDeputies: TopDeputiesSection.fromJson(json['topDeputies'] as Map<String, dynamic>?),
    );
  }
}

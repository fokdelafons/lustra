import 'legislation.dart';
import 'mp.dart';

class TopDeputiesSection {
  final List<MP> deputies;
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
          .map((item) => MP.fromJson(item as Map<String, dynamic>))
          .toList(),
      lastUpdated: json['lastUpdated'] != null ? DateTime.tryParse(json['lastUpdated'].toString()) : null,
    );
  }
}

class HomeScreenData {
  final Legislation? popularVoted;
  final Legislation? upcomingVote;
  final Legislation? popularInProcess;
  final Legislation? civicProject;
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
      popularVoted: json['popularVoted'] != null ? Legislation.fromJson(json['popularVoted'] as Map<String, dynamic>) : null,
      upcomingVote: json['upcomingVote'] != null ? Legislation.fromJson(json['upcomingVote'] as Map<String, dynamic>) : null,
      popularInProcess: json['popularInProcess'] != null ? Legislation.fromJson(json['popularInProcess'] as Map<String, dynamic>) : null,
      civicProject: json['civicProject'] != null ? Legislation.fromJson(json['civicProject'] as Map<String, dynamic>) : null,
      topDeputies: TopDeputiesSection.fromJson(json['topDeputies'] as Map<String, dynamic>?),
    );
  }
}
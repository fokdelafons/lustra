import 'package:flutter/foundation.dart';

class ImportantVote {
  final String title;
  final String link;
  final String? votingUrl;
  final String vote;
  final Map<String, dynamic>? votingStats;

  ImportantVote({
    required this.title,
    required this.link,
    this.votingUrl,
    required this.vote,
    this.votingStats,
  });
  factory ImportantVote.fromJson(Map<String, dynamic> json) {
    return ImportantVote(
      title: json['title'] as String? ?? 'Brak tytułu',
      link: json['legislationId'] as String? ?? json['link'] as String? ?? '',
      votingUrl: json['votingUrl'] as String?,
      vote: json['deputyActualVote'] as String? ?? json['vote'] as String? ?? '',
      votingStats: json['votingStats'] != null && json['votingStats'] is Map
          ? Map<String, dynamic>.from(json['votingStats'] as Map)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'votingUrl': votingUrl,
      'vote': vote,
      'votingStats': votingStats,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportantVote &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          link == other.link &&
          vote == other.vote &&
          mapEquals(votingStats, other.votingStats);

  @override
  int get hashCode =>
      title.hashCode ^
      link.hashCode ^
      vote.hashCode ^
      votingStats.hashCode;

  double? get attendancePercentage {
    return (votingStats?['attendance_percentage'] as num?)?.toDouble();
  }
}

class InterpellationPreview {
  final String id;
  final String title;
  final String? sentDate;
  final String? contentUrl;
  final String? replyFrom;
  final String? replyUrl;
  final String? tag;

  InterpellationPreview({
    required this.id,
    required this.title,
    this.sentDate,
    this.contentUrl,
    this.replyFrom,
    this.replyUrl,
    this.tag,
  });

  factory InterpellationPreview.fromJson(Map<String, dynamic> json) {
    // final sponsorshipType = json['sponsorshipType'] as String?;
    return InterpellationPreview(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      sentDate: json['sentDate'] as String?,
      contentUrl: json['contentUrl'] as String?,
      replyFrom: json['replyfrom'] as String? ?? json['replyFrom'] as String?,
      replyUrl: json['replyUrl'] as String?,
      tag: json['tag'] as String?,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'sentDate': sentDate,
      'contentUrl': contentUrl,
      'replyFrom': replyFrom,
      'replyUrl': replyUrl,
      'tag': tag,
    };
  }
}

class MP {
  final String id;
  final String firstName;
  final String secondName;
  final String lastName;
  final bool active;
  final String email;
  final String club;
  final String birthDate;
  final String birthLocation;
  final String profession;
  final String district;
  final int districtNum;
  final String educationLevel;
  final int numberOfVotes;
  final String voivodeship;
  final String memberType;
  final String? imageUrl; 
  final Map<String, dynamic>? parliamentaryHistory;
  final List<String> clubHistory;
  final int interpellationsCount;
  final int? sponsoredBillsCount;
  final int? cosponsoredBillsCount;
  final List<ImportantVote> votings;
  final List<InterpellationPreview> interpellationsPreview;
  final int? likes;
  final int? dislikes;
  final int? popularity;
  final bool hasMoreVotings;
  final String? lastVoteId;
  final bool hasMoreInterpellations;
  final String? lastInterpellationId;
  final double? attendancePercentage;
  final String mandateCoverage;
  final List<ParliamentaryTermUS> termsUS;
  final List<ParliamentaryClubUS> clubsUS;
  final String? leadership;

  MP({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.lastName,
    required this.active,
    required this.email,
    required this.club,
    required this.birthDate,
    required this.birthLocation,
    required this.profession,
    required this.district,
    required this.districtNum,
    required this.educationLevel,
    required this.numberOfVotes,
    required this.voivodeship,
    required this.memberType,
    this.imageUrl,
    this.parliamentaryHistory,
    this.clubHistory = const [],
    this.interpellationsCount = 0,
    this.sponsoredBillsCount,
    this.cosponsoredBillsCount,
    this.votings = const [],
    this.interpellationsPreview = const [],
    this.likes,
    this.dislikes,
    this.popularity,
    this.hasMoreVotings = false,
    this.lastVoteId,
    this.hasMoreInterpellations = false,
    this.lastInterpellationId,
    this.attendancePercentage,
    required this.mandateCoverage,
    this.termsUS = const [],
    this.clubsUS = const [],
    this.leadership,
  });
  String get firstLastName => '$firstName $lastName';
  String get lastFirstName => '$lastName $firstName';
  factory MP.fromJson(Map<String, dynamic> json) {
    final votingStats = json['votingStats'] as Map<String, dynamic>? ?? {};
    String? latestLeadershipRole;
    final leadershipData = json['parliamentaryHistory']?['leadership'];
    if (leadershipData is List && leadershipData.isNotEmpty) {
      final leadershipList = List<Map<String, dynamic>>.from(leadershipData);
      leadershipList.sort((a, b) => (b['term'] as int? ?? 0).compareTo(a['term'] as int? ?? 0));
      latestLeadershipRole = leadershipList.first['type'] as String?;
    }
    return MP(
      id: json['id'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      secondName: json['secondName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      email: json['email'] as String? ?? '',
      club: json['club'] as String? ?? '',
      birthDate: json['birthDate'] as String? ?? '',
      birthLocation: json['birthLocation'] as String? ?? '',
      profession: json['profession'] as String? ?? '',
      district: json['district'] as String? ?? '',
      districtNum: (json['districtNum'] as num?)?.toInt() ?? 0,
      educationLevel: json['educationLevel'] as String? ?? '',
      numberOfVotes: (json['numberOfVotes'] as num?)?.toInt() ?? 0,
      voivodeship: json['voivodeship'] as String? ?? '',
      memberType: json['memberType'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      parliamentaryHistory: json['parliamentaryHistory'] != null ? Map<String, dynamic>.from(json['parliamentaryHistory']) : null,
    clubHistory: json['clubHistory'] is List ? List<String>.from(json['clubHistory']) : [],
    termsUS: () {
      final termsData = json['parliamentaryHistory']?['terms'];
      if (termsData is List && termsData.isNotEmpty) {
        if (termsData.first is Map) {
          return termsData
              .map((t) => ParliamentaryTermUS.fromJson(t as Map<String, dynamic>))
              .toList();
        } else if (termsData.first is int) {
          return termsData
              .map((t) => ParliamentaryTermUS(term: t as int, memberType: 'Poseł'))
              .toList();
        }
      }
      return <ParliamentaryTermUS>[];
    }(),
    clubsUS: () {
      final clubsData = json['parliamentaryHistory']?['clubs'];
      if (clubsData is List && clubsData.isNotEmpty && clubsData.first is Map) {
        return clubsData
            .map((c) => ParliamentaryClubUS.fromJson(c as Map<String, dynamic>))
            .toList();
      }
      return <ParliamentaryClubUS>[];
    }(),
      interpellationsCount: (json['interpellationsCount'] as num?)?.toInt() ?? 0,
      sponsoredBillsCount: (json['sponsoredBillsCount'] as num?)?.toInt(),
      cosponsoredBillsCount: (json['cosponsoredBillsCount'] as num?)?.toInt(),
      votings: json['votings'] is List ? (json['votings'] as List).map((v) => ImportantVote.fromJson(v)).toList() : [],
      interpellationsPreview: json['interpellationsPreview'] is List ? (json['interpellationsPreview'] as List).map((i) => InterpellationPreview.fromJson(i)).toList() : [],
      likes: (json['likes'] as num?)?.toInt(),
      dislikes: (json['dislikes'] as num?)?.toInt(),
      popularity: (json['popularity'] as num?)?.toInt(),
      hasMoreVotings: json['hasMoreVotings'] as bool? ?? false,
      lastVoteId: json['lastVoteId'] as String?,
      hasMoreInterpellations: json['hasMoreInterpellations'] as bool? ?? false,
      lastInterpellationId: json['lastInterpellationId'] as String?,
      attendancePercentage: (votingStats['attendance_percentage'] as num?)?.toDouble(),
      mandateCoverage: votingStats['mandateCoverage'] as String? ?? 'UNKNOWN',
      leadership: latestLeadershipRole,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'secondName': secondName,
      'lastName': lastName,
      'active': active,
      'email': email,
      'club': club,
      'birthDate': birthDate,
      'birthLocation': birthLocation,
      'profession': profession,
      'district': district,
      'districtNum': districtNum,
      'educationLevel': educationLevel,
      'numberOfVotes': numberOfVotes,
      'voivodeship': voivodeship,
      'imageUrl': imageUrl,
      'parliamentaryHistory': {
        if (parliamentaryHistory != null) ...parliamentaryHistory!,
        'terms': termsUS.map((t) => t.toJson()).toList(),
        'clubs': clubsUS.map((c) => c.toJson()).toList(),
      },
      'clubHistory': clubHistory,
      'interpellationsCount': interpellationsCount,
      'sponsoredBillsCount': sponsoredBillsCount,
      'cosponsoredBillsCount': cosponsoredBillsCount,
      'votings': votings.map((v) => v.toJson()).toList(),
      'interpellationsPreview': interpellationsPreview.map((i) => i.toJson()).toList(),
      'likes': likes,
      'dislikes': dislikes,
      'popularity': popularity,
      'hasMoreVotings': hasMoreVotings,
      'lastVoteId': lastVoteId,
      'hasMoreInterpellations': hasMoreInterpellations,
      'lastInterpellationId': lastInterpellationId,
      'votingStats': {
        'attendance_percentage': attendancePercentage,
        'mandateCoverage': mandateCoverage,
      },
      'leadership': leadership,
    };
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MP &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          lastName == other.lastName;

  @override
  int get hashCode => id.hashCode ^ lastName.hashCode;

MP copyWith({
  String? id,
    String? firstName,
    String? secondName,
    String? lastName,
    bool? active,
    String? email,
    String? club,
    String? birthDate,
    String? birthLocation,
    String? profession,
    String? district,
    int? districtNum,
    String? educationLevel,
    int? numberOfVotes,
    String? voivodeship,
    String? memberType,
    String? imageUrl,
    Map<String, dynamic>? parliamentaryHistory,
    List<String>? clubHistory,
    List<ParliamentaryTermUS>? termsUS,
    List<ParliamentaryClubUS>? clubsUS,
    String? leadership,
    int? likes,
    int? dislikes,
    int? popularity,
    int? sponsoredBillsCount,
    int? cosponsoredBillsCount,
    int? interpellationsCount,
  }) {
    return MP(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      lastName: lastName ?? this.lastName,
      active: active ?? this.active,
      email: email ?? this.email,
      club: club ?? this.club,
      birthDate: birthDate ?? this.birthDate,
      birthLocation: birthLocation ?? this.birthLocation,
      profession: profession ?? this.profession,
      district: district ?? this.district,
      districtNum: districtNum ?? this.districtNum,
      educationLevel: educationLevel ?? this.educationLevel,
      numberOfVotes: numberOfVotes ?? this.numberOfVotes,
      voivodeship: voivodeship ?? this.voivodeship,
      memberType: memberType ?? this.memberType,
      imageUrl: imageUrl ?? this.imageUrl,
      parliamentaryHistory: parliamentaryHistory ?? this.parliamentaryHistory,
      clubHistory: clubHistory ?? this.clubHistory,
      termsUS: termsUS ?? this.termsUS,
      clubsUS: clubsUS ?? this.clubsUS,
      leadership: leadership ?? this.leadership,
      interpellationsCount: interpellationsCount ?? this.interpellationsCount,
      sponsoredBillsCount: sponsoredBillsCount ?? this.sponsoredBillsCount,
      cosponsoredBillsCount: cosponsoredBillsCount ?? this.cosponsoredBillsCount,
      votings: votings,
      interpellationsPreview: interpellationsPreview,
      hasMoreVotings: hasMoreVotings,
      lastVoteId: lastVoteId,
      hasMoreInterpellations: hasMoreInterpellations,
      lastInterpellationId: lastInterpellationId,
      attendancePercentage: attendancePercentage,
      mandateCoverage: mandateCoverage,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      popularity: popularity ?? this.popularity,
    );
  }
  factory MP.empty() => MP(
    id: '', firstName: '', secondName: '', lastName: '', active: false, email: '', 
    club: '', birthDate: '', birthLocation: '', profession: '', district: '', 
    districtNum: 0, educationLevel: '', numberOfVotes: 0, voivodeship: '', 
    memberType: '', mandateCoverage: 'UNKNOWN'
  );
}
class MPVote {
	final String date;
	final String description;
	final String kind;
	final Map<String, String>? listVotes;
	final String title;
	final String? topic;
	final String vote;
	final int votingNumber;

	MPVote({
		required this.date,
		required this.description,
		required this.kind,
		this.listVotes,
		required this.title,
		this.topic,
		required this.vote,
		required this.votingNumber,
	});

	factory MPVote.fromJson(Map<String, dynamic> json) {
		Map<String, String>? listVotesMap;
		if (json['listVotes'] != null && json['listVotes'] is Map) {
			try {
        listVotesMap = Map<String, String>.from(json['listVotes']);
      } catch (e) {
        listVotesMap = null;
      }
		}

		return MPVote(
			date: json['date'] ?? '',
			description: json['description'] ?? '',
			kind: json['kind'] ?? '',
			listVotes: listVotesMap,
			title: json['title'] ?? '',
			topic: json['topic'],
			vote: json['vote'] ?? '',
			votingNumber: json['votingNumber'] ?? 0,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'date': date,
			'description': description,
			'kind': kind,
      'listVotes': listVotes,
			'title': title,
			'topic': topic,
			'vote': vote,
			'votingNumber': votingNumber,
		};
	}
}
class ParliamentaryTermUS {
  final int term;
  final String memberType;

  ParliamentaryTermUS({required this.term, required this.memberType});

  factory ParliamentaryTermUS.fromJson(Map<String, dynamic> json) {
    return ParliamentaryTermUS(
      term: (json['term'] as num?)?.toInt() ?? 0,
      memberType: json['memberType'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'term': term,
        'memberType': memberType,
      };
}

class ParliamentaryClubUS {
  final String party;
  final int startYear;

  ParliamentaryClubUS({required this.party, required this.startYear});

  factory ParliamentaryClubUS.fromJson(Map<String, dynamic> json) {
    return ParliamentaryClubUS(
      party: json['party'] as String? ?? '',
      startYear: (json['startYear'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'party': party,
        'startYear': startYear,
      };
}
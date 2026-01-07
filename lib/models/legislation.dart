import 'package:flutter/foundation.dart' show listEquals;
import 'dart:developer' as developer;

DateTime? _parseDateTime(dynamic data) {
  if (data == null) return null;
  if (data is Map && data.containsKey('_seconds')) {
    try {
      final seconds = data['_seconds'] as int;
      return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
    } catch (e) {
      developer.log('Error parsing timestamp map: $data, error: $e', name: 'LegislationModel.ParseUtil');
      return null;
    }
  }
  if (data is String && data.isNotEmpty) {
    try {
      return DateTime.parse(data);
    } catch (e) {
      developer.log('Error parsing date string: "$data", error: $e', name: 'LegislationModel.ParseUtil');
      return null;
    }
  }
  developer.log('Unsupported_type for DateTime parsing: ${data.runtimeType}, value: $data', name: 'LegislationModel.ParseUtil');
  return null;
}

List<DateTime> _parseDateTimeList(dynamic list) {
  if (list is List) {
    return list.map((item) => _parseDateTime(item)).whereType<DateTime>().toList();
  }
  return [];
}

class MissingDataInfo {
  final String type;

  MissingDataInfo({required this.type});

  factory MissingDataInfo.fromJson(Map<String, dynamic> json) {
    return MissingDataInfo(
      type: json['type'] as String? ?? 'UNKNOWN',
    );
  }

  Map<String, dynamic> toJson() => {'type': type};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MissingDataInfo &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}

class Legislation {
  static String? _parseDynamicString(dynamic data, {String defaultLang = 'pl', String? fieldName, dynamic itemId}) {
    if (data == null) {
      return null;
    }
    if (data is String) {
      return data;
    }
    if (data is Map) {
      final String itemIdStr = itemId?.toString() ?? 'unknown';
      developer.log(
        'Warning: Field "$fieldName" for item ID "$itemIdStr" was a Map, expected String. Data: $data',
        name: 'LegislationModel.ParseUtil'
      );
      if (data.containsKey(defaultLang) && data[defaultLang] is String) {
        return data[defaultLang] as String;
      }
      for (var value in data.values) {
        if (value is String) {
          return value;
        }
      }
      developer.log(
        'Warning: Could not extract a string from Map for field "$fieldName" (item ID: "$itemIdStr"). Map: $data. Returning map.toString().',
        name: 'LegislationModel.ParseUtil'
      );
      return data.toString();
    }
    return data.toString();
  }
  final String id;
  final int term;
  final String number;
  final String title;
  final String description;
  final String status;
  final bool? isEU;
  final DateTime? date;
  final DateTime? documentDate;
  final DateTime? processStartDate;
  final String category;
  final int points;
  final int likes;
  final int dislikes;
  final List<String> keyPoints;
  final List<DateTime>? upcomingProceedingDates;
  final String? documentType;
  final int? popularity;
  final String? fullContentUrl;
  final List<String>? attachmentUrls;
  final int? votesFor;
  final int? votesAgainst;
  final int? votesAbstain;
  final int? meetingNumber;
  final int? votingNumber;
  final String? summaryGeneratedBy;
  final String? statusText;
  final String? votingUrl;
  final MissingDataInfo? missingDataInfo;
  final DateTime? lastUpdated;
  final String? titleOfficial;
  final bool noDocument;
  final Map<String, dynamic>? sponsor;

  Legislation({
    required this.id,
    required this.term,
    required this.number,
    required this.title,
    required this.description,
    required this.status,
    this.votingUrl,
    this.isEU,
    required this.date,
    required this.documentDate,
    required this.processStartDate,
    required this.category,
    required this.points,
    required this.likes,
    required this.dislikes,
    required this.keyPoints,
    this.upcomingProceedingDates,
    this.documentType,
    this.popularity,
    this.fullContentUrl,
    this.attachmentUrls,
    this.votesFor,
    this.votesAgainst,
    this.votesAbstain,
    this.meetingNumber,
    this.votingNumber,
    this.summaryGeneratedBy,
    this.statusText,
    this.missingDataInfo,
    this.lastUpdated,
    this.titleOfficial,
    this.noDocument = false,
    this.sponsor,
  });

  factory Legislation.fromJson(Map<String, dynamic> json) {
    final itemIdForLog = json['id']?.toString() ?? 'unknown_id';
    developer.log('Rozpoczynanie parsowania Legislation dla ID: $itemIdForLog', name: 'Legislation.fromJson');
    List<String> parsedKeyPoints = [];
    if (json.containsKey('key_Points')) {
      if (json['key_Points'] is List) {
        parsedKeyPoints = List<String>.from((json['key_Points'] as List).map((item) => item.toString()));
      } else {
      }
    }

    List<String>? parsedAttachmentUrls;
    if (json['attachmentUrls'] is List) {
      parsedAttachmentUrls = List<String>.from((json['attachmentUrls'] as List).map((item) => item.toString()));
    }

  final missingDataInfoData = json['missingDataInfo'];

    return Legislation(
      id: _parseDynamicString(json['id'], fieldName: 'id', itemId: itemIdForLog) ?? '',
      term: json['term'] as int? ?? 0,
      number: (json['printNumber']?.toString() ?? json['number']?.toString()) ?? '',
      title: _parseDynamicString(json['title'], fieldName: 'title', itemId: itemIdForLog) ?? '',
      description: _parseDynamicString(json['description'], fieldName: 'description', itemId: itemIdForLog) ?? '',
      status: _parseDynamicString(json['status'], fieldName: 'status', itemId: itemIdForLog) ?? '',
      isEU: json['isEU'] as bool?,
      date: _parseDateTime(json['votingDate']),
      documentDate: _parseDateTime(json['documentDate']),
      processStartDate: _parseDateTime(json['processStartDate']),
      category: (json['category'] as List<dynamic>? ?? []).join(', '),
      points: json['points'] as int? ?? 0,
      likes: json['likes'] as int? ?? 0,
      dislikes: json['dislikes'] as int? ?? 0,
      keyPoints: parsedKeyPoints,
      upcomingProceedingDates: _parseDateTimeList(json['upcomingProceedingDates']),
      documentType: _parseDynamicString(json['documentType'], fieldName: 'documentType', itemId: itemIdForLog),
      popularity: json['popularity'] as int?,
      fullContentUrl: _parseDynamicString(json['fullContentUrl'], fieldName: 'fullContentUrl', itemId: itemIdForLog),
      attachmentUrls: parsedAttachmentUrls,
      votesFor: (json['votesFor'] as num?)?.toInt(),
      votesAgainst: (json['votesAgainst'] as num?)?.toInt(),
      votesAbstain: (json['votesAbstain'] as num?)?.toInt(),
      meetingNumber: (json['proceeding'] as num?)?.toInt(),
      votingNumber: (json['votingNumber'] as int?),
      summaryGeneratedBy: json['summaryGeneratedBy'],
      statusText: json['statusText'] as String?,
      votingUrl: _parseDynamicString(json['votingUrl'], fieldName: 'votingUrl', itemId: itemIdForLog),
      missingDataInfo: missingDataInfoData is Map<String, dynamic>
          ? MissingDataInfo.fromJson(missingDataInfoData)
          : null,
      lastUpdated: _parseDateTime(json['lastUpdated']),
      titleOfficial: _parseDynamicString(json['titleOfficial'], fieldName: 'titleOfficial', itemId: itemIdForLog),
      noDocument: json['noDocument'] as bool? ?? false,
      sponsor: json['sponsor'] != null ? Map<String, dynamic>.from(json['sponsor']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'term': term,
      'number': number, 
      'printNumber': number, 
      'title': title,
      'description': description,
      'status': status,
      'isEU': isEU,
      'votingDate': date?.toIso8601String(),
      'documentDate': documentDate?.toIso8601String(),
      'processStartDate': processStartDate?.toIso8601String(),
      'category': category.split(', ').where((s) => s.isNotEmpty).toList(),
      'points': points,
      'likes': likes,
      'dislikes': dislikes,
      'key_Points': keyPoints,
      'upcomingProceedingDates': upcomingProceedingDates?.map((dt) => dt.toIso8601String()).toList(),
      'documentType': documentType,
      'popularity': popularity,
      'fullContentUrl': fullContentUrl,
      'attachmentUrls': attachmentUrls,
      'votesFor': votesFor,
      'votesAgainst': votesAgainst,
      'votesAbstain': votesAbstain,
      'proceeding': meetingNumber,
      'votingNumber': votingNumber,
      'statusText': statusText,
      'votingUrl': votingUrl,
      'missingDataInfo': missingDataInfo?.toJson(),
      'lastUpdated': lastUpdated?.toIso8601String(),
      'titleOfficial': titleOfficial,
      'noDocument': noDocument,
      'sponsor': sponsor,
    };
  }

  Legislation copyWith({
    String? id,
    int? term,
    String? number,
    String? title,
    String? description,
    String? status,
    bool? isEU,
    DateTime? date,
    DateTime? documentDate,
    DateTime? processStartDate,
    String? category,
    int? points,
    int? likes,
    int? dislikes,
    List<String>? keyPoints,
    List<DateTime>? upcomingProceedingDates,
    String? documentType,
    int? popularity,
    String? fullContentUrl,
    List<String>? attachmentUrls,
    int? votesFor,
    int? votesAgainst,
    int? votesAbstain,
    int? meetingNumber,
    int? votingNumber,
    MissingDataInfo? missingDataInfo,
    DateTime? lastUpdated,
    String? titleOfficial,
    bool? noDocument,
    Map<String, dynamic>? sponsor,
  }) {
    return Legislation(
      id: id ?? this.id,
      term: term ?? this.term,
      number: number ?? this.number,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      isEU: isEU ?? this.isEU,
      date: date ?? this.date,
      documentDate: documentDate ?? this.documentDate,
      processStartDate: processStartDate ?? this.processStartDate,
      category: category ?? this.category,
      points: points ?? this.points,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      keyPoints: keyPoints ?? this.keyPoints,
      upcomingProceedingDates: upcomingProceedingDates ?? this.upcomingProceedingDates,
      documentType: documentType ?? this.documentType,
      popularity: popularity ?? this.popularity,
      fullContentUrl: fullContentUrl ?? this.fullContentUrl,
      attachmentUrls: attachmentUrls ?? this.attachmentUrls,
      votesFor: votesFor ?? this.votesFor,
      votesAgainst: votesAgainst ?? this.votesAgainst,
      votesAbstain: votesAbstain ?? this.votesAbstain,
      meetingNumber: meetingNumber ?? this.meetingNumber,
      votingNumber: votingNumber ?? this.votingNumber,
      missingDataInfo: missingDataInfo ?? this.missingDataInfo,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      titleOfficial: titleOfficial ?? this.titleOfficial,
      noDocument: noDocument ?? this.noDocument,
      sponsor: sponsor ?? this.sponsor,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Legislation &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          term == other.term &&
          number == other.number &&
          title == other.title &&
          description == other.description &&
          status == other.status &&
          isEU == other.isEU &&
          date == other.date &&
          documentDate == other.documentDate &&
          processStartDate == other.processStartDate &&
          category == other.category &&
          points == other.points &&
          likes == other.likes &&
          dislikes == other.dislikes &&
          listEquals(keyPoints, other.keyPoints) &&
          listEquals(upcomingProceedingDates, other.upcomingProceedingDates) &&
          documentType == other.documentType &&
          popularity == other.popularity &&
          fullContentUrl == other.fullContentUrl &&
          listEquals(attachmentUrls, other.attachmentUrls) &&
          votesFor == other.votesFor &&
          votesAgainst == other.votesAgainst &&
          votesAbstain == other.votesAbstain &&
          meetingNumber == other.meetingNumber &&
          votingNumber == other.votingNumber &&
          missingDataInfo == other.missingDataInfo &&
        lastUpdated == other.lastUpdated &&
          titleOfficial == other.titleOfficial &&
          noDocument == other.noDocument &&
          sponsor.toString() == other.sponsor.toString();

  @override
  int get hashCode => Object.hashAll([
        id,
        term,
        number,
        title,
        description,
        status,
        isEU,
        date,
        documentDate,
        processStartDate,
        category,
        points,
        likes,
        dislikes,
        Object.hashAll(keyPoints),
        Object.hashAll(upcomingProceedingDates ?? []),
        documentType,
        popularity,
        fullContentUrl,
        Object.hashAll(attachmentUrls ?? []),
        votesFor,
        votesAgainst,
        votesAbstain,
        meetingNumber,
        votingNumber,
        missingDataInfo,
        lastUpdated,
        titleOfficial,
        noDocument,
      ]);
}

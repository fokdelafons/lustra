class Metadata {
	final DateTime lastUpdated;
	final int currentTerm;
	final List<String> clubs;

	Metadata({
		required this.lastUpdated,
		required this.currentTerm,
		required this.clubs,
	});

	factory Metadata.fromJson(Map<String, dynamic> json) {
		return Metadata(
			lastUpdated: DateTime.parse(json['lastUpdated']),			
			currentTerm: json['currentTerm'] as int,
			clubs: List<String>.from(json['clubs'] as List),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'lastUpdated': lastUpdated.toIso8601String(),
			'currentTerm': currentTerm,
			'clubs': clubs,
		};
	}
}
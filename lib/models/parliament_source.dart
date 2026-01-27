enum ParliamentType {
  national,
  european
}

class ParliamentSource {
  final String id;
  final String slug;
  final String name;
  final String flagIconAsset;
  final ParliamentType type;

  const ParliamentSource({
    required this.id,
    required this.slug,
    required this.name,
    required this.flagIconAsset,
    required this.type,
  });
  
  static const ParliamentSource pl = ParliamentSource(
    id: 'pl',
    slug: 'sejm',
    name: 'Poland',
    flagIconAsset: 'assets/flags/pl.svg',
    type: ParliamentType.national,
  );
  
  static const ParliamentSource eu = ParliamentSource(
    id: 'eu',
    slug: 'european-parliament',
    name: 'European Union (15%)',
    flagIconAsset: 'assets/flags/eu.svg',
    type: ParliamentType.european,
  );

  static const ParliamentSource us = ParliamentSource(
    id: 'us',
    slug: 'us-congress',
    name: 'United States of America',
    flagIconAsset: 'assets/flags/us.svg',
    type: ParliamentType.national,
  );

  static const ParliamentSource uk = ParliamentSource(
    id: 'uk',
    slug: 'uk-parliament',
    name: 'United Kingdom (70%)',
    flagIconAsset: 'assets/flags/gb.svg',
    type: ParliamentType.national,
  );

  static const ParliamentSource de = ParliamentSource(
    id: 'de',
    slug: 'bundestag',
    name: 'Germany (59%)',
    flagIconAsset: 'assets/flags/de.svg',
    type: ParliamentType.national,
  );

  static const ParliamentSource fr = ParliamentSource(
    id: 'fr',
    slug: 'assemblee-nationale',
    name: 'France (40%)',
    flagIconAsset: 'assets/flags/fr.svg',
    type: ParliamentType.national,
  );
  
  static const List<ParliamentSource> availableSources = [pl, eu, us, uk, de, fr];

  static String? getIdBySlug(String? slug) {
    if (slug == null) return null;
    try {
      return availableSources.firstWhere((s) => s.slug == slug).id;
    } catch (e) {
      return null;
    }
  }

  static String getSlugById(String? id) {
    if (id == null) return 'us-congress';
    try {
      return availableSources.firstWhere((s) => s.id == id).slug;
    } catch (e) {
      return 'us-congress';
    }
  }
}
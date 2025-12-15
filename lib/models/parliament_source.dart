enum ParliamentType {
  national,
  european
}

class ParliamentSource {
  final String id;
  final String name;
  final String flagIconAsset;
  final ParliamentType type;

  const ParliamentSource({
    required this.id,
    required this.name,
    required this.flagIconAsset,
    required this.type,
  });
  
  static const ParliamentSource pl = ParliamentSource(
    id: 'pl',
    name: 'Poland',
    flagIconAsset: 'assets/flags/pl.svg',
    type: ParliamentType.national,
  );
  
  static const ParliamentSource eu = ParliamentSource(
    id: 'eu',
    name: 'European Union',
    flagIconAsset: 'assets/flags/eu.svg',
    type: ParliamentType.european,
  );

  static const ParliamentSource us = ParliamentSource(
    id: 'us',
    name: 'United States of America',
    flagIconAsset: 'assets/flags/us.svg',
    type: ParliamentType.national,
  );

  static const ParliamentSource uk = ParliamentSource(
    id: 'uk',
    name: 'United Kingdom',
    flagIconAsset: 'assets/flags/gb.svg',
    type: ParliamentType.national,
  );

  static const ParliamentSource de = ParliamentSource(
    id: 'de',
    name: 'Germany',
    flagIconAsset: 'assets/flags/de.svg',
    type: ParliamentType.national,
  );

  static const ParliamentSource fr = ParliamentSource(
    id: 'fr',
    name: 'France',
    flagIconAsset: 'assets/flags/fr.svg',
    type: ParliamentType.national,
  );
  
  static const List<ParliamentSource> availableSources = [pl, eu, us, uk, de, fr];
}
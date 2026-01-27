import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/home_screen_data.dart';
import '../../services/parliament_manager.dart';
import '../../providers/language_provider.dart';
import '../../services/app_router.dart';
import 'home_deputy_section_card.dart';

class PoliticiansCard extends StatelessWidget {
  final List<HomeScreenDeputy> deputies;

  const PoliticiansCard({super.key, required this.deputies});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final manager = context.read<ParliamentManager>();
    final slug = manager.activeSlug;
    final lang = context.read<LanguageProvider>().appLanguageCode;
    final term = manager.currentTerm;

    return HomeDeputySectionCard(
      title: l10n.sectionMpProfiles,
      icon: Icons.people_outline,
      destinationPath: '/$lang/$slug/$term/members',
      buttonText: l10n.buttonAllMps,
      child: _buildDeputiesListContent(context, deputies),
    );
  }

  Widget _buildDeputiesListContent(
    BuildContext context,
    List<HomeScreenDeputy> deputies,
  ) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: deputies.isEmpty
            ? [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(child: Text(l10n.errorNoDeputiesData)),
                )
              ]
            : deputies.asMap().entries.map((entry) {
                int index = entry.key;
                HomeScreenDeputy deputyData = entry.value;
                return Column(
                  children: [
                    _buildSingleDeputyItem(context, deputyData),
                    if (index < deputies.length - 1)
                      const Divider(height: 24, indent: 16, endIndent: 16),
                  ],
                );
              }).toList(),
      ),
    );
  }

  Widget _buildSingleDeputyItem(BuildContext context, HomeScreenDeputy deputyData) {
    final l10n = AppLocalizations.of(context)!;
    final String deputyName = deputyData.fullName;
    final String deputyInfo = '${deputyData.club} • ${deputyData.district}';
    final String imageUrl = deputyData.imageUrl;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 80,
                    height: 100,
                    color: Colors.grey[200],
                    child: const Center(
                        child: Icon(Icons.person_outline,
                            color: Colors.grey, size: 30)),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 80,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(deputyName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(deputyInfo,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        final manager = context.read<ParliamentManager>();
                        final slug = manager.activeSlug;
                        final lang = context.read<LanguageProvider>().appLanguageCode;
                        final term = manager.currentTerm;
                        context.smartNavigate(
                            '/$lang/$slug/$term/members/${deputyData.deputyId}',
                            extra: deputyData);
                      },
                      icon: const Icon(Icons.person_search, size: 16),
                      label: Text(l10n.buttonCheckProfile),
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 13),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
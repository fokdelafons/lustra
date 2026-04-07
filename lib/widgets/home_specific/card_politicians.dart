import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lustra/l10n/app_localizations.dart';

import '../../models/mp.dart';
import '../../services/parliament_manager.dart';
import '../../providers/language_provider.dart';
import '../../widgets/web_link.dart';
import 'ui_deputy_card.dart';

class PoliticiansCard extends StatelessWidget {
  final List<MP> deputies;

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

  Widget _buildDeputiesListContent(BuildContext context, List<MP> deputies) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: deputies.isEmpty
          ? [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(child: Text(l10n.errorNoDeputiesData)),
              )
            ]
          : deputies.asMap().entries.map((entry) {
              int index = entry.key;
              MP deputyData = entry.value;
              return Column(
                children: [
                  _buildSingleDeputyItem(context, deputyData),
                  if (index < deputies.length - 1)
                    const Divider(height: 1, thickness: 1),
                ],
              );
            }).toList(),
    );
  }

  Widget _buildSingleDeputyItem(BuildContext context, MP deputyData) {
    final l10n = AppLocalizations.of(context)!;
    final String deputyName = deputyData.firstLastName;
    final String deputyInfo = '${deputyData.club} • ${deputyData.district}';
    final String imageUrl = deputyData.imageUrl ?? '';
    final attendance = deputyData.attendancePercentage;

    return Material(
      color: Colors.transparent,
      child: Builder(
        builder: (context) {
          final manager = context.read<ParliamentManager>();
          final slug = manager.activeSlug;
          final lang = context.read<LanguageProvider>().appLanguageCode;
          final term = manager.currentTerm;
          final internalPath = '/$lang/$slug/$term/members/${deputyData.id}';

          return WebLink(
            path: internalPath,
            extra: deputyData,
            builder: (context, onTapCallback) => InkWell(
              hoverColor: Colors.black.withAlpha(15), 
              onTap: onTapCallback,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), 
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Hero(
                        tag: 'avatar_${deputyData.id}', 
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          width: 80, 
                          height: 100, 
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 80, height: 100, color: Colors.grey[200],
                            child: const Center(child: Icon(Icons.person_outline, color: Colors.grey, size: 30)),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 80, height: 100, color: Colors.grey[300],
                            child: const Icon(Icons.person, size: 40, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            deputyName,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 1, overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            deputyInfo,
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                            maxLines: 1, overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          if (attendance != null)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${l10n.attendanceLabelShort}: ',
                                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                              ),
                              Text(
                                '${attendance.round()}%',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Icon(Icons.chevron_right, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
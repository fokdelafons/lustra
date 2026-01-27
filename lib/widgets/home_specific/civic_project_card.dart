import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lustra/models/home_screen_data.dart';
import 'package:lustra/services/app_router.dart';
import 'package:lustra/services/parliament_manager.dart';
import 'package:lustra/services/parliament_service_interface.dart';
import 'package:lustra/widgets/citizen_poll_widget.dart';
import 'package:lustra/services/share_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:lustra/providers/language_provider.dart';
import '../partially_expandable_list_widget.dart';

class CivicProjectCard extends StatelessWidget {
  final HomeScreenLegislationItem project;
  final String? title;
  final String? buttonText;

  const CivicProjectCard({
    super.key,
    required this.project,
    this.title,
    this.buttonText,
  });

@override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final displayTitle = title ?? l10n.civicProjectsSectionTitle;

    final headerActionText = l10n.civicRulesAction;

    final bottomButtonText = l10n.actionSeeAll;

    final primaryColor = Colors.teal[700]!;
    final lightPrimaryColor = Colors.teal.withAlpha((255 * 0.05).round());
    final activeService = context.read<ParliamentServiceInterface>();

    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(
                      kIsWeb ? 24.0 : MediaQuery.of(context).size.width * 0.04
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.volunteer_activism, color: primaryColor),
                      SizedBox(width: kIsWeb ? 12.0 : MediaQuery.of(context).size.width * 0.02),
                      Expanded(
                        child: Text(
                          displayTitle,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          final manager = context.read<ParliamentManager>();
                          final slug = manager.activeSlug;
                          final lang = context.read<LanguageProvider>().appLanguageCode;
                          context.smartNavigate('/$lang/$slug/civic-project');
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                headerActionText,
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(Icons.info_outline, size: 16, color: primaryColor),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, thickness: 1),
                _buildLegislationContentReplica(context, project, l10n, primaryColor),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            final manager = context.read<ParliamentManager>();
                            final slug = manager.activeSlug;
                            final lang = context.read<LanguageProvider>().appLanguageCode;
                            context.smartNavigate('/$lang/$slug/civic/legislations/${project.id}', extra: project);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.article_outlined, size: 18, color: primaryColor),
                                const SizedBox(width: 8),
                                Text(
                                  l10n.detailsButton,
                                  style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(height: 24, width: 1, color: Colors.grey[200]),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                             final shareService = ShareService();
                             final manager = context.read<ParliamentManager>();
                             final langProvider = context.read<LanguageProvider>();
                             final pid = manager.activeServiceId!;
                             final slug = manager.activeSlug;
                             final lang = langProvider.appLanguageCode;
                             final term = manager.currentTerm ?? 0;
                             final status = activeService.translateStatus(context, project.status);
                             showModalBottomSheet(
                              context: context,
                              builder: (bottomSheetContext) {
                                return SafeArea(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        leading: const Icon(Icons.crop_square),
                                        title: Text(l10n.shareAsPost),
                                        onTap: () {
                                          Navigator.of(bottomSheetContext).pop();
                                          shareService.shareLegislation(
                                            context: context, legislation: project, imageSize: const Size(1080, 1080),
                                            l10n: l10n, translatedStatus: status, parliamentId: pid,
                                            slug: slug, lang: lang, term: term,
                                            flagAssetPath: activeService.flagAssetPath, parliamentName: activeService.name,
                                            votingTitle: l10n.votingResultsTitle,
                                          );
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.phone_android),
                                        title: Text(l10n.shareAsStory),
                                        onTap: () {
                                          Navigator.of(bottomSheetContext).pop();
                                          shareService.shareLegislation(
                                            context: context, legislation: project, imageSize: const Size(1080, 1920),
                                            l10n: l10n, translatedStatus: status, parliamentId: pid,
                                            slug: slug, lang: lang, term: term,
                                            flagAssetPath: activeService.flagAssetPath, parliamentName: activeService.name,
                                            votingTitle: l10n.votingResultsTitle,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.share, size: 18, color: primaryColor),
                                const SizedBox(width: 8),
                                Text(
                                  l10n.shareAction,
                                  style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: lightPrimaryColor,
            child: InkWell(
              onTap: () {
                final manager = context.read<ParliamentManager>();
                final slug = manager.activeSlug;
                final lang = context.read<LanguageProvider>().appLanguageCode;
                context.smartNavigate('/$lang/$slug/civic/legislations');
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        bottomButtonText,
                        style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward, size: 16, color: primaryColor),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegislationContentReplica(
      BuildContext context, HomeScreenLegislationItem data, AppLocalizations l10n, Color primaryColor) {
    final List<String> keyPoints = data.keyPoints;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            data.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 8),
          Text(
            data.summary ?? l10n.errorNoSummaryLegislationInProcess,
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
          ),
          const SizedBox(height: 8),
          
          Theme(
            data: Theme.of(context).copyWith(primaryColor: primaryColor),
            child: PartiallyExpandableListWidget(
              title: keyPoints.isNotEmpty ? l10n.keyPoints : l10n.noKeyPoints,
              items: keyPoints,
              itemBuilder: (context, item) => bulletPoint(context, item as String),
            ),
          ),
          
          const SizedBox(height: 20),
          Theme(
            data: Theme.of(context).copyWith(primaryColor: primaryColor),
            child: CitizenPollWidget(
              targetType: 'civic',
              targetId: data.id,
              itemData: data,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../models/home_screen_data.dart';
import '../../services/share_service.dart';
import '../../services/parliament_manager.dart';
import '../../providers/language_provider.dart';
import '../../services/parliament_service_interface.dart';
import '../../services/app_router.dart';

class HomeSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final String destinationPath;
  final String buttonText;
  final HomeScreenLegislationItem? legislationItem;

  const HomeSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    required this.destinationPath,
    required this.buttonText,
    this.legislationItem,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final primaryColor = Theme.of(context).primaryColor;

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
                // --- HEADER ---
                Padding(
                  padding: EdgeInsets.all(
                    kIsWeb ? 24.0 : MediaQuery.of(context).size.width * 0.04
                  ),
                  child: Row(
                    children: [
                      Icon(icon, color: primaryColor),
                      SizedBox(width: kIsWeb ? 12.0 : MediaQuery.of(context).size.width * 0.02),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, thickness: 1),
                
                // --- CONTENT ---
                child,

                // --- ACTION BUTTONS (Details / Share) ---
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Przycisk SZCZEGÓŁY
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (legislationItem != null) {
                              final manager = context.read<ParliamentManager>();
                              final slug = manager.activeSlug;
                              final lang = context.read<LanguageProvider>().appLanguageCode;
                              final term = manager.currentTerm;
                              context.smartNavigate('/$lang/$slug/$term/legislations/${legislationItem!.id}', extra: legislationItem);
                            }
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
                      // PIONOWY SEPARATOR
                      Container(height: 24, width: 1, color: Colors.grey[200]),
                      // Przycisk UDOSTĘPNIJ
                      Expanded(
                        child: InkWell(
                          onTap: () => _handleShare(context),
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
          
          // --- FOOTER BUTTON (See All) ---
          Container(
            color: primaryColor.withAlpha((255 * 0.05).round()),
            child: InkWell(
              onTap: () {
                context.smartNavigate(destinationPath);
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
                        buttonText,
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

  void _handleShare(BuildContext context) {
    if (legislationItem == null) return;
    
    final l10n = AppLocalizations.of(context)!;
    final shareService = ShareService(); // Tworzymy instancję (lub można wstrzyknąć)
    final manager = context.read<ParliamentManager>();
    final langProvider = context.read<LanguageProvider>();

    final parliamentId = manager.activeServiceId;
    final slug = manager.activeSlug;
    final lang = langProvider.appLanguageCode;
    final term = manager.currentTerm ?? 0;
    final activeService = context.read<ParliamentServiceInterface>();
    final status = activeService.translateStatus(context, legislationItem!.status);

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
                    context: context, 
                    legislation: legislationItem!, 
                    imageSize: const Size(1080, 1080),
                    l10n: l10n, 
                    translatedStatus: status, 
                    parliamentId: parliamentId!, 
                    slug: slug, 
                    lang: lang, 
                    term: term,
                    flagAssetPath: activeService.flagAssetPath, 
                    parliamentName: activeService.name,
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
                    context: context, 
                    legislation: legislationItem!, 
                    imageSize: const Size(1080, 1920),
                    l10n: l10n, 
                    translatedStatus: status, 
                    parliamentId: parliamentId!, 
                    slug: slug, 
                    lang: lang, 
                    term: term,
                    flagAssetPath: activeService.flagAssetPath, 
                    parliamentName: activeService.name,
                    votingTitle: l10n.votingResultsTitle,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
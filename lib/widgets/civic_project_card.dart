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
import 'package:intl/intl.dart' as intl;

class CivicProjectCard extends StatelessWidget {
  final HomeScreenLegislationItem project;
  final String? title;      // Zmiana na String?
  final String? buttonText; // Zmiana na String?

  const CivicProjectCard({
    super.key,
    required this.project,
    this.title,       // Usuwamy domyślne wartości stąd
    this.buttonText,  // Usuwamy domyślne wartości stąd
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // --- TUTAJ USTALAMY WARTOŚCI DOMYŚLNE Z L10N ---
    final displayTitle = title ?? l10n.civicProjectsSectionTitle;
    final displayButtonText = buttonText ?? l10n.submitCivicProjectButton;
    // -----------------------------------------------

    final primaryColor = Colors.teal[700]!;
    final lightPrimaryColor = Colors.teal.withAlpha((255 * 0.05).round());
    
    final activeService = context.read<ParliamentServiceInterface>();

    // --- STRUKTURA 'buildClassicStyleCard' ---
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
                // HEADER
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
                    ],
                  ),
                ),
                const Divider(height: 1, thickness: 1),
                
                // CONTENT (Replika 'buildLegislationContent')
                _buildLegislationContentReplica(context, project, l10n, primaryColor),

                // ACTION BAR (Szczegóły | Udostępnij)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Przycisk SZCZEGÓŁY
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            final manager = context.read<ParliamentManager>();
                            final slug = manager.activeSlug;
                            final lang = context.read<LanguageProvider>().appLanguageCode;
                            final term = manager.currentTerm;
                            context.smartNavigate('/$lang/$slug/$term/legislations/${project.id}', extra: project);
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
                      // SEPARATOR PIONOWY
                      Container(height: 24, width: 1, color: Colors.grey[200]),
                      // Przycisk UDOSTĘPNIJ
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
          
          // BOTTOM BUTTON (Inny kolor)
          Container(
            color: lightPrimaryColor,
            child: InkWell(
              onTap: () {
                final manager = context.read<ParliamentManager>();
                final slug = manager.activeSlug;
                final lang = context.read<LanguageProvider>().appLanguageCode;
                final term = manager.currentTerm;
                context.smartNavigate('/$lang/$slug/$term/civic-project');
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
                        displayButtonText,
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

  // --- REPLIKA 'buildLegislationContent' z home_screen.dart ---
  Widget _buildLegislationContentReplica(
      BuildContext context, HomeScreenLegislationItem data, AppLocalizations l10n, Color primaryColor) {
    final List<String> keyPoints = data.keyPoints;
    final DateTime? processStartDate = data.processStartDate;

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
          // Data rozpoczęcia (dla projektów obywatelskich może być null, ale zachowujemy układ)
          if (processStartDate != null)
            Row(
              children: [
                Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  intl.DateFormat.yMMMMd(l10n.localeName).format(processStartDate),
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])
                ),
              ],
            ),
          const SizedBox(height: 12),
          
          // Lista rozwijana (Replika widgetu z Home)
          _PartiallyExpandableListReplica(
            title: keyPoints.isNotEmpty ? l10n.keyPoints : l10n.noKeyPoints,
            items: keyPoints,
            initiallyVisibleCount: kIsWeb ? 20 : 2,
            itemBuilder: (context, item) => _bulletPointReplica(context, item as String),
            primaryColor: primaryColor, // Przekazujemy kolor dla strzałek
          ),
          
          const SizedBox(height: 20),
          
          // Sonda (Wrapujemy w Theme, aby wymusić kolor, jeśli widget nie obsługuje parametru)
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

// --- REPLIKI WIDGETÓW POMOCNICZYCH (Skopiowane 1:1 z home_screen.dart) ---

class _PartiallyExpandableListReplica extends StatefulWidget {
  final String title;
  final List<dynamic> items;
  final int initiallyVisibleCount;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final Color primaryColor;

  const _PartiallyExpandableListReplica({
    required this.title,
    required this.items,
    required this.initiallyVisibleCount,
    required this.itemBuilder,
    required this.primaryColor,
  });

  @override
  State<_PartiallyExpandableListReplica> createState() =>
      _PartiallyExpandableListReplicaState();
}

class _PartiallyExpandableListReplicaState extends State<_PartiallyExpandableListReplica> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool canExpand = widget.items.length > widget.initiallyVisibleCount;
    final List<dynamic> visibleItems = _isExpanded
        ? widget.items
        : widget.items.take(widget.initiallyVisibleCount).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: visibleItems.length,
          itemBuilder: (context, index) => widget.itemBuilder(context, visibleItems[index]),
        ),
        if (canExpand)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _isExpanded ? AppLocalizations.of(context)!.actionCollapse : AppLocalizations.of(context)!.actionExpand,
                    style: TextStyle(
                      color: widget.primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    size: 18,
                    color: widget.primaryColor,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

Widget _bulletPointReplica(BuildContext context, String text) {
  const double bulletSize = 5.0;
  return Padding(
    padding: const EdgeInsets.only(bottom: 6.0, left: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6, right: 8.0),
          width: bulletSize,
          height: bulletSize,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[800], height: 1.3),
          ),
        ),
      ],
    ),
  );
}
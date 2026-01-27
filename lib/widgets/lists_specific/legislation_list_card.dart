import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/legislation.dart';
import '../../services/parliament_service_interface.dart';
import '../../providers/translators.dart';


class LegislationListCard extends StatelessWidget {
  final Legislation bill;
  final VoidCallback onTap;
  
  final Widget? additionalInfoWidget;

  const LegislationListCard({
    super.key,
    required this.bill,
    required this.onTap,
    this.additionalInfoWidget,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    
    final displayInfo = activeService.getDisplayableStatusInfo(context, bill.status);
    
    final List<String> keyPoints = bill.keyPoints;
    const int maxVisibleKeyPoints = 3;
    final bool hasMoreKeyPoints = keyPoints.length > maxVisibleKeyPoints;
    final List<String> visibleKeyPoints = keyPoints.take(maxVisibleKeyPoints).toList();
    
    final List<String> individualCategories = _parseCategories(bill.category);

    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.transparent),
      ),
      child: InkWell(
        onTap: onTap,
        hoverColor: Theme.of(context).primaryColor.withValues(alpha: 0.04),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              // --- HEADER: STATUS & CATEGORIES ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (displayInfo.label.isNotEmpty) 
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: displayInfo.backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        displayInfo.label,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: displayInfo.textColor, 
                          fontWeight: FontWeight.w500, 
                          fontSize: 10
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      spacing: 4.0,
                      runSpacing: 4.0,
                      children: [
                        ...individualCategories
                            .where((cat) => !(individualCategories.length == 1 && cat == l10n.categoryOther))
                            .map((cat) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey.withAlpha((255 * 0.05).round()),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              categoryApiKeyToLabel(context, cat),
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Colors.grey[700], 
                                fontWeight: FontWeight.w500, 
                                fontSize: 10
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }),
                        if (bill.isEU == true)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0), 
                            child: SvgPicture.asset('assets/flags/eu.svg', height: 16),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 8), 
              
              // --- TITLE ---
              Text(
                bill.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              
              const SizedBox(height: 12), 
              
              // --- DESCRIPTION ---
              if (bill.description.isNotEmpty && bill.description != l10n.noData)
                Text(
                  bill.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[800]),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              else
                 const SizedBox.shrink(),

              // --- INJECTED SLOT (Dates, Process info, etc.) ---
              if (additionalInfoWidget != null) ...[
                const SizedBox(height: 12),
                additionalInfoWidget!,
              ],

              // --- KEY POINTS ---
              if (visibleKeyPoints.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    ...visibleKeyPoints.map((point) => Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, top: 4.0),
                            child: Icon(Icons.circle, size: 6, color: Colors.grey[600]),
                          ),
                          Expanded(
                            child: Text(
                              point,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    )),
                    if (hasMoreKeyPoints)
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0), 
                        child: Text(
                          l10n.moreButton,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ),
                  ],
                ),
                
              const SizedBox(height: 12),

              // --- FOOTER (LIKES & ACTIONS) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.thumb_up_alt_outlined, size: 16, color: Colors.green[700]),
                      const SizedBox(width: 4),
                      Text(
                        NumberFormat.compact().format(bill.likes),
                        style: TextStyle(color: Colors.grey[700], fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.thumb_down_alt_outlined, size: 16, color: Colors.red[700]),
                      const SizedBox(width: 4),
                      Text(
                        NumberFormat.compact().format(bill.dislikes),
                        style: TextStyle(color: Colors.grey[700], fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        bill.id,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 11,
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),

                  Text(
                    l10n.seeDetailsLink,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  List<String> _parseCategories(String categoryString) {
    if (categoryString.isEmpty) {
      return [];
    }
    String cleanedString = categoryString;
    if (cleanedString.startsWith('[') && cleanedString.endsWith(']')) {
      cleanedString = cleanedString.substring(1, cleanedString.length - 1);
    }
    return cleanedString
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PartiallyExpandableListWidget extends StatefulWidget {
  final String title;
  final List<dynamic> items;
  final int? initiallyVisibleCount;
  final Widget Function(BuildContext, dynamic) itemBuilder;

  const PartiallyExpandableListWidget({
    super.key,
    required this.title,
    required this.items,
    this.initiallyVisibleCount,
    required this.itemBuilder,
  });

  @override
  PartiallyExpandableListWidgetState createState() =>
      PartiallyExpandableListWidgetState();
}

class PartiallyExpandableListWidgetState extends State<PartiallyExpandableListWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final int effectiveLimit = widget.initiallyVisibleCount ?? 
        (MediaQuery.of(context).size.width > 750 ? 20 : 3);

    final bool canExpand = widget.items.length > effectiveLimit;
    final List<dynamic> visibleItems = _isExpanded
        ? widget.items
        : widget.items.take(effectiveLimit).toList();

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
                      color: Theme.of(context).primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

Widget bulletPoint(BuildContext context, String text) {
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
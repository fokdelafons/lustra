import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LegislationControlBar extends StatelessWidget {
  final String searchQuery;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onSearchSubmitted;
  final VoidCallback onSearchClear;
  
  final List<String> categoryOptions;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  final bool showDocType;
  final Map<String, String> docTypeOptions;
  final String selectedDocTypeKey;
  final ValueChanged<String?>? onDocTypeChanged;

  final Map<String, String> sortOptions;
  final String selectedSortKey;
  final ValueChanged<String?> onSortChanged;

  final bool showSearch;
  final bool isSearchActive;

  const LegislationControlBar({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.onSearchSubmitted,
    required this.onSearchClear,
    required this.categoryOptions,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.sortOptions,
    required this.selectedSortKey,
    required this.onSortChanged,
    this.showDocType = true,
    this.docTypeOptions = const {},
    this.selectedDocTypeKey = 'all',
    this.onDocTypeChanged,
    this.showSearch = true,
    this.isSearchActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        if (showSearch)
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: TextField(
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: searchQuery,
                  selection: TextSelection.collapsed(offset: searchQuery.length),
                ),
              ),
              onChanged: onSearchChanged,
              onSubmitted: onSearchSubmitted,
              decoration: InputDecoration(
                hintText: l10n.searchHint,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                filled: true,
                suffixIcon: searchQuery.isNotEmpty
                    ? InkWell(
                        onTap: onSearchClear,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(width: 1, height: 24, color: Colors.grey[300]),
                              const SizedBox(width: 8),
                              Text(
                                l10n.clearText,
                                style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        
        IgnorePointer(
          ignoring: isSearchActive,
          child: Opacity(
            opacity: isSearchActive ? 0.5 : 1.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFilterChips(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Document Type Dropdown
                      if (showDocType)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(l10n.filterTypeLabel, style: Theme.of(context).textTheme.labelMedium),
                            DropdownButton<String>(
                              value: selectedDocTypeKey,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                              items: {'all': l10n.allOption, ...docTypeOptions}
                                  .entries
                                  .map((entry) => DropdownMenuItem(value: entry.key, child: Text(entry.value)))
                                  .toList(),
                              onChanged: onDocTypeChanged,
                              isDense: true,
                              underline: const SizedBox.shrink(),
                            ),
                          ],
                        )
                      else
                        const SizedBox.shrink(), // empty widget, for alignment

                      // Sorting Dropdown
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(l10n.sortingLabel, style: Theme.of(context).textTheme.labelMedium),
                          DropdownButton<String>(
                            value: selectedSortKey,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                            items: sortOptions.entries
                                .map((entry) => DropdownMenuItem(value: entry.key, child: Text(entry.value)))
                                .toList(),
                            onChanged: onSortChanged,
                            isDense: true,
                            underline: const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    final chips = categoryOptions.map((filter) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ChoiceChip(
          label: Text(filter),
          selected: selectedCategory == filter,
          onSelected: (selected) {
            if (selected) {
              onCategorySelected(filter);
            }
          },
          selectedColor: Theme.of(context).primaryColor.withAlpha((255 * 0.05).round()),
          labelStyle: TextStyle(
            color: selectedCategory == filter ? Theme.of(context).primaryColor : null,
            fontWeight: selectedCategory == filter ? FontWeight.bold : FontWeight.normal,
          ),
          side: BorderSide(
            color: selectedCategory == filter ? Theme.of(context).primaryColor : Colors.grey.shade300,
          ),
          visualDensity: VisualDensity.compact,
        ),
      );
    }).toList();

    final bool isWideScreen = kIsWeb && MediaQuery.of(context).size.width > 900;

    if (isWideScreen) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 0.0,
            runSpacing: 8.0,
            children: chips,
          ),
        ),
      );
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(children: chips),
      );
    }
  }
}
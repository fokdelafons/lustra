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
  final Map<String, String> statusOptions;
  final String selectedStatusKey;
  final ValueChanged<String?>? onStatusChanged;
  final Map<String, String> sortOptions;
  final String selectedSortKey;
  final ValueChanged<String?> onSortChanged;

  final bool showSearch;
  final bool isSearchActive;
  final bool hideNoDocument;
  final ValueChanged<bool>? onHideNoDocumentChanged;

  const LegislationControlBar({
    super.key,
    this.hideNoDocument = false,
    this.onHideNoDocumentChanged,
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
    this.statusOptions = const {},
    this.selectedStatusKey = 'all',
    this.onStatusChanged,
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
                _AdvancedFiltersBar(
                  showDocType: showDocType,
                  docTypeOptions: docTypeOptions,
                  selectedDocTypeKey: selectedDocTypeKey,
                  onDocTypeChanged: onDocTypeChanged,
                  sortOptions: sortOptions,
                  selectedSortKey: selectedSortKey,
                  onSortChanged: onSortChanged,
                  hideNoDocument: hideNoDocument,
                  onHideNoDocumentChanged: onHideNoDocumentChanged,
                  statusOptions: statusOptions,
                  selectedStatusKey: selectedStatusKey,
                  onStatusChanged: onStatusChanged,
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

class _AdvancedFiltersBar extends StatefulWidget {
  final Map<String, String> docTypeOptions;
  final String selectedDocTypeKey;
  final ValueChanged<String?>? onDocTypeChanged;
  final Map<String, String> sortOptions;
  final Map<String, String> statusOptions;
  final String selectedStatusKey;
  final ValueChanged<String?>? onStatusChanged;
  final String selectedSortKey;
  final ValueChanged<String?> onSortChanged;
  final bool showDocType;
  final bool hideNoDocument;
  final ValueChanged<bool>? onHideNoDocumentChanged;

  const _AdvancedFiltersBar({
    required this.docTypeOptions,
    required this.selectedDocTypeKey,
    this.onDocTypeChanged,
    required this.sortOptions,
    this.statusOptions = const {},
    this.selectedStatusKey = 'all',
    this.onStatusChanged,
    required this.selectedSortKey,
    required this.onSortChanged,
    this.showDocType = true,
    this.hideNoDocument = false,
    this.onHideNoDocumentChanged,
  });

  @override
  State<_AdvancedFiltersBar> createState() => _AdvancedFiltersBarState();
}

class _AdvancedFiltersBarState extends State<_AdvancedFiltersBar> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.sort, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 6),
                  DropdownButton<String>(
                    value: widget.selectedSortKey,
                    focusColor: Colors.transparent,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                    items: widget.sortOptions.entries
                        .map((entry) => DropdownMenuItem(value: entry.key, child: Text(entry.value)))
                        .toList(),
                    onChanged: (val) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      widget.onSortChanged(val);
                    },
                    isDense: true,
                    menuMaxHeight: 300,
                    underline: const SizedBox.shrink(),
                    icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () => setState(() => _isExpanded = !_isExpanded),
                icon: Icon(_isExpanded ? Icons.tune : Icons.tune_outlined, size: 16),
                label: Text(
                  l10n.filtersLabel,
                  style: Theme.of(context).textTheme.bodySmall,
                ), 
                style: TextButton.styleFrom(
                  foregroundColor: _isExpanded ? Theme.of(context).primaryColor : Colors.grey[700],
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox(width: double.infinity, height: 0),
          secondChild: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            margin: const EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                top: BorderSide(color: Colors.grey[200]!),
                bottom: BorderSide(color: Colors.grey[200]!),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.showDocType)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      children: [
                        Text(l10n.filterTypeLabel, style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(width: 16),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true, 
                              alignment: Alignment.centerRight, 
                              value: widget.selectedDocTypeKey,
                              focusColor: Colors.transparent,
                              style: Theme.of(context).textTheme.bodySmall,
                              items: {'all': l10n.allOption, ...widget.docTypeOptions}
                                  .entries
                                  .map((entry) => DropdownMenuItem(
                                        value: entry.key,
                                        alignment: Alignment.centerRight,
                                        child: Text(entry.value),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (widget.onDocTypeChanged != null) widget.onDocTypeChanged!(val);
                              },
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                if (widget.statusOptions.length > 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      children: [
                        Text(l10n.statusFilterLabel, style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(width: 16),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true, 
                              alignment: Alignment.centerRight, 
                              value: widget.selectedStatusKey,
                              focusColor: Colors.transparent,
                              style: Theme.of(context).textTheme.bodySmall,
                              items: widget.statusOptions.entries
                                  .map((entry) => DropdownMenuItem(
                                        value: entry.key,
                                        alignment: Alignment.centerRight,
                                        child: Text(entry.value),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (widget.onStatusChanged != null) widget.onStatusChanged!(val);
                              },
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                InkWell(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (widget.onHideNoDocumentChanged != null) {
                      widget.onHideNoDocumentChanged!(!widget.hideNoDocument);
                    }
                  },
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.onlyWithSourceTextLabel, style: Theme.of(context).textTheme.labelMedium),
                        SizedBox(
                          height: 24,
                          child: Checkbox(
                            value: widget.hideNoDocument,
                            onChanged: (bool? val) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (val != null && widget.onHideNoDocumentChanged != null) {
                                widget.onHideNoDocumentChanged!(val);
                              }
                            },
                            activeColor: Theme.of(context).primaryColor,
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
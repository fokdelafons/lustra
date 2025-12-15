import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as developer;
import '../services/parliament_service_interface.dart';
import '../models/legislation.dart';
import '../models/parliament_source.dart';
import '../services/parliament_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/translators.dart';
import 'package:flutter/foundation.dart';
import '../services/app_router.dart';

class LegislationScreen extends StatefulWidget {
  const LegislationScreen({super.key});

  @override
  LegislationScreenState createState() => LegislationScreenState();
}

class LegislationScreenState extends State<LegislationScreen> {
  Map<String, String> _documentTypeOptions = {};
  String _selectedDocumentTypeKey = 'all';
  List<Legislation> _bills = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _errorMessage;
  String? _nextCursor;
  final int _limit = 20;
  bool _hasMoreData = true;
  ParliamentSource? _lastSource;
  int? _lastTerm;
  bool _isFirstBuild = true;
  String _searchQuery = '';
  bool _isSearchActive = false;

  void _initializeLocalizableLists(AppLocalizations l10n) {
  if (_categoryOptions.isEmpty) {
    _categoryOptions = [
      l10n.categoryAll, l10n.categoryHealth, l10n.categoryFamily, l10n.categoryTaxes, 
      l10n.categoryMigration, l10n.categoryLabor, l10n.categorySecurity, l10n.categoryEducation,
      l10n.categoryEnvironment, l10n.categoryCourtsAndLaw, l10n.categoryTransport, 
      l10n.categoryBenefits, l10n.categoryRealEstate, l10n.categoryMediaAndCulture,
      l10n.categoryLocalGovernment, l10n.categoryAgriculture, l10n.categoryPublicInvestments, 
      l10n.categoryInformatization, l10n.categoryEconomy
    ];
  }
}
  
  List<String> _categoryOptions = [];
  late String _selectedCategory;
  Map<String, String> _statusOptions = {};
  String _selectedStatusKey = 'all';
  

  @override
  void initState() {
    super.initState();
    developer.log('LegislationScreen initState', name: 'LegislationScreen');
    _selectedStatusKey = 'all'; 
  }
  
  @override
  void didChangeDependencies() {
   super.didChangeDependencies();
   final activeService = context.watch<ParliamentServiceInterface>();
   if (_isFirstBuild || _lastSource?.id != activeService.source.id || _lastTerm != activeService.currentTerm) {
      developer.log('didChangeDependencies: Wykryto zmianę kontekstu. Źródło: ${activeService.source.id}, kadencja: ${activeService.currentTerm}', name: 'LegislationScreen');
     final l10n = AppLocalizations.of(context)!;
      _initializeLocalizableLists(l10n);
      _selectedCategory = l10n.categoryAll;
     _isFirstBuild = false;
     _lastSource = activeService.source;
     _lastTerm = activeService.currentTerm;
      _loadFilterOptions();
     WidgetsBinding.instance.addPostFrameCallback((_) {
       if (mounted) {
          _resetAndLoadData(newSourceChanged: true, forceRefresh: false);
       }
     });
   }
  }

Future<void> _loadFilterOptions() async {
  if (!mounted) return;
  final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
  final l10n = AppLocalizations.of(context)!;
  try {
    final results = await Future.wait([
      activeService.getLegislationFilterStatuses(context),
      activeService.getLegislationFilterDocumentTypes(context),
    ]);
    if (!mounted) return;

    final statuses = results[0];
    statuses.remove('all');

    final Map<String, String> newOptions = {
      'sort_popularity': l10n.sortByPopularity,
      'sort_newest': l10n.sortByFreshness,
      ...statuses,
    };
    
    setState(() {
      _statusOptions = newOptions;
      _selectedStatusKey = 'sort_popularity'; 
      _documentTypeOptions = results[1];
      _selectedDocumentTypeKey = 'all';
    });
  } catch (e) {
    developer.log('Błąd podczas ładowania opcji filtrów: $e', name: 'LegislationScreen');
  }
}

  void _resetAndLoadData({bool forceRefresh = false, bool newSourceChanged = false}) {
    developer.log('Resetowanie stanu i ładowanie danych. forceRefresh: $forceRefresh, newSourceChanged: $newSourceChanged', name: 'LegislationScreen');
    if (!mounted) {
      developer.log('Próba resetowania stanu na odmontowanym widgecie.', name: 'LegislationScreen', level: 900);
      return;
    }
    setState(() {
      _bills = [];
      _isLoading = true;
      _errorMessage = null;
      _nextCursor = null;
      _hasMoreData = true;
      if (newSourceChanged) {
        _searchQuery = '';
        _selectedStatusKey = _statusOptions.containsKey('all') ? 'all' : (_statusOptions.keys.isNotEmpty ? _statusOptions.keys.first : '');
        _selectedCategory = _categoryOptions.first;
        _selectedDocumentTypeKey = 'all';
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _loadBills(forceRefresh: forceRefresh);
      }
    });
  }
  
Future<void> _loadBills({bool forceRefresh = false}) async {
    developer.log('Rozpoczynanie pobierania ustaw. forceRefresh: $forceRefresh', name: 'LegislationScreen');
    try {
      final l10n = AppLocalizations.of(context)!;
      final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);

      // --- DIAGNOSTIC LOGS ---
      developer.log('>>> Stan _selectedStatusKey tuż przed budową zapytania: $_selectedStatusKey', name: 'DIAGNOZA');
      final bool isSortingOption = _selectedStatusKey.startsWith('sort_');
      final String sortBy = _selectedStatusKey == 'sort_newest' ? 'votingDate_desc' : 'popularity';
      developer.log('>>> Wyliczony parametr "sortBy" do wysłania: $sortBy', name: 'DIAGNOZA');
      // --- END DIAGNOSTIC LOGS ---

      final response = await activeService.getLegislations(
       context,
       limit: _limit,
       lastVisibleId: null,
       forceRefresh: forceRefresh,
       searchQuery: _searchQuery,
       sortBy: sortBy,
       status: isSortingOption ? null : _selectedStatusKey,
       documentType: _selectedDocumentTypeKey == 'all'
         ? null
         : [_selectedDocumentTypeKey],
       category: _selectedCategory == l10n.categoryAll 
          ? null 
          : categoryLabelToApiKey(context, _selectedCategory),
      );

      if (!mounted) return;
      
      final List<dynamic> items = response['legislations'] ?? [];
      final List<Legislation> fetchedBills = items.map((item) => Legislation.fromJson(item as Map<String, dynamic>)).toList();
      
      developer.log('Pobrano ${fetchedBills.length} ustaw.', name: 'LegislationScreen');
      
      setState(() {
        _bills = fetchedBills;
        _isLoading = false;
        _nextCursor = response['nextCursor'];
        _hasMoreData = _nextCursor != null;
        _errorMessage = null;
      });
    } catch (e, stackTrace) {
      developer.log('Błąd podczas ładowania ustaw: $e', name: 'LegislationScreen', error: e, stackTrace: stackTrace);
      if (!mounted) return;
      final l10n = AppLocalizations.of(context)!;
      setState(() {
        _isLoading = false;
        _errorMessage = l10n.errorFetchData;
        _bills = [];
        _hasMoreData = false;
      });
    }
  }

    Future<void> _loadMoreBills() async {
    if (_isLoadingMore || !_hasMoreData || _isLoading || !mounted) {
      return;
    }
    setState(() => _isLoadingMore = true);
    try {
      final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
      final bool isSortingOption = _selectedStatusKey.startsWith('sort_');
      final String sortBy = _selectedStatusKey == 'sort_newest' ? 'votingDate_desc' : 'popularity';
      final l10n = AppLocalizations.of(context)!;

      final response = await activeService.getLegislations(
        context, 
        limit: _limit,
        lastVisibleId: _nextCursor,
        searchQuery: _searchQuery,
        sortBy: sortBy,
        status: isSortingOption ? null : _selectedStatusKey,
        documentType: _selectedDocumentTypeKey == 'all'
          ? null
          : [_selectedDocumentTypeKey],
        category: _selectedCategory == l10n.categoryAll 
          ? null 
          : categoryLabelToApiKey(context, _selectedCategory),
      );
      if (!mounted) return;

      final List<dynamic> items = response['legislations'] ?? [];
      final List<Legislation> moreBills = items.map((item) => Legislation.fromJson(item as Map<String, dynamic>)).toList();

      setState(() {
        _bills.addAll(moreBills);
        _isLoadingMore = false;
        _nextCursor = response['nextCursor'];
        _hasMoreData = _nextCursor != null;
      });
    } catch (e, stackTrace) {
      developer.log('Error loading more bills: $e', name: 'LegislationScreen', error: e, stackTrace: stackTrace);
      if (mounted) {
        setState(() => _isLoadingMore = false);
      }
    }
  }
  
  List<Legislation> _getProcessedBills() {
    return _bills;
  }

@override
Widget build(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  final manager = Provider.of<ParliamentManager>(context);
  if (manager.isLoading || !manager.isInitialized) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.legislationScreenTitle("")),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
  if (manager.error != null) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.legislationScreenTitle("")),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(l10n.noMPsForSource, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => manager.changeSource(manager.activeServiceId!),
              child: Text(l10n.tryAgainButton),
            ),
          ],
        ),
      ),
    );
  }
  _initializeLocalizableLists(l10n);
  return ChangeNotifierProvider.value(
    value: manager.activeService,
    child: Consumer<ParliamentServiceInterface>(
      builder: (context, activeService, child) {
        final processedBills = _getProcessedBills();
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.legislationScreenTitle(activeService.name)),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: l10n.refreshDataTooltip,
                onPressed: _isLoading ? null : () async {
                  _resetAndLoadData(forceRefresh: true);
                },
              ),
            ],
          ),
          body: Column(
            children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: TextField(
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: _searchQuery,
                    selection: TextSelection.collapsed(offset: _searchQuery.length),
                  ),
                ),
                onChanged: (value) {
                  _searchQuery = value;
                },
                onSubmitted: (value) {
                  setState(() {
                    _searchQuery = value;
                    _isSearchActive = value.isNotEmpty;
                  });
                  _resetAndLoadData();
                },
                decoration: InputDecoration(
                  hintText: l10n.searchHint,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                  filled: true,
                  suffixIcon: _searchQuery.isNotEmpty
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              _searchQuery = '';
                              _isSearchActive = false;
                            });
                            _resetAndLoadData();
                          },
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
                ignoring: _isSearchActive,
                child: Opacity(
                  opacity: _isSearchActive ? 0.5 : 1.0,
                  child: Column(
                    children: [
                      _buildFilterChips(_categoryOptions, _selectedCategory, (selectedCategory) {
                        setState(() => _selectedCategory = selectedCategory);
                        _resetAndLoadData(forceRefresh: false);
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(l10n.filterTypeLabel, style: Theme.of(context).textTheme.labelMedium),
                                DropdownButton<String>(
                                  value: _selectedDocumentTypeKey,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                                  items: {
                                    'all': l10n.allOption,
                                    ..._documentTypeOptions
                                  }.entries.map((entry) {
                                    return DropdownMenuItem<String>(
                                      value: entry.key,
                                      child: Text(entry.value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newKey) {
                                    if (newKey != null && newKey != _selectedDocumentTypeKey) {
                                      setState(() => _selectedDocumentTypeKey = newKey);
                                      _resetAndLoadData(forceRefresh: false);
                                    }
                                  },
                                  isDense: true,
                                  underline: const SizedBox.shrink(),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(l10n.sortingLabel, style: Theme.of(context).textTheme.labelMedium),
                                DropdownButton<String>(
value: _selectedStatusKey,
style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
items: _statusOptions.entries.map((entry) {
return DropdownMenuItem<String>(
value: entry.key,
child: Text(entry.value),
);
}).toList(),
onChanged: (String? newKey) {
if (newKey != null && newKey != _selectedStatusKey) {
setState(() => _selectedStatusKey = newKey);
_resetAndLoadData(forceRefresh: false);
}
},
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
              const Divider(height: 8),
              Expanded(
                child: _buildListComponent(processedBills),
              ),
            ],
          ),
        );
      },
    ),
  );
}

  Widget _buildListComponent(List<Legislation> processedBills) {
    developer.log('Building list component. isLoading: $_isLoading, errorMessage: $_errorMessage, processed count: ${processedBills.length}', name: 'LegislationScreen.ListComponent');
    if (_isLoading && _bills.isEmpty) {
      developer.log('Showing initial loading indicator.', name: 'LegislationScreen.ListComponent');
      return const Center(child: CircularProgressIndicator());
    }
    if (_errorMessage != null) {
       developer.log('Showing error widget: $_errorMessage', name: 'LegislationScreen.ListComponent');
      return _buildErrorWidget();
    }
    if (!_isLoading && processedBills.isEmpty) {
       developer.log('Showing empty list widget. Original bills count: ${_bills.length}', name: 'LegislationScreen.ListComponent');
      return _buildEmptyListWidget();
    }
    developer.log('Showing list view with ${processedBills.length} items. isLoadingMore: $_isLoadingMore', name: 'LegislationScreen.ListComponent');
    return RefreshIndicator(
      onRefresh: () async {
        _resetAndLoadData(forceRefresh: false);
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          bool canLoadMore = !_isLoadingMore &&
                             _hasMoreData &&
                             !_isLoading && 
                             scrollInfo.metrics.pixels > scrollInfo.metrics.maxScrollExtent - 300; 
          if (canLoadMore) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && !_isLoadingMore && _hasMoreData && !_isLoading) { 
                 _loadMoreBills();
              }
            });
          }
          return true; 
        },
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), 
          itemCount: processedBills.length + (_isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == processedBills.length) {
              return _isLoadingMore
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink();
            }
            if (index >= processedBills.length) {
                developer.log('Index out of bounds in ListView.builder: $index >= ${processedBills.length}', name: 'LegislationScreen.ListComponent', level: 1000);
                return const SizedBox.shrink();
            }
            final bill = processedBills[index];
            return _buildBillCard(bill);
          },
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    final l10n = AppLocalizations.of(context)!;
     return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(_errorMessage!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: Text(l10n.tryAgainButton),
              onPressed: () => _resetAndLoadData(forceRefresh: false)
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyListWidget() {
    final l10n = AppLocalizations.of(context)!;
      String message;
      if (_searchQuery.isNotEmpty || _selectedCategory != l10n.categoryAll || _selectedStatusKey != 'all') {
        message = l10n.emptyListFilterMessage;
      } else {
        message = l10n.emptyListDefaultMessage;
      }
      return Center(
       child: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.search_off, size: 48, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
         )
       ),
     );
  }
  
  Widget _buildFilterChips(List<String> options, String selectedValue, ValueChanged<String> onSelected) {
      final chips = options.map((filter) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ChoiceChip(
            label: Text(filter),
            selected: selectedValue == filter,
            onSelected: (selected) {
              if (selected) {
                onSelected(filter);
              }
            },
            selectedColor: Theme.of(context).primaryColor.withAlpha((255 * 0.05).round()),
            labelStyle: TextStyle(
              color: selectedValue == filter ? Theme.of(context).primaryColor : null,
              fontWeight: selectedValue == filter ? FontWeight.bold : FontWeight.normal,
            ),
            side: BorderSide(
              color: selectedValue == filter ? Theme.of(context).primaryColor : Colors.grey.shade300,
            ),
            visualDensity: VisualDensity.compact,
          ),
        );
      }).toList();

      // Responsywność: Na szerokich ekranach Wrap, na wąskich (mobilnych/tablet portret) Scroll Poziomy
      final bool isWideScreen = kIsWeb && MediaQuery.of(context).size.width > 900;

      if (isWideScreen) {
        // NA SZEROKIM WEBIE: Wrap (wszystkie widoczne)
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
        // NA WĄSKIM WEBIE i MOBILE: Scroll poziomy
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(children: chips),
        );
      }
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

  Widget _buildBillCard(Legislation bill) {
    final l10n = AppLocalizations.of(context)!;
    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    final displayInfo = activeService.getDisplayableStatusInfo(context, bill.status);
    final List<String> keyPoints = bill.keyPoints;
    const int maxVisiblekeyPoints = 3;
    final bool hasMorekeyPoints = keyPoints.length > maxVisiblekeyPoints;
    final List<String> visiblekeyPoints = keyPoints.take(maxVisiblekeyPoints).toList();
    final List<String> individualCategories = _parseCategories(bill.category);
    return GestureDetector(
      onTap: () {
        final parliamentId = context.read<ParliamentManager>().activeServiceId;
        context.smartNavigate('/$parliamentId/legislations/${bill.id}', extra: bill);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12.0),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
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
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: displayInfo.textColor, fontWeight: FontWeight.w500, fontSize: 10),
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
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey[700], fontWeight: FontWeight.w500, fontSize: 10),
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
              Text(
                bill.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12), 
              Text(
                bill.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[800]),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12), 
              if (visiblekeyPoints.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...visiblekeyPoints.map((point) => Padding(
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
                    if (hasMorekeyPoints)
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
                    const SizedBox(height: 12), 
                  ],
                )
              else
                const SizedBox(height: 12),
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
      ),
    );
  }
}
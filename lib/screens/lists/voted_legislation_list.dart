import 'dart:developer' as developer;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lustra/providers/language_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:flutter/foundation.dart';

import '../../services/parliament_service_interface.dart';
import '../../models/legislation.dart';
import '../../models/parliament_source.dart';
import '../../services/parliament_manager.dart';
import '../../providers/translators.dart';
import '../../widgets/web_link.dart';
import '../../widgets/lists_specific/legislation_control_bar.dart';
import '../../widgets/lists_specific/legislation_list_card.dart';
import '../../widgets/osint_loader.dart';

class LegislationScreen extends StatefulWidget {
  const LegislationScreen({super.key});

  @override
  LegislationScreenState createState() => LegislationScreenState();
}

class LegislationScreenState extends State<LegislationScreen> with AutomaticKeepAliveClientMixin {
	@override
	bool get wantKeepAlive => true;
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
      l10n.categoryInformatization, l10n.categoryEconomy, l10n.categoryOther
    ];
  }
}
  
  List<String> _categoryOptions = [];
  late String _selectedCategory;
  String _sortBy = 'popularity';
  String _selectedStatusFilter = 'all';
  Map<String, String> _statusOptions = {};
  bool _hideNoDocument = false;
  

  @override
  void initState() {
    super.initState();
    developer.log('LegislationScreen initState', name: 'LegislationScreen');
    _selectedStatusFilter = 'all';
    _sortBy = 'popularity';
  }

  Future<void> refreshData() async {
      final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
      await activeService.clearCache();
      _resetAndLoadData(forceRefresh: true);
    }
  
  @override
  void didChangeDependencies() {
   super.didChangeDependencies();
   final routerState = GoRouterState.of(context);
    final bool isDetailsView = routerState.pathParameters.containsKey('legislationId');
    final bool hasListMarker = routerState.uri.queryParameters.containsKey('list');
    if (isDetailsView && !hasListMarker) {
      return;
    }
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

Future<void> _loadFilterOptions() async {
  if (!mounted) return;
  final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
  try {
    final documentTypes = await activeService.getLegislationFilterDocumentTypes(context);
      if (!mounted) return;
      final statuses = await activeService.getLegislationFilterStatuses(context);
    
    if (!mounted) return;

    setState(() {
      _documentTypeOptions = documentTypes;
      _selectedDocumentTypeKey = 'all';
      _statusOptions = statuses;
      _selectedStatusFilter = 'all';
    });
  } catch (e) {
    developer.log('Błąd podczas ładowania opcji filtrów: $e', name: 'LegislationScreen');
  }
}

  final ScrollController _scrollController = ScrollController();
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
        _sortBy = 'popularity';
        _selectedStatusFilter = 'all';
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

      final String apiSortBy = _sortBy == 'sort_newest' ? 'votingDate_desc' : 'popularity';

      final response = await activeService.getLegislations(
       context,
       limit: _limit,
       lastVisibleId: null,
       forceRefresh: forceRefresh,
       searchQuery: _searchQuery,
       sortBy: apiSortBy,
       status: _selectedStatusFilter == 'all' ? null : 'exact:$_selectedStatusFilter',
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
      final String apiSortBy = _sortBy == 'sort_newest' ? 'votingDate_desc' : 'popularity';
      final l10n = AppLocalizations.of(context)!;

      final response = await activeService.getLegislations(
       context,
       limit: _limit,
       lastVisibleId: null,
       searchQuery: _searchQuery,
       sortBy: apiSortBy,
       status: _selectedStatusFilter == 'all' ? null : 'exact:$_selectedStatusFilter',
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
    if (_hideNoDocument) {
      return _bills.where((bill) => bill.noDocument != true).toList();
    }
    return _bills;
  }

@override
Widget build(BuildContext context) {
	super.build(context);
	final l10n = AppLocalizations.of(context)!;
  final manager = Provider.of<ParliamentManager>(context);
  if (manager.isLoading || !manager.isInitialized) {
    return Center(child: OsintLoader(text: l10n.loaderLoadingData));
  }
  if (manager.error != null) {
    return Center(
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
    );
  }
  _initializeLocalizableLists(l10n);
  return ChangeNotifierProvider.value(
    value: manager.activeService,
    child: Consumer<ParliamentServiceInterface>(
      builder: (context, activeService, child) {
        final processedBills = _getProcessedBills();
        return Column(
            children: [
            LegislationControlBar(
              searchQuery: _searchQuery,
              onSearchChanged: (value) => _searchQuery = value,
              onSearchSubmitted: (value) {
                setState(() {
                  _searchQuery = value;
                  _isSearchActive = value.isNotEmpty;
                });
                _resetAndLoadData();
              },
              onSearchClear: () {
                setState(() {
                  _searchQuery = '';
                  _isSearchActive = false;
                });
                _resetAndLoadData();
              },
              categoryOptions: _categoryOptions,
              selectedCategory: _selectedCategory,
              onCategorySelected: (selectedCategory) {
                setState(() => _selectedCategory = selectedCategory);
                _resetAndLoadData(forceRefresh: false);
              },
              showDocType: true,
              docTypeOptions: _documentTypeOptions,
              selectedDocTypeKey: _selectedDocumentTypeKey,
              onDocTypeChanged: (String? newKey) {
                if (newKey != null && newKey != _selectedDocumentTypeKey) {
                  setState(() => _selectedDocumentTypeKey = newKey);
                  _resetAndLoadData(forceRefresh: false);
                }
              },
              statusOptions: _statusOptions,
              selectedStatusKey: _selectedStatusFilter,
              onStatusChanged: (String? newKey) {
                if (newKey != null && newKey != _selectedStatusFilter) {
                  setState(() => _selectedStatusFilter = newKey);
                  _resetAndLoadData(forceRefresh: false);
                }
              },
              sortOptions: {
                'popularity': l10n.sortByPopularity,
                'sort_newest': l10n.sortByFreshness,
              },
              selectedSortKey: _sortBy,
              onSortChanged: (String? newValue) {
                if (newValue != null && newValue != _sortBy) {
                  setState(() => _sortBy = newValue);
                  _resetAndLoadData(forceRefresh: false);
                }
              },
              isSearchActive: _isSearchActive,
              hideNoDocument: _hideNoDocument,
              onHideNoDocumentChanged: (bool value) {
                setState(() => _hideNoDocument = value);
              },
            ),
              const Divider(height: 8),
              Expanded(
                child: _buildListComponent(processedBills),
              ),
            ],
          );
      },
    ),
  );
}

  Widget _buildListComponent(List<Legislation> processedBills) {
    final l10n = AppLocalizations.of(context)!;
      developer.log('Building list component. isLoading: $_isLoading, errorMessage: $_errorMessage, processed count: ${processedBills.length}', name: 'LegislationScreen.ListComponent');
      
      if (_isLoading && _bills.isEmpty) {
        return Center(child: OsintLoader(text: l10n.loaderLoadingData));
      }
      if (_errorMessage != null) {
        return _buildErrorWidget();
      }
      if (!_isLoading && processedBills.isEmpty) {
        return _buildEmptyListWidget();
      }

      final bool isDesktopWeb = kIsWeb && MediaQuery.of(context).size.width > 750;

      Widget listView = ListView.builder(
        controller: _scrollController,
        
        physics: isDesktopWeb 
            ? const NeverScrollableScrollPhysics() 
            : const AlwaysScrollableScrollPhysics(),
            
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: processedBills.length + (_isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == processedBills.length) {
            return _isLoadingMore
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(child: OsintLoader(text: l10n.loaderLoadingMore)),
                    ),
                  )
                : const SizedBox.shrink();
          }
          final bill = processedBills[index];
          Widget? votingInfoWidget;
          if (bill.votingDate != null) {
            votingInfoWidget = Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.how_to_vote_outlined,
                      size: 16, color: Colors.grey[600]),
                ),
                Text(
                  DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
                      .format(bill.votingDate!),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey[700]),
                ),
              ],
            );
          }
          final manager = context.read<ParliamentManager>();
          final slug = manager.activeSlug;
          final lang = context.read<LanguageProvider>().appLanguageCode;
          final term = manager.currentTerm;
          final internalPath = '/$lang/$slug/$term/legislations/${bill.id}?list=voted';

          return WebLink(
            path: internalPath,
            extra: bill,
            builder: (context, onTapCallback) => LegislationListCard(
              bill: bill,
              additionalInfoWidget: votingInfoWidget,
              onTap: onTapCallback,
            ),
          );
        },
      );

      return RefreshIndicator(
        onRefresh: () async {
          _resetAndLoadData(forceRefresh: false);
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            bool canLoadMore = !_isLoadingMore &&
                _hasMoreData &&
                !_isLoading &&
                scrollInfo.metrics.pixels >
                    scrollInfo.metrics.maxScrollExtent - 300;
            if (canLoadMore) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted && !_isLoadingMore && _hasMoreData && !_isLoading) {
                  _loadMoreBills();
                }
              });
            }
            return true;
          },
          child: isDesktopWeb
              ? WebSmoothScroll(
                controller: _scrollController,
                scrollAnimationLength: 450,
                scrollSpeed: 0.7,
                curve: Curves.easeOut,
                child: listView,
              )
              : listView,
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
      if (_searchQuery.isNotEmpty || _selectedCategory != l10n.categoryAll || _selectedStatusFilter != 'all') {
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
}
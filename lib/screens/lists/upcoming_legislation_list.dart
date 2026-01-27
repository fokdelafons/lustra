import 'dart:developer' as developer;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:lustra/providers/language_provider.dart';
import 'package:go_router/go_router.dart';

import '../../services/parliament_service_interface.dart';
import '../../models/legislation.dart';
import '../../models/parliament_source.dart';
import '../../services/parliament_manager.dart';
import '../../providers/translators.dart';
import '../../services/app_router.dart';
import '../../widgets/lists_specific/legislation_control_bar.dart';
import '../../widgets/lists_specific/legislation_list_card.dart';

class FutureLegislationScreen extends StatefulWidget {
  const FutureLegislationScreen({super.key});

  @override
  FutureLegislationScreenState createState() => FutureLegislationScreenState();
}

class FutureLegislationScreenState extends State<FutureLegislationScreen> with AutomaticKeepAliveClientMixin {
	@override
	bool get wantKeepAlive => true;
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
  String _sortBy = 'popularity';
  String _searchQuery = '';
  bool _isSearchActive = false;

  List<String> _categoryOptions = [];
  late String _selectedCategory;

  Map<String, String> _documentTypeOptions = {};
  String _selectedDocumentTypeKey = 'all';

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

  @override
  void initState() {
    super.initState();
    developer.log('FutureLegislationScreen initState', name: 'FutureLegislationScreen');
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
     developer.log('didChangeDependencies: Wykryto zmianę kontekstu. Źródło: ${activeService.source.id}, kadencja: ${activeService.currentTerm}', name: 'FutureLegislationScreen');
     final l10n = AppLocalizations.of(context)!;
     _initializeLocalizableLists(l10n);
      _selectedCategory = l10n.categoryAll;
     _isFirstBuild = false;
      _lastSource = activeService.source;
      _lastTerm = activeService.currentTerm;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
         _loadFilterOptions().then((_) {
           if (mounted) {
              _resetAndLoadData(newSourceChanged: true, forceRefresh: false);
            }
          });
        }
      });
   }
  }



Future<void> _loadFilterOptions() async {
  if (!mounted) return;
  final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
  final documentTypes = await activeService.getLegislationFilterDocumentTypes(context);
  
  if (mounted) {
    setState(() {
      _documentTypeOptions = documentTypes;
      _selectedDocumentTypeKey = 'all';
    });
  }
}
  final ScrollController _scrollController = ScrollController();
  void _resetAndLoadData({bool forceRefresh = false, bool newSourceChanged = false}) {
    developer.log('Resetowanie stanu. forceRefresh: $forceRefresh, newSourceChanged: $newSourceChanged', name: 'FutureLegislationScreen');
    if (!mounted) return;

    setState(() {
      _bills = [];
      _isLoading = true;
      _errorMessage = null;
      _nextCursor = null;
      _hasMoreData = true;

      if (newSourceChanged) {
        _selectedCategory = _categoryOptions.first;
        _selectedDocumentTypeKey = 'all';
        _searchQuery = '';
        _sortBy = 'popularity';
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _loadBills(forceRefresh: forceRefresh);
      }
    });
  }

Future<void> _loadBills({bool forceRefresh = false}) async {
    developer.log('Ładowanie pierwszej strony. forceRefresh: $forceRefresh', name: 'FutureLegislationScreen');
    setState(() => _isLoading = true);
    try {
      final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
      final l10n = AppLocalizations.of(context)!;
      final response = await activeService.getLegislations(
        context,
        lastVisibleId: null,
        limit: _limit,
        forceRefresh: forceRefresh,
        searchQuery: _searchQuery,
        status: activeService.futureStatusId,
        documentType: _selectedDocumentTypeKey == 'all'
          ? activeService.defaultDocumentTypeIds
          : [_selectedDocumentTypeKey],
        category: _selectedCategory == l10n.categoryAll 
                  ? null 
                  : categoryLabelToApiKey(context, _selectedCategory),
        sortBy: _sortBy,
      );
      if (mounted) {
        final List<dynamic> items = response['legislations'] ?? [];
        final fetchedBills = items.map((item) => Legislation.fromJson(item as Map<String, dynamic>)).toList();
        setState(() {
          _bills = fetchedBills;
          _nextCursor = response['nextCursor'];
          _hasMoreData = _nextCursor != null;
          _errorMessage = null;
        });
      }
    } catch (e, stackTrace) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        setState(() => _errorMessage = l10n.errorFetchData);
      }
      developer.log('Błąd w _loadBills: $e', name: 'FutureLegislationScreen', error: e, stackTrace: stackTrace);
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

Future<void> _loadMoreBills() async {
    if (_isLoadingMore || !_hasMoreData || _isLoading) {
      return;
    }
    setState(() => _isLoadingMore = true);
    try {
      final l10n = AppLocalizations.of(context)!;
      final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
      
      final docType = _selectedDocumentTypeKey == 'all'
        ? activeService.defaultDocumentTypeIds
        : [_selectedDocumentTypeKey];
        
      final categoryApiKey = _selectedCategory == l10n.categoryAll
          ? null
          : categoryLabelToApiKey(context, _selectedCategory);

      final response = await activeService.getLegislations(
        context,
        lastVisibleId: _nextCursor,
        limit: _limit,
        status: activeService.futureStatusId,
        documentType: docType,
        category: categoryApiKey,
        searchQuery: _searchQuery,
        sortBy: _sortBy,
      );
      if (!mounted) return;
      
      final List<dynamic> items = response['legislations'] ?? [];
      final moreBills = items.map((item) => Legislation.fromJson(item as Map<String, dynamic>)).toList();
      
      setState(() {
        _bills.addAll(moreBills);
        _nextCursor = response['nextCursor'];
        _hasMoreData = _nextCursor != null;
      });
    } catch (e, stackTrace) {
      developer.log('Błąd podczas doładowywania danych: $e', name: 'FutureLegislationScreen', error: e, stackTrace: stackTrace);
    } finally {
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
	super.build(context);
	final l10n = AppLocalizations.of(context)!;
  final manager = Provider.of<ParliamentManager>(context);
  if (manager.isLoading || !manager.isInitialized) {
    return const Center(child: CircularProgressIndicator());
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
              sortOptions: {
                'popularity': l10n.sortByPopularity,
                'processStartDate': l10n.sortByFreshness,
              },
              selectedSortKey: _sortBy,
              onSortChanged: (String? newValue) {
                if (newValue != null && newValue != _sortBy) {
                  setState(() => _sortBy = newValue);
                  _resetAndLoadData(forceRefresh: false);
                }
              },
              isSearchActive: _isSearchActive,
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
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null && _bills.isEmpty) {
      return _buildErrorWidget();
    }

    if (_bills.isEmpty) {
      return _buildEmptyListWidget();
    }

    return RefreshIndicator(
      onRefresh: () async => _resetAndLoadData(forceRefresh: true),
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          bool canLoadMore = !_isLoadingMore && _hasMoreData && scrollInfo.metrics.pixels > scrollInfo.metrics.maxScrollExtent - 300;
          if (canLoadMore) {
            _loadMoreBills();
          }
          return true;
        },
        child: ListView.builder(
          controller: _scrollController,
          key: const PageStorageKey<String>('future_legislation_list_scroll'),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          itemCount: processedBills.length + (_isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == processedBills.length) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }
            final bill = processedBills[index];
            final l10n = AppLocalizations.of(context)!;
            List<String> dateStrings = [];
            if (bill.upcomingProceedingDates != null && bill.upcomingProceedingDates!.isNotEmpty) {
               final locale = Localizations.localeOf(context).languageCode;
               dateStrings = bill.upcomingProceedingDates!.map((dateTime) {
                  if (dateTime.hour == 0 && dateTime.minute == 0) {
                    return DateFormat.yMMMd(locale).format(dateTime.toLocal());
                  } else {
                    return DateFormat.yMMMd(locale).add_Hm().format(dateTime.toLocal());
                  }
               }).toList();
            }
            Widget? dateWidget;
            if (dateStrings.isNotEmpty) {
               dateWidget = Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(right: 8.0, top: 2.0),
                     child: Icon(Icons.calendar_month_outlined, size: 16, color: Theme.of(context).primaryColor),
                   ),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(l10n.upcomingMeetingsCardLabel, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                         const SizedBox(height: 4),
                         Wrap(
                           spacing: 12.0,
                           runSpacing: 4.0,
                           children: dateStrings.map((dateStr) => Text(
                             dateStr,
                             style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                           )).toList(),
                         ),
                       ],
                     ),
                   ),
                 ],
              );
            }

            return LegislationListCard(
              bill: bill,
              additionalInfoWidget: dateWidget,
              onTap: () {
                final manager = context.read<ParliamentManager>();
                final slug = manager.activeSlug;
                final lang = context.read<LanguageProvider>().appLanguageCode;
                final term = manager.currentTerm;
                context.smartNavigate('/$lang/$slug/$term/legislations/${bill.id}?list=upcoming', extra: bill);
              },
            );
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
              onPressed: () => _resetAndLoadData(forceRefresh: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyListWidget() {
    final l10n = AppLocalizations.of(context)!;
    String message;
    if (_selectedCategory != l10n.categoryAll) {
      message = l10n.emptyListFilterMessageFuture;
    } else {
      message = l10n.emptyListDefaultMessageFuture;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.upcoming_outlined, size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
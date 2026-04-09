import 'dart:developer' as developer;

import 'package:lustra/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:lustra/providers/language_provider.dart';
import 'package:go_router/go_router.dart';
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
import '../../widgets/web_smooth_scroll.dart';

  class ProcessLegislationScreen extends StatefulWidget {
    const ProcessLegislationScreen({super.key});

    @override
    ProcessLegislationScreenState createState() => ProcessLegislationScreenState();
  }

  class ProcessLegislationScreenState extends State<ProcessLegislationScreen> with AutomaticKeepAliveClientMixin {
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
    String? _filterFromTimestamp;
    String _searchQuery = '';
    bool _isSearchActive = false;
    bool _isSyncingParliament = false;
    bool _isFromNotification = false;

    List<String> _categoryOptions = [];
    String _selectedCategory = 'all';
    Map<String, String> _documentTypeOptions = {};
    String _selectedDocumentTypeKey = 'all';
    Map<String, String> _statusOptions = {};
    String _selectedStatusFilter = 'all';
    bool _hideNoDocument = false;

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
      developer.log('ProcessLegislationScreen initState', name: 'ProcessLegislationScreen');
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
      final extra = GoRouterState.of(context).extra;
      String? initialSearchQuery;

      if (extra is Map<String, dynamic>) {
        final String? targetParliamentId = extra['parliamentId'];
        final manager = context.read<ParliamentManager>();

        if (targetParliamentId != null && manager.activeServiceId != targetParliamentId) {
          if (mounted && !_isSyncingParliament) {
            setState(() {
              _isSyncingParliament = true;
            });

            WidgetsBinding.instance.addPostFrameCallback((_) {
              developer.log('Wykryto niezgodność stanu. Zmieniam parlament na $targetParliamentId...', name: 'ProcessLegislationScreen');
              manager.changeSource(targetParliamentId).then((_) {
                if (mounted) {
                   setState(() {
                     _isSyncingParliament = false;
                   });
                }
              });
            });
          }
          return;
        }
      }
        if (extra is Map<String, dynamic>) {
          if (extra.containsKey('searchQuery')) {
            initialSearchQuery = extra['searchQuery'] as String;
          }
          if (extra.containsKey('filterFromTimestamp')) {
            _filterFromTimestamp = extra['filterFromTimestamp'] as String;
            _isFromNotification = true;
          }
        }

      if (_isFirstBuild || _lastSource?.id != activeService.source.id || _lastTerm != activeService.currentTerm) {
        developer.log('didChangeDependencies: Wykryto zmianę kontekstu. Nowe źródło: ${activeService.source.id}, kadencja: ${activeService.currentTerm}', name: 'ProcessLegislationScreen');
        final l10n = AppLocalizations.of(context)!;
        _initializeLocalizableLists(l10n);
        _selectedCategory = l10n.categoryAll;
        _isFirstBuild = false;
        _lastSource = activeService.source;
        _lastTerm = activeService.currentTerm;

        if (initialSearchQuery != null && initialSearchQuery.isNotEmpty) {
          _searchQuery = initialSearchQuery;
          _isSearchActive = true;
        }

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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

    Future<void> _loadFilterOptions() async {
      if (!mounted) return;
      final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
      final documentTypes = await activeService.getLegislationFilterDocumentTypes(context);
      if (!mounted) return;
      final statuses = await activeService.getLegislationFilterStatuses(context);
      
      if (mounted) {
        setState(() {
          _documentTypeOptions = documentTypes;
          _selectedDocumentTypeKey = 'all';
          _statusOptions = statuses;
          _selectedStatusFilter = 'all';
        });
      }
    }
  final ScrollController _scrollController = SmoothScrollController();
  void _resetAndLoadData({bool forceRefresh = false, bool newSourceChanged = false, bool exitingNotification = false}) {
      developer.log('Resetowanie stanu. forceRefresh: $forceRefresh, newSourceChanged: $newSourceChanged, exitingNotification: $exitingNotification', name: 'ProcessLegislationScreen');
      if (!mounted) return;

      setState(() {
        _bills = [];
        _isLoading = true;
        _errorMessage = null;
        _nextCursor = null;
        _hasMoreData = true;

        if (exitingNotification) {
          _isFromNotification = false;
          _filterFromTimestamp = null;
        }
        
        if (newSourceChanged) {
          if (_searchQuery.isEmpty) {
              _isSearchActive = false;
          }
          _selectedCategory = _categoryOptions.first;
          _selectedDocumentTypeKey = 'all';
          _selectedStatusFilter = 'all';
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
      developer.log('Ładowanie pierwszej strony. forceRefresh: $forceRefresh, isFromNotification: $_isFromNotification', name: 'ProcessLegislationScreen');
      setState(() => _isLoading = true);
      try {
        final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
        final l10n = AppLocalizations.of(context)!;

        final bool isNotificationLoad = _isFromNotification && _filterFromTimestamp != null;

        final String sortByValue = isNotificationLoad ? 'processStartDate' : _sortBy;
        final String? categoryValue = isNotificationLoad ? null : (_selectedCategory == l10n.categoryAll ? null : categoryLabelToApiKey(context, _selectedCategory));
        final List<String> docTypeValue = isNotificationLoad ? [] : (_selectedDocumentTypeKey == 'all' ? activeService.defaultDocumentTypeIds : [_selectedDocumentTypeKey]);
        
        final response = await activeService.getLegislations(
                context,
                lastVisibleId: null,
                limit: _limit,
                forceRefresh: forceRefresh || isNotificationLoad,
                searchQuery: _searchQuery,
                status: _selectedStatusFilter == 'all' ? activeService.processStatusId : 'exact:$_selectedStatusFilter',
                documentType: docTypeValue,
                category: categoryValue,
                sortBy: sortByValue,
                processStartDateAfter: _filterFromTimestamp,
              );

      if (!mounted) return;
        final List<dynamic> items = response['legislations'] ?? [];
        final fetchedBills = items.map((item) => Legislation.fromJson(item as Map<String, dynamic>)).toList();

        setState(() {
          _bills = fetchedBills;
          _nextCursor = response['nextCursor'];
          _hasMoreData = _nextCursor != null;
          _errorMessage = null;
        });
      } catch (e, stackTrace) {
        developer.log('Błąd podczas ładowania: $e', name: 'ProcessLegislationScreen', error: e, stackTrace: stackTrace);
        if (!mounted) return;
        final l10n = AppLocalizations.of(context)!;
        setState(() => _errorMessage = l10n.errorFetchData);
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }

Future<void> _loadMoreBills() async {
      if (_isLoading || _isLoadingMore || !_hasMoreData) return;
      developer.log('Ładowanie kolejnej strony (kursor: $_nextCursor), isFromNotification: $_isFromNotification', name: 'ProcessLegislationScreen');
      setState(() => _isLoadingMore = true);
      try {
        final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
        final l10n = AppLocalizations.of(context)!;
        
        final bool isNotificationLoad = _isFromNotification && _filterFromTimestamp != null;

        final String sortByValue = isNotificationLoad ? 'processStartDate' : _sortBy;
        final String? categoryValue = isNotificationLoad ? null : (_selectedCategory == l10n.categoryAll ? null : categoryLabelToApiKey(context, _selectedCategory));
        final List<String> docTypeValue = isNotificationLoad ? [] : (_selectedDocumentTypeKey == 'all' ? activeService.defaultDocumentTypeIds : [_selectedDocumentTypeKey]);
        
        final response = await activeService.getLegislations(
                context,
                lastVisibleId: _nextCursor,
                limit: _limit,
                searchQuery: _searchQuery,
                status: _selectedStatusFilter == 'all' ? activeService.processStatusId : 'exact:$_selectedStatusFilter',
                documentType: docTypeValue,
                category: categoryValue,
                sortBy: sortByValue,
                processStartDateAfter: _filterFromTimestamp,
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
        developer.log('Błąd podczas doładowywania danych: $e', name: 'ProcessLegislationScreen', error: e, stackTrace: stackTrace);
      } finally {
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
      
      if (_isSyncingParliament) {
      return Center(child: OsintLoader(text: l10n.loaderEstablishingConnection));
      }

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
                      _resetAndLoadData(exitingNotification: true);
                    },
                    onSearchClear: () {
                      setState(() {
                        _searchQuery = '';
                        _isSearchActive = false;
                      });
                      _resetAndLoadData(exitingNotification: true);
                    },
                    categoryOptions: _categoryOptions,
                    selectedCategory: _selectedCategory,
                    onCategorySelected: (selectedCategory) {
                      setState(() => _selectedCategory = selectedCategory);
                      _resetAndLoadData(forceRefresh: false, exitingNotification: true);
                    },
                    showDocType: true,
                    docTypeOptions: _documentTypeOptions,
                    selectedDocTypeKey: _selectedDocumentTypeKey,
                    onDocTypeChanged: (String? newKey) {
                      if (newKey != null && newKey != _selectedDocumentTypeKey) {
                        setState(() => _selectedDocumentTypeKey = newKey);
                        _resetAndLoadData(forceRefresh: false, exitingNotification: true);
                      }
                    },
                    statusOptions: _statusOptions,
                    selectedStatusKey: _selectedStatusFilter,
                    onStatusChanged: (String? newKey) {
                      if (newKey != null && newKey != _selectedStatusFilter) {
                        setState(() => _selectedStatusFilter = newKey);
                        _resetAndLoadData(forceRefresh: false, exitingNotification: true);
                      }
                    },
                    sortOptions: {
                      'popularity': l10n.sortByPopularity,
                      'lastUpdated': l10n.sortByFreshness,
                    },
                    selectedSortKey: _sortBy,
                    onSortChanged: (String? newValue) {
                      if (newValue != null && newValue != _sortBy) {
                        setState(() => _sortBy = newValue);
                        _resetAndLoadData(forceRefresh: false, exitingNotification: true);
                      }
                    },
                    isSearchActive: _isSearchActive || _isFromNotification,
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
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          itemCount: processedBills.length + (_isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            final l10n = AppLocalizations.of(context)!;
            if (index == processedBills.length) {
              return _isLoadingMore 
                  ? Center(child: Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: OsintLoader(text: l10n.loaderLoadingMore)))
                  : const SizedBox.shrink();
            }
            final bill = processedBills[index];

            Widget? processInfoWidget;

            if (bill.processStartDate != null) {
              processInfoWidget = Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.play_circle_outline, size: 16, color: Colors.grey[600]),
                  ),
                    Text(
                      l10n.processStartDateCardLabel(
                        DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(bill.processStartDate!)
                      ),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                    ),
                ],
              );
            }

            final manager = context.read<ParliamentManager>();
            final slug = manager.activeSlug;
            final lang = context.read<LanguageProvider>().appLanguageCode;
            final term = manager.currentTerm;
            final internalPath = '/$lang/$slug/$term/legislations/${bill.id}?list=process';

            return WebLink(
              path: internalPath,
              extra: bill,
              builder: (context, onTapCallback) => LegislationListCard(
                bill: bill,
                additionalInfoWidget: processInfoWidget,
                onTap: onTapCallback,
              ),
            );
          },
        );

        return RefreshIndicator(
          onRefresh: () async => _resetAndLoadData(forceRefresh: true),
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!_isLoadingMore && _hasMoreData && !_isLoading && scrollInfo.metrics.pixels > scrollInfo.metrics.maxScrollExtent - 300) {
                _loadMoreBills();
              }
              return true;
            },
            child: isDesktopWeb
                ? WebSmoothScroll(
                controller: _scrollController,
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
        if (_searchQuery.isNotEmpty || _selectedCategory != l10n.categoryAll || _selectedDocumentTypeKey != 'all') {
          message = l10n.emptyListFilterMessageProcess;
        } else {
          message = l10n.emptyListDefaultMessageProcess;
        }

        return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.gavel_outlined, size: 48, color: Colors.grey),
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
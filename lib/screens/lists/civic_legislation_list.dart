import 'dart:developer' as developer;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  class CivicLegislationScreen extends StatefulWidget {
    const CivicLegislationScreen({super.key});

    @override
    CivicLegislationScreenState createState() => CivicLegislationScreenState();
  }

  class CivicLegislationScreenState extends State<CivicLegislationScreen> with AutomaticKeepAliveClientMixin {
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
    bool _isSyncingParliament = false;

    List<String> _categoryOptions = [];
    late String _selectedCategory;
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
      developer.log('CivicLegislationScreen initState', name: 'CivicLegislationScreen');
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

      if (extra is Map<String, dynamic>) {
        final String? targetParliamentId = extra['parliamentId'];
        final manager = context.read<ParliamentManager>();

        if (targetParliamentId != null && manager.activeServiceId != targetParliamentId) {
          if (mounted && !_isSyncingParliament) {
            setState(() {
              _isSyncingParliament = true;
            });

            WidgetsBinding.instance.addPostFrameCallback((_) {
              developer.log('Wykryto niezgodność stanu. Zmieniam parlament na $targetParliamentId...', name: 'CivicLegislationScreen');
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

      if (_isFirstBuild || _lastSource?.id != activeService.source.id || _lastTerm != activeService.currentTerm) {
        developer.log('didChangeDependencies: Wykryto zmianę kontekstu. Nowe źródło: ${activeService.source.id}, kadencja: ${activeService.currentTerm}', name: 'CivicLegislationScreen');
        final l10n = AppLocalizations.of(context)!;
        _initializeLocalizableLists(l10n);
        _selectedCategory = l10n.categoryAll;
        _isFirstBuild = false;
        _lastSource = activeService.source;
        _lastTerm = activeService.currentTerm;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _resetAndLoadData(newSourceChanged: true, forceRefresh: false);
          }
        });
      }
    }

  final ScrollController _scrollController = ScrollController();

void _resetAndLoadData({bool forceRefresh = false, bool newSourceChanged = false}) {
      developer.log('Resetowanie stanu. forceRefresh: $forceRefresh, newSourceChanged: $newSourceChanged', name: 'CivicLegislationScreen');
      if (!mounted) return;

      setState(() {
        _bills = [];
        _isLoading = true;
        _errorMessage = null;
        _nextCursor = null;
        _hasMoreData = true;

        if (newSourceChanged) {
          _selectedCategory = _categoryOptions.first;
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
      developer.log('Ładowanie pierwszej strony. forceRefresh: $forceRefresh', name: 'CivicLegislationScreen');
      setState(() => _isLoading = true);
      try {
        final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
        final l10n = AppLocalizations.of(context)!;

        final String? categoryValue = _selectedCategory == l10n.categoryAll ? null : categoryLabelToApiKey(context, _selectedCategory);
        
        final response = await activeService.getCivicProjects(
                context,
                lastVisibleId: null,
                limit: _limit,
                forceRefresh: forceRefresh,
                category: categoryValue,
                sortBy: _sortBy,
              );

      if (!mounted) return;
        final List<dynamic> items = response['projects'] ?? [];
        final fetchedBills = items.map((item) => Legislation.fromJson(item as Map<String, dynamic>)).toList();

        setState(() {
          _bills = fetchedBills;
          _nextCursor = response['nextCursor'];
          _hasMoreData = _nextCursor != null;
          _errorMessage = null;
        });
      } catch (e, stackTrace) {
        developer.log('Błąd podczas ładowania: $e', name: 'CivicLegislationScreen', error: e, stackTrace: stackTrace);
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
      developer.log('Ładowanie kolejnej strony (kursor: $_nextCursor)', name: 'CivicLegislationScreen');
      setState(() => _isLoadingMore = true);
      try {
        final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
        final l10n = AppLocalizations.of(context)!;

        final String? categoryValue = _selectedCategory == l10n.categoryAll ? null : categoryLabelToApiKey(context, _selectedCategory);
        
        final response = await activeService.getCivicProjects(
                context,
                lastVisibleId: _nextCursor,
                limit: _limit,
                forceRefresh: false,
                category: categoryValue,
                sortBy: _sortBy,
              );

      if (!mounted) return;
        
        final fetchedItemsRaw = response['projects'] ?? [];
        final moreBills = fetchedItemsRaw.map((item) => Legislation.fromJson(item as Map<String, dynamic>)).toList();
        
        setState(() {
          _bills.addAll(moreBills);
          _nextCursor = response['nextCursor'];
          _hasMoreData = _nextCursor != null;
        });
      } catch (e, stackTrace) {
        developer.log('Błąd podczas doładowywania danych: $e', name: 'CivicLegislationScreen', error: e, stackTrace: stackTrace);
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
      
      if (_isSyncingParliament) {
      return const Center(child: CircularProgressIndicator());
      }

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
                    // Search off
                    showSearch: false,
                    searchQuery: '',
                    onSearchChanged: (_) {},
                    onSearchSubmitted: (_) {},
                    onSearchClear: () {},
                    
                    // DocType off
                    showDocType: false,
                    docTypeOptions: const {},
                    selectedDocTypeKey: 'all',
                    onDocTypeChanged: null,

                    categoryOptions: _categoryOptions,
                    selectedCategory: _selectedCategory,
                    onCategorySelected: (selectedCategory) {
                      setState(() => _selectedCategory = selectedCategory);
                      _resetAndLoadData(forceRefresh: false);
                    },
                    
                    sortOptions: {
                      'popularity': l10n.sortByPopularity,
                      'documentDate': l10n.sortByFreshness,
                    },
                    selectedSortKey: _sortBy,
                    onSortChanged: (String? newValue) {
                      if (newValue != null && newValue != _sortBy) {
                        setState(() => _sortBy = newValue);
                        _resetAndLoadData(forceRefresh: false);
                      }
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
      if (_isLoading && _bills.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      if (_errorMessage != null) {
        return _buildErrorWidget();
      }

      if (!_isLoading && processedBills.isEmpty) {
        return _buildEmptyListWidget();
      }

      return RefreshIndicator(
        onRefresh: () async => _resetAndLoadData(forceRefresh: true),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!_isLoadingMore && _hasMoreData && !_isLoading && scrollInfo.metrics.pixels > scrollInfo.metrics.maxScrollExtent - 300) {
              _loadMoreBills();
            }
            return true;
          },
          child: ListView.builder(
						key: const PageStorageKey<String>('civic_legislation_list_scroll'),
            controller: _scrollController,
						padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
						itemCount: processedBills.length + (_isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == processedBills.length) {
                return _isLoadingMore ? const Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 16.0), child: CircularProgressIndicator())) : const SizedBox.shrink();
              }
              final bill = processedBills[index];
              
              return LegislationListCard(
                bill: bill,
                additionalInfoWidget: null,
                onTap: () {
                  final manager = context.read<ParliamentManager>();
                  final slug = manager.activeSlug;
                  final lang = context.read<LanguageProvider>().appLanguageCode;
                  context.smartNavigate('/$lang/$slug/civic/legislations/${bill.id}?list=civic', extra: bill);
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
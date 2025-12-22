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
  import 'package:go_router/go_router.dart';
  import 'package:flutter/foundation.dart';
  import '../services/app_router.dart';

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
    late String _selectedCategory;
    Map<String, String> _documentTypeOptions = {};
    String _selectedDocumentTypeKey = 'all';

    final DateFormat _dateFormatter = DateFormat('dd.MM.yyyy');
    final DateFormat _dateTimeFormatter = DateFormat('dd.MM.yyyy HH:mm');

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

    @override
    void initState() {
      super.initState();
      developer.log('ProcessLegislationScreen initState', name: 'ProcessLegislationScreen');
    }

Future<void> refreshData() async {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
    
    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    await activeService.clearCache();
    _resetAndLoadData(forceRefresh: true);
  }

   @override
    void didChangeDependencies() {
      super.didChangeDependencies();
      final activeService = context.watch<ParliamentServiceInterface>();
      final extra = GoRouterState.of(context).extra;
      String? initialSearchQuery;

      // --- POCZĄTEK NOWEJ LOGIKI SYNCHRONIZACJI ---
      if (extra is Map<String, dynamic>) {
        final String? targetParliamentId = extra['parliamentId'];
        final manager = context.read<ParliamentManager>();

        // Wykrywamy niezgodność: ID z powiadomienia jest inne niż aktywne.
        if (targetParliamentId != null && manager.activeServiceId != targetParliamentId) {
          // Ustawiamy flagę, aby pokazać UI ładowania i zapobiec ładowaniu danych.
          // Sprawdzamy `mounted`, aby uniknąć błędów.
          if (mounted && !_isSyncingParliament) {
            setState(() {
              _isSyncingParliament = true;
            });

            // Bezpiecznie wywołujemy zmianę serwisu POZA fazą budowania widgetu.
            WidgetsBinding.instance.addPostFrameCallback((_) {
              developer.log('Wykryto niezgodność stanu. Zmieniam parlament na $targetParliamentId...', name: 'ProcessLegislationScreen');
              manager.changeSource(targetParliamentId).then((_) {
                // Po udanej zmianie, resetujemy flagę. Provider i tak
                // spowoduje przebudowanie, które uruchomi tę metodę ponownie.
                if (mounted) {
                   setState(() {
                     _isSyncingParliament = false;
                   });
                }
              });
            });
          }
          // PRZERYWAMY dalsze wykonywanie tej metody, aby poczekać na zmianę stanu.
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
                status: activeService.processStatusId,
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
                status: activeService.processStatusId,
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
      return _bills;
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

    @override
		Widget build(BuildContext context) {
			super.build(context);
			final l10n = AppLocalizations.of(context)!;
      
      // --- POCZĄTEK ZMIANY W BUILD ---
      // Jeśli trwa synchronizacja parlamentu, pokaż ekran ładowania.
      if (_isSyncingParliament) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.processLegislationScreenTitle("")),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
          ),
          body: const Center(child: CircularProgressIndicator()),
        );
      }
      // --- KONIEC ZMIANY W BUILD ---

      final manager = Provider.of<ParliamentManager>(context);
      if (manager.isLoading || !manager.isInitialized) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.processLegislationScreenTitle("")),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
          ),
          body: const Center(child: CircularProgressIndicator()),
        );
      }
      if (manager.error != null) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.processLegislationScreenTitle("")),
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
      return ChangeNotifierProvider.value(
        value: manager.activeService,
        child: Consumer<ParliamentServiceInterface>(
          builder: (context, activeService, child) {
            final processedBills = _getProcessedBills();
return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                    child: TextField(
                      enabled: !_isFromNotification,
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
                         _resetAndLoadData(exitingNotification: true);
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
                                  _resetAndLoadData(exitingNotification: true);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 1,
                                        height: 24,
                                        color: Colors.grey[300],
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        l10n.clearText,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500,
                                        ),
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
                    ignoring: _isSearchActive || _isFromNotification,
                    child: Opacity(
                      opacity: _isSearchActive || _isFromNotification ? 0.5 : 1.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFilterChips(_categoryOptions, _selectedCategory, (selectedCategory) {
                            setState(() => _selectedCategory = selectedCategory);
                            _resetAndLoadData(forceRefresh: false, exitingNotification: true);
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
                                    items: {'all': l10n.allOption, ..._documentTypeOptions}.entries.map((entry) => DropdownMenuItem(value: entry.key, child: Text(entry.value))).toList(),
                                    onChanged: (String? newKey) {
                                      if (newKey != null && newKey != _selectedDocumentTypeKey) {
                                        setState(() => _selectedDocumentTypeKey = newKey);
                                        _resetAndLoadData(forceRefresh: false, exitingNotification: true);
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
                                    value: _sortBy,
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                                    items: [
                                      DropdownMenuItem(value: 'popularity', child: Text(l10n.sortByPopularity)),
                                      DropdownMenuItem(value: 'processStartDate', child: Text(l10n.sortByFreshness)),
                                    ],
                                    onChanged: (String? newValue) {
                                      if (newValue != null && newValue != _sortBy) {
                                        setState(() => _sortBy = newValue);
                                        _resetAndLoadData(forceRefresh: false, exitingNotification: true);
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
						key: const PageStorageKey<String>('process_legislation_list_scroll'),
            controller: _scrollController,
						padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
						itemCount: processedBills.length + (_isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == processedBills.length) {
                return _isLoadingMore ? const Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 16.0), child: CircularProgressIndicator())) : const SizedBox.shrink();
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

    Widget _buildBillCard(Legislation bill) {
      final l10n = AppLocalizations.of(context)!;
      final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
      final displayInfo = activeService.getDisplayableStatusInfo(context, bill.status);

      const int maxVisiblekeyPoints = 3;
      final List<String> keyPoints = bill.keyPoints;
      final bool hasMorekeyPoints = keyPoints.length > maxVisiblekeyPoints;
      final List<String> visiblekeyPoints = keyPoints.take(maxVisiblekeyPoints).toList();

      String upcomingDatesString = "";
      if (bill.upcomingProceedingDates != null && bill.upcomingProceedingDates!.isNotEmpty) {
        upcomingDatesString = bill.upcomingProceedingDates!
            .map((dateTime) => _formatUpcomingDateString(dateTime))
            .where((formatted) => formatted.isNotEmpty)
            .join('\n');
      }
      
      final List<String> individualCategories = _parseCategories(bill.category);

      return GestureDetector(
        onTap: () {
          final parliamentId = context.read<ParliamentManager>().activeServiceId;
          context.smartNavigate('/$parliamentId/legislations/${bill.id}?list=process', extra: bill);
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
                    if (bill.status.isNotEmpty)
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
                const SizedBox(height: 8),
                if (bill.description.isNotEmpty && bill.description != l10n.noData)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      bill.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[800]),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                else
                  const SizedBox(height: 4),

                if (bill.processStartDate != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.play_circle_outline, size: 16, color: Colors.grey[600]),
                        ),
                        Text(
                          l10n.processStartDateCardLabel(_formatUpcomingDateString(bill.processStartDate)),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  
                if (upcomingDatesString.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
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
                              const SizedBox(height: 2),
                              Text(
                                upcomingDatesString,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700], height: 1.4),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                if (visiblekeyPoints.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.keyPointsTitle, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
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
                  if ((bill.processStartDate != null) || upcomingDatesString.isNotEmpty)
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

    String _formatUpcomingDateString(DateTime? date) {
      if (date == null) return '';
      try {
        final localDate = date.toLocal();
        if (localDate.hour == 0 && localDate.minute == 0 && localDate.second == 0 && localDate.millisecond == 0) {
          return _dateFormatter.format(localDate);
        } else {
          return _dateTimeFormatter.format(localDate);
        }
      } catch (e) {
        return '';
      }
    }
  }
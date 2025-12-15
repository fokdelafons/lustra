import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import '../models/mp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/parliament_source.dart';
import '../services/parliament_manager.dart';
import '../services/parliament_service_interface.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import '../services/app_router.dart';

class MPScreen extends StatefulWidget {
  final String? deputyId;
  const MPScreen({
    super.key,
    this.deputyId,
  });

  @override
  MPScreenState createState() => MPScreenState();
}

class MPScreenState extends State<MPScreen> {
  List<MP> _mps = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _errorMessage;
  ParliamentSource? _lastSource;
  int? _lastTerm;
  bool _isFirstBuild = true;
  final ScrollController _scrollController = ScrollController();
  String? _nextCursor;
  bool _hasMoreItems = true;
  static const int _itemsPerPage = 15;
  String _searchQuery = '';
  bool _isSearchActive = false;
  late String _selectedFilter;
  List<String> _filterOptions = [];
  String _sortBy = 'popularity';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 300 &&
        !_isLoadingMore &&
        _hasMoreItems &&
        !_isLoading) {
      _loadMoreMPs(); 
    }
  }

@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final activeService = context.watch<ParliamentServiceInterface>();

    final extra = GoRouterState.of(context).extra;
    String? initialSearchQuery;
    if (extra is Map<String, dynamic> && extra.containsKey('searchQuery')) {
      initialSearchQuery = extra['searchQuery'] as String;
    }

    if (_isFirstBuild || _lastSource?.id != activeService.source.id || _lastTerm != activeService.currentTerm) {
      developer.log(
        'didChangeDependencies: Wykryto zmianę kontekstu. Nowe źródło: ${activeService.source.id}, kadencja: ${activeService.currentTerm}',
        name: 'MPScreen'
      );
      _isFirstBuild = false;
      _lastSource = activeService.source;
      _lastTerm = activeService.currentTerm;
      final l10n = AppLocalizations.of(context)!;
      _selectedFilter = l10n.allFilter;
      _updateFilterOptions(activeService.clubFilters, l10n);

      if (initialSearchQuery != null && initialSearchQuery.isNotEmpty) {
        _searchQuery = initialSearchQuery;
        _isSearchActive = true;
      }
      
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _resetAndLoadData(newSourceChanged: true, forceRefresh: false);
        }
      });
    }
  }

  void _resetAndLoadData({bool forceRefresh = false, bool newSourceChanged = false}) {
    developer.log('Resetowanie stanu. forceRefresh: $forceRefresh, newSourceChanged: $newSourceChanged', name: 'MPScreen');
    if (!mounted) return;
    setState(() {
      _mps = [];
      _isLoading = true;
      _isLoadingMore = false;
      _errorMessage = null;
      _nextCursor = null;
      _hasMoreItems = true;
      if (newSourceChanged) {
        final l10n = AppLocalizations.of(context)!;
        if (_searchQuery.isEmpty) {
           _isSearchActive = false;
        }
        _selectedFilter = l10n.allFilter;
        _sortBy = 'popularity';
  }});

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _loadMPs(forceRefresh: forceRefresh);
      }
    });
  }

Future<void> _loadMPs({bool forceRefresh = false}) async {
  final l10n = AppLocalizations.of(context)!;
  developer.log('Ładowanie posłów. Filtr: $_selectedFilter, Wyszukiwanie: "$_searchQuery"', name: 'MPScreen');
  try {
    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    final clubFilter = _selectedFilter == l10n.allFilter ? null : _selectedFilter;
    final response = await activeService.getMPs(
      context,
      limit: _itemsPerPage,
      lastVisibleId: null,
      forceRefresh: forceRefresh,
      searchQuery: _searchQuery.trim().isEmpty ? null : _searchQuery.trim(),
      club: clubFilter,
      sortBy: _sortBy,
    );
    if (!mounted) return;
    final List<dynamic> items = _searchQuery.isNotEmpty 
      ? response['deputies']
      : response['deputies'] as List;
    final fetchedMps = items.map((item) => item is MP ? item : MP.fromJson(item as Map<String, dynamic>)).toList();
    setState(() {
      _mps = fetchedMps;
      _nextCursor = response['nextCursor'];
      _hasMoreItems = _nextCursor != null;
      _errorMessage = null;
    });
  } catch (e, stackTrace) {
    developer.log('Błąd podczas ładowania posłów: $e', name: 'MPScreen', error: e, stackTrace: stackTrace);
    if (mounted) {
      setState(() {
        _errorMessage = l10n.errorFetchData;
        _mps = [];
        _hasMoreItems = false;
      });
    }
  } finally {
    if (mounted) {
      setState(() {
        _isLoading = false;
        _isLoadingMore = false;
      });
    }
  }
}

Future<void> _loadMoreMPs() async {
  if (_isLoading || _isLoadingMore || !_hasMoreItems) return;
  final l10n = AppLocalizations.of(context)!;
  developer.log('Doładowywanie posłów. Kursor: $_nextCursor', name: 'MPScreen');
  setState(() => _isLoadingMore = true);
  try {
    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    final clubFilter = _selectedFilter == l10n.allFilter ? null : _selectedFilter;
    final response = await activeService.getMPs(
      context,
      limit: _itemsPerPage,
      lastVisibleId: _nextCursor,
      searchQuery: _searchQuery.trim().isEmpty ? null : _searchQuery.trim(),
      club: clubFilter,
      sortBy: _sortBy,
    );
    if (!mounted) return;
    final List<dynamic> items = _searchQuery.isNotEmpty 
      ? response['deputies']
      : response['deputies'] as List;
    final fetchedMps = items.map((item) => item is MP ? item : MP.fromJson(item as Map<String, dynamic>)).toList();
    setState(() {
      _mps.addAll(fetchedMps);
      _nextCursor = response['nextCursor'];
      _hasMoreItems = _nextCursor != null;
    });
  } catch (e, stackTrace) {
    developer.log('Error loading more MPs: $e', name: 'MPScreen', error: e, stackTrace: stackTrace);
  } finally {
    if (mounted) {
      setState(() => _isLoadingMore = false);
    }
  }
}

  void _updateFilterOptions(List<String> newOptions, AppLocalizations l10n) {
   List<String> sortedClubs = List.from(newOptions);
   sortedClubs.sort();
   _filterOptions = [l10n.allFilter, ...sortedClubs];
   if (!_filterOptions.contains(_selectedFilter)) {
      setState(() {
        _selectedFilter = l10n.allFilter;
     });
   }
  }

  int _calculateAge(String? dateOfBirthString) {
    if (dateOfBirthString == null || dateOfBirthString.isEmpty) return 0;
    try {
      final birthDate = DateTime.parse(dateOfBirthString);
      final today = DateTime.now();
      int age = today.year - birthDate.year;
      if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }
      return age > 0 ? age : 0;
    } catch (e) {
      return 0;
    }
  }

Widget _buildFilterChips() {
    final chips = _filterOptions.map((filter) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ChoiceChip(
          label: Text(filter),
          selected: _selectedFilter == filter,
          onSelected: (selected) {
            if (selected) {
              setState(() => _selectedFilter = filter);
              _resetAndLoadData();
            }
          },
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(children: chips),
      );
    }
  }

@override
Widget build(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  final manager = Provider.of<ParliamentManager>(context);
  if (manager.isLoading || !manager.isInitialized) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.mpScreenTitle("")), 
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
  if (manager.error != null) {
     return Scaffold(
      appBar: AppBar(
        title: Text(l10n.mpScreenTitle("")),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.noMPsForSource, textAlign: TextAlign.center),
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
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.mpScreenTitle(activeService.name)),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: l10n.refreshDataTooltip,
                onPressed: (_isLoading || _isLoadingMore) ? null : () async {
                  await activeService.clearCache();
                  _resetAndLoadData(forceRefresh: true);
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
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
                          hintText: l10n.searchMPsHint,
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
                                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                                      Container(width: 1, height: 24, color: Colors.grey[300]),
                                      const SizedBox(width: 8),
                                      Text(l10n.clearText, style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500)),
                                    ]),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_filterOptions.length > 1)
                IgnorePointer(
                  ignoring: _isSearchActive,
                  child: Opacity(
                    opacity: _isSearchActive ? 0.5 : 1.0,
                    child: _buildFilterChips(),
                  ),
                ),
              IgnorePointer(
                ignoring: _isSearchActive,
                child: Opacity(
                  opacity: _isSearchActive ? 0.5 : 1.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(l10n.filterTypeLabel, style: Theme.of(context).textTheme.labelMedium),
                            DropdownButton<String>(
                              value: 'deputies',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'deputies',
                                  child: Text(l10n.deputies),
                                ),
                              ],
                              onChanged: null,
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
                              items: {
                                'popularity': l10n.sortByPopularity,
                                'attendance': l10n.sortByAttendance,
                              }.entries.map((entry) {
                                return DropdownMenuItem<String>(
                                  value: entry.key,
                                  child: Text(entry.value),
                                );
                              }).toList(),
                              onChanged: (String? newKey) {
                                if (newKey != null && newKey != _sortBy) {
                                  setState(() => _sortBy = newKey);
                                  _resetAndLoadData();
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
                ),
              ),
              const Divider(height: 8),
              Expanded(
                child: _buildMPList(_mps),
              ),
            ],
          ),
        );
      },
    ),
  );
}

  Widget _buildMPList(List<MP> filteredMPs) {
  final l10n = AppLocalizations.of(context)!;
  if (_isLoading && _mps.isEmpty) {
    return const Center(child: CircularProgressIndicator());
  }
  if (_errorMessage != null && _mps.isEmpty) {
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
  if (filteredMPs.isEmpty && !_isLoading) {
    String message = (_isSearchActive || _selectedFilter != l10n.allFilter)
        ? l10n.noMPsMatchFilter
        : l10n.noMPsForSource;
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
  return ListView.builder(
    controller: _scrollController,
    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
    itemCount: filteredMPs.length + (_isLoadingMore ? 1 : 0),
    itemBuilder: (context, index) {
      if (index == filteredMPs.length) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Center(child: CircularProgressIndicator()),
        );
      }
      final mp = filteredMPs[index];
      return _buildMPCard(mp);
    },
  );
}

  Widget _buildAttendanceWidget(double percentage) {
    final l10n = AppLocalizations.of(context)!;
    final int roundedPercentage = percentage.round();
    String numberText = '$roundedPercentage%';
    Color textColor;
    bool addExclamation = false;
    if (percentage >= 95) {
      textColor = Colors.green;
    } else if (percentage >= 90) {
      textColor = Colors.yellow.shade700;
    } else if (percentage >= 85) {
      textColor = Colors.orange;
    } else if (percentage >= 65) {
      textColor = Colors.red;
    } else {
      textColor = Colors.red;
      addExclamation = true;
    }
    String displayText = addExclamation ? '$numberText !' : numberText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          displayText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: textColor,
            decoration: TextDecoration.underline,
            decorationColor: textColor,
          ),
        ),
        Text(
          l10n.attendanceLabelShort,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildMPCard(MP mp) {
    final l10n = AppLocalizations.of(context)!;
    final int age = _calculateAge(mp.birthDate);
    final clubInfo = mp.club.isNotEmpty ? mp.club : l10n.unaffiliatedClub;
    final districtInfo = mp.district;
    final clubAndDistrict = '$clubInfo • $districtInfo';
    
    final int likesCount = mp.likes ?? 0;
    final int dislikesCount = mp.dislikes ?? 0;
    final int totalUserVotes = mp.popularity ?? (likesCount + dislikesCount);
    final double supportPercentage = totalUserVotes > 0 ? (likesCount / totalUserVotes) : 0.0;

    String mandateStatusText;
    switch (mp.mandateCoverage) {
      case 'FULL':
        mandateStatusText = mp.active ? l10n.mandateStatusActive : l10n.mandateStatusFulfilled;
        break;
      case 'PARTIAL':
        mandateStatusText = l10n.mandateStatusCancelled;
        break;
      default:
        mandateStatusText = mp.active ? l10n.mandateStatusActive : l10n.mandateStatusInactive;
        break;
    }
    final double cardOpacity = (mp.mandateCoverage == 'PARTIAL') ? 0.4 : 1.0;
    return Opacity(
      opacity: cardOpacity,
      child: GestureDetector(
        onTap: () {
          final parliamentId = context.read<ParliamentManager>().activeServiceId;
          context.smartNavigate('/$parliamentId/members/${mp.id}', extra: mp);
        },
        child: Card(
          margin: const EdgeInsets.only(bottom: 12.0),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    mp.imageUrl != null
                        ? CircleAvatar(
                            radius: 30,
                            backgroundImage: CachedNetworkImageProvider(mp.imageUrl!),
                            onBackgroundImageError: (exception, stackTrace) {},
                            backgroundColor: Colors.grey[200],
                          )
                        : CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(Icons.person, size: 35, color: Colors.white),
                          ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${mp.firstName} ${mp.lastName}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            clubAndDistrict,
                            style: TextStyle(color: Colors.grey[700], fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (age > 0)
                            Text(
                              l10n.ageUnit(age),
                              style: TextStyle(color: Colors.grey[700], fontSize: 13),
                            ),
                          Text(
                            mandateStatusText,
                            style: TextStyle(color: Colors.grey[700], fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    if (mp.attendancePercentage != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildAttendanceWidget(mp.attendancePercentage!),
                            if (mp.mandateCoverage == 'UNKNOWN') ...[
                              const SizedBox(width: 4),
                              Tooltip(
                                message: l10n.attendanceTooltipWarning,
                                child: Icon(Icons.help_outline, size: 18, color: Colors.grey[600]),
                              ),
                            ],
                          ],
                        ),
                      ),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      l10n.supportLabel,
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    ),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: supportPercentage,
                        backgroundColor: totalUserVotes == 0
                            ? Colors.grey.shade300
                            : (dislikesCount > 0 ? Colors.red.shade300 : Colors.transparent),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          likesCount > 0 ? Colors.green.shade300 : Colors.transparent,
                        ),
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${(supportPercentage * 100).toStringAsFixed(0)}%',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
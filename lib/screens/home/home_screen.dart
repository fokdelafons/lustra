import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

import '../../models/home_screen_data.dart';
import '../../providers/language_provider.dart';
import '../../providers/user_provider.dart';
import '../../services/parliament_service_interface.dart';
import '../../services/app_router.dart';
import '../../services/parliament_manager.dart';
import '../../services/firebase_auth.dart';
import '../../widgets/home_specific/civic_project_card.dart';
import '../../widgets/home_specific/voted_card.dart';
import '../../widgets/home_specific/upcoming_card.dart';
import '../../widgets/home_specific/process_card.dart';
import '../../widgets/home_specific/politicians_card.dart';
import '../../widgets/home_specific/web_app_bar.dart';
import '../../widgets/home_specific/mobile_app_bar.dart';


class NewHomeScreen extends StatefulWidget {
  final Widget child;
  
  const NewHomeScreen({super.key, required this.child});

  @override
  NewHomeScreenState createState() => NewHomeScreenState();
}

class NewHomeScreenState extends State<NewHomeScreen> {

  @override
  void initState() {
    super.initState();
  }
  
int _calculateSelectedIndex(BuildContext context) {
    // URL router
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/info')) return 1;
    if (location.startsWith('/support')) return 2;
    if (location.startsWith('/future')) return 3;
    return 0; // Home
  }

@override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    if (userProvider.isInitialized && !userProvider.profileExists) {
       WidgetsBinding.instance.addPostFrameCallback((_) {
         context.read<AuthService>().signOut();
       });
    }
    
    final l10n = AppLocalizations.of(context)!;
    final manager = Provider.of<ParliamentManager>(context);
    
    // Responsiveness
    final bool useWideLayout = kIsWeb && MediaQuery.of(context).size.width > 1140;

    // LOADING / ERROR STATES
    if (!manager.isInitialized) {
      return Scaffold(body: const Center(child: CircularProgressIndicator()));
    }
    if (manager.error != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.errorFailedToLoadData),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.errorCheckConnection, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => manager.changeSource(manager.activeServiceId!),
                child: Text(l10n.buttonRetry),
              ),
            ],
          ),
        ),
      );
    }

    final int currentIndex = _calculateSelectedIndex(context);

    return ChangeNotifierProvider.value(
      value: manager.activeService,
      child: 
        Scaffold(
          // --- PASEK NA WEBIE ---
          appBar: useWideLayout ? const WebAppBar() : null,
          body: useWideLayout 
            ? widget.child
            : GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: widget.child,
              ),

          // BOTTOM BAR (mobile)
          bottomNavigationBar: useWideLayout ? null : BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: const Icon(Icons.home), label: l10n.bottomNavHome),
              BottomNavigationBarItem(icon: const Icon(Icons.info_outline), label: l10n.bottomNavInfo),
              BottomNavigationBarItem(icon: const Icon(Icons.favorite_outline), label: l10n.bottomNavSupport),
              BottomNavigationBarItem(icon: const Icon(Icons.lightbulb_outline), label: l10n.bottomNavFutureFeatures),
            ],
            currentIndex: currentIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              switch (index) {
                case 0:
                  context.smartNavigate('/');
                case 1:
                  context.smartNavigate('/info');
                  break;
                case 2:
                  context.smartNavigate('/support');
                  break;
                case 3:
                  context.smartNavigate('/future');
                  break;
              }
            },
          ),
        ),
    );
  }
}
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  HomeContentState createState() => HomeContentState();
}

class HomeContentState extends State<HomeContent> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _searchWidgetKey = GlobalKey();
  bool _isInitialScrollPerformed = false;
  HomeScreenData? _data;
  bool _isLoading = true;
  Object? _error;

  ParliamentServiceInterface? _activeService;
  int? _currentTerm;
  String? _currentLanguageCode;

  @override
  void initState() {
    super.initState();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final manager = Provider.of<ParliamentManager>(context);
    if (!manager.isReady || manager.isLoading) return;
    final newActiveService = Provider.of<ParliamentServiceInterface>(context);
    final newTerm = newActiveService.currentTerm;
    final newLanguageCode = context.watch<LanguageProvider>().appLanguageCode;
    if (_activeService != newActiveService || _currentTerm != newTerm || _currentLanguageCode != newLanguageCode) {
      _activeService = newActiveService;
      _currentTerm = newTerm;
      _currentLanguageCode = newLanguageCode;
      _loadHomeScreenData();
    }
  }

  Future<void> _loadHomeScreenData() async {
    setState(() {
      _isInitialScrollPerformed = false; 
    });

    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final data = await _activeService!.getHomeScreenData(context);
      if (mounted) {
        setState(() {
          _data = data;
          _isLoading = false;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && _scrollController.hasClients && !_isInitialScrollPerformed) {
            final RenderBox? renderBox = _searchWidgetKey.currentContext?.findRenderObject() as RenderBox?;
              if (renderBox != null) {
                if (!kIsWeb) {
                  final searchBarHeight = renderBox.size.height;
                  const separatorHeight = 16.0;
                  _scrollController.jumpTo(searchBarHeight + separatorHeight);
                }
                setState(() {
                  _isInitialScrollPerformed = true;
                });
              }
          }
        });
      }
    } catch (e, s) {
      developer.log('Error loading home screen data: $e', name: 'HomeContentState', stackTrace: s);
      if (mounted) {
        setState(() {
          _error = e;
          _isLoading = false;
        });
      }
    }
  }

  void _retryLoading() {
    context.read<ParliamentManager>().clearError();
    _loadHomeScreenData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

Widget _buildSearchWidget(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    void performSearch() {
       if (_searchController.text.trim().isEmpty) return;
       FocusScope.of(context).unfocus();
       final manager = context.read<ParliamentManager>();
       final slug = manager.activeSlug;
       final lang = context.read<LanguageProvider>().appLanguageCode;
       final term = manager.currentTerm;
       context.smartNavigate('/$lang/$slug/$term/legislations?list=process', extra: {'searchQuery': _searchController.text.trim()});
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          textInputAction: TextInputAction.search,
          onSubmitted: (_) => performSearch(),
          decoration: InputDecoration(
            hintText: l10n.homeSearchHint,
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: performSearch,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            isDense: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // If's
    final bool useWideLayout = kIsWeb && MediaQuery.of(context).size.width > 1140;
    
    return Scaffold(
    appBar: useWideLayout ? null : const MobileAppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: _buildBodyContent(context), 
      ),
    );
  }

Widget _buildBodyContent(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.errorFailedToLoadData, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(l10n.errorCheckConnection, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: Text(l10n.buttonRetry),
                onPressed: _retryLoading,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      );
    }
    
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    
    return _buildContentList(context);
  }

Widget _buildContentList(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final homeData = _data;

    if (homeData == null) {
      return const SizedBox.shrink();
    }

    List<Widget> sectionWidgets = [];
    //  0: Popular
    if (homeData.popularVoted != null && homeData.popularVoted!.id.isNotEmpty) {
      sectionWidgets.add(VotedCard(item: homeData.popularVoted!));
    }
    //  1: Upcoming
    if (homeData.upcomingVote != null && homeData.upcomingVote!.id.isNotEmpty) {
      sectionWidgets.add(UpcomingCard(item: homeData.upcomingVote!));
    }
    //  2: Process
    if (homeData.popularInProcess != null && homeData.popularInProcess!.id.isNotEmpty) {
      sectionWidgets.add(ProcessCard(item: homeData.popularInProcess!));
    }
    // 3: Civic
    if (homeData.civicProject != null) {
      sectionWidgets.add(CivicProjectCard(project: homeData.civicProject!,));
    }
    // 4: Politicians
    if (homeData.topDeputies != null && homeData.topDeputies!.deputies.isNotEmpty) {
        sectionWidgets.add(PoliticiansCard(deputies: homeData.topDeputies!.deputies));
      }
    if (sectionWidgets.isEmpty) {
      Widget emptyContent = ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSearchWidget(context),
          const SizedBox(height: 16),
          Center(child: Text(l10n.errorNoDataForTerm)),
        ],
      );
      
      if (kIsWeb) {
         return Center(
           child: ConstrainedBox(
             constraints: const BoxConstraints(maxWidth: 750),
             child: emptyContent
           )
         );
      }
      return emptyContent;
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollStartNotification && _searchFocusNode.hasFocus) {
          FocusScope.of(context).unfocus();
        }
        return false;
      },
      child: Opacity(
        opacity: _isInitialScrollPerformed ? 1.0 : 0.0,
        child: ListView.separated(
          controller: _scrollController,
          padding: kIsWeb 
              ? const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0) 
              : const EdgeInsets.all(16.0),
          itemCount: sectionWidgets.length + 1,
          itemBuilder: (context, index) {
            Widget content;
            if (index == 0) {
              content = Container(
                key: _searchWidgetKey,
                child: _buildSearchWidget(context),
              );
            } else {
              content = sectionWidgets[index - 1];
            }
            if (kIsWeb) {
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 750),
                  child: content,
                ),
              );
            }
            return content;
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      ),
    );
  }
}
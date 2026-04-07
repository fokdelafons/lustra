import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lustra/l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
// import 'package:qr_flutter/qr_flutter.dart';

import '../../models/home_screen_data.dart';
import '../../providers/language_provider.dart';
import '../../providers/user_provider.dart';
import '../../services/parliament_service_interface.dart';
import '../../services/app_router.dart';
import '../../services/parliament_manager.dart';
import '../../services/firebase_auth.dart';
import '../../services/notification_service.dart';
import '../../widgets/osint_loader.dart';
import '../../widgets/home_specific/card_civic.dart';
import '../../widgets/home_specific/card_voted.dart';
import '../../widgets/home_specific/card_upcoming.dart';
import '../../widgets/home_specific/card_process.dart';
import '../../widgets/home_specific/card_politicians.dart';
import '../../widgets/home_specific/app_bar_web.dart';
import '../../widgets/home_specific/app_bar_mobile.dart';
import '../../widgets/home_specific/app_bar_mobile_bottom.dart';
import '../../widgets/home_specific/card_tracked.dart';
import '../../widgets/home_specific/card_curated.dart';



class NewHomeScreen extends StatefulWidget {
  final Widget child;
  
  const NewHomeScreen({super.key, required this.child});

  @override
  NewHomeScreenState createState() => NewHomeScreenState();
}

class NewHomeScreenState extends State<NewHomeScreen> {
  bool _permissionsSynced = false; 

@override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    if (userProvider.isInitialized && !userProvider.profileExists) {
       WidgetsBinding.instance.addPostFrameCallback((_) {
         context.read<AuthService>().signOut();
       });
    }

    if (userProvider.isInitialized && userProvider.profileExists && !_permissionsSynced) {
       _permissionsSynced = true;
       
       WidgetsBinding.instance.addPostFrameCallback((_) {
         NotificationService.instance.syncPermissionsWithBackend(userProvider);
       });
    }
    
    final l10n = AppLocalizations.of(context)!;
    final manager = Provider.of<ParliamentManager>(context);
    
    // Responsiveness
    final bool useWideLayout = kIsWeb && MediaQuery.of(context).size.width > 1140;

    // LOADING / ERROR STATES
    if (!manager.isInitialized) {
       return OsintLoader(text: "SYNCING PARLIAMENT DATA...");
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

    return ChangeNotifierProvider.value(
      value: manager.activeService,
      child: 
      Scaffold(
          appBar: useWideLayout ? const WebAppBar() : null,
          body: Listener(
            onPointerDown: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SelectionArea(
              child: widget.child,
            ),
          ),
          bottomNavigationBar: useWideLayout ? null : const MobileNavBar(),
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        NotificationService.instance.consumePendingNotification(context);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final manager = Provider.of<ParliamentManager>(context, listen: false);
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
            final RenderBox? searchBox = _searchWidgetKey.currentContext?.findRenderObject() as RenderBox?;
            
            if (searchBox != null) {
              if (!kIsWeb) {
                final searchHeight = searchBox.size.height;
                final totalOffset = searchHeight + 16.0; 
                
                _scrollController.jumpTo(totalOffset);
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
    final bool useWideLayout = kIsWeb && MediaQuery.of(context).size.width > 1140;
    
    return Scaffold(
      appBar: useWideLayout ? null : const MobileAppBar(),
      body: Stack(
        children: [
          // GŁÓWNA ZAWARTOŚĆ
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: _buildBodyContent(context), 
          ),
          
          // // TARCZA: Pływający kod QR
          // const _StickyWebQrCode(),
        ],
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
    
  final manager = context.watch<ParliamentManager>();
    if (_isLoading || manager.isLoading) {
       return OsintLoader(text: l10n.loaderFetchingMirrorParliamentData);
    }
    
    return _buildContentList(context);
  }

Widget _buildContentList(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final homeData = _data;

    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktopWeb = kIsWeb && screenWidth > 750;

    if (homeData == null) {
      return const SizedBox.shrink();
    }

    final userProvider = context.watch<UserProvider>();
    final authService = context.watch<AuthService>();

    List<Widget> sectionWidgets = [];
    sectionWidgets.add(Container(
      key: ValueKey('tracked_card_${authService.currentUser?.uid ?? "guest"}'),
      child: const TrackedCard()
    ));
    const String masterListId = 'G0V2PdSmQtwh8bGxdT7e';
    
    final Set<String> uniqueListIds = {
      masterListId, 
      ...userProvider.createdLists,
      ...userProvider.subscribedLists,
    };
    final List<String> allListIds = uniqueListIds.toList();

    List<Widget> standardCards = [];
    if (homeData.popularVoted != null && homeData.popularVoted!.id.isNotEmpty) {
      standardCards.add(VotedCard(item: homeData.popularVoted!));
    }
    if (homeData.upcomingVote != null && homeData.upcomingVote!.id.isNotEmpty) {
      standardCards.add(UpcomingCard(item: homeData.upcomingVote!));
    }
    if (homeData.popularInProcess != null && homeData.popularInProcess!.id.isNotEmpty) {
      standardCards.add(ProcessCard(item: homeData.popularInProcess!));
    }
    if (homeData.civicProject != null) {
      standardCards.add(CivicProjectCard(project: homeData.civicProject!));
    }
    if (homeData.topDeputies != null && homeData.topDeputies!.deputies.isNotEmpty) {
      standardCards.add(PoliticiansCard(deputies: homeData.topDeputies!.deputies));
    }

    int maxLength = standardCards.length > allListIds.length ? standardCards.length : allListIds.length;
    
    for (int i = 0; i < maxLength; i++) {
      if (i < standardCards.length) {
        sectionWidgets.add(standardCards[i]);
      }
      if (i < allListIds.length) {
        sectionWidgets.add(CuratedListCard(listId: allListIds[i]));
      }
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
      if (isDesktopWeb) {
        return Center(
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 750),
                child: emptyContent));
      }
      return emptyContent;
    }

    Widget listView = ListView.separated(
      cacheExtent: 3000.0, 
      
      controller: _scrollController,
      physics: isDesktopWeb 
          ? const NeverScrollableScrollPhysics() 
          : const AlwaysScrollableScrollPhysics(),
          
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
        
        if (screenWidth > 1140 || isDesktopWeb) { 
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
    );

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollStartNotification && _searchFocusNode.hasFocus) {
          FocusScope.of(context).unfocus();
        }
        return false;
      },
      child: Opacity(
        opacity: _isInitialScrollPerformed ? 1.0 : 0.0,
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
}

// // ============================================================================
// // TARCZA: PŁYWAJĄCY KOD QR DLA WEBA (STICKY PROMO)
// // ============================================================================
// class _StickyWebQrCode extends StatefulWidget {
//   const _StickyWebQrCode();

//   @override
//   State<_StickyWebQrCode> createState() => _StickyWebQrCodeState();
// }

// class _StickyWebQrCodeState extends State<_StickyWebQrCode> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     // Pokazujemy tylko na Webie i tylko, gdy jest wystarczająco dużo miejsca po bokach (np. > 1140)
//     if (!kIsWeb || screenWidth < 1140) return const SizedBox.shrink();

//     // Obliczamy pozycję, żeby kod był ładnie wyśrodkowany w prawym marginesie
//     final rightMargin = (screenWidth - 750) / 2;
//     final qrSize = (rightMargin * 0.6).clamp(80.0, 360.0);
//     final widgetWidth = qrSize + 32;
//     final rightPosition = ((rightMargin - widgetWidth) / 2).clamp(8.0, double.infinity);

//     return Positioned(
//       bottom: 40, // Przypięte do dołu ekranu
//       right: rightPosition,
//       child: MouseRegion(
//         onEnter: (_) => setState(() => _isHovered = true),
//         onExit: (_) => setState(() => _isHovered = false),
//         child: AnimatedOpacity(
//           duration: const Duration(milliseconds: 250),
//           opacity: _isHovered ? 1.0 : 0.10, // Subtelne 25% na co dzień, 100% po najechaniu
//           child: Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: _isHovered ? [const BoxShadow(color: Colors.black12, blurRadius: 12, spreadRadius: 2)] : [],
//               border: Border.all(color: Colors.grey.shade300)
//             ),
//             child: Column(
//               children: [
//                 QrImageView(
//                   data: 'https://lustra.news/download',
//                   version: QrVersions.auto,
//                   size: qrSize,
//                   backgroundColor: Colors.white,
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "Get dedicated mobile app for notifications!", // TODO: L10N
//                   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lustra/models/mp.dart';
import 'package:lustra/models/legislation.dart';
import 'package:lustra/models/home_screen_data.dart';
import 'package:lustra/models/parliament_source.dart';
import 'package:lustra/services/parliament_manager.dart';
import 'package:lustra/screens/home_screen.dart';
import 'package:lustra/screens/login_screen.dart';
import 'package:lustra/screens/post_social_login_consent_screen.dart';
import 'package:lustra/screens/info_screen.dart';
import 'package:lustra/screens/terms_screen.dart'; 
import 'package:lustra/screens/tech_screen.dart';
import 'package:lustra/screens/support_project_screen.dart';
import 'package:lustra/screens/future_features_screen.dart';
import 'package:lustra/screens/mp_screen.dart';
import 'package:lustra/screens/mp_details_screen.dart';
import 'package:lustra/screens/legislation_details_screen.dart';
import 'package:lustra/screens/civic_project_screen.dart';
import 'package:lustra/screens/legislation_wrapper_screen.dart';
import 'package:lustra/providers/language_provider.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    // --- SHELL ROUTE (Główna Ramka z Paskami Nawigacji) ---
    ShellRoute(
      builder: (context, state, child) {
        // Przekazujemy "child" do NewHomeScreen, który wyświetli go w body
        return NewHomeScreen(child: child);
      },
      routes: [
        // 1. HOME
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeContent(),
        ),

        // 2. INFO (z podstronami)
        GoRoute(
          path: '/info',
          builder: (context, state) => const InfoScreen(),
          routes: [
            GoRoute(path: 'terms', builder: (context, state) => const TermsScreen()),
            GoRoute(path: 'privacy', builder: (context, state) => const TermsScreen()),
            GoRoute(path: 'tech', builder: (context, state) => const TechStackScreen()),
          ],
        ),

        // 3. SUPPORT
        GoRoute(
          path: '/support',
          builder: (context, state) => const SupportProjectScreen(),
        ),

        // 4. FUTURE
        GoRoute(
          path: '/future',
          builder: (context, state) => const FutureFeaturesScreen(),
        ),
      ],
    ),

    // --- EKRANY PEŁNOEKRANOWE (POZA RAMKĄ) ---
    // Nie mają dolnego paska nawigacji (Login, Zgody)
    
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    
    GoRoute(
      path: '/post-social-login-consent',
      builder: (context, state) {
        if (state.extra is User) {
          final user = state.extra as User;
          return PostSocialLoginConsentScreen(user: user);
        }
        return const NewHomeScreen(child: HomeContent()); 
      },
    ),

    // 1. POSŁOWIE (/:lang/:pid/:term/members)
    GoRoute(
      path: '/:lang/:slug/:term/members',
      redirect: (context, state) {
        final slug = state.pathParameters['slug'];
        if (ParliamentSource.getIdBySlug(slug) == null) {
          return '/';
        }
        return null;
      },
      builder: (context, state) {
        final lang = state.pathParameters['lang'];
        final slug = state.pathParameters['slug'];
        final term = state.pathParameters['term'];
        final pid = ParliamentSource.getIdBySlug(slug)!;

        return RouteContextGuard(
          targetLang: lang,
          targetParliamentId: pid,
          targetTerm: term,
          child: const MPScreen(),
        );
      },
      routes: [
         GoRoute(
          path: ':mpId',
          builder: (context, state) {
            final slug = state.pathParameters['slug'];
            final mpId = state.pathParameters['mpId']!;
            final pid = ParliamentSource.getIdBySlug(slug)!; 
            
            Widget child;
            if (state.extra is MP) {
              child = MPDetailsScreen(mp: state.extra as MP);
            }
            else if (state.extra is HomeScreenDeputy) {
               final homeDeputy = state.extra as HomeScreenDeputy;
               final mp = MP(
                 id: homeDeputy.deputyId,
                 firstName: homeDeputy.fullName.split(' ').first,
                 lastName: homeDeputy.fullName.split(' ').sublist(1).join(' '),
                 club: homeDeputy.club,
                 district: homeDeputy.district,
                 numberOfVotes: homeDeputy.numberOfVotes,
                 imageUrl: homeDeputy.imageUrl,
                 secondName: '',
                 active: true,
                 districtNum: 0,
                 memberType: '',
                 mandateCoverage: 'UNKNOWN',
                 profession: '',
                 birthDate: '',
                 birthLocation: '',
                 educationLevel: '',
                 voivodeship: '',
                 email: '',
                 attendancePercentage: null,
                 parliamentaryHistory: {},
                 likes: null,
                 dislikes: null,
                 popularity: null,
               );
               child = MPDetailsScreen(mp: mp);
            }
            else {
              child = MPDetailsScreen(mpId: mpId);
            }

            return RouteContextGuard(
              targetParliamentId: pid,
              child: child,
            );
          },
        ),
      ]
    ),

  // 2. LEGISLACJA
    GoRoute(
      path: '/:lang/:slug/:term/legislations',
      redirect: (context, state) {
        final slug = state.pathParameters['slug'];
        if (ParliamentSource.getIdBySlug(slug) == null) {
          return '/'; 
        }
        return null;
      },

      builder: (context, state) {
        final lang = state.pathParameters['lang'];
        final slug = state.pathParameters['slug'];
        final term = state.pathParameters['term'];
        final type = state.uri.queryParameters['list'] ?? 'voted';
        final pid = ParliamentSource.getIdBySlug(slug)!;

        return RouteContextGuard(
          targetLang: lang,
          targetParliamentId: pid,
          targetTerm: term,
          child: LegislationWrapperScreen(type: type),
        );
      },
      routes: [
        GoRoute(
          path: ':legislationId',
          builder: (context, state) {
             final slug = state.pathParameters['slug'];
             final pid = ParliamentSource.getIdBySlug(slug)!;
             final legislationId = state.pathParameters['legislationId']!;
             Widget child;
             
             if (state.extra is Legislation) {
                child = LegislationDetailsScreen(bill: state.extra as Legislation);
             } else if (state.extra is HomeScreenLegislationItem) {
                final homeItem = state.extra as HomeScreenLegislationItem;
                final legislation = Legislation(
                  id: homeItem.id, title: homeItem.title, description: homeItem.summary ?? '', 
                  status: homeItem.status, date: homeItem.votingDate, processStartDate: homeItem.processStartDate, 
                  keyPoints: homeItem.keyPoints, likes: homeItem.likes ?? 0, dislikes: homeItem.dislikes ?? 0, 
                  popularity: homeItem.popularity, summaryGeneratedBy: homeItem.summaryGeneratedBy, 
                  upcomingProceedingDates: homeItem.upcomingProceedingDates, documentType: homeItem.documentType, 
                  votesFor: homeItem.votesFor, votesAgainst: homeItem.votesAgainst, votesAbstain: homeItem.votesAbstain, 
                  term: 0, number: '', documentDate: null, category: '', points: 0
                );
                child = LegislationDetailsScreen(bill: legislation);
             } else {
                child = LegislationDetailsScreen(legislationId: legislationId);
             }

             return RouteContextGuard(
               targetParliamentId: pid,
               child: child,
             );
          },
        ),
      ],
    ),
GoRoute(
      path: '/:lang/:slug/:term/civic-project',
      redirect: (context, state) {
        final slug = state.pathParameters['slug'];
        if (ParliamentSource.getIdBySlug(slug) == null) {
          return '/';
        }
        return null;
      },
      builder: (context, state) {
        final lang = state.pathParameters['lang'];
        final slug = state.pathParameters['slug'];
        final term = state.pathParameters['term'];
        final pid = ParliamentSource.getIdBySlug(slug)!;
        return RouteContextGuard(
          targetLang: lang,
          targetParliamentId: pid,
          targetTerm: term,
          child: const CivicProjectScreen(),
        );
      },
    ),
  ],
);

extension NavigationExtensions on BuildContext {
  void smartNavigate(String location, {Object? extra}) {
    if (kIsWeb) {
      go(location, extra: extra);
    } else {
      push(location, extra: extra);
    }
  }
}

class RouteContextGuard extends StatelessWidget {
  final String targetParliamentId;
  final String? targetLang;
  final String? targetTerm;
  final Widget child;

  const RouteContextGuard({
    super.key,
    required this.targetParliamentId,
    this.targetLang,
    this.targetTerm,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final pManager = context.watch<ParliamentManager>();
    final lProvider = context.watch<LanguageProvider>();
    if (!pManager.isReady) {
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    bool langMatch = true;
    if (targetLang != null && lProvider.appLanguageCode != targetLang) {
      langMatch = false;
    }
    bool sourceMatch = pManager.activeServiceId == targetParliamentId;
    bool termMatch = true;
    int? parsedTerm;
    if (targetTerm != null) {
      parsedTerm = int.tryParse(targetTerm!);
      if (sourceMatch && parsedTerm != null && pManager.currentTerm != parsedTerm) {
        termMatch = false;
      }
    }

    if (langMatch && sourceMatch && termMatch && !pManager.isLoading) {
      return child;
    }

    _synchronize(context, pManager, lProvider, langMatch, sourceMatch, termMatch, parsedTerm);
    
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  void _synchronize(
    BuildContext context,
    ParliamentManager pManager,
    LanguageProvider lProvider,
    bool langMatch,
    bool sourceMatch,
    bool termMatch,
    int? parsedTerm,
  ) {
    Future.microtask(() async {
      if (!langMatch && targetLang != null) {
        await lProvider.setLanguageByCode(targetLang!);
        return;
      }
      if (!sourceMatch) {
        if (!pManager.isLoading) {
           await pManager.changeSource(targetParliamentId);
        }
        return;
      }
      if (!termMatch && parsedTerm != null) {
        if (!pManager.isLoading) {
          await pManager.changeTerm(parsedTerm);
        }
      }
    });
  }
}
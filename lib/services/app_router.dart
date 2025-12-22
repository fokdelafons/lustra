import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lustra/models/mp.dart';
import 'package:lustra/models/legislation.dart';
import 'package:lustra/models/home_screen_data.dart';
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
        // Fallback w razie błędu
        return const NewHomeScreen(child: HomeContent()); 
      },
    ),

    // 1. POSŁOWIE (/pl/members i /pl/members/123)
    GoRoute(
      path: '/:parliamentId/members',
      // USUNIĘTO redirect - teraz zajmuje się tym ParliamentSourceGuard w builderze
      builder: (context, state) {
        final pid = state.pathParameters['parliamentId']!;
        return ParliamentSourceGuard(
          targetParliamentId: pid,
          child: const MPScreen(),
        );
      },
      routes: [
         GoRoute(
          path: ':mpId',
          builder: (context, state) {
            final pid = state.pathParameters['parliamentId']!;
            final mpId = state.pathParameters['mpId']!;
            
            Widget child;
            // A. Pełny obiekt MP przekazany w extra
            if (state.extra is MP) {
              child = MPDetailsScreen(mp: state.extra as MP);
            }
            // B. Skrót z HomeScreen (konwersja)
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
            // C. Wejście z linku (pobieranie po ID wewnątrz ekranu)
            else {
              child = MPDetailsScreen(mpId: mpId);
            }

            // Owijamy w Guarda
            return ParliamentSourceGuard(
              targetParliamentId: pid,
              child: child,
            );
          },
        ),
      ]
    ),

  // 2. LEGISLACJA
    GoRoute(
      path: '/:parliamentId/legislations',
      builder: (context, state) {
        final pid = state.pathParameters['parliamentId']!;
        // Pobieramy typ z query params (?type=voted), domyślnie voted
        final type = state.uri.queryParameters['list'] ?? 'voted';

        return ParliamentSourceGuard(
          targetParliamentId: pid,
          child: LegislationWrapperScreen(type: type),
        );
      },
      routes: [
        // Szczegóły jako DZIECKO. URL: /legislations/123
        GoRoute(
          path: ':legislationId',
          builder: (context, state) {
             final pid = state.pathParameters['parliamentId']!;
             final legislationId = state.pathParameters['legislationId']!;
             Widget child;
             
             if (state.extra is Legislation) {
                child = LegislationDetailsScreen(bill: state.extra as Legislation);
             } else if (state.extra is HomeScreenLegislationItem) {
                // Konwersja skróconego obiektu (zachowujemy Twoją logikę)
                final homeItem = state.extra as HomeScreenLegislationItem;
                final legislation = Legislation(
                  id: homeItem.id, title: homeItem.title, description: homeItem.summary ?? 'Brak opisu', 
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

             return ParliamentSourceGuard(
               targetParliamentId: pid,
               child: child,
             );
          },
        ),
      ],
    ),
        GoRoute(
      path: '/:parliamentId/civic-project',
      builder: (context, state) {
        final pid = state.pathParameters['parliamentId']!;
        return ParliamentSourceGuard(
          targetParliamentId: pid,
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

class ParliamentSourceGuard extends StatelessWidget {
  final String targetParliamentId;
  final Widget child;

  const ParliamentSourceGuard({
    super.key,
    required this.targetParliamentId,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final manager = context.watch<ParliamentManager>();
    if (!manager.isReady) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (manager.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (manager.activeServiceId == targetParliamentId) {
      return child;
    }
    Future.microtask(() {
      if (manager.activeServiceId != targetParliamentId && !manager.isLoading) {
         manager.changeSource(targetParliamentId);
      }
    });
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Loading...", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'services/parliament_manager.dart';
import 'services/firebase_auth.dart';
import 'providers/language_provider.dart';
import 'services/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'screens/force_update_screen.dart';
import 'services/remote_config_service.dart';
import 'services/parliament_service_interface.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'widgets/mobile_app_banner_wrapper.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kIsWeb) return;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  developer.log("Obsługa powiadomienia w tle: ${message.messageId}", name: "FirebaseMessaging");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await precacheSvgAssets();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.appAttest,
    // androidProvider: AndroidProvider.debug, // Opcje debug
    // appleProvider: AppleProvider.debug,     
    webProvider: ReCaptchaV3Provider('6Ld0ERYsAAAAAIJwDVGZPZaApFpmBUj0iunVizlr'),
  );

  if (!kIsWeb) {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      developer.log('Wykryto otwarcie powiadomienia z aplikacji w tle: ${message.data}', name: 'Notifications');
      _handleNotificationNavigation(message.data);
    });

    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        developer.log('Aplikacja uruchomiona z powiadomienia: ${message.data}', name: 'Notifications');
        _handleNotificationNavigation(message.data);
      }
    });
  }
  final remoteConfigService = await RemoteConfigService.create();
  
  runApp(
		MultiProvider(
			providers: [
				Provider<AuthService>(
					create: (_) => AuthService(FirebaseAuth.instance),
				),
				StreamProvider<User?>(
					create: (context) => context.read<AuthService>().authStateChanges,
					initialData: null,
				),
				ChangeNotifierProvider(create: (context) => ParliamentManager()),
				ChangeNotifierProvider(create: (context) => LanguageProvider()),
        Provider<RemoteConfigService>.value(value: remoteConfigService),
        ChangeNotifierProxyProvider<ParliamentManager, ParliamentServiceInterface>(
          create: (context) => context.read<ParliamentManager>().activeService,
          update: (context, manager, previousService) => manager.activeService,
        ),
			],
      child: Builder(
        builder: (context) {
          return MyApp(
            languageProvider: context.watch<LanguageProvider>(),
          );
        }
      ),
		),
	);
}

void _handleNotificationNavigation(Map<String, dynamic> data) {
  final String? filterTimestamp = data['filterTimestamp'];
  final String? parliamentId = data['parliamentId'];

  if (filterTimestamp != null && parliamentId != null) {
    router.push(
      '/$parliamentId/legislations/in-process',
      extra: {
        'filterFromTimestamp': filterTimestamp,
        'parliamentId': parliamentId,
      },
    );
    developer.log("Nawigacja do /legislations/in-process z extra: {parliamentId: $parliamentId}", name: "Notifications");
  }
}

class MyApp extends StatelessWidget {
  final LanguageProvider languageProvider;

  const MyApp({
    super.key,
    required this.languageProvider,
  });

	@override
	Widget build(BuildContext context) {
    final remoteConfigService = context.watch<RemoteConfigService>();
    if (!kIsWeb && remoteConfigService.isUpdateRequired()) {
      return MaterialApp(
        locale: Provider.of<LanguageProvider>(context).appLocale,
        supportedLocales: LanguageProvider.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const ForceUpdateScreen(),
        debugShowCheckedModeBanner: false,
      );
    }
		return MaterialApp.router(
      routerConfig: router,
			locale: Provider.of<LanguageProvider>(context).appLocale,
			supportedLocales: LanguageProvider.supportedLocales,
			title: 'Lustra',
			localizationsDelegates: const [
				AppLocalizations.delegate,
				GlobalMaterialLocalizations.delegate,
				GlobalWidgetsLocalizations.delegate,
				GlobalCupertinoLocalizations.delegate,
			],
			debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MobileAppBannerWrapper(
          child: child ?? const SizedBox.shrink(),
        );
      },
			theme: ThemeData(
				primarySwatch: Colors.blue,
				primaryColor: const Color(0xFF1565C0),
				scaffoldBackgroundColor: const Color(0xFFF5F5F5),
				visualDensity: VisualDensity.adaptivePlatformDensity,
				appBarTheme: const AppBarTheme(
					elevation: 0,
				),
				cardTheme: CardTheme(
					shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(8),
					),
				),
			),
		);
	}
}

final List<String> _svgAssetsToPrecache = [
  'assets/logo_full.svg',
];

Future<void> precacheSvgAssets() async {
  for (final String assetPath in _svgAssetsToPrecache) {
    await svg.cache.putIfAbsent(
      SvgAssetLoader(assetPath).cacheKey(null),
      () => SvgAssetLoader(assetPath).loadBytes(null),
    );
  }
}
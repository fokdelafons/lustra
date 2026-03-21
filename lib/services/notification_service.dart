import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../providers/user_provider.dart';
import '../services/tracking_service.dart';
import '../models/parliament_source.dart';
import 'parliament_manager.dart';
import 'app_router.dart';

class NotificationService {
  static final NotificationService instance = NotificationService._internal();
  NotificationService._internal();
  Map<String, dynamic>? _pendingNotificationData;

  Future<void> init() async {
    if (kIsWeb) return;
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      developer.log('Zapisano powiadomienie z Zimnego Startu: ${initialMessage.data}', name: 'NotificationService');
      _pendingNotificationData = initialMessage.data;
    }
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      developer.log('Otwarto powiadomienie z tła: ${message.data}', name: 'NotificationService');
      final context = router.routerDelegate.navigatorKey.currentContext;
      if (context != null && context.mounted) {
        _handleNavigation(context, message.data);
      }
    });
  }

  void consumePendingNotification(BuildContext context) {
    if (_pendingNotificationData != null) {
      developer.log('Konsumpcja powiadomienia z Zimnego Startu...', name: 'NotificationService');
      final dataToProcess = Map<String, dynamic>.from(_pendingNotificationData!);
      _pendingNotificationData = null; 
      _handleNavigation(context, dataToProcess);
    }
  }

Future<void> syncPermissionsWithBackend(UserProvider userProvider) async {
    if (kIsWeb) return; 
    if (userProvider.notificationsTrackedBills == true) {
      developer.log('TARCZA: Weryfikacja uprawnień OS względem stanu z bazy...', name: 'NotificationService');

      final messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.getNotificationSettings();

      if (settings.authorizationStatus == AuthorizationStatus.notDetermined) {
        developer.log('TARCZA: Nowe urządzenie. Pytam system o uprawnienia.', name: 'NotificationService');
        settings = await messaging.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );
      }

      if (settings.authorizationStatus == AuthorizationStatus.authorized || 
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        try {
          final token = await messaging.getToken();
          if (token != null) {
            developer.log('TARCZA: Uprawnienia przyznane. Aktualizuję token FCM.', name: 'NotificationService');
            await userProvider.updatePreferences(fcmToken: token);
          }
        } catch (e) {
          developer.log('TARCZA ERROR: Błąd pobierania tokena FCM: $e', name: 'NotificationService');
        }
      } else {
        developer.log('TARCZA: Odmowa na poziomie OS. Wymuszam synchronizację profilu (wyłączam).', name: 'NotificationService');
        await userProvider.updatePreferences(notificationsTrackedBills: false);
      }
    }
  }

  void _handleNavigation(BuildContext context, Map<String, dynamic> data) {
    final lang = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    if (data['type'] == 'tracked_updates') {
      final parliamentId = data['parliamentId'];
      if (parliamentId != null) {
        final slug = ParliamentSource.getSlugById(parliamentId);
        final currentTerm = Provider.of<ParliamentManager>(context, listen: false).currentTerm;
        final trackingService = TrackingService();
        trackingService.getTrackedItems(parliamentId, lang, forceRefresh: true).then((_) {
            final location = '/$lang/$slug/$currentTerm/legislations?list=tracked';
            developer.log("Nawigacja do obserwowanych: $location", name: "NotificationService");
            router.push(location, extra: {'parliamentId': parliamentId});
        });
        return; 
      }
    }
    final String? filterTimestamp = data['filterTimestamp'];
    final String? parliamentId = data['parliamentId'];
    final String? termStr = data['term'];

    if (filterTimestamp != null && parliamentId != null) {
      final pManager = Provider.of<ParliamentManager>(context, listen: false);
      final lang = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
      
      int? term;
      if (termStr != null) {
        term = int.tryParse(termStr);
      } else if (pManager.activeServiceId == parliamentId) {
        term = pManager.currentTerm;
      }
      
      if (term == null) {
        developer.log("Błąd: Brak parametru 'term' dla $parliamentId", name: "NotificationService");
        return;
      }
      
      final slug = ParliamentSource.getSlugById(parliamentId);
      final location = '/$lang/$slug/$term/legislations?list=process';
      
      developer.log("Nawigacja do: $location", name: "NotificationService");
      
      router.push(
        location,
        extra: {
          'filterFromTimestamp': filterTimestamp,
          'parliamentId': parliamentId,
        },
      );
    }
  }
}
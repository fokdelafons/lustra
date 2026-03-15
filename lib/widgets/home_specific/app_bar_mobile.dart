import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:developer' as developer;

import '../../providers/language_provider.dart';
import '../../providers/user_provider.dart';
import '../../services/parliament_manager.dart';
import '../../services/parliament_service_interface.dart';
import '../../models/parliament_source.dart';
import '../../services/firebase_auth.dart';
import '../../services/app_router.dart';

class MobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<MobileAppBar> createState() => _MobileAppBarState();
}

class _MobileAppBarState extends State<MobileAppBar> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> _handleNotificationsToggle(bool isEnabled) async {
    final authService = context.read<AuthService>();
    final parliamentManager = context.read<ParliamentManager>();
    final userProvider = context.read<UserProvider>();
    final parliamentId = parliamentManager.activeServiceId;

    if (authService.currentUser == null || parliamentId == null) return;

    // Pobierz obecną listę i zaktualizuj ją
    List<String> updatedList = List.from(userProvider.subscribedParliaments);
    if (isEnabled && !updatedList.contains(parliamentId)) {
      updatedList.add(parliamentId);
    } else if (!isEnabled) {
      updatedList.remove(parliamentId);
    }

    // Natychmiastowy update w RAM
    userProvider.updatePreferences(subscribedParliaments: updatedList);

    if (isEnabled) {
      NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true, badge: true, sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        String? fcmToken = await _firebaseMessaging.getToken();
        if (fcmToken != null) {
          await userProvider.updatePreferences(subscribedParliaments: updatedList, fcmToken: fcmToken);
          developer.log('Powiadomienia włączone dla $parliamentId.', name: 'Notifications');
        }
      } else {
        // Użytkownik odmówił – cofamy zmianę w RAM
        updatedList.remove(parliamentId);
        userProvider.updatePreferences(subscribedParliaments: updatedList);
        developer.log('Odmowa powiadomień.', name: 'Notifications');
      }
    } else {
      // Wyłączono dla tego kraju
      await userProvider.updatePreferences(subscribedParliaments: updatedList);
      developer.log('Powiadomienia wyłączone dla $parliamentId.', name: 'Notifications');
    }
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final languageProvider =
            Provider.of<LanguageProvider>(context, listen: false);
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(l10n.dialogChooseLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: LanguageProvider.supportedLocales.map((locale) {
              return ListTile(
                title:
                    Text(LanguageProvider.getLanguageName(locale.languageCode)),
                onTap: () {
                  languageProvider.changeLanguage(locale);
                  Navigator.of(dialogContext).pop();
                },
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
                child: Text(l10n.dialogCancel),
                onPressed: () => Navigator.of(dialogContext).pop()),
          ],
        );
      },
    );
  }

  Future<String?> _showPasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final l10n = AppLocalizations.of(context)!;
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.dialogReauthenticateTitle),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: l10n.passwordLabel),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(l10n.dialogCancel),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(l10n.dialogConfirm),
              onPressed: () => Navigator.of(context).pop(passwordController.text),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> _showFinalConfirmationDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.dialogDeleteAccountTitle),
          content: Text(l10n.dialogDeleteAccountContent),
          actions: <Widget>[
            TextButton(
              child: Text(l10n.dialogCancel),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text(l10n.dialogDelete),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      title: Center(
        child: Consumer<ParliamentManager>(
          builder: (context, manager, child) {
            return Consumer<ParliamentServiceInterface>(
              builder: (context, activeService, child) {
                return PopupMenuButton<String>(
                  enabled: activeService.availableTerms.isNotEmpty,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Text(
                          activeService.availableTerms.isNotEmpty
                              ? l10n
                                  .termLabel(activeService.currentTerm.toString())
                              : activeService.name,
                          key: ValueKey<String>(
                              activeService.availableTerms.isNotEmpty
                                  ? activeService.currentTerm.toString()
                                  : activeService.name),
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                      ),
                      if (activeService.availableTerms.isNotEmpty)
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                  onSelected: (String value) {
                    int? newTerm = int.tryParse(value);
                    if (newTerm != null) {
                      context
                          .read<ParliamentServiceInterface>()
                          .changeTerm(newTerm);
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    final Map<int, String> durations = activeService.termDurations;
                    return activeService.availableTerms.map((int term) {
                      final String termYears = durations[term] ?? "";
                      return PopupMenuItem<String>(
                        value: term.toString(),
                        child: Text(l10n.termMenuItem(term, termYears)),
                      );
                    }).toList();
                  },
                );
              },
            );
          },
        ),
      ),
      leadingWidth: 80,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Consumer<ParliamentManager>(
            builder: (context, manager, child) {
              if (!manager.isInitialized) return const SizedBox.shrink();
              return PopupMenuButton<String>(
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      manager.activeService.source.flagIconAsset,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
                onSelected: (String sourceId) async {
                  manager.changeSource(sourceId);
                },
                itemBuilder: (BuildContext context) {
                  return ParliamentSource.availableSources
                      .map((ParliamentSource source) {
                    final bool isFullyEnabled =
                        source.id == 'pl' || source.id == 'us';

                    return PopupMenuItem<String>(
                      value: source.id,
                      enabled: true,
                      child: Row(
                        children: [
                          Opacity(
                            opacity: isFullyEnabled ? 1.0 : 0.5,
                            child: SvgPicture.asset(
                              source.flagIconAsset,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            source.name,
                            style: TextStyle(
                              color: isFullyEnabled ? null : Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
              );
            },
          ),
        ),
      ),
      actions: [
        Consumer<User?>(
          builder: (context, user, child) {
            if (user != null) {
              return PopupMenuButton<String>(
                onSelected: (String value) async {
                  final authService = context.read<AuthService>();
                  switch (value) {
                    case 'language':
                      _showLanguageDialog(context);
                      break;
                    case 'logout':
                      authService.signOut();
                      break;
                    case 'delete_account':
                      bool proceed = false;
                      final isEmailUser = user.providerData
                          .any((p) => p.providerId == 'password');

                      if (isEmailUser) {
                        final password = await _showPasswordDialog(context);
                        if (!context.mounted) return;
                        if (password != null && password.isNotEmpty) {
                          final reauthenticated =
                              await authService.reauthenticateUser(password);
                          if (!context.mounted) return;
                          if (reauthenticated) {
                            proceed = true;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(l10n.authErrorInvalidCredentials)),
                            );
                          }
                        }
                      } else {
                        proceed = true;
                      }
                      if (!context.mounted) return;
                      if (proceed) {
                        final deleteConfirmed =
                            await _showFinalConfirmationDialog(context);
                        if (!context.mounted) return;
                        if (deleteConfirmed == true) {
                          try {
                            await authService.deleteAccount();
                            await authService.signOut();
                          } catch (e) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.errorDeleteAccount)),
                            );
                          }
                        }
                      }
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'language',
                    child: Row(
                      children: [
                        Icon(Icons.language, size: 20, color: Colors.grey[700]),
                        const SizedBox(width: 12),
                        Text(l10n.settingsChangeLanguage),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'notifications_new_laws',
                    child: Consumer<UserProvider>(
                      builder: (context, userProvider, _) {
                        final currentParliamentId = context.watch<ParliamentManager>().activeServiceId;
                        if (currentParliamentId == null) return const SizedBox.shrink();
                        
                        final isSubscribed = userProvider.isParliamentSubscribed(currentParliamentId);

                        return Row(
                          children: [
                            Icon(Icons.notifications_active_outlined, size: 20, color: Colors.grey[700]),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(l10n.settingsNotificationsNewLaws, style: const TextStyle(fontSize: 14)),
                            ),
                            Checkbox(
                              value: isSubscribed,
                              onChanged: (bool? value) => _handleNotificationsToggle(value ?? false),
                              activeColor: Theme.of(context).primaryColor,
                              visualDensity: VisualDensity.compact,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  PopupMenuItem<String>(
                    enabled: true,
                    value: 'marketing_consent',
                    child: Consumer<UserProvider>(
                      builder: (context, userProvider, _) {
                        return Row(
                          children: [
                            Icon(Icons.favorite_outline, size: 20, color: Colors.grey[700]),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(AppLocalizations.of(context)!.lustraClubLabel, style: const TextStyle(fontSize: 14)),
                            ),
                            Checkbox(
                              value: userProvider.marketingConsent,
                              onChanged: (bool? value) async {
                                if (value == null) return;
                                userProvider.updatePreferences(marketing: value);
                                final authService = context.read<AuthService>();
                                try {
                                  await authService.updateUserNotificationPrefs({'marketingConsent': value});
                                } catch (e) {
                                  developer.log('Błąd zapisu zgody: $e');
                                }
                              },
                              activeColor: Theme.of(context).primaryColor,
                              visualDensity: VisualDensity.compact,
                            ),
                          ],
                        );
                      }
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.logout, size: 20, color: Colors.grey[700]),
                        const SizedBox(width: 12),
                        Text(l10n.settingsLogout),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete_account',
                    child: Row(
                      children: [
                        const Icon(Icons.delete_forever, size: 20, color: Colors.red),
                        const SizedBox(width: 12),
                        Text(l10n.settingsDeleteAccount, style: const TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  const PopupMenuDivider(), // TYLKO JEDEN SEPARATOR NA DOLE
                  PopupMenuItem<String>(
                    enabled: false,
                    value: 'version',
                    height: 30,
                    child: FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Center(
                            child: Text(
                              'v${snapshot.data!.version} (Build ${snapshot.data!.buildNumber})',
                              style: TextStyle(fontSize: 11, color: Colors.grey[400], letterSpacing: 0.5),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.settings, color: Colors.white),
                ),
              );
            } else {
              return TextButton(
                onPressed: () => context.smartNavigate('/login'),
                child: Text(l10n.loginAction,
                    style: const TextStyle(color: Colors.white, fontSize: 15)),
              );
            }
          },
        ),
      ],
    );
  }
}
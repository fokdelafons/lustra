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
import '../../services/curated_list_service.dart';
import '../../services/cache/parliament_cache_manager.dart';

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
    List<String> updatedList = List.from(userProvider.subscribedParliaments);
    if (isEnabled && !updatedList.contains(parliamentId)) {
      updatedList.add(parliamentId);
    } else if (!isEnabled) {
      updatedList.remove(parliamentId);
    }

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
        updatedList.remove(parliamentId);
        userProvider.updatePreferences(subscribedParliaments: updatedList);
        developer.log('Odmowa powiadomień.', name: 'Notifications');
      }
    } else {
      await userProvider.updatePreferences(subscribedParliaments: updatedList);
      developer.log('Powiadomienia wyłączone dla $parliamentId.', name: 'Notifications');
    }
  }

  Future<void> _handleTrackedNotificationsToggle(bool isEnabled) async {
    final userProvider = context.read<UserProvider>();
    userProvider.updatePreferences(notificationsTrackedBills: isEnabled);

    if (isEnabled) {
      NotificationSettings settings = await _firebaseMessaging.requestPermission(alert: true, badge: true, sound: true);
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        String? fcmToken = await _firebaseMessaging.getToken();
        if (fcmToken != null) {
          await userProvider.updatePreferences(notificationsTrackedBills: true, fcmToken: fcmToken);
        }
      } else {
        userProvider.updatePreferences(notificationsTrackedBills: false);
      }
    } else {
      await userProvider.updatePreferences(notificationsTrackedBills: false);
    }
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
        final currentLangCode = context.watch<LanguageProvider>().appLanguageCode;
        final l10n = AppLocalizations.of(context)!;
        
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.dialogChooseLanguage, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ...LanguageProvider.supportedLocales.map((locale) {
                  final isSelected = locale.languageCode == currentLangCode;
                  return InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      languageProvider.changeLanguage(locale);
                      Navigator.of(dialogContext).pop();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      margin: const EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        color: isSelected ? Theme.of(context).primaryColor.withAlpha(13) : Colors.grey[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected ? Theme.of(context).primaryColor : Colors.grey[200]!,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LanguageProvider.getLanguageName(locale.languageCode),
                            style: TextStyle(
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected ? Theme.of(context).primaryColor : Colors.grey[800],
                            ),
                          ),
                          if (isSelected)
                            Icon(Icons.check_circle, color: Theme.of(context).primaryColor, size: 20),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: Text(l10n.dialogCancel, style: const TextStyle(color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
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

  Future<void> _handleDeleteAccount(BuildContext context, User user) async {
    final authService = context.read<AuthService>();
    final l10n = AppLocalizations.of(context)!;
    bool proceed = false;
    
    final isEmailUser = user.providerData.any((p) => p.providerId == 'password');
    if (isEmailUser) {
      final password = await _showPasswordDialog(context);
      if (!context.mounted) return;
      if (password != null && password.isNotEmpty) {
        final reauthenticated = await authService.reauthenticateUser(password);
        if (!context.mounted) return;
        if (reauthenticated) {
          proceed = true;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.authErrorInvalidCredentials)));
        }
      }
    } else {
      proceed = true;
    }

    if (!context.mounted) return;
    if (proceed) {
      final deleteConfirmed = await _showFinalConfirmationDialog(context);
      if (!context.mounted) return;
      if (deleteConfirmed == true) {
        try {
          await authService.deleteAccount();
          await authService.signOut();
        } catch (e) {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.errorDeleteAccount)));
        }
      }
    }
  }

  void _showCreateListModal() {
    final TextEditingController nameController = TextEditingController();
    
    void submitForm(BuildContext dialogCtx) async {
      final text = nameController.text.trim();
      if (text.isEmpty) return;
      
      final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
      final userProv = context.read<UserProvider>();
      
      Navigator.of(dialogCtx).pop(); 
      
      try {
        await CuratedListService().createList(text, prefix);
        await ParliamentCacheManager(prefix).clearMyCuratedLists(); 
        
        if (!mounted) return;
        await userProv.refreshProfile();
        userProv.triggerCuratedListsRebuild(); 
        
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("List '$text' created!")));
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed to create list.")));
      }
    }

    showDialog(
      context: context, 
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent, 
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name your Tracking List", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  maxLength: 40,
                  textCapitalization: TextCapitalization.words,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => submitForm(ctx),
                  decoration: InputDecoration(
                    hintText: "e.g. Tax The Billionaires", 
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text(AppLocalizations.of(context)!.actionCancel, style: const TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        elevation: 0,
                      ),
                      onPressed: () => submitForm(ctx),
                      child: const Text("Create"),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }
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
                tooltip: l10n.settingsTitle,
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
                onSelected: (String value) {
                  if (value == 'language') _showLanguageDialog(context);
                },
                itemBuilder: (BuildContext context) {
                  final userProv = context.read<UserProvider>();
                  final prefix = context.read<ParliamentManager>().activeServiceId ?? 'us';
                  
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      enabled: false,
                      value: 'primary_parliament',
                      child: Row(
                        children: [
                          Icon(Icons.account_balance, size: 20, color: Colors.grey[400]),
                          const SizedBox(width: 12),
                          Text("Primary: ${userProv.primaryParliamentId ?? 'Unknown'}", style: TextStyle(color: Colors.grey[600], fontSize: 13, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const PopupMenuDivider(),

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
                    const PopupMenuDivider(),

                    PopupMenuItem<String>(
                      enabled: true,
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
                      value: 'notifications_tracked_bills',
                      child: Consumer<UserProvider>(
                        builder: (context, userProvider, _) {
                          return Row(
                            children: [
                              Icon(Icons.notifications_active_outlined, size: 20, color: Colors.grey[700]),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(l10n.trackedBillsTitle, style: const TextStyle(fontSize: 14)),
                              ),
                              Checkbox(
                                value: userProvider.notificationsTrackedBills,
                                onChanged: (bool? value) => _handleTrackedNotificationsToggle(value ?? false),
                                activeColor: Theme.of(context).primaryColor,
                                visualDensity: VisualDensity.compact,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const PopupMenuDivider(),

                    PopupMenuItem<String>(
                      enabled: true,
                      value: 'marketing_consent',
                      child: Row(
                        children: [
                          Icon(Icons.favorite_outline, size: 20, color: Colors.grey[700]),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(AppLocalizations.of(context)!.lustraClubLabel, style: const TextStyle(fontSize: 14)),
                          ),
                          Checkbox(
                            value: userProv.marketingConsent,
                            onChanged: (bool? value) async {
                              if (value == null) return;
                              userProv.updatePreferences(marketing: value);
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
                      ),
                    ),
                    const PopupMenuDivider(),

                    PopupMenuItem<String>(
                      enabled: false,
                      padding: EdgeInsets.zero,
                      child: FutureBuilder<List<Map<String, dynamic>>>(
                        future: CuratedListService().getMyLists(prefix),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24.0),
                              child: Center(
                                child: SizedBox(
                                  width: 20, height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                ),
                              ),
                            );
                          }

                          final allLists = snapshot.data ?? [];
                          final currentPrefix = context.read<ParliamentManager>().activeServiceId;
                          final lists = allLists.where((l) => (l['prefix'] ?? 'us') == currentPrefix).toList();
                          
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(l10n.yourListsForCountry(context.read<ParliamentManager>().activeService.source.name), style: TextStyle(fontSize: 12, color: Colors.grey[500], fontWeight: FontWeight.bold)),
                                    Text("${allLists.length}/3", style: TextStyle(fontSize: 12, color: Colors.grey[500], fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              if (lists.isNotEmpty) ...[
                                ...lists.map((listData) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      final manager = context.read<ParliamentManager>();
                                      final lang = context.read<LanguageProvider>().appLanguageCode;
                                      final slug = manager.activeSlug;
                                      final term = manager.currentTerm ?? 0;
                                      final listId = listData['id'];
                                      context.smartNavigate('/$lang/$slug/$term/legislations?list=curated&listId=$listId'); 
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.list_alt, size: 20, color: Colors.grey[700]),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(listData['listName'] ?? 'Unnamed', style: const TextStyle(fontSize: 14)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ],
                              if (userProv.createdLists.length < 3)
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    _showCreateListModal();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.add_circle_outline, size: 20, color: Theme.of(context).primaryColor),
                                        const SizedBox(width: 12),
                                        Text(lists.isNotEmpty ? "Create Another List" : "Create Tracking List", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          );
                        }
                      ),
                    ),
                    const PopupMenuDivider(),

                    PopupMenuItem<String>(
                      enabled: false,
                      padding: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                context.read<AuthService>().signOut();
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.logout, size: 20, color: Colors.grey[800]),
                                  const SizedBox(width: 8),
                                  Text(l10n.settingsLogout, style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                Navigator.of(context).pop();
                                _handleDeleteAccount(context, user);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.delete_forever, size: 20, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const PopupMenuDivider(),
                    
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
                  ];
                },
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:developer' as developer;

import '../../providers/language_provider.dart';
import '../../providers/user_provider.dart';
import '../../services/parliament_manager.dart';
import '../../services/parliament_service_interface.dart';
import '../../models/parliament_source.dart';
import '../../services/firebase_auth.dart';
import '../../services/app_router.dart';

class WebAppBar extends StatefulWidget implements PreferredSizeWidget {
  const WebAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  State<WebAppBar> createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {
  void _onItemTapped(int index) {
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
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/info')) return 1;
    if (location.startsWith('/support')) return 2;
    if (location.startsWith('/future')) return 3;
    return 0;
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

  Widget _buildWebNavItem(String label, int index, IconData icon) {
    final isSelected = _calculateSelectedIndex(context) == index;
    final color = isSelected ? Theme.of(context).primaryColor : Colors.grey[700];
    return InkWell(
      onTap: () => _onItemTapped(index),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 6),
            Text(label,
                style: TextStyle(
                    color: color,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Text("Lustra",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
            const SizedBox(width: 40),
            _buildWebNavItem(l10n.bottomNavHome, 0, Icons.home),
            _buildWebNavItem(l10n.bottomNavInfo, 1, Icons.info_outline),
            _buildWebNavItem(l10n.bottomNavSupport, 2, Icons.favorite_outline),
            _buildWebNavItem(
                l10n.bottomNavFutureFeatures, 3, Icons.lightbulb_outline),
          ],
        ),
      ),
      actions: [
        // 1. WYBÓR KADENCJI
        Consumer<ParliamentServiceInterface>(
          builder: (context, activeService, child) {
            if (activeService.availableTerms.isEmpty) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PopupMenuButton<String>(
                tooltip: l10n.termLabel(""),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text(
                        l10n.termLabel(activeService.currentTerm.toString()),
                        style: TextStyle(
                            color: Colors.grey[800], fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_drop_down, color: Colors.grey[800]),
                    ],
                  ),
                ),
                onSelected: (String value) {
                  int? newTerm = int.tryParse(value);
                  if (newTerm != null) {
                    context.read<ParliamentServiceInterface>().changeTerm(newTerm);
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
              ),
            );
          },
        ),
        // 2. WYBÓR KRAJU
        Consumer<ParliamentManager>(
          builder: (context, manager, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PopupMenuButton<String>(
                tooltip: l10n.selectYourParliament,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        manager.activeService.source.flagIconAsset,
                        width: 28,
                        height: 20,
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    ],
                  ),
                ),
                onSelected: (String sourceId) {
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
              ),
            );
          },
        ),
        // 3. PROFIL
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 8.0),
          child: Consumer<User?>(
            builder: (context, user, child) {
              if (user != null) {
                return PopupMenuButton<String>(
                  tooltip: l10n.settingsTitle,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(
                      user.email != null && user.email!.isNotEmpty
                          ? user.email![0].toUpperCase()
                          : 'U',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
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
                                    content: Text(
                                        l10n.authErrorInvalidCredentials)),
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
                                SnackBar(
                                    content: Text(l10n.errorDeleteAccount)),
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
                      child: Text(l10n.settingsChangeLanguage),
                    ),
                    PopupMenuItem<String>(
                      enabled: true,
                      value: 'marketing_consent',
                      child: Consumer<UserProvider>(
                          builder: (context, userProvider, _) {
                        return SwitchListTile(
                          title: Text(AppLocalizations.of(context)!.lustraClubLabel,
                              style: const TextStyle(fontSize: 14)),
                          value: userProvider.marketingConsent,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (bool value) async {
                            // Aktualizacja lokalna w Providerze
                            userProvider.updatePreferences(marketing: value);

                            // Zapis do bazy
                            final authService = context.read<AuthService>();
                            try {
                              await authService.updateUserNotificationPrefs(
                                  {'marketingConsent': value});
                            } catch (e) {
                              developer.log('Błąd zapisu zgody: $e');
                            }
                          },
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                        );
                      }),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete_account',
                      child: Text(l10n.settingsDeleteAccount,
                          style: TextStyle(color: Colors.red)),
                    ),
                    PopupMenuItem<String>(
                      value: 'logout',
                      child: Text(l10n.settingsLogout),
                    ),
                  ],
                );
              } else {
                return TextButton(
                  onPressed: () => context.smartNavigate('/login'),
                  child: Text(l10n.loginAction,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
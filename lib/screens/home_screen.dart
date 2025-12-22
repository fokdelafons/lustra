import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';
import '../models/parliament_source.dart';
import '../services/parliament_manager.dart';
import '../services/firebase_auth.dart';
import '../models/home_screen_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../providers/language_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/parliament_service_interface.dart';
import 'dart:developer' as developer;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;
import '../services/share_service.dart';
import '../widgets/shareable_image_widget.dart';
import '../widgets/citizen_poll_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import '../services/app_router.dart';
import 'package:go_router/go_router.dart';
import '../widgets/civic_project_card.dart';


class ParliamentaryVotePainter extends CustomPainter {
  final int votesFor;
  final int votesAgainst;
  final int votesAbstain;
  final String labelFor;
  final String labelAgainst;
  final String labelAbstain;
  final Color forColor;
  final String noDataLabel;
  final Color noDataColor;
  final Color againstColor;
  final Color abstainColor;

  ParliamentaryVotePainter({
    required this.votesFor,
    required this.votesAgainst,
    required this.votesAbstain,
    required this.labelFor,
    required this.labelAgainst,
    required this.labelAbstain,
    required this.noDataLabel,
    this.forColor = Colors.green,
    this.againstColor = Colors.red,
    this.abstainColor = Colors.grey,
    this.noDataColor = const Color.fromRGBO(189, 189, 189, 0.4),
  });

  @override
  void paint(Canvas canvas, Size size) {
    const int fixedTotalDots = 117; // Stała liczba kropek do wyświetlenia
    final double spacingFraction = 0.15; // Odstęp między kropkami

    final int actualTotalVotes = votesFor + votesAgainst + votesAbstain;
    if (fixedTotalDots == 0) return;
    
    final List<Color> dotColors;

    if (actualTotalVotes > 0) {
    double pFor = votesFor / actualTotalVotes;
    double pAgainst = votesAgainst / actualTotalVotes;
    double pAbstain = votesAbstain / actualTotalVotes;

    int numDotsFor = (pFor * fixedTotalDots).floor();
    int numDotsAgainst = (pAgainst * fixedTotalDots).floor();
    int numDotsAbstain = (pAbstain * fixedTotalDots).floor();

    int currentTotalRoundedDots = numDotsFor + numDotsAgainst + numDotsAbstain;
    int remainderDots = fixedTotalDots - currentTotalRoundedDots;

    List<MapEntry<int, double>> fractionalParts = [
      MapEntry(0, pFor * fixedTotalDots - numDotsFor),
      MapEntry(1, pAgainst * fixedTotalDots - numDotsAgainst),
      MapEntry(2, pAbstain * fixedTotalDots - numDotsAbstain),
    ];
    fractionalParts.sort((a, b) => b.value.compareTo(a.value));

    for (int k = 0; k < remainderDots; k++) {
      int categoryIndex = fractionalParts[k].key;
      if (categoryIndex == 0) {
        numDotsFor++;
      } else if (categoryIndex == 1) {
        numDotsAgainst++;
      } else {
        numDotsAbstain++;
      }
    }

      final calculatedColors = <Color>[];
      for (int i = 0; i < numDotsFor; i++) {
        calculatedColors.add(forColor);
        }
      for (int i = 0; i < numDotsAgainst; i++) {
        calculatedColors.add(againstColor);
        }
      for (int i = 0; i < numDotsAbstain; i++) {
        calculatedColors.add(abstainColor);
        }
      dotColors = calculatedColors;

    } else {
      dotColors = List.generate(fixedTotalDots, (_) => noDataColor);
    }

    final double chartCenterX = size.width / 2;
    final double chartFocalY = size.height;
    final double chartOuterRadius = min(chartCenterX, chartFocalY);
    final double chartInnerRadiusRatio = 0.35;
    final double chartInnerRadius = chartOuterRadius * chartInnerRadiusRatio;

    if (chartOuterRadius <= chartInnerRadius) return;

    final double annulusArea = (pi / 2.0) * (pow(chartOuterRadius, 2) - pow(chartInnerRadius, 2));
    if (annulusArea <= 0) return;

    const double maxAllowableDotDiameter = 20.0;
    const double minAllowableDotDiameter = 1.0; // Minimalna średnica kropki (da promień 0.5px)

    double currentEstimatedDotDiameter;
    double initialDotDiameterEstimate = sqrt(annulusArea / fixedTotalDots) / (1 + spacingFraction);
    if (initialDotDiameterEstimate.isNaN || initialDotDiameterEstimate.isInfinite || initialDotDiameterEstimate <= 0) {
        initialDotDiameterEstimate = 4.0; // Domyślna wartość, jeśli obliczenia zawiodą
    }
    currentEstimatedDotDiameter = initialDotDiameterEstimate.clamp(minAllowableDotDiameter, maxAllowableDotDiameter);

    double dotRadius = 0;
    double interDotSpacing = 0;
    int numRows = 0;

    int loopGuard = 0;
    while (loopGuard < 20) {
      dotRadius = currentEstimatedDotDiameter / 2.0;
      if (dotRadius < 0.5 && fixedTotalDots > 0) {
          if (loopGuard > 0) break;
          return;
      }

      interDotSpacing = currentEstimatedDotDiameter * spacingFraction;
      final double tempRowHeight = currentEstimatedDotDiameter + interDotSpacing;
      if (tempRowHeight <= 0) return;

      numRows = max(1, ((chartOuterRadius - chartInnerRadius) / tempRowHeight).floor());
      
      int totalAvailableSlots = 0;
      for (int i = 0; i < numRows; i++) {
        final currentRowNominalRadius = chartInnerRadius + (i * tempRowHeight) + (tempRowHeight / 2);
        final int maxDotsInThisRow = (pi * currentRowNominalRadius / (currentEstimatedDotDiameter + interDotSpacing)).floor();
        totalAvailableSlots += maxDotsInThisRow;
      }

      if (totalAvailableSlots >= fixedTotalDots || currentEstimatedDotDiameter <= minAllowableDotDiameter) {
        break;
      }

      currentEstimatedDotDiameter = max(minAllowableDotDiameter, currentEstimatedDotDiameter * 0.95);
      loopGuard++;
    }
    
    if (dotRadius < 0.5 && fixedTotalDots > 0) return;
    final double rowHeight = currentEstimatedDotDiameter + interDotSpacing;

    final paint = Paint()..style = PaintingStyle.fill;
    int dotsDrawnCount = 0;

    for (int i = 0; i < numRows; i++) {
      if (dotsDrawnCount >= fixedTotalDots) break;

      final currentRowNominalRadius = chartInnerRadius + (i * rowHeight) + (rowHeight / 2);
      final int maxDotsInThisRow = (pi * currentRowNominalRadius / (currentEstimatedDotDiameter + interDotSpacing)).floor();

      if (maxDotsInThisRow == 0) continue;

      final double angleStep = pi / maxDotsInThisRow;

      for (int j = 0; j < maxDotsInThisRow; j++) {
        if (dotsDrawnCount >= fixedTotalDots) break;

        final double angle = pi - (j * angleStep) - (angleStep / 2); 
        final double dotX = chartCenterX + currentRowNominalRadius * cos(angle);
        final double dotY = chartFocalY - currentRowNominalRadius * sin(angle); 

        if (dotY < -dotRadius || dotY > size.height + dotRadius || dotX < -dotRadius || dotX > size.width + dotRadius) {
            continue;
        }

        paint.color = dotColors[dotsDrawnCount];
        canvas.drawCircle(Offset(dotX, dotY), dotRadius, paint);
        dotsDrawnCount++;
      }
    }

    if (actualTotalVotes > 0) {
      double forP = (votesFor / actualTotalVotes) * 100;
      double againstP = (votesAgainst / actualTotalVotes) * 100;
      double abstainP = (votesAbstain / actualTotalVotes) * 100;
// ignore: unused_local_variable
      String largestLabel = '';
      double largestPercent = 0;
      Color largestColor = Colors.black;
      if (forP >= againstP && forP >= abstainP) {
        largestLabel = labelFor; largestPercent = forP; largestColor = forColor;
      } else if (againstP >= forP && againstP >= abstainP) {
        largestLabel = labelAgainst; largestPercent = againstP; largestColor = againstColor;
      } else {
        largestLabel = labelAbstain; largestPercent = abstainP; largestColor = abstainColor;
      }

      final textSpan = TextSpan(
        text: '${largestPercent.toStringAsFixed(0)}%',
        style: TextStyle(
            color: largestColor, 
            fontSize: chartInnerRadius * 0.5,
            fontWeight: FontWeight.bold
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(minWidth: 0, maxWidth: chartInnerRadius * 1.5);

      final double textX = chartCenterX - textPainter.width / 2;
      final double textY = (chartFocalY - chartInnerRadius / 2) - (textPainter.height / 2);
      canvas.drawRRect(RRect.fromLTRBR(textX - 6, textY - 3, textX + textPainter.width + 6, textY + textPainter.height + 3, Radius.circular(chartInnerRadius * 0.1)), Paint()..color = Colors.white.withAlpha((255 * 0.05).round())..maskFilter = MaskFilter.blur(BlurStyle.normal, 2.0));
      textPainter.paint(canvas, Offset(textX, textY));
    } else {
        final textSpan = TextSpan(
          text: noDataLabel,
          style: TextStyle(
              color: Colors.grey[700], 
              fontSize: (chartInnerRadius * 0.4).clamp(12.0, 16.0),
              fontWeight: FontWeight.bold
          ),
        );
        final textPainter = TextPainter(
          text: textSpan,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(minWidth: 0, maxWidth: size.width * 0.7);
        final double textX = chartCenterX - textPainter.width / 2;
        final double textY = (chartFocalY - chartOuterRadius / 2) - (textPainter.height / 2);
        textPainter.paint(canvas, Offset(textX, textY));
    }
  }

  @override
  bool shouldRepaint(ParliamentaryVotePainter oldDelegate) {
    return oldDelegate.votesFor != votesFor ||
        oldDelegate.votesAgainst != votesAgainst ||
        oldDelegate.votesAbstain != votesAbstain ||
        oldDelegate.noDataLabel != noDataLabel ||
        oldDelegate.forColor != forColor ||
        oldDelegate.againstColor != againstColor ||
        oldDelegate.abstainColor != abstainColor;
  }
}

class NewHomeScreen extends StatefulWidget {
  final Widget child; // <--- To będzie zawartość (Home, Info, Support)
  
  const NewHomeScreen({super.key, required this.child});

  @override
  NewHomeScreenState createState() => NewHomeScreenState();
}

class NewHomeScreenState extends State<NewHomeScreen> {

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkUserProfileAndHandleIfNeeded();
    });
  }

  Future<void> _checkUserProfileAndHandleIfNeeded() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    if (authService.currentUser == null) return;
    final bool hasProfile = await authService.hasCompletedProfile();
    if (!mounted) return;
    if (!hasProfile) {
      await authService.signOut();
    }
  }
  
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(l10n.dialogChooseLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: LanguageProvider.supportedLocales.map((locale) {
              return ListTile(
                title: Text(LanguageProvider.getLanguageName(locale.languageCode)),
                onTap: () {
                  languageProvider.changeLanguage(locale);
                  Navigator.of(dialogContext).pop();
                },
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(child: Text(l10n.dialogCancel), onPressed: () => Navigator.of(dialogContext).pop()),
          ],
        );
      },
    );
  }

int _calculateSelectedIndex(BuildContext context) {
    // Pobieramy aktualny URL z routera
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/info')) return 1;
    if (location.startsWith('/support')) return 2;
    if (location.startsWith('/future')) return 3;
    return 0; // Domyślnie Home
  }

@override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final manager = Provider.of<ParliamentManager>(context);
    
    // Responsywność
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

    // Obliczamy aktywny indeks na podstawie URL
    final int currentIndex = _calculateSelectedIndex(context);

    return ChangeNotifierProvider.value(
      value: manager.activeService,
      // Usunęliśmy PopScope, bo Router teraz zarządza historią "wstecz"
      child: Scaffold(
          // --- PASEK NA WEBIE ---
          appBar: useWideLayout ? AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            titleSpacing: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text("Lustra", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 24)),
                  const SizedBox(width: 40),
                  _buildWebNavItem(l10n.bottomNavHome, 0, Icons.home),
                  _buildWebNavItem(l10n.bottomNavInfo, 1, Icons.info_outline),
                  _buildWebNavItem(l10n.bottomNavSupport, 2, Icons.favorite_outline),
                  _buildWebNavItem(l10n.bottomNavFutureFeatures, 3, Icons.lightbulb_outline),
                ],
              ),
            ),
            actions: [
              // 1. WYBÓR KADENCJI
              Consumer<ParliamentServiceInterface>(
                builder: (context, activeService, child) {
                  if (activeService.availableTerms.isEmpty) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: PopupMenuButton<String>(
                      tooltip: l10n.termLabel(""),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Text(
                              l10n.termLabel(activeService.currentTerm.toString()),
                              style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w500),
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
                        return ParliamentSource.availableSources.map((ParliamentSource source) {
                          final bool isFullyEnabled = source.id == 'pl' || source.id == 'us';
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
                             user.email != null && user.email!.isNotEmpty ? user.email![0].toUpperCase() : 'U',
                             style: const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        onSelected: (String value) async {
                          final authService = context.read<AuthService>();
                          switch (value) {
                            case 'language': _showLanguageDialog(context); break;
                            case 'logout': authService.signOut(); break;
                            case 'delete_account': 
                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Aby usunąć konto, użyj aplikacji mobilnej.")));
                               break;
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'language',
                            child: Text(l10n.settingsChangeLanguage),
                          ),
                          PopupMenuItem<String>(
                            value: 'delete_account',
                            child: Text(l10n.settingsDeleteAccount, style: TextStyle(color: Colors.red)),
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
                        child: Text(l10n.loginAction, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                      );
                    }
                  },
                ),
              ),
            ],
          ) : null,

          // BODY: Wyświetlamy to, co każe router (widget.child)
          body: useWideLayout 
            ? widget.child
            : GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: widget.child,
              ),

          // BOTTOM BAR
          bottomNavigationBar: useWideLayout ? null : BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: const Icon(Icons.home), label: l10n.bottomNavHome),
              BottomNavigationBarItem(icon: const Icon(Icons.info_outline), label: l10n.bottomNavInfo),
              BottomNavigationBarItem(icon: const Icon(Icons.favorite_outline), label: l10n.bottomNavSupport),
              BottomNavigationBarItem(icon: const Icon(Icons.lightbulb_outline), label: l10n.bottomNavFutureFeatures),
            ],
            // Tutaj używamy obliczonego indeksu
            currentIndex: currentIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
          ),
        ),
    );
  }

Widget _buildWebNavItem(String label, int index, IconData icon) {
    // Obliczamy czy jest aktywny na podstawie URL, a nie zmiennej
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
            Text(label, style: TextStyle(color: color, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
          ],
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
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _notificationsEnabled = false;
  String? _subscribedParliamentId;
  final ShareService _shareService = ShareService();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _searchWidgetKey = GlobalKey();
  bool _isSearchExpanded = false;
  bool _isInitialScrollPerformed = false;
  HomeScreenData? _data;
  bool _isLoading = true;
  Object? _error;

  String _formatDateTime(BuildContext context, DateTime? date) {
    final l10n = AppLocalizations.of(context)!;
    if (date == null) return l10n.noDate;
    return intl.DateFormat.yMMMMd(l10n.localeName).format(date);
  }

  final List<Map<String, dynamic>> deputiesData = [];

  ParliamentServiceInterface? _activeService;
  int? _currentTerm;
  String? _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    final initialService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    _activeService = initialService;
    _currentTerm = initialService.currentTerm;
    _currentLanguageCode = Provider.of<LanguageProvider>(context, listen: false).appLanguageCode;
    _loadHomeScreenData();
    _loadNotificationPreference();
    _searchFocusNode.addListener(_onSearchFocusChange);
  }

  Future<void> _loadNotificationPreference() async {
    final parliamentId = context.read<ParliamentManager>().activeServiceId;
    if (parliamentId == null) return;

    final prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    final key = 'notifications_enabled_$parliamentId';
    final subscribedId = prefs.getString('subscribed_parliament_id');
    
    setState(() {
      _notificationsEnabled = prefs.getBool(key) ?? false;
      _subscribedParliamentId = subscribedId;
    });
  }

  Future<void> _handleNotificationsToggle(bool isEnabled) async {
    final authService = context.read<AuthService>();
    final parliamentManager = context.read<ParliamentManager>();
    final parliamentId = parliamentManager.activeServiceId;
    final prefs = await SharedPreferences.getInstance();

    if (authService.currentUser == null || parliamentId == null) return;

    final key = 'notifications_enabled_$parliamentId';
    await prefs.setBool(key, isEnabled);

    if (isEnabled) {
      await prefs.setString('subscribed_parliament_id', parliamentId);
    } else {
      await prefs.remove('subscribed_parliament_id');
    }
    
    if (!mounted) return;
    setState(() {
      _notificationsEnabled = isEnabled;
      _subscribedParliamentId = isEnabled ? parliamentId : null;
    });

    if (isEnabled) {
      NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true, badge: true, sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        String? fcmToken = await _firebaseMessaging.getToken();
        if (fcmToken != null) {
          await authService.updateUserNotificationPrefs({
            'notificationsEnabled': true,
            'fcmToken': fcmToken,
            'notificationParliamentId': parliamentId,
          });
          developer.log('Powiadomienia włączone. Token zapisany dla $parliamentId.', name: 'Notifications');
        }
      } else {
        await prefs.setBool(key, false);
        await prefs.remove('subscribed_parliament_id');
        if (!mounted) return;
        setState(() {
          _notificationsEnabled = false;
          _subscribedParliamentId = null;
        });
        developer.log('Użytkownik nie wyraził zgody na powiadomienia.', name: 'Notifications');
      }
    } else {
      await authService.updateUserNotificationPrefs({
        'notificationsEnabled': false,
        'fcmToken': null,
      });
      developer.log('Powiadomienia wyłączone dla $parliamentId.', name: 'Notifications');
    }
  }

  void _onSearchFocusChange() {
    setState(() {
      _isSearchExpanded = _searchFocusNode.hasFocus;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newActiveService = Provider.of<ParliamentServiceInterface>(context);
    final newTerm = newActiveService.currentTerm;
    final newLanguageCode = context.watch<LanguageProvider>().appLanguageCode;
    if (_activeService != newActiveService || _currentTerm != newTerm || _currentLanguageCode != newLanguageCode) {
      _activeService = newActiveService;
      _currentTerm = newTerm;
      _currentLanguageCode = newLanguageCode;
      _loadNotificationPreference();
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
    _searchFocusNode.removeListener(_onSearchFocusChange);
    _searchFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildSearchWidget(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                hintText: l10n.homeSearchHint,
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                isDense: true,
                fillColor: Colors.grey[200],
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 350),
                opacity: (kIsWeb || _isSearchExpanded) ? 1.0 : 0.0,
                child: !(kIsWeb || _isSearchExpanded)
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.people_outline, size: 18),
                                label: Text(l10n.homeSearchButtonDeputies),
                                onPressed: () {
                                  if (_searchController.text.trim().isEmpty) return;
                                  FocusScope.of(context).unfocus();
                                  final pid = context.read<ParliamentManager>().activeServiceId;
                                  context.smartNavigate('/$pid/members', extra: {'searchQuery': _searchController.text.trim()});
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.gavel_outlined, size: 18),
                                label: Text(l10n.homeSearchButtonLegislations),
                                onPressed: () {
                                  if (_searchController.text.trim().isEmpty) return;
                                  FocusScope.of(context).unfocus();
                                  final pid = context.read<ParliamentManager>().activeServiceId;
                                  context.smartNavigate('/$pid/legislations?list=process', extra: {'searchQuery': _searchController.text.trim()});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Jeśli NewHomeScreen używa szerokiego layoutu, ten AppBar jest ukryty.
    // Jeśli jest wąsko (nawet na Web), pokazujemy ten AppBar.
    final bool useWideLayout = kIsWeb && MediaQuery.of(context).size.width > 1140;
    
    return Scaffold(
      appBar: useWideLayout ? null : AppBar(
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
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Text(
                          activeService.availableTerms.isNotEmpty
                              ? l10n.termLabel(activeService.currentTerm.toString())
                              : activeService.name,
                          key: ValueKey<String>(
                            activeService.availableTerms.isNotEmpty
                                ? activeService.currentTerm.toString()
                                : activeService.name
                          ),
                          style: const TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      if (activeService.availableTerms.isNotEmpty)
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
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
                );
                },
              );
            },
          ),
        ),
        leadingWidth: 80,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Consumer<User?>(
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(l10n.authErrorInvalidCredentials)),
                              );
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
                      child: Text(l10n.settingsChangeLanguage),
                    ),
                    PopupMenuItem<String>(
                      value: 'notifications_new_laws',
                      child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          final currentParliamentId = context.watch<ParliamentManager>().activeServiceId;
                          final isAnotherParliamentSubscribed = _subscribedParliamentId != null && _subscribedParliamentId != currentParliamentId;
                          final bool isSwitchEnabled = !isAnotherParliamentSubscribed;
                          return SwitchListTile(
                            title: Text(l10n.settingsNotificationsNewLaws),
                            subtitle: isAnotherParliamentSubscribed
                                ? Text(
                                    l10n.notificationsEnabledForOtherParliament,
                                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                  )
                                : null,
                            value: _notificationsEnabled,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: isSwitchEnabled
                                ? (bool value) {
                                    setState(() {});
                                    _handleNotificationsToggle(value);
                                  }
                                : null,
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                          );
                        },
                      ),
                    ),
                    PopupMenuItem<String>(
                      enabled: false,
                      value: 'notifications_vote_results',
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(l10n.settingsNotificationsVoteResults),
                          ),
                          const SizedBox(width: 16),
                          Icon(Icons.check_box_outline_blank, color: Theme.of(context).disabledColor),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete_account',
                      child: Text(
                        l10n.settingsDeleteAccount,
                        style: TextStyle(color: Theme.of(context).colorScheme.error),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'logout',
                      child: Text(l10n.settingsLogout),
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
                  child: Text(l10n.loginAction, style: const TextStyle(color: Colors.white, fontSize: 15)),
                );
              }
            },
          ),
        ),
        actions: [
          Consumer<ParliamentManager>(
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
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
                onSelected: (String sourceId) async {
                  manager.changeSource(sourceId);
                },
// start of greyed out parliaments
                itemBuilder: (BuildContext context) {
                  return ParliamentSource.availableSources.map((ParliamentSource source) {
                    final bool isFullyEnabled = source.id == 'pl' || source.id == 'us';

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
                // itemBuilder: (BuildContext context) {
                //   return ParliamentSource.availableSources.map((ParliamentSource source) {
                //     return PopupMenuItem<String>(
                //       value: source.id,
                //       child: Row(
                //         children: [
                //           SvgPicture.asset(
                //             source.flagIconAsset,
                //             width: 24,
                //             height: 24,
                //           ),
                //           const SizedBox(width: 8),
                //           Text(source.name),
                //         ],
                //       ),
                //     );
                //   }).toList();
                // },
              );
            },
          ),
        ],
      ),
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
    
    // Jeśli ładujemy, pokaż wskaźnik
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    
    // Gdy dane są gotowe, pokaż listę
    return _buildContentList(context);
  }

Widget _buildContentList(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final homeData = _data;
    final pid = context.read<ParliamentManager>().activeServiceId;

    if (homeData == null) {
      return const SizedBox.shrink();
    }

    List<Widget> sectionWidgets = [];
    // Sekcja 0: Popularne głosowania
    if (homeData.popularVoted != null && homeData.popularVoted!.id.isNotEmpty) {
      sectionWidgets.add(buildClassicStyleCard(
        context, l10n.sectionPopularVotes, buildVotingContent(context, true, homeData.popularVoted),
        Icons.how_to_vote, '/$pid/legislations?list=voted', l10n.actionSeeAll,
        legislationItem: homeData.popularVoted,
      ));
    }
    // Sekcja 1: Rozpatrywane wkrótce
    if (homeData.upcomingVote != null && homeData.upcomingVote!.id.isNotEmpty) {
      sectionWidgets.add(buildClassicStyleCard(
        context, l10n.sectionUpcoming, buildVotingContent(context, false, homeData.upcomingVote),
        Icons.upcoming, '/$pid/legislations?list=upcoming', l10n.actionSeeAll,
        legislationItem: homeData.upcomingVote,
      ));
    }
    // Sekcja 2: Legislacja w procesie
    if (homeData.popularInProcess != null && homeData.popularInProcess!.id.isNotEmpty) {
      sectionWidgets.add(buildClassicStyleCard(
        context, l10n.sectionLegislationInProcess, buildLegislationContent(context, homeData.popularInProcess),
        Icons.gavel, '/$pid/legislations?list=process', l10n.actionSeeAll,
        legislationItem: homeData.popularInProcess,
      ));
    }
        // --- NOWA SEKCJA ---
    if (homeData.civicProject != null) {
      sectionWidgets.add(CivicProjectCard(
        project: homeData.civicProject!,
        // Tytuł i przycisk możesz sparametryzować lub zostawić domyślne z Widgetu
      ));
    }
    // Sekcja 3: Profile poselskie
    if (homeData.topDeputies != null && homeData.topDeputies!.deputies.isNotEmpty) {
      sectionWidgets.add(buildRoundedShadowCard(
        context, l10n.sectionMpProfiles, buildDeputiesListContent(context, homeData.topDeputies!.deputies, _buildSingleDeputyItem),
        Icons.people_outline, '/$pid/members', l10n.buttonAllMps,
      ));
    }
    if (sectionWidgets.isEmpty) {
      // Pusta lista też musi być wycentrowana na webie
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
          // Na Webie dajemy większy padding góra/dół
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

extension HomeContentStateHelpers on HomeContentState {
Widget buildClassicStyleCard(BuildContext context, String title, Widget content,
    IconData icon, String destinationPath, String buttonText, {HomeScreenLegislationItem? legislationItem}) {
    final l10n = AppLocalizations.of(context)!;
    final primaryColor = Theme.of(context).primaryColor;

    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(
                    kIsWeb ? 24.0 : MediaQuery.of(context).size.width * 0.04
                  ),
                  child: Row(
                    children: [
                      Icon(icon, color: primaryColor),
                      SizedBox(width: kIsWeb ? 12.0 : MediaQuery.of(context).size.width * 0.02),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, thickness: 1),
                content,
                // Usunęliśmy stąd poziomą linię Divider
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Przycisk SZCZEGÓŁY
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (legislationItem != null) {
                              final parliamentId = context.read<ParliamentManager>().activeServiceId;
                              context.smartNavigate('/$parliamentId/legislations/${legislationItem.id}', extra: legislationItem);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.article_outlined, size: 18, color: primaryColor), // Kolor NIEBIESKI
                                const SizedBox(width: 8),
                                Text(
                                  l10n.detailsButton,
                                  style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 14), // Kolor NIEBIESKI
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Przywrócony PIONOWY SEPARATOR
                      Container(height: 24, width: 1, color: Colors.grey[200]),
                      // Przycisk UDOSTĘPNIJ
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (legislationItem == null) return;
                            final shareService = _shareService;
                            final parliamentId = context.read<ParliamentManager>().activeServiceId;
                            final activeService = context.read<ParliamentServiceInterface>();
                            final status = activeService.translateStatus(context, legislationItem.status);
                            showModalBottomSheet(
                              context: context,
                              builder: (bottomSheetContext) {
                                return SafeArea(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        leading: const Icon(Icons.crop_square),
                                        title: Text(l10n.shareAsPost),
                                        onTap: () {
                                          Navigator.of(bottomSheetContext).pop();
                                          shareService.shareLegislation(
                                            context: context, legislation: legislationItem, imageSize: const Size(1080, 1080),
                                            l10n: l10n, translatedStatus: status, parliamentId: parliamentId!,
                                            flagAssetPath: activeService.flagAssetPath, parliamentName: activeService.name,
                                            votingTitle: l10n.votingResultsTitle,
                                          );
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.phone_android),
                                        title: Text(l10n.shareAsStory),
                                        onTap: () {
                                          Navigator.of(bottomSheetContext).pop();
                                          shareService.shareLegislation(
                                            context: context, legislation: legislationItem, imageSize: const Size(1080, 1920),
                                            l10n: l10n, translatedStatus: status, parliamentId: parliamentId!,
                                            flagAssetPath: activeService.flagAssetPath, parliamentName: activeService.name,
                                            votingTitle: l10n.votingResultsTitle,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.share, size: 18, color: primaryColor), // Kolor NIEBIESKI
                                const SizedBox(width: 8),
                                Text(
                                  l10n.shareAction,
                                  style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 14), // Kolor NIEBIESKI
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: primaryColor.withAlpha((255 * 0.05).round()),
            child: InkWell(
              onTap: () {
                context.smartNavigate(destinationPath);
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        buttonText,
                        style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward, size: 16, color: primaryColor),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRoundedShadowCard(BuildContext context, String title, Widget content,
      IconData icon, String destinationPath, String buttonText
      ) {
        
    final primaryColor = Theme.of(context).primaryColor;
    final cardColor = Colors.white;
    final shadowColor = Colors.black.withAlpha((0.08 * 255).round());
    final lightPrimaryColor = primaryColor.withAlpha((255 * 0.1).round());
    final lighterPrimaryColor = primaryColor.withAlpha((255 * 0.05).round());

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
        boxShadow: [
          BoxShadow(color: shadowColor, blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(
              kIsWeb ? 24.0 : MediaQuery.of(context).size.width * 0.04
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(kIsWeb ? 12.0 : MediaQuery.of(context).size.width * 0.025),
                  decoration: BoxDecoration(
                    color: lightPrimaryColor,
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.03)
                  ),
                  child: Icon(icon, color: primaryColor, size: 24),
                ),
                SizedBox(width: kIsWeb ? 16.0 : MediaQuery.of(context).size.width * 0.03),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          content,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.smartNavigate(destinationPath);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: lighterPrimaryColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width * 0.04), bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0.04)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            buttonText,
                            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 16, color: primaryColor),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildVotingContent(
    BuildContext context,
    bool isRecent,
    HomeScreenLegislationItem? legislationData,
  ) {
    final l10n = AppLocalizations.of(context)!;
    final activeService = Provider.of<ParliamentServiceInterface>(context, listen: false);
    final int votesForSejm = legislationData?.votesFor ?? 0; 
    final int votesAgainstSejm = legislationData?.votesAgainst ?? 0; 
    final int votesAbstainSejm = legislationData?.votesAbstain ?? 0; 
    final List<String> keyPoints = legislationData?.keyPoints ?? [];    
    final int totalSejmVotes = votesForSejm + votesAgainstSejm + votesAbstainSejm;
    final DateTime? votingDateTime = legislationData?.votingDate; 
    final DateTime? firstUpcomingDate = legislationData?.upcomingProceedingDates?.isNotEmpty == true
        ? legislationData!.upcomingProceedingDates!.first 
        : null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            legislationData?.title ?? (isRecent ? l10n.errorNoDataLastVote : l10n.errorNoDataUpcomingVote),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            legislationData?.summary ?? (isRecent ? l10n.errorNoSummaryLastVote : l10n.errorNoSummaryUpcomingVote),
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
          ),
          const SizedBox(height: 16),
          PartiallyExpandableListWidget(
            title: keyPoints.isNotEmpty ? l10n.keyPoints : l10n.noKeyPoints,
            items: keyPoints,
            // Na Webie pokazujemy wszystko (do 20 punktów), na mobile zwijamy po 2
            initiallyVisibleCount: kIsWeb ? 20 : 2,
            itemBuilder: (context, item) => bulletPoint(context, item as String),
          ),
          const SizedBox(height: 16),
          if (isRecent) ...[
            Center(
              child: Text(
                l10n.votingResultsTitle,
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold, 
                ),
              ),
            ),
            if (votingDateTime != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                child: Center(
                  child: Text(
                    _formatDateTime(context, votingDateTime),
                    style: TextStyle(fontSize: 13, color: Colors.grey[700], fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            
            RepaintBoundary(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double chartFullWidth = max(150.0, constraints.maxWidth);
                  final double calculatedHeightBasedOnWidth = chartFullWidth / 2;
                  final double chartHeight = calculatedHeightBasedOnWidth.clamp(120.0, 220.0);
                  return SizedBox( 
                      width: chartFullWidth,
                      height: chartHeight, 
                      child: CustomPaint(
                        painter: ParliamentaryVotePainter(
                          labelFor: l10n.votingFor,
                          labelAgainst: l10n.votingAgainst,
                          labelAbstain: l10n.votingAbstainShort,
                          noDataLabel: l10n.errorNoVotingsDetails,
                          votesFor: votesForSejm,
                          votesAgainst: votesAgainstSejm,
                          votesAbstain: votesAbstainSejm,
                        ),
                      ),
                  );
                }, 
              ),
            ),
            if (totalSejmVotes > 0) ...[
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildVoteCountRow(l10n.labelFor, votesForSejm, Colors.green),
                  _buildVoteCountRow(l10n.labelAgainst, votesAgainstSejm, Colors.red),
                  _buildVoteCountRow(l10n.labelAbstained, votesAbstainSejm, Colors.grey),
                ],
              ),
            ],
            const SizedBox(height: 12.0),
            Center(
              child: Text(
                activeService.translateStatus(context, legislationData?.status),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87, 
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ] else ... [
             Text(
                firstUpcomingDate != null ? l10n.scheduledMeetingDate(_formatDateTime(context, firstUpcomingDate)) : l10n.noScheduledMeetingDate,
                style: TextStyle(fontSize: 13, color: Colors.grey[600], fontStyle: FontStyle.italic),
             ),
             const SizedBox(height: 20),
          ],
          CitizenPollWidget(
            targetType: 'legislation',
            targetId: legislationData?.id ?? 'unknown',
            itemData: legislationData,
          ),
        ],
      ),
    );
  }

  Widget _buildVoteCountRow(String label, int count, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
        ),
        const SizedBox(width: 6),
        Text(
          count.toString(),
          style: TextStyle(fontSize: 15, color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSingleDeputyItem(BuildContext context, HomeScreenDeputy deputyData) {
    final l10n = AppLocalizations.of(context)!;
    final String deputyName = deputyData.fullName;
    final String deputyInfo = '${deputyData.club} • ${deputyData.district}';
    final String imageUrl = deputyData.imageUrl;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 80,
                    height: 100,
                    color: Colors.grey[200],
                    child: const Center(child: Icon(Icons.person_outline, color: Colors.grey, size: 30)),
                  ),
                  errorWidget: (context, url, error) => Container(
                      width: 80,
                      height: 100,
                      color: Colors.grey[300],
                    child: const Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(deputyName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(deputyInfo, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        final parliamentId = context.read<ParliamentManager>().activeServiceId;
                        final homeDeputy = deputyData; 
                        context.smartNavigate('/$parliamentId/members/${homeDeputy.deputyId}', extra: homeDeputy);
                      },
                      icon: const Icon(Icons.person_search, size: 16),
                      label: Text(l10n.buttonCheckProfile),
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 13),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLegislationContent(
    BuildContext context,
    HomeScreenLegislationItem? legislationData,
  ) {
    final l10n = AppLocalizations.of(context)!;
    final List<String> keyPoints = legislationData?.keyPoints ?? [];
    final DateTime? processStartDate = legislationData?.processStartDate;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            legislationData?.title ?? l10n.errorNoDataLegislationInProcess,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 8),
          Text(
            legislationData?.summary ?? l10n.errorNoSummaryLegislationInProcess,
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                processStartDate != null ? l10n.processStartDate(_formatDateTime(context, processStartDate)) : l10n.noProcessStartDate,
                style: TextStyle(fontSize: 14, color: Colors.grey[600])
              ),
            ],
          ),
          const SizedBox(height: 12),
          PartiallyExpandableListWidget(
            title: keyPoints.isNotEmpty ? l10n.keyPoints : l10n.noKeyPoints,
            items: keyPoints,
            // Na Webie pokazujemy wszystko (do 20 punktów), na mobile zwijamy po 2
            initiallyVisibleCount: kIsWeb ? 20 : 2,
            itemBuilder: (context, item) => bulletPoint(context, item as String),
          ),
          const SizedBox(height: 20),
          CitizenPollWidget(
            targetType: 'legislation',
            targetId: legislationData?.id ?? 'unknown',
            itemData: legislationData,
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(l10n.dialogChooseLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: LanguageProvider.supportedLocales.map((locale) {
              return ListTile(
                title: Text(LanguageProvider.getLanguageName(locale.languageCode)),
                onTap: () {
                  languageProvider.changeLanguage(locale);
                  Navigator.of(dialogContext).pop();
                },
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(child: Text(l10n.dialogCancel), onPressed: () => Navigator.of(dialogContext).pop()),
          ],
        );
      },
    );
  }
}

class PartiallyExpandableListWidget extends StatefulWidget {
  final String title;
  final List<dynamic> items;
  final int initiallyVisibleCount;
  final Widget Function(BuildContext, dynamic) itemBuilder;

  const PartiallyExpandableListWidget({
    super.key,
    required this.title,
    required this.items,
    required this.initiallyVisibleCount,
    required this.itemBuilder,
  });

  @override
  PartiallyExpandableListWidgetState createState() =>
      PartiallyExpandableListWidgetState();
}

class PartiallyExpandableListWidgetState extends State<PartiallyExpandableListWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool canExpand = widget.items.length > widget.initiallyVisibleCount;
    final List<dynamic> visibleItems = _isExpanded
        ? widget.items
        : widget.items.take(widget.initiallyVisibleCount).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: visibleItems.length,
          itemBuilder: (context, index) => widget.itemBuilder(context, visibleItems[index]),
        ),
        if (canExpand)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _isExpanded ? AppLocalizations.of(context)!.actionCollapse : AppLocalizations.of(context)!.actionExpand,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

Widget bulletPoint(BuildContext context, String text) {
  const double bulletSize = 5.0;
  return Padding(
    padding: const EdgeInsets.only(bottom: 6.0, left: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6, right: 8.0),
          width: bulletSize,
          height: bulletSize,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[800], height: 1.3),
          ),
        ),
      ],
    ),
  );
}

Widget buildDeputiesListContent(
  BuildContext context,
  List<HomeScreenDeputy> deputies,
  Widget Function(BuildContext, HomeScreenDeputy) itemBuilder,
) {
  final l10n = AppLocalizations.of(context)!;
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Column(
      children: deputies.isEmpty
          ? [ Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Center(child: Text(l10n.errorNoDeputiesData))) ]
          : deputies.asMap().entries.map((entry) {
              int index = entry.key;
              HomeScreenDeputy deputyData = entry.value;
              return Column(
                children: [
                  itemBuilder(context, deputyData),
                  if (index < deputies.length - 1)
                    const Divider(height: 24, indent: 16, endIndent: 16),
                ],
              );
            }).toList(),
    ),
  );
}


class SharePreviewScreen extends StatefulWidget {
  final HomeScreenLegislationItem legislation;

  const SharePreviewScreen({
    super.key,
    required this.legislation,
  });

  @override
  State<SharePreviewScreen> createState() => _SharePreviewScreenState();
}

class _SharePreviewScreenState extends State<SharePreviewScreen> {
  // Dostępne formaty, które chcemy testować.
  final Map<String, Size> _formats = {
    'Kwadrat (1:1)': const Size(1080, 1080),
    'Story (9:16)': const Size(1080, 1920),
  };
  late Size _currentSize; // Aktualnie wybrany rozmiar.

  @override
  void initState() {
    super.initState();
    // Zaczynamy od pierwszego formatu na liście (kwadrat).
    _currentSize = _formats.values.first;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Podgląd obrazka (${_currentSize.width.toInt()}x${_currentSize.height.toInt()})'),
        backgroundColor: Colors.black,
        // Dodajemy przyciski do zmiany formatu.
        actions: [
          PopupMenuButton<Size>(
            icon: const Icon(Icons.aspect_ratio),
            onSelected: (Size newSize) {
              // Gdy użytkownik wybierze nowy format, aktualizujemy stan.
              setState(() {
                _currentSize = newSize;
              });
            },
            itemBuilder: (context) {
              return _formats.entries.map((entry) {
                return PopupMenuItem<Size>(
                  value: entry.value,
                  child: Text(entry.key),
                );
              }).toList();
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[800],
body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FittedBox(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.noScaling,
              ),
              child: Builder(
                builder: (context) {
                  final activeService = context.read<ParliamentServiceInterface>();
                  return ShareableImage.legislation(
                    legislation: widget.legislation,
                    size: _currentSize,
                    l10n: l10n,
                    translatedStatus: activeService.translateStatus(context, widget.legislation.status),
                    flagAssetPath: activeService.flagAssetPath,
                    parliamentName: activeService.name,
                    votingTitle: l10n.votingResultsTitle,
                    parliamentId: activeService.source.id,
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<String?> _showPasswordDialog(BuildContext context) {
  final TextEditingController passwordController = TextEditingController();
  final l10n = AppLocalizations.of(context)!;
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(l10n.dialogReauthenticateTitle), // "Potwierdź swoją tożsamość"
        content: TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: l10n.passwordLabel),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(l10n.dialogCancel), // "Anuluj"
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(l10n.dialogConfirm), // "Potwierdź"
            onPressed: () => Navigator.of(context).pop(passwordController.text),
          ),
        ],
      );
    },
  );
}

// Funkcja pokazująca ostateczne potwierdzenie
Future<bool?> _showFinalConfirmationDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(l10n.dialogDeleteAccountTitle), // "Czy na pewno chcesz usunąć konto?"
        content: Text(l10n.dialogDeleteAccountContent), // "Tej operacji nie można cofnąć..."
        actions: <Widget>[
          TextButton(
            child: Text(l10n.dialogCancel),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(l10n.dialogDelete), // "Usuń"
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    },
  );
}
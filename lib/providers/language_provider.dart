import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class LanguageProvider with ChangeNotifier {
  Locale _appLocale = const Locale('en');

  static const List<Locale> supportedLocales = [
    Locale('pl'),
    Locale('en'),
    Locale('de'),
    Locale('fr'),
    Locale('pt'),
    Locale('es'),
    Locale('it'),
    Locale('nl'),
  ];

  static String getLanguageName(String code) {
    switch (code) {
      case 'pl':
        return 'Polski';
      case 'en':
        return 'English';
      case 'de':
        return 'Deutsch';
      case 'fr':
        return 'Français';
      case 'pt':
        return 'Português';
      case 'es':
        return 'Español';
      case 'it':
        return 'Italiano';
      case 'nl':
        return 'Nederlands';
      default:
        return code;
    }
  }

  Locale get appLocale => _appLocale;
  String get appLanguageCode => _appLocale.languageCode;

  LanguageProvider() {
    _initializeLocale();
  }

  Future<void> _initializeLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedLanguageCode = prefs.getString('language_code');
    if (savedLanguageCode != null && isSupported(Locale(savedLanguageCode))) {
      _appLocale = Locale(savedLanguageCode);
      notifyListeners();
      return;
    }
    final Locale systemLocale = ui.PlatformDispatcher.instance.locale;
    if (isSupported(systemLocale)) {
      _appLocale = systemLocale;
    } else {
      _appLocale = const Locale('en');
    }
    notifyListeners();
  }
  bool isSupported(Locale locale) {
    return supportedLocales.any((sl) => sl.languageCode == locale.languageCode);
  }

  Future<void> setLanguageByCode(String code) async {
    await changeLanguage(Locale(code));
  }

Future<void> changeLanguage(Locale newLocale) async {
    if (!isSupported(newLocale)) {
      return;
    }
    if (_appLocale == newLocale) return;
    _appLocale = newLocale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', newLocale.languageCode);
    notifyListeners();
  }
}
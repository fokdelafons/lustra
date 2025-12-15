import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;
import 'parliament_service_interface.dart';
import 'pl_parliament_service.dart';
import 'eu_parliament_service.dart';
import 'us_parliament_service.dart';
import 'uk_parliament_service.dart';
import 'fr_parliament_service.dart';
import 'de_parliament_service.dart';
import 'package:flutter/widgets.dart';

class ParliamentManager extends ChangeNotifier {
  static const String _lastSelectedSourceKey = 'last_selected_parliament_source_id';
  SharedPreferences? _prefs;
  int _changeSourceOperationId = 0;

  final Map<String, ParliamentServiceInterface Function()> _serviceFactories = {
    'pl': () => PLParliamentService(),
    'eu': () => EUParliamentService(),
    'us': () => USParliamentService(),
    'uk': () => UKParliamentService(),
    'de': () => DEParliamentService(),
    'fr': () => FRParliamentService(),
  };

  final Map<String, String> _languageToServiceMap = {
    'pl_PL': 'pl',
    'en_GB': 'uk',
    'en_US': 'us',
    'de_DE': 'de',
    'fr_FR': 'fr',
  };

  String? _activeServiceId;
  late ParliamentServiceInterface _activeService;

  bool _isLoading = false;
  bool _isReady = false;
  Object? _error;
  
  ParliamentServiceInterface get activeService => _activeService;
  String? get activeServiceId => _activeServiceId;
  
  List<ParliamentServiceInterface> get availableServices => _serviceFactories.values.map((factory) => factory()).toList();

  bool get isInitialized => _activeServiceId != null;
  bool get isLoading => _isLoading;
  bool get isReady => _isReady;
  Object? get error => _error;

  ParliamentManager() {
    _initialize();
  }

  Future<void> _initialize() async {
    _prefs = await SharedPreferences.getInstance();
    String? lastSelectedId = _prefs?.getString(_lastSelectedSourceKey);

    if (lastSelectedId != null && _serviceFactories.containsKey(lastSelectedId)) {
      _activeServiceId = lastSelectedId;
    } else {
      // Bezpieczne pobieranie locale (działa na Web i Mobile)
      final locale = WidgetsBinding.instance.platformDispatcher.locale;
      // Tworzymy string np. "pl_PL"
      String deviceLocale = '${locale.languageCode}_${locale.countryCode}';
      
      String? mappedServiceId = _languageToServiceMap[deviceLocale];
      if (mappedServiceId != null && _serviceFactories.containsKey(mappedServiceId)) {
        _activeServiceId = mappedServiceId;
      } else {
        _activeServiceId = _serviceFactories.keys.first;
      }
    }
    
    _activeService = _serviceFactories[_activeServiceId]!();
    developer.log('ParliamentManager zainicjalizowany wstępnie. Aktywny serwis: $_activeServiceId', name: 'ParliamentManager');
    
    notifyListeners();

    try {
      await _activeService.initialize();
    } catch (e) {
      _error = e;
    } finally {
      _isReady = true;
      notifyListeners();
    }
  }

  Future<void> changeSource(String newSourceId) async {
    final int operationId = ++_changeSourceOperationId;
    if (_activeServiceId == newSourceId || !_serviceFactories.containsKey(newSourceId)) return;
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      if (operationId != _changeSourceOperationId) return;
      _activeServiceId = newSourceId;
      _activeService = _serviceFactories[newSourceId]!();
      await _prefs?.setString(_lastSelectedSourceKey, newSourceId);
      if (operationId != _changeSourceOperationId) return;
      notifyListeners();
      await _activeService.initialize();
      if (operationId != _changeSourceOperationId) return;
      _error = null;
    } catch (e) {
      if (operationId == _changeSourceOperationId) {
        _error = e;
        developer.log('Błąd podczas zmiany źródła na $newSourceId: $e', name: 'ParliamentManager');
      } else {
        developer.log('Stłumiono błąd ze starej operacji zmiany źródła.', name: 'ParliamentManager');
      }
    } finally {
      if (operationId == _changeSourceOperationId) {
        _isLoading = false;
        notifyListeners();
      }
    }
  }
  void clearError() {
    if (_error != null) {
      _error = null;
      notifyListeners();
    }
  }
}
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:developer' as developer;

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;
  PackageInfo? _packageInfo;
  
  RemoteConfigService(this._remoteConfig);

  static Future<RemoteConfigService> create() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    final service = RemoteConfigService(remoteConfig);
    await service.initialize();
    return service;
  }

  Future<void> initialize() async {
    try {
      await _remoteConfig.setDefaults(const {
        'min_required_version_code': 1,
        'is_kickstarter_campaign_active': false,
        'kickstarter_campaign_url': '',
      });
      await _remoteConfig.fetchAndActivate();
      _packageInfo = await PackageInfo.fromPlatform();
      developer.log('Remote Config zainicjalizowany. Wymagany build: ${_remoteConfig.getInt('min_required_version_code')}', name: 'RemoteConfigService');
    } catch (e) {
      developer.log('Nie udało się zainicjalizować Remote Config: $e', name: 'RemoteConfigService');
      _packageInfo = await PackageInfo.fromPlatform();
    }
  }

  bool isUpdateRequired() {
    if (_packageInfo == null) {
      return false; 
    }
    final currentVersionCode = int.tryParse(_packageInfo!.buildNumber) ?? 0;
    final requiredVersionCode = _remoteConfig.getInt('min_required_version_code');
    
    developer.log('Wersja bieżąca: $currentVersionCode, Wersja wymagana: $requiredVersionCode', name: 'RemoteConfigService');
    return currentVersionCode < requiredVersionCode;
  }
  
  bool getBool(String key) {
    return _remoteConfig.getBool(key);
  }
  String getString(String key) {
    return _remoteConfig.getString(key);
  }
}
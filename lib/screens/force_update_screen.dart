import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({super.key});

  Future<void> _launchStore() async {
    String url;
    if (Platform.isAndroid) {
      // Zmień 'dev.lustra' na ID Twojej aplikacji w sklepie Play
      url = 'market://details?id=dev.lustra'; 
    } else if (Platform.isIOS) {
      // Zmień '123456789' na ID Twojej aplikacji w App Store
      url = 'itms-apps://itunes.apple.com/app/id123456789';
    } else {
      return;
    }
    
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Import 'package:flutter_gen/gen_l10n/app_localizations.dart'; if not present
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.system_update, size: 80, color: Colors.blue),
              const SizedBox(height: 24),
              Text(
                l10n.forceUpdateTitle,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.forceUpdateDescription,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _launchStore,
                child: Text(l10n.forceUpdateButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
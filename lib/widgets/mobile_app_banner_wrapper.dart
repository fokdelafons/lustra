import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileAppBannerWrapper extends StatefulWidget {
  final Widget child;
  const MobileAppBannerWrapper({super.key, required this.child});

  @override
  State<MobileAppBannerWrapper> createState() => _MobileAppBannerWrapperState();
}

class _MobileAppBannerWrapperState extends State<MobileAppBannerWrapper> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final showBanner = kIsWeb && defaultTargetPlatform == TargetPlatform.android;
    if (!showBanner || !_isVisible) {
      return widget.child;
    }

    return Column(
      children: [
        // BANER
        Container(
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              const Icon(Icons.phone_android, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.webBannerDownloadMessage,
                  style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
              
              // Przycisk Pobierz
              TextButton(
                onPressed: _launchStore,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(l10n.webBannerDownloadButton),
              ),
              
              const SizedBox(width: 8),

              // Zamknij (X)
              InkWell(
                onTap: () => setState(() => _isVisible = false),
                child: const Icon(Icons.close, color: Colors.white70, size: 20),
              ),
            ],
          ),
        ),
        
        // RESZTA APLIKACJI
        Expanded(child: widget.child),
      ],
    );
  }

  void _launchStore() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      launchUrlString("https://play.google.com/store/apps/details?id=dev.lustra"); 
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      launchUrlString("https://apps.apple.com/app/id6751850630"); 
    }
  }
}
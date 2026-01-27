import 'dart:developer' as developer;

import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/services.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import '../models/home_screen_data.dart';
import '../models/mp.dart'; 
import '../widgets/shareable_image_widget.dart';
import '../services/image_renderer.dart';

class ShareService {
  static const String _baseDeepLinkUrl = 'https://lustra.news';
  
  String _getParliamentHashtag(String parliamentId) {
    switch (parliamentId) {
      case 'pl': return '#SejmRP';
      case 'us': return '#USCongress';
      case 'uk': return '#UKParliament';
      case 'de': return '#Bundestag';
      case 'fr': return '#AssembleeNationale';
      case 'ue': return '#EUParliament';
      default: return '#Parliament';
    }
  }

  String _sanitizeHashtag(String text) {
     return '#${text.replaceAll(RegExp(r'[\s,\.\-]'), '')}';
  }

  // --- REMOTE CONFIG (Global Singleton) ---
  Future<String?> _getPromoText(AppLocalizations l10n) async {
    try {
      final rc = FirebaseRemoteConfig.instance;

      if (!rc.getBool('is_kickstarter_campaign_active')) return null;
      
      final url = rc.getString('kickstarter_campaign_url');
      if (url.isEmpty) return null;

      return '${l10n.crowdfundingLabel} $url'; 
    } catch (e) {
      developer.log('Błąd odczytu Remote Config w ShareService: $e');
      return null;
    }
  }

  Future<void> shareLegislation({
    required BuildContext context,
    required HomeScreenLegislationItem legislation,
    required Size imageSize,
    required AppLocalizations l10n,
    required String translatedStatus,
    required String parliamentId,
    required String slug,
    required String lang,
    required int term,
    required String flagAssetPath,
    required String parliamentName,
    required String votingTitle,
    bool showMissingDataWarning = false,
  }) async {
    try {
      final shareableWidget = ShareableImage.legislation(
        legislation: legislation,
        size: imageSize,
        l10n: l10n,
        translatedStatus: translatedStatus,
        flagAssetPath: flagAssetPath,
        parliamentName: parliamentName,
        votingTitle: votingTitle,
        parliamentId: parliamentId,
        showMissingDataWarning: showMissingDataWarning,
      );

      final imageBytes = await renderWidgetToImage(shareableWidget, imageSize);

      if (imageBytes != null) {
        final xFile = XFile.fromData(
          imageBytes,
          mimeType: 'image/png',
          name: 'bill.png',
        );

        final deepLink = '$_baseDeepLinkUrl/$lang/$slug/$term/legislations/${legislation.id}/';
        
        final countryTag = _getParliamentHashtag(parliamentId);
        final translatedLawHash = _sanitizeHashtag(l10n.hashtagLaw);
        final catTag = legislation.category != null && legislation.category!.isNotEmpty 
            ? _sanitizeHashtag(legislation.category!) 
            : translatedLawHash;

        final typeTag = catTag == translatedLawHash ? '' : ' $translatedLawHash';
        final hashtags = '$countryTag $catTag$typeTag #Lustra';

        final promo = await _getPromoText(l10n);

        final sb = StringBuffer();
        sb.write(l10n.shareLegislationText(deepLink));
        sb.write('\n\n$hashtags');
        if (promo != null) {
          sb.write('\n\n$promo');
        }
        
        final fullShareText = sb.toString();

        await Clipboard.setData(ClipboardData(text: fullShareText));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.clipboardCopySuccess)),
          );
        }

        await SharePlus.instance.share(ShareParams(files: [xFile], text: fullShareText));
      }
    } catch (e) {
      developer.log('Błąd podczas renderowania i udostępniania legislacji: $e');
    }
  }

  Future<void> shareDeputy({
    required BuildContext context,
    required MP deputy,
    required Size imageSize,
    required AppLocalizations l10n,
    required String tenureText,
    required List<ImportantVote> recentVotings,
    required String parliamentId,
    required String slug,
    required String lang,
    required int term,
    required String flagAssetPath,
    required String parliamentName
  }) async {
    try {
      final shareableWidget = ShareableImage.deputy(
        deputy: deputy,
        size: imageSize,
        l10n: l10n,
        tenureText: tenureText,
        recentVotings: recentVotings,
        flagAssetPath: flagAssetPath,
        parliamentName: parliamentName,
        parliamentId: parliamentId,
      );

      final imageBytes = await renderWidgetToImage(shareableWidget, imageSize);

      if (imageBytes != null) {
        final xFile = XFile.fromData(
          imageBytes,
          mimeType: 'image/png',
          name: 'politician.png',
        );

        final deepLink = '$_baseDeepLinkUrl/$lang/$slug/$term/members/${deputy.id}/';
        
        final countryTag = _getParliamentHashtag(parliamentId);
        final translatedPoliticianHash = _sanitizeHashtag(l10n.hashtagPolitician);
        final partyTag = deputy.club.isNotEmpty ? _sanitizeHashtag(deputy.club) : translatedPoliticianHash;

        final typeTag = partyTag == translatedPoliticianHash ? '' : '$translatedPoliticianHash ';
        final hashtags = '$typeTag$countryTag $partyTag #Lustra';

        final promo = await _getPromoText(l10n);

        final sb = StringBuffer();
        sb.write(l10n.shareDeputyText(deepLink));
        sb.write('\n\n$hashtags');
        if (promo != null) {
          sb.write('\n\n$promo');
        }

        final fullShareText = sb.toString();
        
        await Clipboard.setData(ClipboardData(text: fullShareText));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.clipboardCopySuccess)),
          );
        }
        
        await SharePlus.instance.share(ShareParams(files: [xFile], text: fullShareText));
      }
    } catch (e) {
      developer.log('Błąd podczas renderowania i udostępniania posła: $e');
    }
  }
}
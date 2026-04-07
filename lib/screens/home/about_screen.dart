import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lustra/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutGovernanceScreen extends StatelessWidget {
  const AboutGovernanceScreen({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
  }

  Widget _buildSectionTitle(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(BuildContext context, String text, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
      ),
    );
  }

  Widget _buildBullet(BuildContext context, String title, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 18, height: 1.6)),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "$title ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: text),
                ],
              ),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightBox(BuildContext context, String title, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border(left: BorderSide(color: Theme.of(context).primaryColor, width: 4)),
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade900, fontSize: 16)),
          const SizedBox(height: 8),
          Text(text, style: TextStyle(color: Colors.blue.shade900, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildWarningBox(BuildContext context, String title, String text, String contactText, String githubText) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        border: Border(left: BorderSide(color: Colors.orange.shade800, width: 4)),
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange.shade900, fontSize: 16)),
          const SizedBox(height: 8),
          Text(text, style: TextStyle(color: Colors.orange.shade900, height: 1.5)),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => _launchUrl('mailto:jacek@lustra.dev'),
            child: Text("→ $contactText", style: TextStyle(color: Colors.orange.shade900, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _launchUrl('https://github.com/fokdelafons'),
            child: Text("→ $githubText", style: TextStyle(color: Colors.orange.shade900, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isWide = MediaQuery.of(context).size.width > 800;

    final content = SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: SelectionArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            l10n.aboutGovTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.aboutGovSubtitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Divider(thickness: 2),
          ),

          Container(
            padding: EdgeInsets.all(isWide ? 32 : 24),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [BoxShadow(color: Color(0x05000000), blurRadius: 10, offset: Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: isWide ? 260 : double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300, width: 1),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [BoxShadow(color: Color(0x05000000), blurRadius: 8, offset: Offset(0, 4))],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Image.asset(
                          'assets/founder.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: isWide ? 32 : 0, height: isWide ? 0 : 24),
                    Expanded(
                      flex: isWide ? 1 : 0,
                      child: Column(
                        crossAxisAlignment: isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                        children: [
                          Text(
                            l10n.aboutGovFounderName, 
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E1E1E),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              l10n.aboutGovFounderBadge,
                              style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            l10n.aboutGovFounderP1, 
                            textAlign: isWide ? TextAlign.left : TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            l10n.aboutGovFounderP2, 
                            textAlign: isWide ? TextAlign.left : TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
                    border: Border(left: BorderSide(color: Theme.of(context).primaryColor, width: 4)),
                    borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
                  ),
                  child: Text(
                    l10n.aboutGovFounderP3, 
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5, color: Colors.grey.shade900, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          _buildSectionTitle(context, l10n.aboutGovSec1Title, Icons.account_balance),
          _buildParagraph(context, l10n.aboutGovSec1Intro),
          _buildBullet(context, l10n.aboutGovSec1Bullet1Title, l10n.aboutGovSec1Bullet1Text),
          _buildBullet(context, l10n.aboutGovSec1Bullet2Title, l10n.aboutGovSec1Bullet2Text),
          _buildBullet(context, l10n.aboutGovSec1Bullet3Title, l10n.aboutGovSec1Bullet3Text),
          _buildSectionTitle(context, l10n.aboutGovSec2Title, Icons.gavel),
          _buildParagraph(context, l10n.aboutGovSec2P1),
          _buildHighlightBox(context, l10n.aboutGovSec2BoxTitle, l10n.aboutGovSec2BoxText),
          _buildParagraph(context, l10n.aboutGovSec2P2),
          _buildSectionTitle(context, l10n.aboutGovSec3Title, Icons.security),
          _buildBullet(context, l10n.aboutGovSec3Bullet1Title, l10n.aboutGovSec3Bullet1Text),
          _buildBullet(context, l10n.aboutGovSec3Bullet2Title, l10n.aboutGovSec3Bullet2Text),
          _buildWarningBox(
            context,
            l10n.aboutGovSec3BoxTitle,
            l10n.aboutGovSec3BoxText,
            l10n.aboutGovSec3Contact,
            l10n.aboutGovSec3Github,
          ),
        ],
      ),
      ),
    );

    return Scaffold(
      appBar: (kIsWeb && MediaQuery.of(context).size.width > 1140)
          ? null
          : AppBar(
              title: Text(l10n.aboutGovAppBar),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
      body: kIsWeb
          ? Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 850),
                child: content,
              ),
            )
          : content,
    );
  }
}
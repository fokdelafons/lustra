import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lustra/l10n/app_localizations.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 2)),
        ),
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
        ),
      ),
    );
  }

  Widget _buildSubsectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
      ),
    );
  }

  Widget _buildParagraph(BuildContext context, String text, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
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

  Widget _buildCodeBlock(BuildContext context, String code) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 13,
          height: 1.5,
          color: Color(0xFFD4D4D4),
        ),
      ),
    );
  }

  Widget _buildHighlightBox(BuildContext context, String content) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border(left: BorderSide(color: Theme.of(context).primaryColor, width: 4)),
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
      ),
      child: Text(
        content,
        style: TextStyle(color: Colors.blue.shade900, height: 1.6, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final content = SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: SelectionArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            l10n.termsTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.termsLastUpdated,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),

          // ALERT BOX (Radical Transparency)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              border: Border.all(color: Colors.red.shade700, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.policy, color: Colors.red.shade700),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.termsAlertTitle,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red.shade700),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildParagraph(context, l10n.termsAlertP1),
                _buildParagraph(context, l10n.termsAlertP2),
                _buildCodeBlock(context, l10n.termsAlertCode),
                const SizedBox(height: 8),
                Text(
                  l10n.termsAlertH4,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                _buildParagraph(context, l10n.termsAlertP3),
                _buildBullet(context, l10n.termsAlertB1Title, l10n.termsAlertB1Text),
                _buildBullet(context, l10n.termsAlertB2Title, l10n.termsAlertB2Text),
                const SizedBox(height: 8),
                _buildParagraph(context, l10n.termsAlertP4, isBold: true),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 32.0),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.termsTocTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 12),
                Text(l10n.termsPart1Title, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Text(l10n.termsPart2Title, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)),
              ],
            ),
          ),

          // PART 1: PRIVACY
          _buildSectionTitle(context, l10n.termsPart1Title),
          _buildParagraph(context, l10n.termsPart1Intro),

          _buildSubsectionTitle(context, l10n.termsP1S1Title),
          _buildParagraph(context, l10n.termsP1S1Text),

          _buildSubsectionTitle(context, l10n.termsP1S2Title),
          _buildBullet(context, l10n.termsP1S2B1Title, l10n.termsP1S2B1Text),
          _buildBullet(context, l10n.termsP1S2B2Title, l10n.termsP1S2B2Text),
          _buildBullet(context, l10n.termsP1S2B3Title, l10n.termsP1S2B3Text),
          _buildBullet(context, l10n.termsP1S2B4Title, l10n.termsP1S2B4Text),
          _buildBullet(context, l10n.termsP1S2B5Title, l10n.termsP1S2B5Text),
          _buildBullet(context, l10n.termsP1S2B6Title, l10n.termsP1S2B6Text),

          _buildHighlightBox(context, l10n.termsP1S2Highlight),

          _buildSubsectionTitle(context, l10n.termsP1S3Title),
          _buildBullet(context, l10n.termsP1S3B1Title, l10n.termsP1S3B1Text),
          _buildBullet(context, l10n.termsP1S3B2Title, l10n.termsP1S3B2Text),
          _buildBullet(context, l10n.termsP1S3B3Title, l10n.termsP1S3B3Text),

          _buildSubsectionTitle(context, l10n.termsP1S4Title),
          _buildParagraph(context, l10n.termsP1S4P1),
          _buildParagraph(context, l10n.termsP1S4P2),

          _buildSubsectionTitle(context, l10n.termsP1S5Title),
          _buildParagraph(context, l10n.termsP1S5Text),

          // PART 2: RULES
          _buildSectionTitle(context, l10n.termsPart2Title),

          _buildSubsectionTitle(context, l10n.termsP2S1Title),
          _buildParagraph(context, l10n.termsP2S1Text),

          _buildSubsectionTitle(context, l10n.termsP2S2Title),
          _buildParagraph(context, l10n.termsP2S2Intro),
          _buildBullet(context, l10n.termsP2S2B1Title, l10n.termsP2S2B1Text),
          _buildBullet(context, l10n.termsP2S2B2Title, l10n.termsP2S2B2Text),
          _buildBullet(context, l10n.termsP2S2B3Title, l10n.termsP2S2B3Text),

          _buildSubsectionTitle(context, l10n.termsP2S3Title),
          _buildParagraph(context, l10n.termsP2S3Intro),
          _buildBullet(context, l10n.termsP2S3B1Title, l10n.termsP2S3B1Text),
          _buildBullet(context, l10n.termsP2S3B2Title, l10n.termsP2S3B2Text),
          _buildBullet(context, l10n.termsP2S3B3Title, l10n.termsP2S3B3Text),

          _buildSubsectionTitle(context, l10n.termsP2S4Title),
          _buildParagraph(context, l10n.termsP2S4Intro),
          _buildBullet(context, l10n.termsP2S4B1Title, l10n.termsP2S4B1Text),
          _buildBullet(context, l10n.termsP2S4B2Title, l10n.termsP2S4B2Text),
          _buildBullet(context, l10n.termsP2S4B3Title, l10n.termsP2S4B3Text),
          _buildBullet(context, l10n.termsP2S4B4Title, l10n.termsP2S4B4Text),

          _buildSubsectionTitle(context, l10n.termsP2S5Title),
          _buildParagraph(context, l10n.termsP2S5Text),

          _buildSubsectionTitle(context, l10n.termsP2S6Title),
          _buildParagraph(context, l10n.termsP2S6Text),
        ],
      ),
      ),
    );

    return Scaffold(
      appBar: (kIsWeb && MediaQuery.of(context).size.width > 1140)
          ? null
          : AppBar(
              title: Text(l10n.termsAppBar),
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
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlueprintScreen extends StatelessWidget {
  const BlueprintScreen({super.key});

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
                color: Colors.black87,
              ),
        ),
      ),
    );
  }

  Widget _buildSubsectionTitle(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
      padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 18, height: 1.6)),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  if (title.isNotEmpty) TextSpan(text: "$title ", style: const TextStyle(fontWeight: FontWeight.bold)),
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
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 13,
          height: 1.5,
          color: Color(0xFFD4D4D4),
        ),
      ),
    );
  }

  Widget _buildHighlightBox(BuildContext context, String content, {bool isSuccess = false}) {
    final color = isSuccess ? Colors.green : Colors.blue;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        border: Border(left: BorderSide(color: color, width: 4)),
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
      ),
      child: Text(
        content,
        style: TextStyle(color: color.shade900, height: 1.6, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildImage(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          assetPath,
          width: double.infinity,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            color: Colors.grey.shade200,
            child: const Icon(Icons.broken_image, color: Colors.grey, size: 48),
          ),
        ),
      ),
    );
  }

  // --- FLOWCHART BUILDERS ---
  Widget _buildFlowStep(BuildContext context, String number, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 5, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(number, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15))),
        ],
      ),
    );
  }

  Widget _buildFlowArrow(BuildContext context) {
    return Container(
      height: 24,
      width: 2,
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.symmetric(vertical: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Enables global native text selection
    final content = SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: SelectionArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // HEADER
          Text(
            l10n.bpTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          _buildImage('assets/protocol.png',),
          _buildParagraph(context, l10n.bpIntroBig),
          _buildParagraph(context, l10n.bpIntroSmall),

          // SECTION 1
          _buildSectionTitle(context, l10n.bpS1Title),
          _buildParagraph(context, l10n.bpS1P1),
          _buildCodeBlock(context, l10n.bpS1Code),
          _buildHighlightBox(context, l10n.bpS1Highlight),

          // SECTION 2
          _buildSectionTitle(context, l10n.bpS2Title),
          _buildParagraph(context, l10n.bpS2P1),
          
          // FLOWCHART
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.visibility, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(l10n.bpS2FlowMedia, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildFlowStep(context, "1", l10n.bpS2Flow1),
                _buildFlowArrow(context),
                _buildFlowStep(context, "2", l10n.bpS2Flow2),
                _buildFlowArrow(context),
                _buildFlowStep(context, "3", l10n.bpS2Flow3),
                _buildFlowArrow(context),
                _buildFlowStep(context, "4", l10n.bpS2Flow4),
                _buildFlowArrow(context),
                _buildFlowStep(context, "5", l10n.bpS2Flow5),
                _buildFlowArrow(context),
                _buildFlowStep(context, "6", l10n.bpS2Flow6),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 4),
                    Text(l10n.bpS2FlowLoop, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),

          // SECTION 3
          _buildSectionTitle(context, l10n.bpS3Title),
          
          _buildSubsectionTitle(context, l10n.bpS3ATitle, Icons.translate),
          _buildParagraph(context, l10n.bpS3AP1),
          _buildParagraph(context, l10n.bpS3AP2, isBold: true),
          _buildImage('assets/transform.png'),

          _buildSubsectionTitle(context, l10n.bpS3BTitle, Icons.share),
          _buildParagraph(context, l10n.bpS3BP1),
          _buildBullet(context, l10n.bpS3BList1Title, l10n.bpS3BList1Text),
          _buildBullet(context, l10n.bpS3BList2Title, l10n.bpS3BList2Text),
          _buildBullet(context, l10n.bpS3BList3Title, l10n.bpS3BList3Text),
          _buildParagraph(context, l10n.bpS3BExample, isBold: true),
          _buildImage('assets/news-card.png'),

          _buildSubsectionTitle(context, l10n.bpS3CTitle, Icons.how_to_vote),
          _buildParagraph(context, l10n.bpS3CP1),
          _buildBullet(context, l10n.bpS3CList1Title, l10n.bpS3CList1Text),
          _buildImage('assets/social-poll.png'),
          _buildBullet(context, l10n.bpS3CList2Title, l10n.bpS3CList2Text),
          _buildParagraph(context, l10n.bpS3CP2),

          // SECTION 4
          _buildSectionTitle(context, l10n.bpS4Title),
          _buildParagraph(context, l10n.bpS4P1),
          _buildBullet(context, l10n.bpS4List1Title, l10n.bpS4List1Text),
          _buildBullet(context, l10n.bpS4List2Title, l10n.bpS4List2Text),
          _buildBullet(context, l10n.bpS4List3Title, l10n.bpS4List3Text),

          // SECTION 5
          _buildSectionTitle(context, l10n.bpS5Title),
          _buildParagraph(context, l10n.bpS5P1),
          _buildParagraph(context, l10n.bpS5P2),
          _buildParagraph(context, l10n.bpS5P3),
          _buildHighlightBox(context, l10n.bpS5Highlight, isSuccess: true),
        ],
      ),
      ),
    );

    return Scaffold(
      appBar: (kIsWeb && MediaQuery.of(context).size.width > 1140)
          ? null
          : AppBar(
              title: Text(l10n.bpAppBar),
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
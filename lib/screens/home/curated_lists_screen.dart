import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lustra/l10n/app_localizations.dart';

class CuratedListsScreen extends StatelessWidget {
  const CuratedListsScreen({super.key});

  Widget _buildSectionTitle(BuildContext context, String title, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, color: Theme.of(context).primaryColor, size: 28),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
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
              color: Colors.grey.shade800,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
      ),
    );
  }

  Widget _buildTacticalCard(BuildContext context, String title, String text, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Color(0x08000000), blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: color, width: 6)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
                    child: Icon(icon, color: color, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(text, style: TextStyle(height: 1.5, color: Colors.grey.shade700)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightBox(BuildContext context, String title, String content, IconData icon, Color color) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 24.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(color: Colors.grey.shade900, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard(BuildContext context, String stepNumber, String title, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Theme.of(context).primaryColor.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 4))],
            ),
            alignment: Alignment.center,
            child: Text(
              stepNumber,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)),
                const SizedBox(height: 8),
                Text(text, style: TextStyle(height: 1.5, color: Colors.grey.shade700)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSystemLimitsBox(BuildContext context, AppLocalizations l10n) {
    Widget buildLimitItem(String label, String value, String desc) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              child: Text(
                value,
                style: const TextStyle(color: Colors.greenAccent, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'monospace'),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(desc, style: const TextStyle(color: Colors.white54, fontSize: 13, height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800),
        boxShadow: const [BoxShadow(color: Color(0x29000000), blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.memory, color: Colors.grey, size: 20),
              const SizedBox(width: 8),
              Text(
                l10n.clLimitsTitle,
                style: const TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 1.2, fontWeight: FontWeight.bold, fontFamily: 'monospace'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          buildLimitItem(l10n.clLimit1Label, "03", l10n.clLimit1Desc),
          buildLimitItem(l10n.clLimit2Label, "80", l10n.clLimit2Desc),
          buildLimitItem(l10n.clLimit3Label, "10", l10n.clLimit3Desc),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Enables global native selection
    final content = SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: SelectionArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // HERO
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12, width: 2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(4)),
                  child: const Text("OPERATIONAL PROTOCOL", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 12)),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.clTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900, color: Colors.black87, height: 1.2),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.clIntro,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey.shade700, height: 1.5),
                ),
              ],
            ),
          ),

          // SECTION 1: MOBILIZATION
          _buildSectionTitle(context, l10n.clS1Title, icon: Icons.hub),
          _buildParagraph(context, l10n.clS1P1),
          _buildParagraph(context, l10n.clS1P2),

          // SECTION 2: WEAPONIZATION (Tactical Cards)
          _buildSectionTitle(context, l10n.clS2Title, icon: Icons.my_location),
          _buildTacticalCard(context, l10n.clS2A_Title, l10n.clS2A_Text, Icons.policy, Colors.red.shade700),
          _buildTacticalCard(context, l10n.clS2B_Title, l10n.clS2B_Text, Icons.account_balance, Colors.blue.shade700),
          _buildTacticalCard(context, l10n.clS2C_Title, l10n.clS2C_Text, Icons.push_pin, Colors.amber.shade800),

          // SECTION 3 & 4: BROADCAST & ECONOMY
          _buildHighlightBox(context, l10n.clS3Title, l10n.clS3Text, Icons.cell_tower, Colors.deepPurple),
          _buildHighlightBox(context, l10n.clS4Title, l10n.clS4Text, Icons.savings, Colors.teal),

          // SECTION 5: DEPLOYMENT
          _buildSectionTitle(context, l10n.clS5Title, icon: Icons.rocket_launch),
          _buildParagraph(context, l10n.clS5Intro),
          const SizedBox(height: 16),
          _buildStepCard(context, "1", l10n.clStep1Title, l10n.clStep1Text),
          _buildStepCard(context, "2", l10n.clStep2Title, l10n.clStep2Text),
          _buildStepCard(context, "3", l10n.clStep3Title, l10n.clStep3Text),

          // SECTION 6: SYSTEM LIMITS
          _buildSystemLimitsBox(context, l10n),

          // OUTRO
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: Theme.of(context).primaryColor, width: 4)),
              color: Colors.grey.shade100,
            ),
            child: _buildParagraph(context, l10n.clOutro, isBold: true),
          ),
          const SizedBox(height: 40),
        ],
      ),
      ),
    );

    return Scaffold(
      appBar: (kIsWeb && MediaQuery.of(context).size.width > 1140)
          ? null
          : AppBar(
              title: Text(l10n.clAppBar),
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
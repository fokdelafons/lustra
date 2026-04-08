// lib/screens/civic_audit_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lustra/l10n/app_localizations.dart';
import '../../services/app_router.dart'; // Zakładam istnienie Twojego routera (smartNavigate)

class CivicAuditScreen extends StatelessWidget {
  const CivicAuditScreen({super.key});

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

  Widget _buildParagraph(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: Colors.grey.shade800,
            ),
      ),
    );
  }

  Widget _buildComparisonCards(BuildContext context, AppLocalizations l10n) {
    final isWide = MediaQuery.of(context).size.width > 600;

    Widget buildCard(String title, String text, IconData icon, MaterialColor color, bool isNegative) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.05),
          border: Border.all(color: color.withValues(alpha: 0.3)),
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
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color.shade900),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              text,
              style: TextStyle(height: 1.5, color: Colors.grey.shade900),
            ),
          ],
        ),
      );
    }

    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: buildCard(l10n.caS1PetitionsTitle, l10n.caS1PetitionsText, Icons.timer_off, Colors.red, true)),
          const SizedBox(width: 16),
          Expanded(child: buildCard(l10n.caS1LustraTitle, l10n.caS1LustraText, Icons.anchor, Colors.green, false)),
        ],
      );
    } else {
      return Column(
        children: [
          buildCard(l10n.caS1PetitionsTitle, l10n.caS1PetitionsText, Icons.timer_off, Colors.red, true),
          const SizedBox(height: 16),
          buildCard(l10n.caS1LustraTitle, l10n.caS1LustraText, Icons.anchor, Colors.green, false),
        ],
      );
    }
  }

  Widget _buildPowerEquation(BuildContext context, AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Color(0x29000000), blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        children: [
          Text(
            l10n.caS3MathSubtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 14, letterSpacing: 1.2, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, color: Colors.white, size: 32),
              SizedBox(width: 8),
              Text("+", style: TextStyle(color: Colors.white54, fontSize: 24)),
              SizedBox(width: 8),
              Icon(Icons.insert_chart, color: Colors.blueAccent, size: 32),
              SizedBox(width: 8),
              Text("=", style: TextStyle(color: Colors.white54, fontSize: 24)),
              SizedBox(width: 8),
              Icon(Icons.groups, color: Colors.greenAccent, size: 36),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "1 CITIZEN + FACT CARD = 1,000+ VIEWS",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
          ),
        ],
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

  Widget _buildSkepticBox(BuildContext context, AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
        border: Border.all(color: Theme.of(context).primaryColor.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.security, color: Theme.of(context).primaryColor, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(l10n.caSkepticTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).primaryColor)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(l10n.caSkepticText, style: TextStyle(height: 1.5, color: Colors.grey.shade800)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              OutlinedButton.icon(
                onPressed: () => context.smartNavigate('/info/governance/'),
                icon: const Icon(Icons.account_balance, size: 18),
                label: Text(l10n.caSkepticBtnGov),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                  side: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => context.smartNavigate('/info/privacy-policy/'),
                icon: const Icon(Icons.policy, size: 18),
                label: Text(l10n.caSkepticBtnPriv),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                  side: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ],
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
                  child: const Text("MANIFESTO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 12)),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.caTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87, height: 1.2),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.caIntro,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey.shade700, height: 1.5),
                ),
              ],
            ),
          ),

          // SECTION 1: PETITIONS VS LUSTRA
          _buildSectionTitle(context, l10n.caS1Title, icon: Icons.compare_arrows),
          _buildComparisonCards(context, l10n),

          // SECTION 2: POLITICIANS
          _buildSectionTitle(context, l10n.caS2Title, icon: Icons.visibility),
          _buildParagraph(context, l10n.caS2Text),

          // SECTION 3: ASYMMETRIC POWER
          _buildSectionTitle(context, l10n.caS3Title, icon: Icons.bolt),
          _buildParagraph(context, l10n.caS3P1),
          _buildPowerEquation(context, l10n),
          _buildParagraph(context, l10n.caS3P2),

          // SECTION 4: ALGORITHM
          _buildSectionTitle(context, l10n.caS4Title, icon: Icons.tune),
          _buildParagraph(context, l10n.caS4Text),

          // SECTION 5: THE ARSENAL
          _buildSectionTitle(context, l10n.caS5Title, icon: Icons.construction),
          _buildParagraph(context, l10n.caS5Intro),
          
          _buildTacticalCard(context, l10n.caS5A_Title, l10n.caS5A_Text, Icons.phishing, Colors.deepOrange),
          _buildTacticalCard(context, l10n.caS5B_Title, l10n.caS5B_Text, Icons.article, Colors.indigo),
          _buildTacticalCard(context, l10n.caS5C_Title, l10n.caS5C_Text, Icons.video_camera_front, Colors.pink),
          _buildTacticalCard(context, l10n.caS5D_Title, l10n.caS5D_Text, Icons.send, Colors.teal),
          
          const SizedBox(height: 16),
          _buildParagraph(context, l10n.caS5Outro),

          // SKEPTIC BOX (Footer)
          _buildSkepticBox(context, l10n),
        ],
      ),
      ),
    );

    return Scaffold(
      appBar: (kIsWeb && MediaQuery.of(context).size.width > 1140)
          ? null
          : AppBar(
              title: Text(l10n.caAppBar),
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
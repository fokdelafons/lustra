import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lustra/l10n/app_localizations.dart';
import '../../widgets/web_link.dart'; 
import 'package:flutter_animate/flutter_animate.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  Widget _buildInfoCtaCard(BuildContext context, VoidCallback onTap, IconData icon, String title, String subtitle, {int animDelayMs = 0}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        hoverColor: Theme.of(context).primaryColor.withValues(alpha: 0.05),
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 8, offset: Offset(0, 4))],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 28, color: Theme.of(context).primaryColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    ).animate().fade(duration: 400.ms, delay: animDelayMs.ms).slideX(begin: 0.05, curve: Curves.easeOut);
  }

  Widget _buildMissionBlock(BuildContext context, String title, String text, IconData icon, int delayMs) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Color(0x05000000), blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Theme.of(context).primaryColor, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6, color: Colors.grey.shade800),
          ),
        ],
      ),
    ).animate().fade(duration: 500.ms, delay: delayMs.ms).slideY(begin: 0.1, curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final content = SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 32),
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
                    child: const Text("SYSTEM OVERVIEW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 12)),
                  ).animate().fade().scale(),
                  const SizedBox(height: 16),
                  Text(
                    l10n.infoScreenTitle,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900, color: Colors.black87, height: 1.2),
                  ).animate().fade(delay: 100.ms).slideX(),
                ],
              ),
            ),

            _buildMissionBlock(context, l10n.infoTitle1, l10n.infoParagraph1, Icons.flag_outlined, 200),
            _buildMissionBlock(context, l10n.infoTitle2, l10n.infoParagraph2, Icons.warning_amber_rounded, 300),
            _buildMissionBlock(context, l10n.infoTitle3, l10n.infoParagraph3, Icons.shield_outlined, 400),
            _buildMissionBlock(context, l10n.infoTitle4, l10n.infoParagraph4, Icons.bolt_outlined, 500),
            
            const SizedBox(height: 16),
            Text(
              "RESOURCES & PROTOCOLS",
              style: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.bold, letterSpacing: 1.2),
            ).animate().fade(delay: 600.ms),
            const SizedBox(height: 16),
            
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  WebLink(
                    path: '/info/tech',
                    builder: (context, onTap) => _buildInfoCtaCard(context, onTap, Icons.memory, l10n.infoTechTitle, l10n.infoTechSubtitle, animDelayMs: 650),
                  ),
                  const SizedBox(height: 16),
                  WebLink(
                    path: '/info/governance',
                    builder: (context, onTap) => _buildInfoCtaCard(context, onTap, Icons.account_balance, l10n.infoGovTitle, l10n.infoGovSubtitle, animDelayMs: 750),
                  ),
                  const SizedBox(height: 16),
                  WebLink(
                    path: '/info/privacy-policy',
                    builder: (context, onTap) => _buildInfoCtaCard(context, onTap, Icons.policy, l10n.infoPrivacyTitle, l10n.infoPrivacySubtitle, animDelayMs: 850),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

    return Scaffold(
      appBar: (kIsWeb && MediaQuery.of(context).size.width > 1140) ? null : AppBar(
        title: Text(l10n.infoScreenTitle),
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
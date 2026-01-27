import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:lustra/services/parliament_manager.dart';

class CivicProjectScreen extends StatelessWidget {
  const CivicProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; // <-- Dodane
    // Kolorystyka
    final primaryColor = Colors.teal[800]!; // Ciemniejszy teal dla tekstów
    final accentColor = Colors.teal[700]!;  // Akcent dla belek
    final backgroundColor = Colors.grey[100]!; // Tło pod kartą

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: (kIsWeb && MediaQuery.of(context).size.width > 1140)
          ? null
          : AppBar(
              title: Text(l10n.civicTitle),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              elevation: 1,
            ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 850),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(32.0), // Margines wewnętrzny karty
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- HEADER ---
                    Center(
                      child: Column(
                        children: [
                          Icon(Icons.volunteer_activism, size: 64, color: accentColor),
                          const SizedBox(height: 16),
                          Text(
                            l10n.civicIncubatorTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                  letterSpacing: -0.5,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.civicSubtitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.grey[600],
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    const Divider(),
                    const SizedBox(height: 40),

                    // --- SECTION 1: PROGRAM RULES ---
                    _SectionHeader(title: l10n.civicSection1Title, color: accentColor),
                    const SizedBox(height: 16),
                    _BodyText(l10n.civicSection1Intro),
                    
                    const SizedBox(height: 24),
                    _SubHeader(title: l10n.civicProcessTitle),
                    _buildOrderedList([
                      _ListItem(bold: l10n.civicRuleSubmissionTitle, text: l10n.civicRuleSubmissionText),
                      _ListItem(bold: l10n.civicRuleReviewTitle, text: l10n.civicRuleReviewText),
                      _ListItem(bold: l10n.civicRuleAiTitle, text: l10n.civicRuleAiText),
                      _ListItem(bold: l10n.civicRulePublicationTitle, text: l10n.civicRulePublicationText),
                    ]),

                    const SizedBox(height: 24),
                    _WarningBox(
                      title: l10n.civicWarningTitle,
                      text: l10n.civicWarningText,
                    ),

                    const SizedBox(height: 24),
                    _SubHeader(title: l10n.civicPoliciesTitle),
                    _buildUnorderedList([
                      _ListItem(bold: l10n.civicPolicyPublicDomainTitle, text: l10n.civicPolicyPublicDomainText),
                      _ListItem(bold: l10n.civicPolicyAstroturfingTitle, text: l10n.civicPolicyAstroturfingText),
                      _ListItem(bold: l10n.civicPolicyAdPersonamTitle, text: l10n.civicPolicyAdPersonamText),
                      _ListItem(bold: l10n.civicPolicyTrashTitle, text: l10n.civicPolicyTrashText),
                    ]),

                    const SizedBox(height: 40),

                    // --- SECTION 2: STANDARD ---
                    _SectionHeader(title: l10n.civicSection2Title, color: accentColor),
                    const SizedBox(height: 16),
                    _BodyText(l10n.civicSection2Intro),
                    
                    const SizedBox(height: 24),
                    _SubHeader(title: l10n.civicStructureTitle),
                    _buildUnorderedList([
                      _ListItem(bold: l10n.civicStructureTitleItem, text: l10n.civicStructureTitleText),
                      _ListItem(bold: l10n.civicStructureArticlesItem, text: l10n.civicStructureArticlesText),
                      _ListItem(bold: l10n.civicStructureExposeItem, text: l10n.civicStructureExposeText),
                    ]),
                    // Zagnieżdżona lista dla Exposé
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, top: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _BodyText(l10n.civicExposePoint1),
                          _BodyText(l10n.civicExposePoint2),
                          _BodyText(l10n.civicExposePoint3),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // --- SECTION 3: SCORING ---
                    _SectionHeader(title: l10n.civicSection3Title, color: accentColor),
                    const SizedBox(height: 16),
                    _BodyText(l10n.civicSection3Intro),
                    
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7FAFC),
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _buildUnorderedList([
                        _ListItem(bold: l10n.civicScoreStructureTitle, text: l10n.civicScoreStructureText),
                        _ListItem(bold: l10n.civicScoreExposeTitle, text: l10n.civicScoreExposeText),
                        _ListItem(bold: l10n.civicScoreLogicTitle, text: l10n.civicScoreLogicText),
                        _ListItem(bold: l10n.civicScoreImpactTitle, text: l10n.civicScoreImpactText),
                      ]),
                    ),

                    const SizedBox(height: 24),
                    _SubHeader(title: l10n.civicThresholdsTitle),
                    const SizedBox(height: 8),
                    _buildThresholdRow(Colors.red, "0-40 (Draft)", l10n.civicThresholdRejected),
                    _buildThresholdRow(Colors.orange, "41-70 (Candidate)", l10n.civicThresholdCandidate),
                    _buildThresholdRow(Colors.green, "71-100 (Ready)", l10n.civicThresholdReady),

                    const SizedBox(height: 40),

// --- SECTION 4: TEMPLATE ---
                    _SectionHeader(title: l10n.civicSection4Title, color: accentColor),
                    const SizedBox(height: 16),
                    _BodyText(l10n.civicSection4Intro),
                    const SizedBox(height: 16),
                    _CodeBlock(
                      code: l10n.civicTemplateCode,
                    ),

                    const SizedBox(height: 60),

                    // --- CTA BUTTON ---
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: () => _launchEmail(context),
                        icon: const Icon(Icons.send_rounded),
                        label: Text(
                          l10n.civicSubmitButton,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.0),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentColor,
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Text(
                        l10n.civicFooterCopyright,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[500], fontSize: 13, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- LOGIKA EMAIL ---
  Future<void> _launchEmail(BuildContext context) async {
    final activeService = context.read<ParliamentManager>().activeService;
    final l10n = AppLocalizations.of(context)!;
    
    final recipient = "jacek@lustra.dev"; 
    final subject = l10n.civicEmailSubject(activeService.name);
    final body = l10n.civicEmailBodyPlaceholder;

    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipient],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (e) {
      if (context.mounted) {
        _showManualEmailDialog(context, l10n, recipient, subject, body);
      }
    }
  }

void _showManualEmailDialog(BuildContext context, AppLocalizations l10n, String recipient, String subject, String body) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.civicEmailDialogTitle),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.civicEmailDialogIntro, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 16),
                _buildCopyField(ctx, l10n, l10n.civicEmailDialogRecipient, recipient),
                const SizedBox(height: 12),
                _buildCopyField(ctx, l10n, l10n.civicEmailDialogSubject, subject),
                const SizedBox(height: 12),
                _buildCopyField(ctx, l10n, l10n.civicEmailDialogBody, body, isMultiline: true),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.actionCancel),
          ),
        ],
      ),
    );
  }

  Widget _buildCopyField(BuildContext context, AppLocalizations l10n, String label, String content, {bool isMultiline = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            crossAxisAlignment: isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SelectableText(
                  content,
                  style: const TextStyle(fontSize: 14, fontFamily: "Courier New"),
                  maxLines: isMultiline ? 8 : 1,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.copy, size: 20),
                tooltip: "Copy",
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: content));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.civicCopiedToClipboard), duration: const Duration(seconds: 2)),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- WIDGETY POMOCNICZE (WIZUALNE) ---

  Widget _buildOrderedList(List<_ListItem> items) {
    return Column(
      children: items.asMap().entries.map((entry) {
        int idx = entry.key + 1;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$idx.", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(width: 12),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.5, fontFamily: 'Roboto'), // Dopasuj font do apki
                    children: [
                      TextSpan(text: entry.value.bold, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: " "),
                      TextSpan(text: entry.value.text),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildUnorderedList(List<_ListItem> items) {
    return Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 6.0, right: 12.0),
                child: Icon(Icons.circle, size: 6, color: Colors.black87),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.5, fontFamily: 'Roboto'),
                    children: [
                      TextSpan(text: item.bold, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: " "),
                      TextSpan(text: item.text),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildThresholdRow(Color color, String label, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(desc, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }
}

class _ListItem {
  final String bold;
  final String text;
  _ListItem({required this.bold, required this.text});
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final Color color;
  const _SectionHeader({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 4, height: 26, color: color),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
          ),
        ),
      ],
    );
  }
}

class _SubHeader extends StatelessWidget {
  final String title;
  const _SubHeader({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
      child: Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey[800])),
    );
  }
}

class _BodyText extends StatelessWidget {
  final String text;
  const _BodyText(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 15, height: 1.6, color: Colors.black87));
  }
}

class _WarningBox extends StatelessWidget {
  final String title;
  final String text;
  const _WarningBox({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAF0), // box-warning background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFFBD38D)), // box-warning border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("⚠️ ", style: TextStyle(fontSize: 18)),
              Expanded(
                child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF744210), fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(color: Color(0xFF744210), fontSize: 15, height: 1.5)),
        ],
      ),
    );
  }
}

class _CodeBlock extends StatelessWidget {
  final String code;
  const _CodeBlock({required this.code});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF2D3748),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SelectableText(
            code,
            style: const TextStyle(fontFamily: "Courier New", color: Color(0xFFE2E8F0), fontSize: 13.5, height: 1.5),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            icon: const Icon(Icons.copy, color: Colors.white70),
            tooltip: "Copy Template",
            onPressed: () {
              Clipboard.setData(ClipboardData(text: code));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.civicTemplateCopied), duration: const Duration(seconds: 2)),
              );
            },
          ),
        )
      ],
    );
  }
}
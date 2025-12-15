import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TechStackScreen extends StatelessWidget {
  const TechStackScreen({super.key});

  Widget _buildFormattedText(BuildContext context, String text) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5, fontSize: 16);
    final boldStyle = bodyStyle?.copyWith(fontWeight: FontWeight.bold);

    List<TextSpan> spans = [];
    final parts = text.split(RegExp(r'<\/?b>'));

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style: i.isOdd ? boldStyle : null,
      ));
    }

    return RichText(
      text: TextSpan(
        style: bodyStyle,
        children: spans,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold);
    final headerStyle = theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);
    final bodyStyle = theme.textTheme.bodyMedium?.copyWith(height: 1.5, fontSize: 16);
    final codeStyle = const TextStyle(
      fontFamily: 'monospace',
      backgroundColor: Color(0xFFF5F5F5),
      fontSize: 14,
      height: 1.4,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.techPageTitle),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Używamy zdefiniowanych stylów dla każdego klucza
            Text(l10n.techPageTitle, style: titleStyle),
            const SizedBox(height: 16),
            Text(l10n.techPageIntro, style: bodyStyle),
            const SizedBox(height: 24),

            Text(l10n.techPageWhyAiTitle, style: headerStyle),
            const SizedBox(height: 8),
            Text(l10n.techPageWhyAiBody, style: bodyStyle),
            const SizedBox(height: 24),

            Text(l10n.techPageWhatForTitle, style: headerStyle),
            const SizedBox(height: 8),
            Text(l10n.techPageWhatForBody, style: bodyStyle),
            const SizedBox(height: 24),

            Text(l10n.techPageBiasTitle, style: headerStyle),
            const SizedBox(height: 8),
            _buildFormattedText(context, l10n.techPageBiasBody),
            const SizedBox(height: 24),

            Text(l10n.techPagePromiseTitle, style: headerStyle),
            const SizedBox(height: 8),
            Text(l10n.techPagePromiseBody, style: bodyStyle),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: codeStyle.backgroundColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                l10n.techPagePromptCode(
                  "{DOCUMENT_TEXT}",
                  "{country}"
                )
                .replaceAll('__OPEN_BRACE__', '{')
                .replaceAll('__CLOSE_BRACE__', '}'),
                style: codeStyle,
              ),
            ),
            const SizedBox(height: 24),

            Text(l10n.techPageFlawlessTitle, style: headerStyle),
            const SizedBox(height: 8),
            Text(l10n.techPageFlawlessBody, style: bodyStyle),
            const SizedBox(height: 24),
            
            Center(
              child: Text(l10n.techPageOutro, style: bodyStyle?.copyWith(fontStyle: FontStyle.italic)),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
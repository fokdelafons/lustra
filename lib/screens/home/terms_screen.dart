import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  Widget _buildFormattedText(BuildContext context, String text) {
    final defaultStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5, fontSize: 15);
    final boldStyle = defaultStyle?.copyWith(fontWeight: FontWeight.bold);
    final parts = text.split(RegExp(r'<\/?b>'));
    final spans = <TextSpan>[];
    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style: i.isOdd ? boldStyle : null,
      ));
    }
    return Text.rich(
      TextSpan(
        style: defaultStyle,
        children: spans,
      ),
      textAlign: TextAlign.justify,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final termsContent = l10n.termsOfServiceContent;
    final privacyPolicyContent = l10n.privacyPolicyContent;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.termsAndPrivacyTitle),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: l10n.termsOfServiceTab),
              Tab(text: l10n.privacyPolicyTab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  _buildFormattedText(context, termsContent),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  _buildFormattedText(context, privacyPolicyContent),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
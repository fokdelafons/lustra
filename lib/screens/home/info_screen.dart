import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../services/app_router.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // Treść ekranu (wspólna)
    final content = SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.infoTitle1,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(height: 1.4),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Text(
              l10n.infoParagraph1,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              l10n.infoTitle2,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(height: 1.4),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Text(
              l10n.infoParagraph2,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              l10n.infoTitle3,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(height: 1.4),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Text(
              l10n.infoParagraph3,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              l10n.infoTitle4,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(height: 1.4),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Text(
              l10n.infoParagraph4,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    context.smartNavigate('/info/tech');
                  },
                  child: Text(
                    l10n.linkHowTechnologyWorks,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.smartNavigate('/info/terms');
                  },
                  child: Text(
                    l10n.linkTermsAndPrivacy,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
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
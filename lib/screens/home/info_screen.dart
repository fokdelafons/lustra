import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/link.dart';
import '../../services/app_router.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
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
            
            Builder(
              builder: (context) {
                final lang = Localizations.localeOf(context).languageCode;
                
                Widget buildCtaCard(String? urlPath, IconData icon, String title, String subtitle, {VoidCallback? onTapFallback}) {
                  
                  Widget buildUi(VoidCallback? activeOnTap) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: activeOnTap,
                        borderRadius: BorderRadius.circular(8),
                        child: Ink(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 12,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(icon, size: 32, color: Theme.of(context).primaryColor),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      subtitle,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  if (urlPath != null) {
                    return Link(
                      uri: Uri.parse('https://www.lustra.news/$lang$urlPath'),
                      target: LinkTarget.blank,
                      builder: (context, followLink) {
                        return buildUi(followLink);
                      },
                    );
                  }

                  return buildUi(onTapFallback);
                }

                return Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFAFA),
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      buildCtaCard(null, Icons.memory, l10n.infoTechTitle, l10n.infoTechSubtitle, onTapFallback: () {
                        context.smartNavigate('/info/tech');
                      }),
                      const SizedBox(height: 16),
                      
                      buildCtaCard('/info/governance/', Icons.account_balance, l10n.infoGovTitle, l10n.infoGovSubtitle),
                      const SizedBox(height: 16),
                      buildCtaCard('/info/privacy-policy/', Icons.policy, l10n.infoPrivacyTitle, l10n.infoPrivacySubtitle),
                    ],
                  ),
                );
              },
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
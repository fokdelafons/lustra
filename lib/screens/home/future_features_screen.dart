import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FutureFeaturesScreen extends StatelessWidget {
  const FutureFeaturesScreen({super.key});

  Future<void> _launchVotingUrl(BuildContext context) async {
    // Link do Twojej społeczności (Reddit)
    final Uri url = Uri.parse('https://www.reddit.com/r/civicevolution/');
    
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch community page')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final content = SingleChildScrollView(
      padding: const EdgeInsets.all(24.0), // Nieco większy padding dla oddechu
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Nagłówek
          Text(
            l10n.futureFeaturesHeader,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
          
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),

          // 2. Przykładowe karty (Wizualizacja "co może być")
          Row(
            children: [
              Expanded(
                child: _FeatureItem(
                  title: l10n.futureFeatureSenate,
                  icon: Icons.account_balance, // Zmieniłem ikonę na bardziej pasującą do senatu
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _FeatureItem(
                  title: l10n.futureFeatureCitizenInitiative,
                  icon: Icons.groups, // Zmieniłem ikonę na pasującą do ludzi/inicjatyw
                ),
              ),
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.04),

          // 3. Tekst wyjaśniający (Manifest)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.withValues(alpha: 0.1)),
            ),
            child: Column(
              children: [
                const Icon(Icons.tips_and_updates_outlined, color: Colors.blue, size: 28),
                const SizedBox(height: 12),
                Text(
                  l10n.futureFeaturesDescription,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                ),
              ],
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.04),

          // 4. Przycisk CTA (Głosowanie)
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () => _launchVotingUrl(context),
              icon: const Icon(Icons.how_to_vote),
              label: Text(
                l10n.futureFeaturesVoteButton.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Opcjonalny dopisek o Reddicie, żeby użytkownik wiedział gdzie idzie
          Text(
            "Powered by r/CivicEvolution",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: (kIsWeb && MediaQuery.of(context).size.width > 1140)
          ? null
          : AppBar(
              title: Text(l10n.futureFeaturesScreenTitle),
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

class _FeatureItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _FeatureItem({
    required this.title,
    this.icon = Icons.lock_outline, // Domyślna ikona
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      height: 160, // Stała wysokość dla równości
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.grey[600],
              size: 30,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.comingSoon,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).primaryColor, // Kolor akcentu zamiast szarego
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
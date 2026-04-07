import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lustra/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../services/parliament_manager.dart';
import '../../widgets/web_link.dart';


class FutureFeaturesScreen extends StatelessWidget {
  const FutureFeaturesScreen({super.key});

  Future<void> _launchVotingUrl(BuildContext context) async {
    final Uri url = Uri.parse('https://www.reddit.com/r/civicevolution/');
    
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.errorLaunchUrl)),
        );
      }
    }
  }

  Widget _buildActionTile(BuildContext context, {required IconData icon, required String title, required String subtitle, required String path, int animDelayMs = 0}) {
    return WebLink(
      path: path,
      builder: (context, onTap) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Color(0x08000000), blurRadius: 8, offset: Offset(0, 4))],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(12),
              hoverColor: Theme.of(context).primaryColor.withValues(alpha: 0.05),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 4),
                          Text(subtitle, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
            ),
          ),
        ).animate().fade(duration: 400.ms, delay: animDelayMs.ms).slideX(begin: 0.05, end: 0, curve: Curves.easeOut);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final lang = Localizations.localeOf(context).languageCode;
    final manager = context.read<ParliamentManager>();
    final slug = manager.activeSlug;

    final content = SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WebLink(
              path: '/future/blueprint',
              builder: (context, onTap) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColor, 
                            Theme.of(context).primaryColor.withValues(alpha: 0.8)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).primaryColor.withValues(alpha: 0.4), 
                            blurRadius: 12, 
                            offset: const Offset(0, 6)
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.menu_book, size: 40, color: Colors.white),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(l10n.manualTitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                                const SizedBox(height: 4),
                                Text(l10n.manualSubtitle, style: const TextStyle(fontSize: 14, color: Colors.white70)),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18)
                              .animate(onPlay: (controller) => controller.repeat(reverse: true))
                              .moveX(begin: 0, end: 4, duration: 800.ms, curve: Curves.easeInOut),
                        ],
                      ),
                    ),
                  ),
                ).animate()
                 .fade(duration: 500.ms)
                 .scale(begin: const Offset(0.95, 0.95), curve: Curves.easeOut)
                 .shimmer(delay: 1.seconds, duration: 1200.ms, color: Colors.white30);
              },
            ),
            
            const SizedBox(height: 32),

            Text(
              l10n.howToActTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ).animate().fade(duration: 400.ms, delay: 100.ms),
            const SizedBox(height: 16),
            
            _buildActionTile(
              context,
              icon: Icons.how_to_vote,
              title: l10n.actAuditTitle,
              subtitle: l10n.actAuditSubtitle,
              path: '/future/audit',
              animDelayMs: 200,
            ),
            
            _buildActionTile(
              context,
              icon: Icons.playlist_add_check,
              title: l10n.actWatchlistTitle,
              subtitle: l10n.actWatchlistSubtitle,
              path: '/future/watchlists',
              animDelayMs: 300,
            ),
            
            _buildActionTile(
              context,
              icon: Icons.history_edu,
              title: l10n.actDraftTitle,
              subtitle: l10n.actDraftSubtitle,
              path: '/$lang/$slug/civic-project',
              animDelayMs: 400,
            ),
            
            const SizedBox(height: 32),
            
            Text(
              l10n.joinCommunityTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _launchVotingUrl(context),
                    icon: const Icon(Icons.forum),
                    label: const Text("Reddit"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: const Color(0xFFFF4500),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final url = Uri.parse('https://matrix.to/#/#lustra:matrix.org'); 
                      try {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      } catch (e) {
                        debugPrint('Could not launch Matrix link');
                      }
                    },
                    icon: const Icon(Icons.chat),
                    label: const Text("Matrix"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
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

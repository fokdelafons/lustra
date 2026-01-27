import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../services/payment_service.dart';
import '../../services/remote_config_service.dart';

class SupportProjectScreen extends StatefulWidget {
  const SupportProjectScreen({super.key});

  @override
  State<SupportProjectScreen> createState() => _SupportProjectScreenState();
}

class _SupportProjectScreenState extends State<SupportProjectScreen> {
  late PaymentService _paymentService;
  
  // Twój link Stripe (USD)
  final String _stripeLink = 'https://buy.stripe.com/4gM9AT9DX8AMfqb8bTbfO00';

  @override
  void initState() {
    super.initState();
    _paymentService = PaymentService();
  }

  @override
  void dispose() {
    _paymentService.dispose();
    super.dispose();
  }

  Future<void> _launchStripe() async {
    final Uri url = Uri.parse(_stripeLink);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $_stripeLink');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final content = SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- GÓRA: MISJA ---
            Icon(
              Icons.shield_outlined,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.supportMegaTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.supportParagraph1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),

            // --- SZYBKIE WSPARCIE (WEB + MOBILE) ---
            Text(
              l10n.supportQuickTitle, 
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            if (kIsWeb) ...[
              // WEB: Stripe
              ElevatedButton.icon(
                onPressed: _launchStripe,
                icon: const Icon(Icons.favorite_border),
                label: Text(l10n.supportStripeButton),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ] else ...[
              // MOBILE: IAP
              ChangeNotifierProvider.value(
                value: _paymentService,
                child: Consumer<PaymentService>(
                  builder: (context, paymentService, child) {
                    if (paymentService.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!paymentService.isAvailable) {
                      return Text(l10n.supportPaymentsUnavailable);
                    }
                    if (paymentService.products.isEmpty) {
                      return Text(l10n.supportNoProducts);
                    }
                    return Wrap(
                      spacing: 12.0,
                      runSpacing: 12.0,
                      alignment: WrapAlignment.center,
                      children: paymentService.products.map((product) {
                        return ElevatedButton(
                          onPressed: () {
                            paymentService.buy(product);
                          },
                          child: Text(product.price),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],

            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            
// --- KAMPANIE CELOWE (PRZYWRÓCONY "SZARY PRZYCISK") ---
            Builder(
              builder: (context) {
                final remoteConfigService = context.watch<RemoteConfigService>();
                final String campaignUrl = remoteConfigService.getString('kickstarter_campaign_url');
                final bool isCampaignActive = remoteConfigService.getBool('is_kickstarter_campaign_active');
                
                // Logika: Przycisk aktywny tylko gdy flaga włączona I link nie jest pusty
                final bool isButtonEnabled = isCampaignActive && campaignUrl.isNotEmpty;

                return Column(
                  children: [
                    const Divider(),
                    const SizedBox(height: 20),
                    Text(
                      l10n.supportCampaignsTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.supportCampaignsDescription,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: isButtonEnabled
                          ? () async {
                              final Uri url = Uri.parse(campaignUrl);
                              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Could not launch $campaignUrl')),
                                );
                              }
                            }
                          : null, // NULL wyłącza przycisk (robi go szarym)
                      icon: const Icon(Icons.open_in_new),
                      label: Text(
                        isCampaignActive
                            ? l10n.supportCampaignsButtonActive
                            : l10n.supportCampaignsButtonInactive,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isButtonEnabled ? null : Colors.grey,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  ],
                );
              },
            ),
            const Divider(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            // --- FOUNDER (SIDE-BY-SIDE) ---
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/ja.jpg'),
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.creatorName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      l10n.creatorTitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      l10n.supportFounderMessage,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                        height: 1.4
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text(
              l10n.supportThankYou,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

    return Scaffold(
      appBar: (kIsWeb && MediaQuery.of(context).size.width > 1140) ? null : AppBar(
        title: Text(l10n.supportScreenTitle),
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
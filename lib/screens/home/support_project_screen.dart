import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lustra/l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../services/payment_service.dart';
import '../../services/remote_config_service.dart';
import '../../widgets/osint_loader.dart';


class SupportProjectScreen extends StatefulWidget {
  const SupportProjectScreen({super.key});

  @override
  State<SupportProjectScreen> createState() => _SupportProjectScreenState();
}

class _SupportProjectScreenState extends State<SupportProjectScreen> {
  late PaymentService _paymentService;
  
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

  Widget _buildFundraisingHub(BuildContext context, AppLocalizations l10n) {
    return Builder(
      builder: (context) {
        final remoteConfig = context.watch<RemoteConfigService>();
        
        final currentStr = remoteConfig.getString('foundation_current');
        final targetStr = remoteConfig.getString('foundation_target');
        
        final double current = double.tryParse(currentStr) ?? 27.0;
        final double target = (double.tryParse(targetStr) ?? 2000.0).clamp(1.0, double.infinity);
        final double progress = (current / target).clamp(0.0, 1.0);

        return Container(
          margin: const EdgeInsets.only(top: 32.0, bottom: 16.0),
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Theme.of(context).primaryColor.withValues(alpha: 0.2)),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.flag_rounded, color: Theme.of(context).primaryColor, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      l10n.supportFundTitle,
                      style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                l10n.supportFundDesc,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 15, height: 1.6),
              ),
              const SizedBox(height: 32),
              
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: progress),
                duration: const Duration(milliseconds: 2000),
                curve: Curves.easeOutCubic,
                builder: (context, value, _) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: LinearProgressIndicator(
                          value: value,
                          minHeight: 16,
                          backgroundColor: Colors.grey.shade200,
                          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${(value * target).toInt()}",
                            style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 22, fontFamily: 'monospace'),
                          ),
                          Text(
                            "Target: \$${target.toInt()}",
                            style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'monospace'),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Divider(),
              ),

              if (kIsWeb) ...[
                ElevatedButton.icon(
                  onPressed: _launchStripe,
                  icon: const Icon(Icons.favorite, color: Colors.white)
                      .animate(onPlay: (c) => c.repeat(reverse: true))
                      .scaleXY(end: 1.15, duration: 800.ms, curve: Curves.easeInOut),
                  label: Text(l10n.supportStripeButton),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ).animate().fade(delay: 400.ms).scaleXY(begin: 0.95),
              ] else ...[
                ChangeNotifierProvider.value(
                  value: _paymentService,
                  child: Consumer<PaymentService>(
                    builder: (context, paymentService, child) {
                      if (paymentService.isLoading) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0), 
                            child: OsintLoader(text: l10n.loaderSecuringSafeChannel)
                          )
                        );
                      }
                      if (!paymentService.isAvailable) {
                        return Center(child: Text(l10n.supportPaymentsUnavailable, style: TextStyle(color: Colors.grey.shade600)));
                      }
                      if (paymentService.products.isEmpty) {
                        return Center(child: Text(l10n.supportNoProducts, style: TextStyle(color: Colors.grey.shade600)));
                      }
                      return Wrap(
                        spacing: 12.0,
                        runSpacing: 12.0,
                        alignment: WrapAlignment.center,
                        children: paymentService.products.map((product) {
                          return ElevatedButton.icon(
                            onPressed: () => paymentService.buy(product),
                            icon: const Icon(Icons.favorite, color: Colors.white)
                                .animate(onPlay: (c) => c.repeat(reverse: true))
                                .scaleXY(end: 1.15, duration: 800.ms),
                            label: Text(product.price),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          );
                        }).toList(),
                      ).animate().fade(delay: 400.ms).scaleXY(begin: 0.95);
                    },
                  ),
                ),
              ],

              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Colors.grey.shade400, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.supportFundDisclaimer,
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              )
            ],
          ),
        ).animate().fade(duration: 800.ms, delay: 200.ms).slideY(begin: 0.05, curve: Curves.easeOut);
      },
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
              // --- HERO HEADER (Standard Protocol) ---
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
                      child: const Text("SUPPORT INITIATIVE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 12)),
                    ).animate().fade().scale(),
                    const SizedBox(height: 16),
                    Text(
                      l10n.supportMegaTitle,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900, color: Colors.black87, height: 1.2),
                    ).animate().fade(delay: 100.ms).slideX(),
                  ],
                ),
              ),

              // --- INTRO PARAGRAPH ---
              Text(
                l10n.supportParagraph1,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6, color: Colors.grey.shade800),
              ).animate().fade(delay: 200.ms).slideX(),
            
            _buildFundraisingHub(context, l10n),

            // --- FOUNDER SIGNATURE ---
            LayoutBuilder(
              builder: (context, constraints) {
                final bool isDesktop = constraints.maxWidth > 650;

                final profileWidget = Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('assets/ja.jpg'),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.creatorName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        l10n.creatorTitle.toUpperCase(),
                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                      ),
                    ),
                  ],
                );

                final quoteWidget = Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
                    border: Border(left: BorderSide(color: Theme.of(context).primaryColor, width: 4)),
                    borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
                  ),
                  child: Text(
                    "\"${l10n.supportFounderMessage}\"",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                      fontSize: 14,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );

                if (isDesktop) {
                  return Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        profileWidget,
                        const SizedBox(width: 40),
                        Expanded(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: quoteWidget,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(child: profileWidget),
                        const SizedBox(height: 24),
                        quoteWidget,
                      ],
                    ),
                  );
                }
              },
            ).animate().fade(duration: 800.ms, delay: 600.ms),
          ],
        ),
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
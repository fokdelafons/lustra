import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lustra/services/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<bool> checkVerificationOrShowDialog(BuildContext context) async {
  final authService = Provider.of<AuthService>(context, listen: false);
  final l10n = AppLocalizations.of(context)!; 
  
  bool isVerified = await authService.checkEmailVerified();
  
  if (isVerified) {
    return true;
  }

  if (!context.mounted) return false;
  
  await showDialog(
    context: context,
    builder: (ctx) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: Container(
        width: 450,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.mark_email_unread_outlined, color: Theme.of(context).primaryColor, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.verificationRequiredTitle, 
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              l10n.verificationRequiredContent,
              style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.4),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                // Subtelny przycisk wyjścia po lewej (lub kliknięcie w tło)
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: Text(l10n.cancel, style: const TextStyle(color: Colors.grey)),
                ),
                const Spacer(),
                // Prawa strona to akcje
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                    foregroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: () async {
                    await authService.sendVerificationEmail();
                    if (ctx.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.verificationLinkSentSuccess)),
                      );
                    }
                  },
                  child: Text(l10n.verificationResendLink),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: () async {
                    final success = await authService.checkEmailVerified();
                    if (ctx.mounted) {
                      Navigator.of(ctx).pop();
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.verificationSuccessVotingUnlocked)),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text(l10n.verificationStillNotVerified)),
                        );
                      }
                    }
                  },
                  child: Text(l10n.verificationAlreadyConfirmed),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  return await authService.checkEmailVerified();
}
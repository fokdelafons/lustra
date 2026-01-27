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
    builder: (ctx) => AlertDialog(
      title: Text(l10n.verificationRequiredTitle),
      content: Text(l10n.verificationRequiredContent),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: Text(l10n.cancel, style: const TextStyle(color: Colors.grey)),
        ),
        TextButton(
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
        ElevatedButton(
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
  );

  return await authService.checkEmailVerified();
}
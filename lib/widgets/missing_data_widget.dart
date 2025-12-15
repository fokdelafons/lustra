import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Potrzebne do Clipboard
import 'package:lustra/services/parliament_service_interface.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'dart:developer' as developer;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MissingDataWidget extends StatelessWidget {
  final MissingDataAction action;

  const MissingDataWidget({
    super.key,
    required this.action,
  });

  Future<void> _launchEmail(BuildContext context) async {
    final template = action.emailTemplate;
    
    final Email email = Email(
      body: template.body,
      subject: template.subject,
      recipients: [template.recipient],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (e) {
      developer.log('Failed to launch email client: $e', name: 'MissingDataWidget');
      // Zamiast SnackBara, pokazujemy Dialog z danymi do skopiowania
      if (context.mounted) {
        _showManualEmailDialog(context, template);
      }
    }
  }

  void _showManualEmailDialog(BuildContext context, EmailTemplate template) {
    final l10n = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.manualEmailDialogTitle),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.manualEmailDialogDescription, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 16),
                
                _buildCopyField(ctx, l10n.labelRecipient, template.recipient),
                const SizedBox(height: 12),
                _buildCopyField(ctx, l10n.labelSubject, template.subject),
                const SizedBox(height: 12),
                _buildCopyField(ctx, l10n.labelBody, template.body, isMultiline: true),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.actionCancel), // Używamy "Anuluj" lub "Zamknij" jeśli masz taki klucz
          ),
        ],
      ),
    );
  }

  Widget _buildCopyField(BuildContext context, String label, String content, {bool isMultiline = false}) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            crossAxisAlignment: isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SelectableText(
                  content,
                  style: const TextStyle(fontSize: 14),
                  maxLines: isMultiline ? 10 : 1,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.copy, size: 20),
                tooltip: l10n.actionCopy,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: content));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l10n.copiedToClipboard),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        border: Border.all(color: Colors.orange.shade200),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange.shade700,
            size: 40,
          ),
          const SizedBox(height: 12),
          Text(
            action.userMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 15,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.outgoing_mail),
            label: Text(action.buttonText),
            onPressed: () => _launchEmail(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
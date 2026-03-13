import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../services/api_service.dart';
import '../../widgets/osint_loader.dart';
import 'package:provider/provider.dart';
import '../services/parliament_manager.dart';
import '../providers/language_provider.dart';

// Helper function to show the dialog
void showErrorReportDialog({
  required BuildContext context,
  required String targetId,
  required String targetType,
  required String sourceId,
}) {
  final TextEditingController reportController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  final mainContext = context; 
  bool isSending = false;
  bool includeDiagnostics = false;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return StatefulBuilder(
        builder: (context, setDialogState) {
          final l10n = AppLocalizations.of(mainContext)!;
          
          return AlertDialog(
            title: Text(l10n.reportErrorButton),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isSending) ...[
                    Text(l10n.reportErrorDescription),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: reportController,
                      maxLines: 4,
                      maxLength: 400,
                      decoration: InputDecoration(
                        hintText: l10n.reportErrorHint,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return l10n.reportErrorValidationEmpty;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CheckboxListTile(
                      title: const Text("Include system diagnostics", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), // TODO: l10n
                      subtitle: Text("Attaches active state (Parliament, Term, Target) to help us patch the issue.", style: TextStyle(fontSize: 12, color: Colors.grey[600])), // TODO: l10n
                      value: includeDiagnostics,
                      onChanged: (val) {
                        setDialogState(() {
                          includeDiagnostics = val ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ] else ...[
                    const SizedBox(
                      height: 120,
                      child: Center(
                        // TARCZA: OSINT Loader w akcji
                        child: OsintLoader(text: "SENDING REPORT..."), //TODO
                      ),
                    ),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: isSending ? null : () => Navigator.of(dialogContext).pop(),
                child: Text(l10n.actionCancel),
              ),
              if (!isSending)
                ElevatedButton(
                  onPressed: () async {
                    if (!(formKey.currentState?.validate() ?? false)) {
                      return;
                    }
                    setDialogState(() {
                      isSending = true;
                    });

                    final navigator = Navigator.of(dialogContext);
                    final messenger = ScaffoldMessenger.of(mainContext);

                    try {
                      // TARCZA: Zbieranie logów systemu
                      Map<String, dynamic>? diagnostics;
                      if (includeDiagnostics) {
                        try {
                          final manager = Provider.of<ParliamentManager>(mainContext, listen: false);
                          final lang = Provider.of<LanguageProvider>(mainContext, listen: false).appLanguageCode;
                          diagnostics = {
                            'active_parliament': manager.activeServiceId ?? 'UNKNOWN',
                            'term': manager.currentTerm ?? 0,
                            'language': lang,
                            'timestamp': DateTime.now().toIso8601String(),
                          };
                        } catch (e) {
                          diagnostics = {'error': 'Failed to build diagnostics matrix'};
                        }
                      }

                      final apiService = ApiService();
                      await apiService.callFunction(
                        'reportError',
                        params: {
                          'targetId': targetId,
                          'targetType': targetType,
                          'message': reportController.text.trim(),
                          'source': sourceId,
                          // Jeśli są diagnostyki, backend dostanie dodatkowy klucz z JSON-em
                          if (diagnostics != null) 'diagnostics': diagnostics, 
                        },
                      );
                      if (navigator.context.mounted) navigator.pop();
                      messenger.showSnackBar(
                        SnackBar(content: Text(l10n.reportErrorSuccess), backgroundColor: Colors.green),
                      );
                    } on FirebaseFunctionsException catch (e) {
                      if (navigator.context.mounted) navigator.pop();
                      String errorMessage;
                      if (e.code == 'resource-exhausted') {
                        errorMessage = l10n.reportErrorRateLimitExceeded;
                      } else {
                        errorMessage = e.message ?? l10n.errorFailedToLoadData;
                      }
                      messenger.showSnackBar(
                        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
                      );
                    } catch (e) {
                       if (navigator.context.mounted) navigator.pop();
                       messenger.showSnackBar(
                          SnackBar(content: Text(l10n.errorFailedToLoadData), backgroundColor: Colors.red),
                        );
                    }
                  },
                  child: Text(l10n.actionSend),
                ),
            ],
          );
        },
      );
    },
  );
}
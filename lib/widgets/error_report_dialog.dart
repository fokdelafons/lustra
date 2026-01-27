import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../services/api_service.dart';

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
                  ] else ...[
                    const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
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
                      final apiService = ApiService();
                      await apiService.callFunction(
                        'reportError',
                        params: {
                          'targetId': targetId,
                          'targetType': targetType,
                          'message': reportController.text.trim(),
                          'source': sourceId,
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
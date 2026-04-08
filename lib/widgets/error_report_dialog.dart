import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:lustra/l10n/app_localizations.dart';
import '../services/api_service.dart';
import '../../widgets/osint_loader.dart';
import 'package:provider/provider.dart';
import '../services/parliament_manager.dart';
import '../providers/language_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:package_info_plus/package_info_plus.dart';

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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Row(
              children: [
                Icon(Icons.bug_report_outlined, color: Theme.of(mainContext).primaryColor),
                const SizedBox(width: 8),
                Text(l10n.reportErrorButton, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
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
                        filled: true,
                        fillColor: Theme.of(mainContext).brightness == Brightness.dark 
                            ? Colors.white.withValues(alpha: 0.05) 
                            : Colors.grey.withValues(alpha: 0.08),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Theme.of(mainContext).primaryColor, width: 1.5),
                        ),
                        contentPadding: const EdgeInsets.all(16),
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
                      title: Text(l10n.reportIncludeDiagnosticsTitle, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                      subtitle: Text(l10n.reportIncludeDiagnosticsSubtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      value: includeDiagnostics,
                      activeColor: Theme.of(mainContext).primaryColor,
                      visualDensity: VisualDensity.compact,
                      onChanged: (val) {
                        setDialogState(() {
                          includeDiagnostics = val ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ] else ...[
                    SizedBox(
                      height: 120,
                      child: Center(
                        child: OsintLoader(text: l10n.loaderSendingReport),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey[600],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: isSending ? null : () => Navigator.of(dialogContext).pop(),
                child: Text(l10n.actionCancel, style: const TextStyle(fontWeight: FontWeight.w500)),
              ),
              if (!isSending)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 0,
                    backgroundColor: Theme.of(mainContext).primaryColor,
                    foregroundColor: Colors.white,
                  ),
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
                      Map<String, dynamic>? diagnostics;
                      if (includeDiagnostics) {
                        try {
                          final manager = Provider.of<ParliamentManager>(mainContext, listen: false);
                          final lang = Provider.of<LanguageProvider>(mainContext, listen: false).appLanguageCode;
                          final platformName = Theme.of(mainContext).platform.name;
                          final screenSize = MediaQuery.sizeOf(mainContext);
                          
                          final packageInfo = await PackageInfo.fromPlatform();
                          final appVersion = '${packageInfo.version}+${packageInfo.buildNumber}';

                          diagnostics = {
                            'active_parliament': manager.activeServiceId ?? 'UNKNOWN',
                            'term': manager.currentTerm ?? 0,
                            'language': lang,
                            'app_version': appVersion,
                            'sys_is_web': kIsWeb,
                            'sys_ui_platform': platformName,
                            'sys_screen_resolution': '${screenSize.width.toInt()}x${screenSize.height.toInt()}',
                            'timestamp': DateTime.now().toIso8601String(),
                          };
                        } catch (e) {
                          diagnostics = {'error': 'Failed to build diagnostics matrix: ${e.toString()}'};
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
                          if (diagnostics != null) 'diagnostics': diagnostics, 
                        },
                      );
                      
                      if (!mainContext.mounted) return;
                      navigator.pop();
                      
                      messenger.showSnackBar(
                        SnackBar(content: Text(l10n.reportErrorSuccess), backgroundColor: Colors.green),
                      );
                    } on FirebaseFunctionsException catch (e) {
                      if (!mainContext.mounted) return;
                      navigator.pop();
                      
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
                       if (!mainContext.mounted) return;
                       navigator.pop();
                       
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
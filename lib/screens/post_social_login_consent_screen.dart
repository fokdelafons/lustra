import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../services/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../services/parliament_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/app_router.dart';

class PostSocialLoginConsentScreen extends StatefulWidget {
  final User user;

  const PostSocialLoginConsentScreen({super.key, required this.user});

  @override
  State<PostSocialLoginConsentScreen> createState() => _PostSocialLoginConsentScreenState();
}

class _PostSocialLoginConsentScreenState extends State<PostSocialLoginConsentScreen> {
  bool _termsAccepted = false;
  bool _marketingConsent = false;
  bool _isLoading = false;
  String? _errorMessage;
  String? _selectedParliamentId;
  final _formKey = GlobalKey<FormState>();

  Future<void> _completeRegistration() async {
    final l10n = AppLocalizations.of(context)!;
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    if (!_termsAccepted) {
      setState(() {
        _errorMessage = l10n.validatorAcceptTerms;
      });
      return;
    }
    setState(() { _isLoading = true; _errorMessage = null; });
    try {
      final authService = Provider.of<AuthService>(context, listen: false);
      await authService.completeOnboarding(
        marketingConsent: _marketingConsent,
        parliamentId: _selectedParliamentId!,
      );
      if (mounted) {
        await FirebaseAuth.instance.currentUser?.getIdToken(true);
        if (!mounted) return;
        context.go('/'); 
      }
    } catch (e) {
      setState(() { 
        _errorMessage = l10n.authErrorUnexpected; 
        _isLoading = false;
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.registrationFinishTitle),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.welcomeMessage,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.finalStepMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),
                  Consumer<ParliamentManager>(
                    builder: (context, parliamentManager, child) {
                      return DropdownButtonFormField<String>(
                        value: _selectedParliamentId,
                        decoration: InputDecoration(
                          labelText: l10n.selectYourParliament,
                          border: const OutlineInputBorder(),
                        ),
                        items: parliamentManager.availableServices.map((service) {
                          return DropdownMenuItem<String>(
                            value: service.name,
                            child: Row(
                              children: [
                                SvgPicture.asset(service.flagAssetPath, height: 20),
                                const SizedBox(width: 10),
                                Text(service.name),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedParliamentId = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.validatorSelectParliament;
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                CheckboxListTile(
                  title: GestureDetector(
                    onTap: () => context.smartNavigate('/terms'),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14, color: _errorMessage != null ? Theme.of(context).colorScheme.error : Colors.grey[700]),
                        children: [
                          TextSpan(text: '${l10n.acceptTermsPrefix} '),
                          TextSpan(text: l10n.termsAndConditions, style: const TextStyle(decoration: TextDecoration.underline)),
                          const TextSpan(text: ' *'),
                        ],
                      ),
                    ),
                  ),
                  value: _termsAccepted,
                  onChanged: (v) => setState(() => _termsAccepted = v ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
                CheckboxListTile(
                  title: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      children: [
                        TextSpan(text: '${l10n.joinSupportClubPrefix} '),
                        TextSpan(text: l10n.supportClub, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(l10n.supportClubDescription, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ),
                  value: _marketingConsent,
                  onChanged: (v) => setState(() => _marketingConsent = v ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 24),
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(_errorMessage!, style: TextStyle(color: Theme.of(context).colorScheme.error), textAlign: TextAlign.center),
                  ),
                if (_isLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  ElevatedButton(
                    onPressed: _completeRegistration,
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                    child: Text(l10n.continueButton),
                  ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
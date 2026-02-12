import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../services/parliament_manager.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../providers/user_provider.dart';
import 'dart:developer' as developer;


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _mode = 'login'; // 'login', 'register', 'onboarding'
  var _isLoading = false;
  var _isGoogleLoading = false;
  var _isFacebookLoading = false;
  var _isAppleLoading = false;
  String? _errorMessage;
  String? _selectedParliamentId;

  bool _termsAccepted = false;
  bool _marketingConsent = false;
  bool _termsValidationError = false; 

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      FacebookAuth.instance.webAndDesktopInitialize(
        appId: "1388465905793451",
        cookie: true,
        xfbml: true,
        version: "v23.0",
      );
    }
  }

@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final queryMode = GoRouterState.of(context).uri.queryParameters['mode'];
    if (queryMode != null && ['login', 'register', 'onboarding'].contains(queryMode)) {
      setState(() {
        _mode = queryMode;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context)!;
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    if (_mode != 'onboarding' && _mode != 'login' && !_termsAccepted) {
      setState(() {
        _termsValidationError = true;
        _errorMessage = l10n.validatorAcceptTerms;
      });
      return;
    }
    
    if (_mode == 'onboarding' && !_termsAccepted) {
       setState(() {
        _termsValidationError = true;
        _errorMessage = l10n.validatorAcceptTerms;
      });
      return;
    }

    _formKey.currentState!.save();
 
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _termsValidationError = false;
    });
 
    String? authError;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
 
    try {
      final authService = Provider.of<AuthService>(context, listen: false);
      
      if (_mode == 'login') {
        await authService.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else if (_mode == 'register') {
        userProvider.setOnboardingStatus(true);

        await authService.signUpWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        await userProvider.createProfile(
          marketingConsent: _marketingConsent,
          parliamentId: _selectedParliamentId!,
        );
      } else if (_mode == 'onboarding') {
        userProvider.setOnboardingStatus(true);
        
        await userProvider.createProfile(
          marketingConsent: _marketingConsent,
          parliamentId: _selectedParliamentId!,
        );
      }
    } on FirebaseAuthException catch (e) {
      userProvider.setOnboardingStatus(false);
      switch (e.code) {
        case 'invalid-credential':
        case 'user-not-found':
        case 'wrong-password':
          authError = l10n.authErrorInvalidCredentials;
          break;
        case 'email-already-in-use':
          authError = l10n.authErrorEmailInUse;
          break;
        case 'weak-password':
          authError = l10n.authErrorWeakPassword;
          break;
        case 'no-user': 
          authError = "Sesja wygasła. Zaloguj się ponownie.";
          break;
        default:
          authError = l10n.authErrorDefault;
      }
    } catch (e) {
      userProvider.setOnboardingStatus(false);
      authError = l10n.authErrorUnexpected;
      developer.log("Error during submit: $e", name: "LoginScreen");
    }
 
    if (mounted) {
      setState(() {
        _isLoading = false;
        _errorMessage = authError;
      });
    }
    if (authError == null && mounted) {
      _handleSmartNavigation();
    }
  }

  Future<void> _forgotPassword() async {
    final l10n = AppLocalizations.of(context)!;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final authService = Provider.of<AuthService>(context, listen: false);
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text(l10n.validatorInvalidEmail)),
      );
      return;
    }
    setState(() { _isLoading = true; _errorMessage = null; });
    try {
      await authService.sendPasswordResetEmail(email: email);
      if (!mounted) return;
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text(l10n.passwordResetEmailSent)),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _errorMessage = l10n.authErrorUserNotFound;
      } else {
        _errorMessage = l10n.authErrorDefault;
      }
    } catch (e) {
      _errorMessage = l10n.authErrorUnexpected;
    } finally {
      if (mounted) {
        setState(() { _isLoading = false; });
      }
    }
  }

 Future<void> _signInWithGoogle() async {
    final l10n = AppLocalizations.of(context)!;
    final authService = Provider.of<AuthService>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    setState(() { _isGoogleLoading = true; _errorMessage = null; });
    userProvider.setOnboardingStatus(true);
    try {
      await authService.signInWithGoogle();
      if (!mounted) return;
      final bool hasProfile = await authService.hasCompletedProfile();
      if (!mounted) return;
      if (hasProfile) {
        userProvider.setOnboardingStatus(false);
        _handleSmartNavigation();
      } else {
        final user = authService.currentUser;
        if (user != null) {
          setState(() {
            _mode = 'onboarding';
            _errorMessage = null;
          });
        }
      }
    } on FirebaseAuthException catch (e) {
      userProvider.setOnboardingStatus(false);
      if (e.code == 'account-exists-with-different-credential') {
        _errorMessage = l10n.authErrorAccountExists;
      } else if (e.code != 'sign-in-cancelled') {
        _errorMessage = l10n.authErrorGoogleFailed;
      }
    } catch (e, s) {
      userProvider.setOnboardingStatus(false);
      developer.log('Google Sign-In Error in UI', name: 'LoginScreen', error: e, stackTrace: s);
      _errorMessage = '${l10n.authErrorGoogleFailed}: ${e.toString()}';
    } finally {
      if (mounted) {
        setState(() { _isGoogleLoading = false; });
      }
    }
  }

  Future<void> _signInWithFacebook() async {
    final l10n = AppLocalizations.of(context)!;
    final authService = Provider.of<AuthService>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    setState(() { _isFacebookLoading = true; _errorMessage = null; });
    userProvider.setOnboardingStatus(true); 
    try {
      await authService.signInWithFacebook();
      if (!mounted) return;
      final bool hasProfile = await authService.hasCompletedProfile();
      if (!mounted) return;
      if (hasProfile) {
        userProvider.setOnboardingStatus(false);
        await userProvider.refreshProfile();
        _handleSmartNavigation();
      } else {
        setState(() {
          _mode = 'onboarding';
          _errorMessage = null;
        });
      }
    } on FirebaseAuthException catch (e) {
      userProvider.setOnboardingStatus(false);
      developer.log('Facebook Auth Error', name: 'LoginScreen', error: e);
      if (e.code == 'account-exists-with-different-credential') {
        _errorMessage = l10n.authErrorAccountExists;
      } else if (e.code != 'sign-in-cancelled') {
        _errorMessage = '${l10n.authErrorFacebookFailed}: ${e.message}';
      }
    } catch (e, s) {
      userProvider.setOnboardingStatus(false);
      developer.log('Facebook Generic Error', name: 'LoginScreen', error: e, stackTrace: s);
      _errorMessage = '${l10n.authErrorFacebookFailed}: ${e.toString()}';
    } finally {
      if (mounted) {
        setState(() { _isFacebookLoading = false; });
      }
    }
  }

 Future<void> _signInWithApple() async {
		final l10n = AppLocalizations.of(context)!;
		final authService = Provider.of<AuthService>(context, listen: false);
        final userProvider = Provider.of<UserProvider>(context, listen: false);
		setState(() { _isAppleLoading = true; _errorMessage = null; });
        userProvider.setOnboardingStatus(true);
		try {
			await authService.signInWithApple();
			if (!mounted) return;
			final bool hasProfile = await authService.hasCompletedProfile();
			if (!mounted) return;
			if (hasProfile) {
                userProvider.setOnboardingStatus(false);
                _handleSmartNavigation();
			} else {
				final user = authService.currentUser;
                if (user != null) {
                    setState(() {
                        _mode = 'onboarding';
                        _errorMessage = null;
                    });
                }
			}
		} on FirebaseAuthException catch (e) {
            userProvider.setOnboardingStatus(false);
            developer.log('Apple FirebaseAuthException in UI', name: 'LoginScreen', error: e, stackTrace: e.stackTrace);
			if (e.code == 'account-exists-with-different-credential') {
				_errorMessage = l10n.authErrorAccountExists;
			} else if (e.code != 'sign-in-cancelled') {
				_errorMessage = '${l10n.authErrorAppleFailed}: ${e.message} (${e.code})';
			}
		} catch (e, s) {
            userProvider.setOnboardingStatus(false);
            developer.log('Apple Sign-In Generic Error in UI', name: 'LoginScreen', error: e, stackTrace: s);
			_errorMessage = '${l10n.authErrorAppleFailed}: ${e.toString()}';
		} finally {
			if (mounted) {
				setState(() { _isAppleLoading = false; });
			}
		}
	}

  Widget _buildFacebookButton(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
      return ElevatedButton(
        onPressed: _signInWithFacebook,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1877F2),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(l10n.continueWithFacebook),
      );
    } else {
      return ElevatedButton.icon(
        icon: const Icon(Icons.facebook, color: Colors.white),
        label: Text(l10n.continueWithFacebook),
        onPressed: _signInWithFacebook,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1877F2),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      );
    }
  }

@override
Widget build(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  return Scaffold(
    appBar: AppBar(
      title: Text(_mode == 'login' 
          ? l10n.loginScreenTitle 
          : (_mode == 'register' ? l10n.registrationScreenTitle : l10n.registrationFinishTitle)),
      automaticallyImplyLeading: _mode != 'onboarding',
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
                if (_mode == 'onboarding') ...[
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
                ],
                if (_mode != 'onboarding') ...[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: l10n.emailLabel, border: const OutlineInputBorder()),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty || !value.contains('@')) {
                      return l10n.validatorInvalidEmail;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: l10n.passwordLabel, border: const OutlineInputBorder()),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().length < 6) {
                      return l10n.validatorPasswordTooShort;
                    }
                    return null;
                  },
                ),
                ], // End of non-onboarding fields
                if (_mode == 'login')
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _forgotPassword,
                      child: Text(l10n.forgotPasswordButton),
                    ),
                  ),
                if (_mode != 'login') ...[
                  const SizedBox(height: 16),
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
                      onTap: () {
                        context.push('/terms');
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 14, color: _termsValidationError ? Theme.of(context).colorScheme.error : Colors.grey[700]),
                          children: [
                            TextSpan(text: '${l10n.acceptTermsPrefix} '),
                            TextSpan(
                              text: l10n.termsAndConditions,
                              style: const TextStyle(decoration: TextDecoration.underline),
                            ),
                            const TextSpan(text: ' *'),
                          ],
                        ),
                      ),
                    ),
                    value: _termsAccepted,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _termsAccepted = newValue ?? false;
                        if (_termsAccepted) {
                          _termsValidationError = false;
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    activeColor: _termsValidationError ? Theme.of(context).colorScheme.error : null,
                  ),
                  CheckboxListTile(
                    title: RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          children: [
                            TextSpan(text: '${l10n.joinSupportClubPrefix} '),
                            TextSpan(
                              text: l10n.supportClub,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        l10n.supportClubDescription,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ),
                    value: _marketingConsent,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _marketingConsent = newValue ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
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
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                    child: Text(_mode == 'login' 
                        ? l10n.loginButton 
                        : (_mode == 'register' ? l10n.registerButton : l10n.continueButton)),
                  ),
                const SizedBox(height: 16),
                if (_mode == 'login') ...[
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(l10n.orDivider),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 16),
                if (_isGoogleLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  ElevatedButton.icon(
                    icon: SvgPicture.asset('assets/google_logo.svg', height: 22),
                    label: Text(l10n.continueWithGoogle),
                    onPressed: _signInWithGoogle,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFF1F1F1F),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF747775)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                if (_isFacebookLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  _buildFacebookButton(context),
                  const SizedBox(height: 16),
                  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) ...[
                    if (_isAppleLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      ElevatedButton.icon(
                        icon: const Icon(Icons.apple, color: Colors.white),
                        label: Text(l10n.continueWithApple),
                        onPressed: _signInWithApple,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                  ],
                ], // End of social login block
                if (_mode != 'onboarding')
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _mode = _mode == 'login' ? 'register' : 'login';
                        _errorMessage = null;
                      });
                    },
                    child: Text(_mode == 'login' ? l10n.promptToRegister : l10n.promptToLogin),
                  ),
              ],
            ),
          ),
        ),
      ),
  ));
  }
  void _handleSmartNavigation() {
    if (!mounted) return;
    final nextParam = GoRouterState.of(context).uri.queryParameters['next'];
    
    if (nextParam != null && nextParam.isNotEmpty) {
      developer.log('[NAV] Przekierowanie do celu: $nextParam', name: 'LoginScreen');
      context.go(nextParam);
    } else {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      } else {
        context.go('/');
      }
    }
  }
}
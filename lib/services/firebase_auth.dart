import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'dart:developer' as developer;
import 'package:lustra/services/api_service.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final ApiService _apiService = ApiService();

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  User? get currentUser => _firebaseAuth.currentUser;

  String _generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> signInWithEmailAndPassword({ required String email, required String password, }) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUpWithEmailAndPassword({ required String email, required String password, }) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user != null && !userCredential.user!.emailVerified) {
      await userCredential.user!.sendEmailVerification();
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> completeOnboarding({ required bool marketingConsent, required String parliamentId, }) async {
    if (_firebaseAuth.currentUser == null) {
      developer.log('[CRITICAL] Próba onboardingu bez zalogowanego użytkownika!', name: 'AuthService');
      throw FirebaseAuthException(code: 'no-user', message: 'Session lost. Please log in again.');
    }
    try {
      await _firebaseAuth.currentUser!.reload();
      await _firebaseAuth.currentUser!.getIdToken(true);
    } catch (e) {
      developer.log('[WARNING] Nie udało się odświeżyć sesji przed onboardingiem: $e', name: 'AuthService');
    }
    await _apiService.callFunction('userOnboarding', params: {
      'marketingConsent': marketingConsent, 
      'parliamentId': parliamentId,
    });
  }
  
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw FirebaseAuthException(code: 'sign-in-cancelled');
    }
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken,);
    return await _firebaseAuth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    developer.log("Starting Facebook login...", name: 'AuthService');
    
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
      developer.log("Running on iOS, using Limited Login with Nonce.", name: 'AuthService');
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);
      developer.log("Generated rawNonce for FB: $rawNonce", name: 'AuthService');
      developer.log("Generated hashed nonce for FB: $nonce", name: 'AuthService');

      final result = await FacebookAuth.instance.login(
          loginTracking: LoginTracking.limited,
          nonce: nonce,
      );

      if (result.status == LoginStatus.success) {
        developer.log("iOS Facebook Native Login Success. AccessToken received.", name: 'AuthService');
        developer.log("Token: ${result.accessToken?.tokenString}", name: 'AuthService');
        try {
          final oAuthCredential = OAuthProvider('facebook.com').credential(
              idToken: result.accessToken!.tokenString,
              rawNonce: rawNonce,
          );
          developer.log("OIDC credential for Firebase created. Signing in...", name: 'AuthService');
          return await _firebaseAuth.signInWithCredential(oAuthCredential);
        } catch (e, s) {
          developer.log("Firebase sign-in with Facebook FAILED on iOS", name: 'AuthService', error: e, stackTrace: s);
          rethrow;
        }
      } else {
         developer.log("iOS Facebook Native login failed", name: 'AuthService', error: "Status: ${result.status}, Message: ${result.message}");
         throw FirebaseAuthException(code: 'facebook-sign-in-failed', message: result.message);
      }
    } 

    else {
      developer.log("Running on Android, using standard login.", name: 'AuthService');
      final result = await FacebookAuth.instance.login(
        loginTracking: LoginTracking.enabled,
      );

      if (result.status == LoginStatus.success) {
         developer.log("Android Facebook Login Success. Creating standard credential.", name: 'AuthService');
        try {
          final credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
          developer.log("Credential created, signing in to Firebase...", name: 'AuthService');
          return await _firebaseAuth.signInWithCredential(credential);
        } catch (e, s) {
          developer.log("Firebase sign-in FAILED on Android", name: 'AuthService', error: e, stackTrace: s);
          rethrow;
        }
      } else {
        developer.log("Android Facebook login failed", name: 'AuthService', error: "Status: ${result.status}, Message: ${result.message}");
        throw FirebaseAuthException(code: 'facebook-sign-in-failed', message: result.message);
      }
    }
  }

Future<UserCredential> signInWithApple() async {
    if (kIsWeb) {
    throw FirebaseAuthException(code: 'operation-not-allowed', message: 'Not supported on Web');
  }
	developer.log("Starting Apple login...", name: 'AuthService');
	developer.log("Bundle ID from GoogleService: ${_firebaseAuth.app.options.iosBundleId}", name: 'AuthService');
	
	final rawNonce = _generateNonce();
	final nonce = _sha256ofString(rawNonce);
	
	try {
		developer.log("Calling SignInWithApple.getAppleIDCredential...", name: 'AuthService');
		final appleCredential = await SignInWithApple.getAppleIDCredential(
			scopes: [
				AppleIDAuthorizationScopes.email,
				AppleIDAuthorizationScopes.fullName,
			],
			nonce: nonce,
		);
		
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
      accessToken: appleCredential.authorizationCode,
    );
		
		developer.log("OAuthCredential created, calling Firebase signIn...", name: 'AuthService');
		final result = await _firebaseAuth.signInWithCredential(oauthCredential);
		developer.log("Firebase signIn SUCCESS!", name: 'AuthService');
		return result;
		
	} catch (e, s) {
		developer.log("Apple sign-in failed at step: ${e.runtimeType}", name: 'AuthService', error: e, stackTrace: s);
		if (e is SignInWithAppleAuthorizationException && e.code == AuthorizationErrorCode.canceled) {
			throw FirebaseAuthException(code: 'sign-in-cancelled');
		}
		rethrow;
	}
}

  Future<bool> hasCompletedProfile() async {
    if (_firebaseAuth.currentUser == null) return false;
    try {
      final result = await _apiService.callFunction('checkUserProfile');
      return result['exists'] as bool;
    } catch (e) {
      developer.log("Błąd podczas sprawdzania profilu przez funkcję: $e", name: 'AuthService');
      return true;
    }
  }

  Future<void> createUserDocumentFromSocialLogin({ required bool marketingConsent, required String parliamentId, }) async {
      await _apiService.callFunction('userOnboarding', params: {'marketingConsent': marketingConsent, 'parliamentId': parliamentId,},);
    }

  Future<void> signOut() async {
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
    await _firebaseAuth.signOut();
  }

  Future<void> deleteAccount() async {
    await _apiService.callFunction('deleteAccount');
  }

  Future<void> updateUserNotificationPrefs(Map<String, dynamic> prefs) async {
    if (currentUser == null) {
      developer.log("Próba aktualizacji preferencji powiadomień dla niezalogowanego użytkownika.", name: 'AuthService');
      return;
    }
    try {
      await _apiService.callFunction('updateUserProfile', params: prefs);
      developer.log("Pomyślnie zaktualizowano preferencje powiadomień: $prefs", name: 'AuthService');
    } catch (e) {
      developer.log("Błąd podczas aktualizacji preferencji powiadomień: $e", name: 'AuthService');
    }
  }
  
  Future<bool> reauthenticateUser(String password) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null || user.email == null) return false;
      AuthCredential credential = EmailAuthProvider.credential(email: user.email!, password: password,);
      await user.reauthenticateWithCredential(credential);
      return true;
    } catch (e) {
      developer.log("Błąd reautentykacji: $e", name: "AuthService");
      return false;
    }
  }

  Future<Map<String, dynamic>?> getUserProfileDetails() async {
    if (_firebaseAuth.currentUser == null) return null;
    try {
      final result = await _apiService.callFunction('checkUserProfile');
      if (result['exists'] == true && result['profile'] != null) {
        return Map<String, dynamic>.from(result['profile']);
      }
      return null;
    } catch (e) {
      developer.log("Błąd pobierania detali profilu: $e", name: 'AuthService');
      return null;
    }
  }
  Future<bool> checkEmailVerified() async {
    await _firebaseAuth.currentUser?.reload(); 
    return _firebaseAuth.currentUser?.emailVerified ?? false;
  }

  Future<void> sendVerificationEmail() async {
    final user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
}
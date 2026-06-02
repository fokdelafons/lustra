import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
      throw FirebaseAuthException(code: 'no-user', message: 'Session lost. Please log in again.');
    }
        await _firebaseAuth.currentUser!.reload();
    await _firebaseAuth.currentUser!.getIdToken(true);
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
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final result = await FacebookAuth.instance.login(
          loginTracking: LoginTracking.limited,
          nonce: nonce,
      );

      if (result.status == LoginStatus.success) {
        try {
          final oAuthCredential = OAuthProvider('facebook.com').credential(
              idToken: result.accessToken!.tokenString,
              rawNonce: rawNonce,
          );
          return await _firebaseAuth.signInWithCredential(oAuthCredential);
        } catch (e) {
          rethrow;
        }
      } else {
         throw FirebaseAuthException(code: 'facebook-sign-in-failed', message: result.message);
      }
    } 

    else {
      final result = await FacebookAuth.instance.login(
        loginTracking: LoginTracking.enabled,
      );

      if (result.status == LoginStatus.success) {
        try {
          final credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
          return await _firebaseAuth.signInWithCredential(credential);
        } catch (e) {
          rethrow;
        }
      } else {
        throw FirebaseAuthException(code: 'facebook-sign-in-failed', message: result.message);
      }
    }
  }

Future<UserCredential> signInWithApple() async {
    if (kIsWeb) {
    throw FirebaseAuthException(code: 'operation-not-allowed', message: 'Not supported on Web');
  }
	
	final rawNonce = _generateNonce();
	final nonce = _sha256ofString(rawNonce);
	
	try {
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
		
		final result = await _firebaseAuth.signInWithCredential(oauthCredential);
		return result;
		
	} catch (e) {
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
        // FAIL-CLOSED: on error, require onboarding rather than letting user through
        return false;
      }
    }

  Future<void> createUserDocumentFromSocialLogin({ required bool marketingConsent, required String parliamentId, }) async {
      await _apiService.callFunction('userOnboarding', params: {'marketingConsent': marketingConsent, 'parliamentId': parliamentId,},);
    }

    Future<void> signOut() async {
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
    // Facebook session cleanup
    try {
      await FacebookAuth.instance.logOut();
    } catch (_) {
      // Facebook SDK may not be initialized — ignore
    }
    await _firebaseAuth.signOut();
  }

    Future<void> deleteAccount() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return;

    // Force token refresh — confirms session is still valid before destructive op
    try {
      await user.getIdToken(true);
    } catch (e) {
      throw FirebaseAuthException(
        code: 'reauthentication-required',
        message: 'Session expired. Please log in again before deleting your account.',
      );
    }

    await _apiService.callFunction('deleteAccount');
  }

  Future<void> updateUserNotificationPrefs(Map<String, dynamic> prefs) async {
    if (currentUser == null) {
      return;
    }
    await _apiService.callFunction('updateUserProfile', params: prefs);
  }
  
  Future<bool> reauthenticateUser(String password) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null || user.email == null) return false;
      AuthCredential credential = EmailAuthProvider.credential(email: user.email!, password: password,);
      await user.reauthenticateWithCredential(credential);
      return true;
    } catch (e) {
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
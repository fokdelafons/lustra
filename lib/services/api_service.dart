import 'dart:convert';
import 'dart:async';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiService {
  final String _baseUrl = 'https://api.lustra.dev';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _cachedAppCheckToken;
  DateTime? _tokenExpiration;
  Completer<String?>? _tokenRefreshCompleter;

  Future<String?> _getSafeAppCheckToken() async {
    if (_cachedAppCheckToken != null && 
        _tokenExpiration != null && 
        DateTime.now().isBefore(_tokenExpiration!)) {
      return _cachedAppCheckToken;
    }
    if (_tokenRefreshCompleter != null) {
      return _tokenRefreshCompleter!.future;
    }
    _tokenRefreshCompleter = Completer<String?>();
    try {
      final token = await FirebaseAppCheck.instance.getToken(false);
      _cachedAppCheckToken = token;
      _tokenExpiration = DateTime.now().add(const Duration(minutes: 20));
      _tokenRefreshCompleter!.complete(token);
      return token;
    } catch (e) {
      developer.log('Błąd tokenu App Check: $e', name: 'ApiService');
      _tokenRefreshCompleter!.completeError(e);
      return null;
    } finally {
      _tokenRefreshCompleter = null;
    }
  }

  Future<Map<String, dynamic>> callFunction(
    String functionName, {
    Map<String, dynamic> params = const {},
  }) async {
    final appCheckToken = await _getSafeAppCheckToken();
    if (appCheckToken == null) {
      developer.log('Nie udało się uzyskać tokenu App Check.', name: 'ApiService');
      throw FirebaseFunctionsException(
        message: 'Brak tokenu App Check.',
        code: 'unauthenticated',
      );
    }

    String? authToken;
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      try {
        authToken = await _auth.currentUser!.getIdToken();
      } catch (e) {
        developer.log('Nie udało się uzyskać tokenu Auth użytkownika: $e', name: 'ApiService');
      }
    }

    final url = Uri.parse('$_baseUrl/$functionName');
    final headers = {
      'Content-Type': 'application/json',
      'X-Firebase-AppCheck': appCheckToken,
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    };
    final finalParams = Map<String, dynamic>.from(params);
    if (currentUser != null) {
    finalParams['userId'] = currentUser.uid;
    finalParams['email'] = currentUser.email;
    }
    final body = json.encode({'data': finalParams});
    developer.log('ApiService Wywołuje: $url', name: 'ApiService');
    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return (responseBody['result'] ?? responseBody['data']) as Map<String, dynamic>;
      } else {
        String errorCode = 'internal';
        String errorMessage = 'Błąd serwera: ${response.body}';
        try {
          final decodedBody = json.decode(response.body) as Map<String, dynamic>;
          if (decodedBody.containsKey('error') && decodedBody['error'] is Map) {
            final errorMap = decodedBody['error'] as Map<String, dynamic>;
            if (errorMap.containsKey('message')) {
              errorMessage = errorMap['message'] as String;
            }
            if (errorMap.containsKey('status')) {
              errorCode = (errorMap['status'] as String).toLowerCase().replaceAll('_', '-');
            }
          }
        } catch (_) {
        }
        developer.log(
          'Błąd odpowiedzi serwera ($functionName): ${response.statusCode}\nBody: ${response.body}',
          name: 'ApiService',
        );
        throw FirebaseFunctionsException(
          message: errorMessage,
          code: errorCode,
        );
      }
    } catch (e) {
      developer.log('Błąd sieci podczas wywoływania $functionName: $e', name: 'ApiService');
      rethrow;
    }
  }
}
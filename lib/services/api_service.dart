import 'dart:convert';
import 'dart:async';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ---------------------------------------------------------
// Unified API error (same file — avoids fragmentation)
// ---------------------------------------------------------
class ApiException implements Exception {
  final String message;
  final String code;
  final int? statusCode;
  final bool isRetryable;

  const ApiException({
    required this.message,
    required this.code,
    this.statusCode,
    this.isRetryable = false,
  });

  factory ApiException.timeout(String fn) => ApiException(
        message: 'Timeout: $fn',
        code: 'timeout',
        isRetryable: true,
      );

  factory ApiException.network(Object e) => ApiException(
        message: 'Network error: $e',
        code: 'network-error',
        isRetryable: true,
      );

  factory ApiException.appCheck() => ApiException(
        message: 'App Check unavailable',
        code: 'app-check-failed',
        isRetryable: false,
      );

  factory ApiException.badResponse(String fn) => ApiException(
        message: 'Unexpected response shape: $fn',
        code: 'bad-response',
        isRetryable: false,
      );

  @override
  String toString() => 'ApiException($code): $message';
}

// ---------------------------------------------------------
// ApiService
// ---------------------------------------------------------
class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final String _baseUrl = 'https://api.lustra.dev';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _cachedAppCheckToken;
  DateTime? _tokenExpiration;
  Completer<String?>? _tokenRefreshCompleter;

  static const Duration _timeout = Duration(seconds: 15);

  static const Set<String> _appCheckFunctions = {
    'search',
    'checkUserProfile',
    'userOnboarding',
    'deleteAccount',
    'reportError',
    'updateUserProfile',
    'getUserInteractions',
    'toggleBillTracking',
    'getTrackedItems',
    'createCuratedList',
    'toggleBillInCuratedList',
    'subscribeToCuratedList',
    'getCuratedListFeed',
    'getMyCuratedLists',
    'deleteCuratedList',
    'updateCuratedListMeta',
    'setHighlightedBill',
    'sendCuratedListPush',
  };

  bool _needsAppCheck(String fn) =>
      _appCheckFunctions.contains(fn) || fn.endsWith('_citizenVote');

  // --- App Check ---
  Future<String> _getAppCheckToken() async {
    if (_cachedAppCheckToken != null &&
        _tokenExpiration != null &&
        DateTime.now().isBefore(_tokenExpiration!)) {
      return _cachedAppCheckToken!;
    }

    if (_tokenRefreshCompleter != null) {
      final t = await _tokenRefreshCompleter!.future;
      if (t == null) throw ApiException.appCheck();
      return t;
    }

    _tokenRefreshCompleter = Completer<String?>();

    try {
      final token = await _fetchAppCheckToken();
      _tokenRefreshCompleter!.complete(token);
      return token;
    } catch (_) {
      developer.log('App Check fail, retrying…', name: 'ApiService');
      await Future.delayed(const Duration(milliseconds: 800));
      try {
        final token = await _fetchAppCheckToken();
        _tokenRefreshCompleter!.complete(token);
        return token;
      } catch (e2) {
        developer.log('App Check fail after retry: $e2', name: 'ApiService');
        _tokenRefreshCompleter!.completeError(e2);
        throw ApiException.appCheck();
      }
    } finally {
      _tokenRefreshCompleter = null;
    }
  }

    Future<String> _fetchAppCheckToken() async {
    final token = await FirebaseAppCheck.instance.getToken(false);
    if (token == null) throw ApiException.appCheck();
    _cachedAppCheckToken = token;
    _tokenExpiration = DateTime.now().add(const Duration(minutes: 20));
    return token;
  }

  // --- Public API ---
  Future<Map<String, dynamic>> callFunction(
    String functionName, {
    Map<String, dynamic> params = const {},
  }) async {
    return _request(functionName, params, isRetry: false);
  }

  Future<Map<String, dynamic>> _request(
    String functionName,
    Map<String, dynamic> params, {
    required bool isRetry,
  }) async {
    // App Check
    String? appCheckToken;
    if (_needsAppCheck(functionName)) {
      appCheckToken = await _getAppCheckToken();
    }

    // Auth
    String? authToken;
    final user = _auth.currentUser;
    if (user != null) {
      authToken = await user.getIdToken(isRetry); // force refresh on retry
    }

    final headers = <String, String>{
      'Content-Type': 'application/json',
      if (appCheckToken != null) 'X-Firebase-AppCheck': appCheckToken,
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    };

    // Backend extracts uid from verified Firebase token — no userId/email in body
    final body = json.encode({'data': params});

    developer.log(
      'Api → $functionName${isRetry ? " (retry)" : ""}',
      name: 'ApiService',
    );

    try {
      final response = await http
          .post(Uri.parse('$_baseUrl/$functionName'),
              headers: headers, body: body)
          .timeout(_timeout, onTimeout: () => throw ApiException.timeout(functionName));

      // Success
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body) as Map<String, dynamic>;
        final data = decoded['result'] ?? decoded['data'];
        if (data is! Map<String, dynamic>) {
          throw ApiException.badResponse(functionName);
        }
        return data;
      }

      // 401 → refresh token once
      if (response.statusCode == 401 && !isRetry && user != null) {
        developer.log('401 → refreshing token', name: 'ApiService');
        try {
          await user.getIdToken(true);
        } catch (_) {
          throw _parseError(response.statusCode, response.body, functionName);
        }
        return _request(functionName, params, isRetry: true);
      }

      throw _parseError(response.statusCode, response.body, functionName);
    } on ApiException {
      rethrow;
    } on http.ClientException catch (e) {
      throw ApiException.network(e);
    } on TimeoutException {
      throw ApiException.timeout(functionName);
    } catch (e) {
      developer.log('Unexpected: $e', name: 'ApiService');
      rethrow;
    }
  }

  ApiException _parseError(int status, String body, String fn) {
    String msg = 'Server error $status';
    String code = 'server-error';

    try {
      final d = json.decode(body);
      if (d is Map && d['error'] is Map) {
        final e = d['error'] as Map<String, dynamic>;
        if (e['message'] is String) msg = e['message'] as String;
        if (e['status'] is String) code = (e['status'] as String).toLowerCase().replaceAll('_', '-');
      }
    } catch (_) {}

    return ApiException(
      message: msg,
      code: code,
      statusCode: status,
      isRetryable: status == 429 || status >= 500,
    );
  }
}
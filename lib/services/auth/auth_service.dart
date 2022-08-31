import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';

import '../../common/dio_extensions.dart';
import '../../common/encoders.dart';
import '../../models/auth/auth_failure.dart';
import 'credentials_storage/credentials_storage.dart';

class AuthService {
  AuthService(
    this._credentialsStorage,
    this._dio, {
    Client? httpClient,
    required this.clientID,
    this.clientSecret,
    required this.scopes,
    required this.authorisationEndpoint,
    required this.tokenEndpoint,
    required this.revocationEndpoint,
  }) : _httpClient = httpClient;

  final CredentialsStorage _credentialsStorage;
  final Dio _dio;
  final Client? _httpClient;

  final String clientID;
  final String? clientSecret;
  final List<String> scopes;
  final Uri authorisationEndpoint;
  final Uri tokenEndpoint;
  final Uri revocationEndpoint;
  static final Uri redirectUrl = Uri.parse('http://localhost:3000/callback');

  /// Throws [AuthFailure]
  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialsStorage.read();

      if (storedCredentials != null &&
          storedCredentials.canRefresh &&
          storedCredentials.isExpired) {
        return refresh(storedCredentials);
      }

      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> get isSignedIn =>
      getSignedInCredentials().then((value) => value != null);

  AuthorizationCodeGrant createGrant() {
    return AuthorizationCodeGrant(
      clientID,
      authorisationEndpoint,
      tokenEndpoint,
      secret: clientSecret,
      httpClient: _httpClient,
    );
  }

  Uri getAuthorisationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(
      redirectUrl,
      scopes: scopes,
    );
  }

  /// Throws [AuthFailure]
  Future<void> handleAuthorisationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> queryParameters,
  ) async {
    try {
      final httpClient =
          await grant.handleAuthorizationResponse(queryParameters);
      await _credentialsStorage.save(httpClient.credentials);
    } on FormatException {
      throw const AuthFailure.server();
    } on AuthorizationException catch (e) {
      throw AuthFailure.server('${e.error}: ${e.description}');
    } on PlatformException {
      throw const AuthFailure.storage();
    }
  }

  /// Throws [AuthFailure]
  Future<void> signOut() async {
    try {
      await _credentialsStorage.clear();
    } on PlatformException {
      throw const AuthFailure.storage();
    }
  }

  /// Throws [AuthFailure]
  Future<Credentials> refresh(Credentials credentials) async {
    try {
      final refreshedCredentials = await credentials.refresh(
        identifier: clientID,
        secret: clientSecret,
        httpClient: _httpClient,
      );

      await _credentialsStorage.save(refreshedCredentials);

      return refreshedCredentials;
    } on FormatException {
      throw const AuthFailure.server();
    } on AuthorizationException catch (e) {
      throw AuthFailure.server('${e.error}: ${e.description}');
    } on PlatformException {
      throw const AuthFailure.storage();
    }
  }
}

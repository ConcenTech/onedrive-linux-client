import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/auth/auth_failure.dart';
import '../../models/auth/auth_state.dart';
import '../../services/auth/auth_service.dart';

typedef AuthUriCallback = Future<Uri> Function(Uri authorisationUrl);

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._authService) : super(const AuthState.initial());

  final AuthService _authService;

  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _authService.isSignedIn)
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }

  Future<void> signIn(AuthUriCallback authorisationCallback) async {
    try {
      final grant = _authService.createGrant();

      final url = _authService.getAuthorisationUrl(grant);

      final redirectUrl = await authorisationCallback(url);

      await _authService.handleAuthorisationResponse(
        grant,
        redirectUrl.queryParameters,
      );

      state = const AuthState.authenticated();
    } on AuthFailure catch (e) {
      state = AuthState.failure(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      WebviewWindow.clearAll();
      state = const AuthState.unauthenticated();
    } on AuthFailure catch (e) {
      state = AuthState.failure(e);
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/auth/auth_state.dart';
import '../../services/auth/auth_service.dart';
import '../../services/auth/credentials_storage/credentials_storage.dart';
import '../../services/auth/credentials_storage/secure_credentials_storage.dart';
import '../common/providers.dart';
import 'auth_notifier.dart';

final flutterSecureStorageProvider =
    Provider((ref) => const FlutterSecureStorage());

final credentialsStorageProvider = Provider<CredentialsStorage>(
  (ref) => SecureCredentialsStorage(
    ref.watch(flutterSecureStorageProvider),
  ),
);

final msftAuthenticatorProvider = Provider(
  (ref) {
    const oauthUrl = 'https://login.microsoftonline.com/common/oauth2/v2.0';

    return AuthService(
      ref.watch(credentialsStorageProvider),
      ref.watch(dioProvider),
      clientID: 'a0d276af-3eca-4109-92df-b4632367fea9',
      scopes: [
        'Files.Read',
        'Files.Read.All',
        'Files.ReadWrite',
        'Files.ReadWrite.All',
        'Sites.Read.All',
        'Sites.ReadWrite.All',
      ],
      authorisationEndpoint: Uri.parse('$oauthUrl/authorize'),
      tokenEndpoint: Uri.parse('$oauthUrl/token'),
      revocationEndpoint:
          Uri.parse('https://graph.microsoft.com/v1.0/me/revokeSignInSessions'),
    );
  },
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(msftAuthenticatorProvider),
  ),
);

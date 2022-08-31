import 'dart:async';

import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth/auth_providers.dart';
import 'sign_in_button.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  bool _authWindowOpen = false;

  void _setAuthWindowOpen(bool open) {
    if (mounted) {
      setState(() {
        _authWindowOpen = open;
      });
    }
  }

  void openWebView() async {
    _setAuthWindowOpen(true);

    WebviewWindow.clearAll();

    final webview = await WebviewWindow.create(
      configuration: const CreateConfiguration(
        // titleBarHeight: 0,
        windowWidth: 400,
        windowHeight: 500,
        // titleBarTopPadding: 0,
        title: 'Microsoft | Sign In',
      ),
    );

    webview.onClose.then((_) => _setAuthWindowOpen(false));

    ref.read(authNotifierProvider.notifier).signIn((authorisationUrl) {
      final completer = Completer<Uri>();

      webview.addOnUrlRequestCallback((url) {
        if (url.contains('http://localhost:3000/callback')) {
          completer.complete(Uri.parse(url));
          webview.close();
        }
      });

      webview.launch(authorisationUrl.toString());

      return completer.future;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/onedrive.png',
                width: 150,
              ),
              const SizedBox(height: 16),
              Text(
                'OneDrive Client',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 42),
              _authWindowOpen
                  ? const LinearProgressIndicator()
                  : MicrosoftSignInButton(
                      onPressed: () => openWebView(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

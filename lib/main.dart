import 'package:adwaita/adwaita.dart';
import 'package:auto_route/auto_route.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';
import 'screens/home/tray_listener.dart';
import 'package:tray_manager/tray_manager.dart';

import 'models/auth/auth_state.dart';
import 'providers/auth/auth_providers.dart';
import 'routes/app_router.gr.dart';

void main(args) {
  WidgetsFlutterBinding.ensureInitialized();

  if (runWebViewTitleBarWidget(args)) {
    return;
  }

  initSystemTray();

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );

  doWhenWindowReady(() {
    appWindow?.alignment = Alignment.center;
  });
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> with TrayListener {
  @override
  void initState() {
    super.initState();

    trayManager.addListener(this);
  }

  @override
  void dispose() {
    trayManager.removeListener(this);
    super.dispose();
  }

  final appRouter = AppRouter();

  void pushTo(PageRouteInfo route) {
    appRouter.pushAndPopUntil(
      route,
      predicate: (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(initialisationProvider, (_, __) {});
    ref.listen<AuthState>(authNotifierProvider, (_, state) {
      print(state.map(
        initial: (_) => 'initial',
        unauthenticated: (_) => 'unauthenticated',
        authenticated: (_) => 'authenticated',
        failure: (e) => 'failure: $e',
      ));

      state.maybeMap(
        orElse: () {},
        authenticated: (_) => pushTo(const HomeRoute()),
        unauthenticated: (_) => pushTo(const SignInRoute()),
      );
    });

    return MaterialApp.router(
      title: 'OneDrive Client',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      themeMode: ThemeMode.system,
      theme: AdwaitaThemeData.light(),
      darkTheme: AdwaitaThemeData.dark(),
    );
  }
}

final initialisationProvider = FutureProvider((ref) async {
  final authNotifier = ref.read(authNotifierProvider.notifier);

  await authNotifier.checkAndUpdateAuthStatus();
});

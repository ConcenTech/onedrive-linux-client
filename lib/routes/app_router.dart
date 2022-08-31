import 'package:auto_route/auto_route.dart';
import '../screens/auth/sign_in_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/splash/splash_screen.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: SignInScreen, path: '/sign-in'),
    MaterialRoute(page: HomeScreen, path: '/home')
  ],
  replaceInRouteName: 'Screen,Route',
)
class $AppRouter {}

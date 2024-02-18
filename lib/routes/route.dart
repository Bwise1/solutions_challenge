import 'package:get/get.dart';
import 'package:smart_agriculture/bindings/auth_binding.dart';
import 'package:smart_agriculture/screens/getting_started.dart';
import 'package:smart_agriculture/screens/home_screen.dart';
import 'package:smart_agriculture/screens/login.dart';

import '../bindings/splash_binding.dart';
import '../screens/splash_screen.dart';

class Routes {
  static const INITIAL = '/splash';
  static const MAIN_PAGE = '/main_page';
  static const LOGIN = '/login';
  static const HOME = '/home';
}

class Pages {
  static const SPLASHSCREEN = Routes.INITIAL;
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.MAIN_PAGE,
      page: () => const GettingStarted(),
    ),
    GetPage(
      name: Routes.LOGIN,
      binding: AuthBinding(),
      page: () => Login(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
    ),
  ];
}

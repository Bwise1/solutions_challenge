import 'package:get/get.dart';
import 'package:smart_agriculture/screens/getting_started.dart';

import '../bindings/splash_binding.dart';
import '../screens/splash_screen.dart';

class Routes {
  static const INITIAL = '/splash';
  static const MAIN_PAGE = '/main_page';
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
  ];
}

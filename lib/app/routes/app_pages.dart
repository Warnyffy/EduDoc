import 'package:edudoc/app/modules/getstarted_module/getstarted_binding.dart';
import 'package:edudoc/app/modules/getstarted_module/getstarted_screen.dart';
import 'package:edudoc/app/modules/splash_module/splash_binding.dart';
import 'package:edudoc/app/modules/splash_module/splash_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static var pageList = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.getStartedScreen,
      page: () => const GetstartedPage(),
      binding: GetstartedBinding(),
    ),
  ];
}

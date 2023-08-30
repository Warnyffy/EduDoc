import 'package:edudoc/app/modules/forgotpassword_module.dart/forgotpassword_binding.dart';
import 'package:edudoc/app/modules/forgotpassword_module.dart/forgotpassword_page.dart';
import 'package:edudoc/app/modules/getstarted_module/getstarted_screen.dart';
import 'package:edudoc/app/modules/login_module/login_binding.dart';
import 'package:edudoc/app/modules/login_module/login_screen.dart';
import 'package:edudoc/app/modules/signup_module/signup_binding.dart';
import 'package:edudoc/app/modules/signup_module/signup_screen.dart';
import 'package:edudoc/app/modules/splash_module/splash_screen.dart';
import 'package:get/get.dart';

import '../modules/getstarted_module/getstarted_binding.dart';
import 'app_routes.dart';

class AppPages {
  static var pageList = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.getStartedScreen,
      page: () => const GetstartedPage(),
      binding: GetstartedBinding(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signupScreen,
      page: () => const SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassScreen,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}

import 'package:edudoc/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  start() {
    // Delay for 3 seconds
    Future.delayed(const Duration(seconds: 6), () {
      Get.offAndToNamed(AppRoutes.getStartedScreen);
    });
  }
}

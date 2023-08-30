import 'package:edudoc/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  start() {
    // Delay for 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAndToNamed(AppRoutes.getStartedScreen);
    });
  }
}

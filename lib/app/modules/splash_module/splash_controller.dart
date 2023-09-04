import 'package:edudoc/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/auth.controller.dart';

class SplashController extends GetxController {
  var auth = Get.put(AuthController());

  @override
  void onInit() {
    /// We forcing this as the first controller
    debugPrint("Init State");
    super.onInit();
  }

  @override
  void onReady() {
    /// We set a Future Delay to transition to the next page.
    Future.delayed(const Duration(seconds: 5), () {
      // if user exists move to home else login
      auth.returnUser().then((value) {
        Get.offAndToNamed(value == null
            ? AppRoutes.getStartedScreen
            : AppRoutes.bottomnavScreen);
      });
    });
  }

  // start() {
  //   // Delay for 5 seconds
  //   Future.delayed(const Duration(seconds: 5), () {
  //     Get.offAndToNamed(AppRoutes.getStartedScreen);
  //   });
  // }
}

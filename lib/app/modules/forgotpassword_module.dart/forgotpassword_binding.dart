import 'package:get/get.dart';

import 'forgotpassword_controller.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      fenix: true,
      () => ForgotPasswordController(),
    );
    // Get.put<ForgotPasswordController>(ForgotPasswordController(),
    //     perm);
  }
}

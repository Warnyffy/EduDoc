import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LoginController>(fenix: true, () => LoginController());
    Get.put<LoginController>(LoginController(), permanent: true);
  }
}

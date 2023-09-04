import 'package:get/get.dart';

import 'checkemail_controller.dart';

class CheckEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckEmailController>(
      fenix: true,
      () => CheckEmailController(),
    );
  }
}

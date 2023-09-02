import 'package:get/get.dart';

import 'success_controller.dart';

class SuccessBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessController>(fenix: true, () => SuccessController());
  }
}

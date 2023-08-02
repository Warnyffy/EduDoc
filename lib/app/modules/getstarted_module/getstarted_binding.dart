import 'package:get/get.dart';

import 'getstarted_controller.dart';

class GetstartedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetstartedController>(() => GetstartedController());
  }
}

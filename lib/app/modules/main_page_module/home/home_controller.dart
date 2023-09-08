import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../../../services/auth.controller.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // Initialize controller
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose of controller
    super.onClose();
  }

  UserModel user = Get.put(AuthController()).user;
}

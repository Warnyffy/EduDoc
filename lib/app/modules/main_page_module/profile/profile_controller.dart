import 'package:edudoc/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../../../services/auth.controller.dart';

class ProfileController extends GetxController {
  var auth = Get.put(AuthController());
  UserModel user = Get.put(AuthController()).user!;

  logout() {
    auth.logout();
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}

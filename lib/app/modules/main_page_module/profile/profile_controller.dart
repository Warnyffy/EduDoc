import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../../../services/auth.controller.dart';

class ProfileController extends GetxController {
  UserModel user = Get.put(AuthController()).user;
}

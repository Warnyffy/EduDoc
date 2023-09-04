import 'package:edudoc/app/modules/main_page_module/chatbot/chatbot_controller.dart';
import 'package:edudoc/app/modules/main_page_module/profile/profile_controller.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';
import 'nav_controller.dart';

class BottomNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(
        fenix: true, () => BottomNavigationController());
    Get.lazyPut<ChatBotController>(() => ChatBotController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}

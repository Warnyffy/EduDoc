import 'package:edudoc/app/modules/main_page_module/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../chatbot/chatbot_page.dart';
import '../home/home_page.dart';
import 'nav_controller.dart';

class BottomNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomePage(),
            ChatBotPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.customDarkGrey,
          selectedItemColor: AppColors.primaryColor,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              activeIcon: Icon(CupertinoIcons.house_fill),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble),
                activeIcon: Icon(CupertinoIcons.chat_bubble_fill),
                label: "Chat Bot"),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              activeIcon: Icon(CupertinoIcons.person_crop_circle_fill),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}

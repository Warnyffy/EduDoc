import 'package:edudoc/app/modules/main_page_module/chatbot/widgets/messages.dart';
import 'package:edudoc/app/utils/app_colors.dart';
import 'package:edudoc/app/utils/app_styles.dart';
import 'package:edudoc/app/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatbot_controller.dart';

class ChatBotPage extends GetView<ChatBotController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.put(ChatBotController()),
        builder: (ChatBotController controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.primaryColor,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EduDoc',
                    style: AppStyles.littleText.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.customWhite,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.customGreen,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Online",
                        style: AppStyles.littleText.copyWith(
                          color: AppColors.customWhite,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            body: Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              color: AppColors.customWhite2,
              child: Column(
                children: [
                  Expanded(
                    child: MessagesScreen(
                      messgaes: controller.messages,
                      user: controller.user,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: controller.messageController,
                          hint: "Type a message",
                          isEmail: false,
                          isObscureText: false,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller
                              .sendMessage(controller.messageController.text);
                          controller.messageController.clear();
                        },
                        icon: Icon(
                          Icons.send,
                          color: AppColors.primaryColor,
                        ),
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  chat(String string, messag) {}
}

import 'package:edudoc/app/modules/main_page_module/chatbot/widgets/messages.dart';
import 'package:edudoc/app/utils/app_colors.dart';
import 'package:edudoc/app/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatbot_controller.dart';

class ChatBotPage extends GetView<ChatBotController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.put(ChatBotController()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: AppColors.primaryColor,
                title: Text('ChatBotPage')),
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: MessagesScreen(messgaes: controller.messages),
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

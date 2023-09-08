import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:edudoc/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBotController extends GetxController {
  late DialogFlowtter dialogFlowtter;
  final messageController = TextEditingController();
  RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.onInit();
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
      Get.snackbar(
        "Message Failure",
        "Please input a text messgae so we can talk",
        backgroundColor: AppColors.customWhite,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        icon: Image.asset("assets/images/launcher.png"),
        duration: const Duration(seconds: 4),
        isDismissible: true,
      );
    } else {
      addMessage(Message(text: DialogText(text: [text])), true);
      update();
      // setState(() {
      //   addMessage(Message(text: DialogText(text: [text])), true);
      // });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      // response.
      if (response.message == null) {
        addMessage(Message(
            text: DialogText(text: ["Sorry No response", "Try later."])));
      } else {
        addMessage(response.message!);
        update();
        // setState(() {
        //   addMessage(response.message!);
        // });
      }
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }

  // void response(String query) async {
  //   AuthGoogle authGoogle = await AuthGoogle(projectId: 'edudoc-53ae7',fileJson: "assets/keys/dialogflow.json").build();
  //   DialogFlowtter dialogFlowtter = DialogFlowtter(authGoogle: authGoogle,);
  //   AIResponse aiResponse = await dialogFlowtter.detectIntent(queryInput: QueryInput());
  //   messages.insert(
  //     0,
  //     {
  //       "data": 0,
  //       "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString(),
  //     },
  //   );
  //   print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
  // }

  // void sendMessage() {
  //   if (messageInsert.text.isEmpty) {
  //     print("empty message");
  //   } else {
  //     messages.insert(0, {"data": 1, "message": messageInsert.text});
  //     response(messageInsert.text);
  //     messageInsert.clear();
  //   }
  //   FocusScopeNode currentFocus = FocusScope.of(Get.context!);
  //   if (!currentFocus.hasPrimaryFocus) {
  //     currentFocus.unfocus();
  //   }
  // }

  // @override
  // void onClose() {
  //   messageInsert.dispose();
  //   super.onClose();
  // }
}

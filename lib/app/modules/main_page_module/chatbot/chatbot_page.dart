import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatbot_controller.dart';

class ChatBotPage extends GetView<ChatBotController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ChatBotPage')),
        body: SafeArea(child: Text('Interface To be built')));
  }
}

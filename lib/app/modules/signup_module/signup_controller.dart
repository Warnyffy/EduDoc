import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../../services/firebase_controller.dart';
import '../../utils/app_colors.dart';

class SignupController extends GetxController {
  FirebaseController _firebaseController = FirebaseController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isObscureText = true.obs;
  var isSigning = false.obs;

  final GlobalKey<FormState> registerFormKey =
      GlobalKey<FormState>(debugLabel: "__REGISTERFORMKEY");

  String? validateUsername(String value) {
    String pattern = r'^[#.0-9a-zA-Z\s,-]+$';
    RegExp addressPattern = RegExp(pattern);
    if (!addressPattern.hasMatch(value)) {
      return "Please Enter a Valid Name";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Please Enter a Valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_-]).{8,}$';
    RegExp passwordPattern = RegExp(pattern);
    if (!passwordPattern.hasMatch(value)) {
      return "Enter at least 1 Upper Case, 1 lower Case, 1 digit and 1 special character";
    }
    return null;
  }

  // Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  Widget imgPlaceHolder({required String userName}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
          child: Text(
        userName.split('').first.toUpperCase(),
        style: TextStyle(
          color: AppColors.customWhite,
        ),
      )),
    );
  }

  Future<Uint8List> takePicture(String userName) async {
    return await screenshotController
        .captureFromWidget(imgPlaceHolder(userName: userName));
  }

  void registerUser() async {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isSigning.value = true;
    takePicture(nameController.text.trim());

    await _firebaseController.createUser(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      profileImage: await takePicture(nameController.text.trim()),
    );

    // isSigning.value = false;
  }
}

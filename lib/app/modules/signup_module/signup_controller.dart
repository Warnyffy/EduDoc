import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/firebase_controller.dart';

class SignupController extends GetxController {
  FirebaseController _firebaseController = FirebaseController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isObscureText = true.obs;

  final GlobalKey<FormState> registerFormKey =
      GlobalKey<FormState>(debugLabel: "__REGISTERFORMKEY");

  final registerUsername = GetStorage();
  final registerEmail = GetStorage();
  final registerPassword = GetStorage();
  // String? get userType => _lottieSplashController.userType.read('USERTYPE');

  String? validateUsername(String value) {
    // if (!GetUtils.isUsername(value)) {
    //   return "Please Enter a Valid Name without space bar";
    // }
    // return null;
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

  void registerUser() async {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    // isRegistring.value = true;
    registerUsername.write('USERNAME', nameController.text.trim());
    registerEmail.write('EMAIL', emailController.text.trim());
    registerPassword.write('PASSWORD', passwordController.text.trim());

    debugPrint(registerUsername.read('USERNAME'));
    debugPrint(registerEmail.read('EMAIL'));
    debugPrint(registerPassword.read('PASSWORD'));

    await _firebaseController.createUser(registerUsername.read('USERNAME'),
        registerEmail.read('EMAIL'), registerPassword.read('PASSWORD'));
    // Get.toNamed(AppRoutes.OTPSCREEN);

    // isRegistring.value = false;
  }
}

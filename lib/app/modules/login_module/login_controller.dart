import 'package:edudoc/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/firebase_controller.dart';

class LoginController extends GetxController {
  FirebaseController _firebaseController = FirebaseController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isObscureText = true.obs;
  var isLogin = false.obs;

  // final GlobalKey<FormState> loginFormKey =
  //     GlobalKey<FormState>(debugLabel: "__LOGINFORMKEY");

  // final loginEmail = GetStorage();
  // final loginPassword = GetStorage();
  final userState = GetStorage();

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide a valid Email";
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

  void loginUser() async {
    // log(emailController.text.trim(), name: "EMAIL");
    // log(passwordController.text.trim(), name: "PASSWORD");
    // final isValid = loginFormKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Login Failed",
        "Please fill in all the informations",
        backgroundColor: AppColors.customWhite,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        icon: Image.asset("assets/images/launcher.png"),
        duration: const Duration(seconds: 4),
        isDismissible: true,
      );
    } else {
      isLogin.value = true;
      // loginEmail.write('LOGEMAIL', emailController.text.trim());
      // loginPassword.write('LOGPASSWORD', passwordController.text.trim());

      // debugPrint(loginEmail.read('LOGEMAIL'));
      // debugPrint(loginPassword.read('LOGPASSWORD'));

      await _firebaseController.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      isLogin.value = false;
    }

    // userState.write('isIN', true);
  }
}

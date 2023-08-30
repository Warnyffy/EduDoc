import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/buttons.dart';
import '../../widgets/textfields.dart';
import 'signup_controller.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: Text('LoginPage')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width / 16,
                right: size.width / 16,
                top: size.height / 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    'Create an Account',
                    style: AppStyles.headingText,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                  style: AppStyles.subHeadingText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: AppStyles.textfieldText,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.nameController,
                      hint: "Andy Warren",
                      isEmail: false,
                      isObscureText: false,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: AppStyles.textfieldText,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.emailController,
                      hint: "example@email.com",
                      isEmail: true,
                      isObscureText: false,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: AppStyles.textfieldText,
                    ),
                    SizedBox(height: 10),
                    Obx(
                      () => CustomTextField(
                        controller: controller.passwordController,
                        hint: "* * * * * * * *",
                        isEmail: true,
                        isObscureText: controller.isObscureText.value,
                        suffixIcon: controller.isObscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onPressSuffix: () {
                          controller.isObscureText.value =
                              !controller.isObscureText.value;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                // Text(
                //   "Forgot Password ?",
                //   style: AppStyles.littleText,
                // ),
                SizedBox(
                  height: 36,
                ),
                Center(
                  child: CustomButton(
                    color: AppColors.primaryColor,
                    text: "SIGN UP",
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // Center(
                //   child:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You don't have an account yet?",
                      style: AppStyles.littleText,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.loginScreen);
                      },
                      child: Text(
                        "Sign in",
                        style: AppStyles.littleText.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
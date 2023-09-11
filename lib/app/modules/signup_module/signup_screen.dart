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
        child: Obx(
          () => controller.isSigning.value
              ? Center(
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                      strokeWidth: 3,
                    ),
                  ),
                )
              : SingleChildScrollView(
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
                          'Thanks for choosing us to do your churn predictions, please input the required information below.',
                          style: AppStyles.subHeadingText,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 60),
                        // Form(
                        //   key: controller.registerFormKey,
                        // child:
                        Column(
                          children: [
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
                                  hint: "Enter name",
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
                                    isObscureText:
                                        controller.isObscureText.value,
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
                          ],
                        ),
                        // ),

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
                            onTap: () {
                              controller.registerUser();
                              // Get.offAllNamed(AppRoutes.succesScreen);
                            },
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
                              "Already have an account ? ",
                              style: AppStyles.littleText,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.offAndToNamed(AppRoutes.loginScreen);
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
      ),
    );
  }
}

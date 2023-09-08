import 'package:edudoc/app/routes/app_routes.dart';
import 'package:edudoc/app/utils/app_colors.dart';
import 'package:edudoc/app/utils/app_styles.dart';
import 'package:edudoc/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/textfields.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: Get.put(LoginController()),
        builder: (controller) {
          return Scaffold(
            // appBar: AppBar(title: Text('LoginPage')),
            body: SafeArea(
              child: Obx(
                () => controller.isLogin.value
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
                                  'Welcome Back',
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
                              Form(
                                key: controller.loginFormKey,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Email",
                                          style: AppStyles.textfieldText,
                                        ),
                                        SizedBox(height: 10),
                                        CustomTextField(
                                          controller:
                                              controller.emailController,
                                          hint: "example@email.com",
                                          isEmail: true,
                                          isObscureText: false,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Password",
                                          style: AppStyles.textfieldText,
                                        ),
                                        SizedBox(height: 10),
                                        Obx(
                                          () => CustomTextField(
                                            controller:
                                                controller.passwordController,
                                            hint: "* * * * * * * *",
                                            isEmail: true,
                                            isObscureText:
                                                controller.isObscureText.value,
                                            suffixIcon:
                                                controller.isObscureText.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                            onPressSuffix: () {
                                              controller.isObscureText.value =
                                                  !controller
                                                      .isObscureText.value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 24,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.forgotPassScreen);
                                },
                                child: Text(
                                  "Forgot Password ?",
                                  style: AppStyles.littleText,
                                ),
                              ),
                              SizedBox(
                                height: 36,
                              ),
                              Center(
                                child: CustomButton(
                                  color: AppColors.primaryColor,
                                  text: "LOGIN",
                                  onTap: () {
                                    controller.loginUser();
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
                                    "You don't have an account yet?",
                                    style: AppStyles.littleText,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.signupScreen);
                                    },
                                    child: Text(
                                      "Sign up",
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
        });
  }
}

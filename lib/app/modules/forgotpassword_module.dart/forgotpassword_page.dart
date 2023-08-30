import 'package:edudoc/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/app_styles.dart';
import '../../widgets/buttons.dart';
import '../../widgets/textfields.dart';
import 'forgotpassword_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                    'Forgot Password ?',
                    style: AppStyles.headingText,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'To reset your password, you need to input your email that can be authenticated',
                  style: AppStyles.subHeadingText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 55),
                Center(
                    child:
                        SvgPicture.asset("assets/images/forgot_password.svg")),
                SizedBox(height: 70),
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
                SizedBox(
                  height: 24,
                ),
                Center(
                  child: CustomButton(
                    color: AppColors.primaryColor,
                    text: "RESET PASSWORD",
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: CustomButton(
                    color: AppColors.customLightPurple,
                    text: "BACK TO LOGIN",
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

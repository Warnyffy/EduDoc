import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/buttons.dart';
import 'checkemail_controller.dart';

class CheckEmailPage extends GetView<CheckEmailController> {
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
                    'Check Email',
                    style: AppStyles.headingText,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'We have sent the reset password to the email address brandonelouis@gmial.com',
                  style: AppStyles.subHeadingText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 55),
                Center(
                    child: SvgPicture.asset("assets/images/check_email.svg")),
                SizedBox(height: 70),
                SizedBox(height: 15),
                SizedBox(
                  height: 24,
                ),
                Center(
                  child: CustomButton(
                    color: AppColors.primaryColor,
                    text: "OPEN EMAIL",
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
                    onTap: () {
                      Get.offAllNamed(AppRoutes.loginScreen);
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You have not received the email?",
                      style: AppStyles.littleText,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Resend",
                        style: AppStyles.littleText.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

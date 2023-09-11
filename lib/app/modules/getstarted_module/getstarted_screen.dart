import 'package:edudoc/app/utils/app_colors.dart';
import 'package:edudoc/app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import 'getstarted_controller.dart';

class GetstartedPage extends GetView<GetstartedController> {
  const GetstartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: Get.put(GetstartedController()),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width / 16,
                    right: size.width / 16,
                    top: size.height / 28),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "EduDoc",
                        style: AppStyles.logoText.copyWith(
                            fontSize: 18, color: AppColors.customBlack),
                      ),
                    ),
                    SizedBox(height: size.height / 12),
                    Image.asset(
                      "assets/images/gs_illustration.png",
                      width: size.width,
                    ),
                    SizedBox(height: size.height / 14),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Make A Legit",
                          style: AppStyles.largeText,
                        ),
                        Row(
                          children: [
                            Text(
                              "Prediction",
                              style: AppStyles.largeText.copyWith(
                                color: AppColors.secondaryColor,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(width: size.width / 30),
                            Text(
                              "Here",
                              style: AppStyles.largeText,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height / 72,
                    ),
                    Text(
                      "Explore all the most exciting job roles based on your interest and study major.",
                      style: AppStyles.littleText,
                    ),
                    SizedBox(
                      height: size.height / 80,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          // controller.goToLogin();
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: size.height * 0.07,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                              "assets/images/forward_arrow.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

import 'package:edudoc/app/utils/app_colors.dart';
import 'package:edudoc/app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: Get.put(SplashController()),
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: AppColors.primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height / 2.2),
                          child: Column(
                            children: [
                              SvgPicture.asset("assets/images/logo.svg"),
                              const Text("EduDoc", style: AppStyles.logoText),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: AppColors.customWhite,
                              strokeWidth: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

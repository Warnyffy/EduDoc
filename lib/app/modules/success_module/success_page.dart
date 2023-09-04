import 'package:edudoc/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/buttons.dart';
import 'success_controller.dart';

class SuccessPage extends GetView<SuccessController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
      init: Get.put(SuccessController()),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width / 16,
                    right: size.width / 16,
                    top: size.height / 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        'Successful',
                        style: AppStyles.headingText,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Your operation worked out, please regularly use this app to enjoy our services',
                      style: AppStyles.subHeadingText,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 55),
                    Center(
                        child: SvgPicture.asset("assets/images/success.svg")),
                    SizedBox(height: 70),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: CustomButton(
                        color: AppColors.primaryColor,
                        text: "CONTINUE",
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.bottomnavScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

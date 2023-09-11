import 'package:edudoc/app/modules/main_page_module/chatbot/chatbot_page.dart';
import 'package:edudoc/app/utils/app_colors.dart';
import 'package:edudoc/app/utils/app_styles.dart';
import 'package:edudoc/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(174.0 / 2),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Image(
                          image: NetworkImage(
                            controller.user.profileImage ??
                                'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: AppStyles.headingText,
                    ),
                    // SizedBox(height: 5),
                    Text(
                      controller.user.name,
                      style: AppStyles.headingText.copyWith(fontSize: 26),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Stack(
                  children: [
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: -20,
                      child: Image.asset("assets/images/People.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Free Bot,",
                                style: AppStyles.bannerText.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "Predict Student Churn",
                                style: AppStyles.bannerText.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 120,
                            child: CustomCTAButton(
                              text: "Start",
                              onTap: () {
                                // Get.toNamed(AppRoutes.)
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatBotPage()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Worlwide Statistics",
                  style: AppStyles.bannerText.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 190,
                      // width: MediaQuery.of(context).size.width,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Color(0xFFAFECFE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/headhunting.png"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "44.5k",
                            style: AppStyles.bannerText.copyWith(
                                color: AppColors.customBlack,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Remote Students",
                            style:
                                AppStyles.subHeadingText.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 80,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Color(0xFFBEAFFE),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "66.8k",
                                style: AppStyles.bannerText.copyWith(
                                    color: AppColors.customBlack,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Pass Students",
                                style: AppStyles.subHeadingText
                                    .copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 80,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFD6AD),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "38.9k",
                                style: AppStyles.bannerText.copyWith(
                                    color: AppColors.customBlack,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Fail Students",
                                style: AppStyles.subHeadingText
                                    .copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
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

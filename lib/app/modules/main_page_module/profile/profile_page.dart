import 'package:edudoc/app/utils/app_colors.dart';
import 'package:edudoc/app/utils/app_styles.dart';
import 'package:edudoc/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(ProfileController()),
      builder: (ProfileController controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/images/share.svg"),
                          SizedBox(width: 10),
                          SvgPicture.asset("assets/images/settings.svg"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(174.0 / 2),
                              child: SizedBox(
                                width: 90,
                                height: 90,
                                child: Image(
                                  image: NetworkImage(
                                    controller.user.profileImage ??
                                        'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              controller.user.name,
                              style: AppStyles.profileName,
                            ),
                            Text(
                              controller.user.email,
                              style: AppStyles.profileName.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProfileButtons(
                          onTap: () {},
                          label: "About Me",
                          icon: "assets/images/profile.svg",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProfileButtons(
                          onTap: () {},
                          label: "Change Password",
                          icon: "assets/images/lock.svg",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProfileButtons(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  color: AppColors.customWhite,
                                ),
                                height: 300,
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/dash.svg"),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Logout",
                                        style: AppStyles.bottomSheetTitle,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Are you sure you want to leave?',
                                        style: AppStyles.subHeadingText,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      CustomButton(
                                        text: "YES",
                                        onTap: () {
                                          controller.logout();
                                        },
                                        color: AppColors.primaryColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomButton(
                                        text: "CANCEL",
                                        onTap: () {
                                          Get.back();
                                        },
                                        color: AppColors.primaryColorShade8,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              isScrollControlled:
                                  true, // Set to true if you want to enable scrolling
                            );
                          },
                          label: "Logout",
                          icon: "assets/images/logout.svg",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

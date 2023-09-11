import 'package:edudoc/app/utils/app_colors.dart';
import 'package:edudoc/app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
  });

  final String text;
  Color? color = AppColors.primaryColor;
  final void Function() onTap;
  double? width = 270;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.only(
          left: 32,
          right: 32,
          top: 16,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyles.littleText.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.customWhite,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCTAButton extends StatelessWidget {
  CustomCTAButton({
    super.key,
    required this.text,
    required this.onTap,
    // this.color,
  });

  final String text;
  // final Color color = AppColors.secondaryColor;
  final void Function() onTap;
  // double? width = 270;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: width,
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyles.littleText.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: AppColors.customWhite,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
  });

  final void Function()? onTap;
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          // height: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryColorShade5,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    height: 32,
                    width: 32,
                    colorFilter: ColorFilter.mode(
                      AppColors.secondaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    label,
                    style: AppStyles.subHeadingText.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset("assets/images/forward_icon.svg"),
            ],
          ),
        ),
      ),
    );
  }
}

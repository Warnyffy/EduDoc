import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isEmail,
    required this.isObscureText,
    this.suffixIcon,
    this.onPressSuffix,
  });

  final TextEditingController controller;
  final String hint;
  final bool isEmail;
  final bool isObscureText;
  final IconData? suffixIcon;
  final VoidCallback? onPressSuffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.customWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscureText,
        obscuringCharacter: '*',
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        style:
            AppStyles.subHeadingText.copyWith(color: AppColors.customDarkGrey),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppStyles.subHeadingText.copyWith(
            color: AppColors.customDarkGrey,
          ),
          suffixIcon:
              // SvgPicture.asset(
              //   suffixIcon,
              // ),
              IconButton(
            onPressed: onPressSuffix,
            icon: Icon(
              suffixIcon,
              color: AppColors.customDarkGrey,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

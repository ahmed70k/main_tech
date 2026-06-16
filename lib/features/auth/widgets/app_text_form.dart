import 'package:flutter/material.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';

class AppTextForm extends StatelessWidget {
  final Widget? prefixIcon;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  const AppTextForm({
    super.key,
    this.maxLines ,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: obscureText ? 1 : maxLines,
      style: AppStyles.inputLabelStyle,
      cursorColor: AppColors.textSecondary,
      cursorHeight: 18,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorStyle: AppStyles.logoutButtonStyle,
        fillColor: AppColors.inactiveDot,
       // filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        suffixIconColor: AppColors.badgeHighPriorityText,
        prefixIconColor: AppColors.textSecondary,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.inactiveDot, width: 2),
          borderRadius: BorderRadius.circular(18),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.inactiveDot, width: 2),
          borderRadius: BorderRadius.circular(18),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textRed, width: 2),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}

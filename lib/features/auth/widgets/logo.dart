import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/colors/app_colors.dart';

class LogoScreen extends StatelessWidget {
  final String? icon1;
  final String? icon2;

  const LogoScreen({super.key, this.icon1, this.icon2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.micCardGradientEnd,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon1!, height: 46),
          SvgPicture.asset(icon2!, height: 46),
        ],
      ),
    );
  }
}

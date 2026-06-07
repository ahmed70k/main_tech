import 'package:flutter/material.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';

class MicCardGradientStart extends StatelessWidget {
  final String cardText;
  void Function()? onPressed;
  Color color;
  MicCardGradientStart({
    super.key,
    required this.cardText,
    this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color,
        ),
        child: Center(child: Text(cardText, style: AppStyles.nextButtonStyle)),
      ),
    );
  }
}

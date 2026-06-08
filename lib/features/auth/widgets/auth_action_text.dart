import 'package:flutter/material.dart';

import '../../../core/utils/styles/app_styles.dart';

class AuthActionText extends StatelessWidget {
  final String text;
  String authActionText;
  void Function()? onPressed;
  AuthActionText({super.key, required this.text, required this.onPressed,required this.authActionText});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(text, style: AppStyles.inputHintStyle),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            authActionText,
            style: AppStyles.textLinkStyle.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

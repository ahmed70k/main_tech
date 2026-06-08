import 'package:flutter/material.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/app_regex/app_regex.dart';
import 'package:main_tech/features/auth/widgets/app_text_form.dart';
import 'package:main_tech/features/auth/widgets/mic_card_gradient_start.dart';
import '../manager/send_otp_cubit.dart';

class SendOtpForm extends StatefulWidget {
  final SendOtpCubit sendOtpCubit;

  const SendOtpForm({super.key, required this.sendOtpCubit});

  @override
  State<SendOtpForm> createState() => _SendOtpFormState();
}

class _SendOtpFormState extends State<SendOtpForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Card(
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 36),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AppTextForm(
                controller: emailController,
                prefixIcon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: (textInput) {
                  if (textInput == null || textInput.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!AppRegex.emailPattern.hasMatch(textInput)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 22),
              MicCardGradientStart(
                cardText: "Send OTP",
                color: AppColors.avatarBackground,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    widget.sendOtpCubit.sendOtp(
                      email: emailController.text,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

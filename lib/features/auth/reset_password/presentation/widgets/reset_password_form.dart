import 'package:flutter/material.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/app_regex/app_regex.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/features/auth/widgets/app_text_form.dart';
import 'package:main_tech/features/auth/widgets/mic_card_gradient_start.dart';
import '../manager/reset_password_cubit.dart';

class ResetPasswordForm extends StatefulWidget {
  final ResetPasswordCubit resetPasswordCubit;

  const ResetPasswordForm({super.key, required this.resetPasswordCubit});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  @override
  void dispose() {
    otpController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      color: AppColors.cardBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("OTP", style: AppStyles.inputLabelStyle),
              SizedBox(height: 12),
              AppTextForm(
                controller: otpController,
                prefixIcon: const Icon(Icons.numbers),
                keyboardType: TextInputType.number,
                validator: (textInput) {
                  if (textInput == null || textInput.isEmpty) {
                    return "Please enter the OTP";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Text("New Password", style: AppStyles.inputLabelStyle),
              SizedBox(height: 12),
              AppTextForm(
                controller: passwordController,
                prefixIcon: const Icon(Icons.lock_open),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordObscured
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordObscured = !isPasswordObscured;
                    });
                  },
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: isPasswordObscured,
                validator: (textInput) {
                  if (textInput == null || textInput.isEmpty) {
                    return "Please enter your password";
                  }
                  if (!AppRegex.passwordPattern.hasMatch(textInput)) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Text("Confirm Password", style: AppStyles.inputLabelStyle),
              SizedBox(height: 12),
              AppTextForm(
                controller: confirmPasswordController,
                prefixIcon: const Icon(Icons.lock_open),
                suffixIcon: IconButton(
                  icon: Icon(
                    isConfirmPasswordObscured
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordObscured =
                          !isConfirmPasswordObscured;
                    });
                  },
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: isConfirmPasswordObscured,
                validator: (textInput) {
                  if (textInput == null || textInput.isEmpty) {
                    return "Please confirm your password";
                  }
                  if (textInput != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 22),
              MicCardGradientStart(
                cardText: "Reset Password",
                color: AppColors.avatarBackground,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    widget.resetPasswordCubit.resetPassword(
                      otp: otpController.text,
                      password: passwordController.text,
                      passwordConfirmation:
                          confirmPasswordController.text,
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

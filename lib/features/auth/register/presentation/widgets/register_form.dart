import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import '../../../../../core/utils/app_regex/app_regex.dart';
import '../../../../../core/utils/assets/app_assets.dart';
import '../../../widgets/app_text_form.dart';
import '../../../widgets/auth_action_text.dart';
import '../../../widgets/mic_card_gradient_start.dart';
import 'package:main_tech/config/app_routes/app_routes.dart';
import '../manager/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  final RegisterViewModel registerViewModel;
  const RegisterForm({super.key, required this.registerViewModel});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordObscured = true;

  @override
  void dispose() {
    fnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Card(
        color: AppColors.cardBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text("Full Name", style: AppStyles.inputLabelStyle),
              const SizedBox(height: 12),
              AppTextForm(
                keyboardType: TextInputType.name,
                prefixIcon: SvgPicture.asset(
                  AppAssets.userIcon,
                  fit: BoxFit.scaleDown,
                ),
                controller: fnameController,
                validator: (textInput) {
                  if (textInput == null || textInput.isEmpty) {
                    return "Please enter your full name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Text("Email", style: AppStyles.inputLabelStyle),
              const SizedBox(height: 12),
              AppTextForm(
                keyboardType: TextInputType.emailAddress,
                prefixIcon: SvgPicture.asset(
                  AppAssets.emailIcon,
                  fit: BoxFit.scaleDown,
                ),
                controller: emailController,
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
              const SizedBox(height: 12),
              Text("Phone Number", style: AppStyles.inputLabelStyle),
              const SizedBox(height: 12),
              AppTextForm(
                keyboardType: TextInputType.phone,
                prefixIcon: SvgPicture.asset(
                  AppAssets.phoneIcon,
                  fit: BoxFit.scaleDown,
                ),
                controller: phoneController,
                validator: (textInput) {
                  if (textInput == null || textInput.isEmpty) {
                    return "Please enter your phone number";
                  }
                  if (!AppRegex.phonePattern.hasMatch(textInput)) {
                    return "Please enter a valid phone number (Egyptian/Saudi)";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Text("Password", style: AppStyles.inputLabelStyle),
              const SizedBox(height: 12),
              AppTextForm(
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock_outline),
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
                controller: passwordController,
                validator: (textInput) {
                  if (textInput == null || textInput.isEmpty) {
                    return "Please enter your password";
                  }
                  if (!AppRegex.passwordPattern.hasMatch(textInput)) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
                obscureText: isPasswordObscured,
              ),
              const SizedBox(height: 22),
              MicCardGradientStart(
                cardText: "Create Account ",
                color: AppColors.avatarBackground,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    widget.registerViewModel.register(
                      email: emailController.text,
                      password: passwordController.text,
                      fullName: fnameController.text,
                      phone: phoneController.text,
                    );
                  }
                },
              ),
              const SizedBox(height: 12),
              Center(
                child: AuthActionText(
                  text: "Already have an account?",
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  authActionText: "Sign In",
                ),
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}

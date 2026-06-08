import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:main_tech/features/auth/login/presentation/manager/login_cubit.dart';
import '../../../../../config/app_routes/app_routes.dart';
import '../../../../../core/utils/app_regex/app_regex.dart';
import '../../../../../core/utils/assets/app_assets.dart';
import '../../../../../core/utils/colors/app_colors.dart';
import '../../../../../core/utils/styles/app_styles.dart';
import '../../../widgets/app_text_form.dart';
import '../../../widgets/auth_action_text.dart';
import '../../../widgets/mic_card_gradient_start.dart';

class LoginForm extends StatefulWidget {
  final LoginViewModel loginViewModel;

  const LoginForm({super.key, required this.loginViewModel});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordObscured = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.transparent)
        ),
        color: AppColors.cardBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
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
              const SizedBox(height: 32),
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
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.sendOtp);
                },
                highlightColor: Colors.transparent,
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    "Forget Password?",
                    style: AppStyles.textLinkStyle,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              MicCardGradientStart(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    widget.loginViewModel.login(
                      email: emailController.text.trim(),
                      password: passwordController.text,
                    );
                  }
                },
                cardText: "SignIn",
                color: AppColors.avatarBackground,
              ),
              SizedBox(height: 12),
              Center(
                child: AuthActionText(
                  text: "Don't Have An Account?",
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                  authActionText: "Register",
                ),
              ),
              SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}

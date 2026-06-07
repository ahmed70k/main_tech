import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/core/utils/assets/app_assets.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:main_tech/features/auth/login/presentation/manager/login_state.dart';
import 'package:main_tech/features/auth/login/presentation/widgets/login_form.dart';
import 'package:main_tech/features/auth/widgets/logo.dart';
import '../../../../../config/app_routes/app_routes.dart';
import '../../../../../core/widgets/app_dialog.dart';
import '../../../../../di/di.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider<LoginViewModel>(
      create: (context) => getIt<LoginViewModel>(),
      child: BlocListener<LoginViewModel, LoginState>(
        listener: (BuildContext context, state) async {
          if (state is LoginLoadingState) {
            AppDialogs.showLoading(context);
          } else if (state is LoginSuccessState) {
            AppDialogs.hideLoading(context);
            await AppDialogs.showSuccess(
              context,
              message: state.loginResponseEntity.message ?? "Login successful!",
            );
            // Navigate to register or root for now since there's no home page yet.
            Navigator.pushNamed(context, AppRoutes.register);
          } else if (state is LoginErrorState) {
            print("error: ${state.error}");
            AppDialogs.hideLoading(context);
            await AppDialogs.showError(context, message: state.error);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: height * 0.5/3,),
                LogoScreen(
                  icon1: AppAssets.carIcon,
                  icon2: AppAssets.shieldIcon,
                ),
                const SizedBox(height: 12),
                Text("Welcome Back", style: AppStyles.titleStyle),
                const SizedBox(height: 4),
                Text("Sign In Continue", style: AppStyles.bodyStyle),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Builder(
                    builder: (context) {
                      return LoginForm(
                        loginViewModel: context.read<LoginViewModel>(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

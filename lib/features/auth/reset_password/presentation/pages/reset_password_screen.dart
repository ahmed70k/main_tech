import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/core/utils/assets/app_assets.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/features/auth/widgets/logo.dart';
import 'package:main_tech/config/app_routes/app_routes.dart';
import 'package:main_tech/core/widgets/app_dialog.dart';
import 'package:main_tech/di/di.dart';
import '../manager/reset_password_cubit.dart';
import '../manager/reset_password_state.dart';
import '../widgets/reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider<ResetPasswordCubit>(
      create: (context) => getIt<ResetPasswordCubit>(),
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (BuildContext context, state) async {
          if (state is ResetPasswordLoading) {
            AppDialogs.showLoading(context);
          } else if (state is ResetPasswordSuccessState) {
            AppDialogs.hideLoading(context);
            await AppDialogs.showSuccess(
              context,
              message:
                  state.responseEntity.message ??
                  "Password reset successfully!",
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (route) => false,
            );
          } else if (state is ResetPasswordErrorState) {
            AppDialogs.hideLoading(context);
            await AppDialogs.showError(context, message: state.message);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            child: SizedBox(
              height: height - kToolbarHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 44),
                  const LogoScreen(
                    icon1: AppAssets.carIcon,
                    icon2: AppAssets.shieldIcon,
                  ),
                  const SizedBox(height: 12),
                  Text("Reset Password", style: AppStyles.titleStyle),
                  const SizedBox(height: 4),
                  Text(
                    "Enter OTP and new password",
                    style: AppStyles.bodyStyle,
                  ),
                  Builder(
                    builder: (context) {
                      return ResetPasswordForm(
                        resetPasswordCubit: context.read<ResetPasswordCubit>(),
                      );
                    },
                  ),
                  const SizedBox(height: 22),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

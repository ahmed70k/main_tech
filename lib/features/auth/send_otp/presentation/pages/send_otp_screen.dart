import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/core/utils/assets/app_assets.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/features/auth/widgets/logo.dart';
import 'package:main_tech/config/app_routes/app_routes.dart';
import 'package:main_tech/core/widgets/app_dialog.dart';
import 'package:main_tech/di/di.dart';
import '../manager/send_otp_cubit.dart';
import '../manager/send_otp_state.dart';
import '../widgets/send_otp_form.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SendOtpCubit>(
      create: (context) => getIt<SendOtpCubit>(),
      child: BlocListener<SendOtpCubit, SendOtpState>(
        listener: (BuildContext context, state) async {
          if (state is SendOtpLoading) {
            AppDialogs.showLoading(context);
          } else if (state is SendOtpSuccessState) {
            AppDialogs.hideLoading(context);
            await AppDialogs.showSuccess(
              context,
              message: state.responseEntity.message ?? "OTP Sent successfully!",
            );
            Navigator.pushNamed(context, AppRoutes.resetPassword);
          } else if (state is SendOtpErrorState) {
            AppDialogs.hideLoading(context);
            await AppDialogs.showError(context, message: state.message);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoScreen(
                icon1: AppAssets.carIcon,
                icon2: AppAssets.shieldIcon,
              ),
              const SizedBox(height: 12),
              Text("Forget Password", style: AppStyles.titleStyle),
              const SizedBox(height: 4),
              Text(
                "Enter email to receive OTP",
                style: AppStyles.bodyStyle,
              ),

              Builder(
                builder: (context) {
                  return SendOtpForm(
                    sendOtpCubit: context.read<SendOtpCubit>(),
                  );
                },
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}

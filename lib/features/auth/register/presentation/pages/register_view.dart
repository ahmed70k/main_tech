import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/config/app_routes/app_routes.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/features/auth/register/presentation/manager/register_state.dart';
import '../../../../../core/utils/assets/app_assets.dart';
import '../../../../../core/widgets/app_dialog.dart';
import '../../../../../di/di.dart';
import '../../../widgets/logo.dart';
import '../manager/register_cubit.dart';
import '../widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterViewModel>(
      create: (context) => getIt<RegisterViewModel>(),
      child: BlocListener<RegisterViewModel, RegisterState>(
        listener: (BuildContext context, state) async {
          if (state is RegisterLoadingState) {
            AppDialogs.showLoading(context);
          } else if (state is RegisterSuccessState) {
            AppDialogs.hideLoading(context);
            await AppDialogs.showSuccess(
              context,
              message: "Registration successful!",
            );
            Navigator.pushNamed(context, AppRoutes.login);
          } else if (state is RegisterErrorState) {
            print("error: ${state.error}");
            AppDialogs.hideLoading(context);
            await AppDialogs.showError(context, message: state.error);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LogoScreen(icon1: AppAssets.carIcon, icon2: AppAssets.shieldIcon),
                  const SizedBox(height: 20),
                  Text("Create Account", style: AppStyles.titleStyle),
                  const SizedBox(height: 6),
                  Text("Join the recovery network", style: AppStyles.inputHintStyle),
                  const SizedBox(height: 6),
                  Builder(
                    builder: (context) {
                      return RegisterForm(
                        registerViewModel: context.read<RegisterViewModel>(),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

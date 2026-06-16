import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/features/profile/presentation/widgets/profile_content.dart';
import '../../../../config/app_routes/app_routes.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/widgets/app_dialog.dart';
import '../../../auth/logout/presentation/manager/logout_cubit.dart';
import '../../../auth/logout/presentation/manager/logout_state.dart';
import '../manager/profile_cubit.dart';
import '../manager/profile_state.dart';
class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileErrorState) {
              AppDialogs.showError(
                context,
                title: 'خطأ',
                message: state.message,
              );
            }
          },
        ),
        BlocListener<LogoutCubit, LogoutState>(
          listener: (context, state) async {
            if (state is LogoutLoadingState) {
              AppDialogs.showLoading(context);
            } else if (state is LogoutSuccessState) {
              AppDialogs.hideLoading(context);
              if (!context.mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                    (route) => false,
              );
            } else if (state is LogoutErrorState) {
              AppDialogs.hideLoading(context);
              if (!context.mounted) return;
              await AppDialogs.showError(context, message: state.message);
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoadingState ||
                  state is ProfileInitialState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryCyan,
                  ),
                );
              }

              if (state is ProfileLoadedState) {
                final profile = state.response.data;
                if (profile == null) {
                  return const Center(
                    child: Text(
                      'No profile data',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  );
                }
                return ProfileContent(profile: profile);
              }

              return Center(
                child: TextButton(
                  onPressed: () => context.read<ProfileCubit>().getProfile(),
                  child: const Text('Retry'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
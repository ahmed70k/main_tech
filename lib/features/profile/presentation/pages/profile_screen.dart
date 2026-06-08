import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/config/app_routes/app_routes.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/widgets/app_dialog.dart';
import 'package:main_tech/di/di.dart';
import 'package:main_tech/features/auth/logout/presentation/manager/logout_cubit.dart';
import 'package:main_tech/features/auth/logout/presentation/manager/logout_state.dart';
import 'package:main_tech/features/profile/presentation/manager/profile_cubit.dart';
import 'package:main_tech/features/profile/presentation/manager/profile_state.dart';

import '../widgets/profile_content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProfileCubit>()..getProfile()),
        BlocProvider(create: (_) => getIt<LogoutCubit>()),
      ],
      child: const _ProfileBody(),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

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

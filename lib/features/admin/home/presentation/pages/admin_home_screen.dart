import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/widgets/app_dialog.dart';
import 'package:main_tech/di/di.dart';
import 'package:main_tech/features/admin/home/presentation/manager/admin_stats_cubit.dart';
import 'package:main_tech/features/admin/home/presentation/manager/admin_stats_state.dart';
import '../widgets/admin_statso_cntent.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AdminStatsCubit>()..getAdminStats(),
      child: const _AdminHomeBody(),
    );
  }
}

class _AdminHomeBody extends StatelessWidget {
  const _AdminHomeBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminStatsCubit, AdminStatsState>(
      listener: (context, state) {
        if (state is AdminStatsErrorState) {
          AppDialogs.showError(context, title: 'خطأ', message: state.message);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<AdminStatsCubit, AdminStatsState>(
            builder: (context, state) {
              if (state is AdminStatsLoadingState ||
                  state is AdminStatsInitialState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryCyan,
                  ),
                );
              }

              if (state is AdminStatsLoadedState) {
                final stats = state.response.data;
                if (stats == null) {
                  return const Center(
                    child: Text(
                      'No stats available',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  );
                }
                return AdminStatsContent(stats: stats);
              }
              return Center(
                child: TextButton(
                  onPressed: () =>
                      context.read<AdminStatsCubit>().getAdminStats(),
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

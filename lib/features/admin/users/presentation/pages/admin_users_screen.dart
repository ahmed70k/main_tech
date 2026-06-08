import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/core/widgets/app_dialog.dart';
import 'package:main_tech/di/di.dart';
import 'package:main_tech/features/admin/users/presentation/manager/users_cubit.dart';
import 'package:main_tech/features/admin/users/presentation/manager/users_state.dart';

import '../widgets/user_card.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UsersCubit>()..getUsers(),
      child: const _AdminUsersBody(),
    );
  }
}

class _AdminUsersBody extends StatelessWidget {
  const _AdminUsersBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersCubit, UsersState>(
      listener: (context, state) async {
        if (state is UsersDeleteLoadingState) {
          AppDialogs.showLoading(context);
        } else {
          AppDialogs.hideLoading(context);
        }

        if (!context.mounted) return;

        if (state is UsersDeleteSuccessState) {
          await AppDialogs.showSuccess(
            context,
            title: 'تم بنجاح',
            message: state.response.message ?? 'تم حذف المستخدم بنجاح',
          );
        }

        if (!context.mounted) return;

        if (state is UsersDeleteErrorState) {
          AppDialogs.showError(context, title: 'خطأ', message: state.message);
        }

        if (state is UsersErrorState) {
          AppDialogs.showError(context, title: 'خطأ', message: state.message);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Users', style: AppStyles.titleStyle),
                    const SizedBox(height: 4),
                    Text(
                      'Manage system users',
                      style: AppStyles.inputLabelStyle.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<UsersCubit, UsersState>(
                  builder: (context, state) {
                    if (state is UsersLoadingState ||
                        state is UsersInitialState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryCyan,
                        ),
                      );
                    }

                    // Resolve the list entity from both loaded and delete-in-progress states.
                    final listEntity = switch (state) {
                      UsersLoadedState(:final response) => response,
                      UsersDeleteLoadingState(:final cachedList) => cachedList,
                      UsersDeleteErrorState(:final cachedList) => cachedList,
                      _ => null,
                    };

                    if (listEntity != null) {
                      final users = listEntity.data?.users ?? [];
                      final total = listEntity.data?.total ?? users.length;

                      if (users.isEmpty) {
                        return Center(
                          child: Text(
                            'No users found',
                            style: AppStyles.inputLabelStyle.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        );
                      }

                      return RefreshIndicator(
                        color: AppColors.primaryCyan,
                        onRefresh: () =>
                            context.read<UsersCubit>().getUsers(),
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                'All Users ($total)',
                                style: AppStyles.inputLabelStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            ...users.map((user) => UserCard(user: user)),
                          ],
                        ),
                      );
                    }

                    // Error state — show retry
                    return Center(
                      child: TextButton.icon(
                        onPressed: () =>
                            context.read<UsersCubit>().getUsers(),
                        icon: const Icon(
                          Icons.refresh,
                          color: AppColors.primaryCyan,
                        ),
                        label: Text(
                          'Retry',
                          style: AppStyles.inputLabelStyle.copyWith(
                            color: AppColors.primaryCyan,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



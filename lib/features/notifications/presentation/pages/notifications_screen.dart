import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/widgets/app_dialog.dart';
import 'package:main_tech/features/notifications/presentation/manager/notifications_cubit.dart';
import 'package:main_tech/features/notifications/presentation/manager/notifications_state.dart';
import '../widgets/empty_notifications.dart';
import '../widgets/notification_card.dart';
import '../widgets/notifications_header.dart';
import '../widgets/pill_chips_row.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => NotificationsScreenState();
}

class NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<NotificationsCubit>().getNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationsCubit, NotificationsState>(
      listener: (context, state) {
        if (state is NotificationsListErrorState) {
          AppDialogs.showError(context, title: 'خطأ', message: state.message);
        } else if (state is NotificationsMarkAsReadErrorState) {
          AppDialogs.showError(context, title: 'خطأ', message: state.message);
        } else if (state is NotificationsMarkAllAsReadErrorState) {
          AppDialogs.showError(context, title: 'خطأ', message: state.message);
        } else if (state is NotificationsDeleteErrorState) {
          AppDialogs.showError(context, title: 'خطأ', message: state.message);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            // ── Gradient header ──────────────────────────────────────
            NotificationsHeader(
              onMarkAllRead: () => context
                  .read<NotificationsCubit>()
                  .markAllNotificationsAsRead(),
            ),
            // ── List ─────────────────────────────────────────────────
            Expanded(
              child: BlocBuilder<NotificationsCubit, NotificationsState>(
                buildWhen: (previous, current) =>
                    current is NotificationsListLoadingState ||
                    current is NotificationsListLoadedState ||
                    current is NotificationsInitialState,
                builder: (context, state) {
                  if (state is NotificationsListLoadingState ||
                      state is NotificationsInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryCyan,
                      ),
                    );
                  }

                  if (state is NotificationsListLoadedState) {
                    final all = state.listEntity.data?.notifications ?? [];
                    final unreadCount = context
                        .read<NotificationsCubit>()
                        .unreadCount;

                    if (all.isEmpty) {
                      return EmptyNotifications();
                    }

                    return RefreshIndicator(
                      color: AppColors.primaryCyan,
                      onRefresh: () => context
                          .read<NotificationsCubit>()
                          .getNotifications(showLoading: false),
                      child: ListView(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                        children: [
                          // Pill chips row
                          PillChipsRow(
                            newCount: unreadCount,
                            totalCount: all.length,
                          ),
                          const SizedBox(height: 16),
                          ...all.map((n) => NotificationCard(notification: n)),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

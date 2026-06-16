import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/utils/styles/app_styles.dart';
import '../../domain/entities/notification_entity.dart';
import '../manager/notifications_cubit.dart';
import 'notification_icon.dart';

class NotificationCard extends StatelessWidget {
  final NotificationEntity notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final isRead = notification.isRead;

    return GestureDetector(
      onTap: () {
        if (!isRead && notification.id != null) {
          context.read<NotificationsCubit>().markNotificationAsRead(notification.id!);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isRead
                ? AppColors.cardBorderColor
                : AppColors.primaryCyan.withValues(alpha: 0.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Colored icon container
                NotificationIcon(notification: notification),
                const SizedBox(width: 14),
                // Title + delete
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          style: AppStyles.inputLabelStyle.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight:
                            isRead ? FontWeight.w500 : FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          if (notification.id != null) {
                            context.read<NotificationsCubit>().deleteNotification(notification.id!);
                          }
                        },
                        child: Icon(
                          Icons.delete_outline,
                          size: 20,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Body
            Padding(
              padding: const EdgeInsets.only(left: 62),
              child: Text(
                notification.body,
                style: AppStyles.inputLabelStyle.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10),
            // Bottom row: clock + time | priority badge | unread dot
            Padding(
              padding: const EdgeInsets.only(left: 62),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _timeAgo(notification.createdAt),
                    style: AppStyles.inputLabelStyle.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  if (_isHighPriority(notification)) ...[
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.badgeHighPriorityBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'High Priority',
                        style: AppStyles.inputLabelStyle.copyWith(
                          color: AppColors.badgeHighPriorityText,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                  const Spacer(),
                  // Unread indicator dot
                  if (!isRead)
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryCyan,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isHighPriority(NotificationEntity n) {
    final d = n.data;
    if (d == null) return false;
    final priority = (d['priority'] ?? d['level'] ?? '').toString().toLowerCase();
    return priority == 'high';
  }

  String _timeAgo(DateTime? dt) {
    if (dt == null) return '-';
    final diff = DateTime.now().difference(dt.toLocal());
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) return '${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} ago';
    if (diff.inDays < 7) return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}


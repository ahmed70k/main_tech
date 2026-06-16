import 'package:flutter/material.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../domain/entities/notification_entity.dart';
import 'icon_config.dart';
class NotificationIcon extends StatelessWidget {
  final NotificationEntity notification;

  const NotificationIcon({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final config = _iconConfig(notification);

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [config.gradientStart, config.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(config.icon, color: Colors.white, size: 22),
    );
  }

  IconConfig _iconConfig(NotificationEntity n) {
    final type = (n.type ?? '').toLowerCase();
    final title = n.title.toLowerCase();

    if (type.contains('match') || title.contains('match')) {
      return IconConfig(
        icon: Icons.warning_amber_rounded,
        gradientStart: const Color(0xFFE53935),
        gradientEnd: const Color(0xFFB71C1C),
      );
    }
    if (type.contains('excel') ||
        type.contains('upload') ||
        title.contains('excel') ||
        title.contains('upload')) {
      return IconConfig(
        icon: Icons.check_circle_outline,
        gradientStart: AppColors.excelCardGradientStart,
        gradientEnd: AppColors.excelCardGradientEnd,
      );
    }
    if (type.contains('subscription') ||
        type.contains('premium') ||
        title.contains('subscription')) {
      return IconConfig(
        icon: Icons.workspace_premium_outlined,
        gradientStart: AppColors.premiumCardGradientStart,
        gradientEnd: AppColors.premiumCardGradientEnd,
      );
    }
    if (type.contains('feature') ||
        type.contains('update') ||
        title.contains('feature')) {
      return IconConfig(
        icon: Icons.info_outline,
        gradientStart: AppColors.micCardGradientStart,
        gradientEnd: AppColors.micCardGradientEnd,
      );
    }
    // Default
    return IconConfig(
      icon: notification.isRead
          ? Icons.notifications_none_outlined
          : Icons.notifications_active_outlined,
      gradientStart: AppColors.micCardGradientStart,
      gradientEnd: AppColors.micCardGradientEnd,
    );
  }
}
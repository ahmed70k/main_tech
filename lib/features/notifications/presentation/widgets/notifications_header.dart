import 'package:flutter/material.dart';

import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/utils/styles/app_styles.dart';

class NotificationsHeader extends StatelessWidget {
  final VoidCallback onMarkAllRead;

  const NotificationsHeader({super.key, required this.onMarkAllRead});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.fromLTRB(20, top + 20, 20, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A2FA0), Color(0xFF1565C0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Notifications',
              style: AppStyles.titleStyle.copyWith(fontSize: 26),
            ),
          ),
          GestureDetector(
            onTap: onMarkAllRead,
            child: Text(
              'Mark all read',
              style: AppStyles.inputLabelStyle.copyWith(
                color: AppColors.primaryCyan,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
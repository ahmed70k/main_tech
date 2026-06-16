import 'package:flutter/material.dart';

import '../../../../core/utils/colors/app_colors.dart';

class PillChipsRow extends StatelessWidget {
  final int newCount;
  final int totalCount;

  const PillChipsRow({super.key, required this.newCount, required this.totalCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Chip(
          icon: Icons.notifications_outlined,
          label: '$newCount New',
          iconColor: AppColors.textRed,
          bgColor: const Color(0xFF5C2C3A),
          labelColor: AppColors.textPrimary,
        ),
        const SizedBox(width: 10),
        _Chip(
          label: '$totalCount Total',
          bgColor: const Color(0xFF0D5C6E),
          labelColor: AppColors.textPrimary,
        ),
      ],
    );
  }
}
class _Chip extends StatelessWidget {
  final IconData? icon;
  final String label;
  final Color bgColor;
  final Color labelColor;
  final Color? iconColor;

  const _Chip({
    this.icon,
    required this.label,
    required this.bgColor,
    required this.labelColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: iconColor ?? labelColor),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: TextStyle(
              color: labelColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
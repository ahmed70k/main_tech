import 'package:flutter/material.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/core/widgets/app_dialog.dart';
import 'package:main_tech/core/widgets/sheet_action_button.dart';
import 'package:main_tech/features/admin/users/domain/entities/user_entity.dart';
import 'package:main_tech/features/admin/users/presentation/manager/users_cubit.dart';

class UserDetailSheet extends StatelessWidget {
  final UserEntity user;
  final UsersCubit cubit;

  const UserDetailSheet({
    super.key,
    required this.user,
    required this.cubit,
  });

  static Future<void> show(
    BuildContext context, {
    required UserEntity user,
    required UsersCubit cubit,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => UserDetailSheet(user: user, cubit: cubit),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAdmin = user.role?.toLowerCase() == 'admin';

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.inactiveDot,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primaryCyan.withValues(alpha: 0.15),
                backgroundImage: user.profileImage != null &&
                        user.profileImage!.isNotEmpty
                    ? NetworkImage(user.profileImage!)
                    : null,
                child: user.profileImage == null || user.profileImage!.isEmpty
                    ? Text(
                        _initials(user),
                        style: AppStyles.inputLabelStyle.copyWith(
                          color: AppColors.primaryCyan,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName,
                      style: AppStyles.titleStyle.copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.role?.toUpperCase() ?? 'USER',
                      style: AppStyles.inputLabelStyle.copyWith(
                        color: isAdmin ? AppColors.primaryCyan : AppColors.badgeHighText,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _DetailRow(label: 'Email', value: user.email ?? '-'),
          _DetailRow(label: 'Phone', value: user.phone ?? '-'),
          _DetailRow(label: 'Address', value: user.address ?? '-'),
          _DetailRow(
            label: 'Member Since',
            value: user.createdAt != null
                ? '${user.createdAt!.day}/${user.createdAt!.month}/${user.createdAt!.year}'
                : '-',
          ),
          const SizedBox(height: 24),
          if (!isAdmin)
            SheetActionButton(
              text: 'Delete User',
              icon: Icons.delete_outline_rounded,
              backgroundColor: const Color(0xFF4A2529),
              contentColor: const Color(0xFFFF5252),
              border: Border.all(
                color: const Color(0xFFFF5252).withValues(alpha: 0.3),
                width: 1,
              ),
              onPressed: () async {
                final confirmed = await AppDialogs.showConfirmation(
                  context,
                  title: 'حذف المستخدم',
                  message: 'هل أنت متأكد من حذف ${user.fullName}؟ لا يمكن التراجع عن هذا الإجراء.',
                );
                if (confirmed == true && context.mounted) {
                  Navigator.pop(context);
                  cubit.deleteUser(user.id!);
                }
              },
            ),
        ],
      ),
    );
  }

  String _initials(UserEntity user) {
    final first = user.fname?.trim().isNotEmpty == true
        ? user.fname!.trim()[0].toUpperCase()
        : '';
    final last = user.lname?.trim().isNotEmpty == true
        ? user.lname!.trim()[0].toUpperCase()
        : '';
    final initials = '$first$last';
    return initials.isEmpty ? '?' : initials;
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: AppStyles.inputLabelStyle.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppStyles.inputLabelStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

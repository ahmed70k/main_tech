import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/features/admin/users/presentation/widgets/user_detail_sheet.dart';
import '../../../../../core/utils/colors/app_colors.dart';
import '../../../../../core/utils/styles/app_styles.dart';
import '../../../../../core/widgets/app_dialog.dart';
import '../../domain/entities/user_entity.dart';
import '../manager/users_cubit.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final isAdmin = user.role?.toLowerCase() == 'admin';

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorderColor),
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => UserDetailSheet.show(
                  context,
                  user: user,
                  cubit: context.read<UsersCubit>(),
                ),
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      // Avatar
                      CircleAvatar(
                        radius: 26,
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
                            fontSize: 16,
                          ),
                        )
                            : null,
                      ),
                      const SizedBox(width: 14),
                      // Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.fullName,
                              style: AppStyles.inputLabelStyle.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              user.email ?? '-',
                              style: AppStyles.inputLabelStyle.copyWith(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                              ),
                            ),
                            if (user.phone != null) ...[
                              const SizedBox(height: 2),
                              Text(
                                user.phone!,
                                style: AppStyles.inputLabelStyle.copyWith(
                                  color: AppColors.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Role badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: isAdmin
                              ? AppColors.primaryCyan.withValues(alpha: 0.15)
                              : AppColors.badgeHighBg,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          (user.role ?? 'user').toUpperCase(),
                          style: AppStyles.badgeHighStyle.copyWith(
                            color: isAdmin
                                ? AppColors.primaryCyan
                                : AppColors.badgeHighText,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Delete button — hidden for admin accounts
            if (!isAdmin) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: IconButton(
                  onPressed: () => _confirmDelete(context),
                  icon: const Icon(Icons.delete_outline, size: 22),
                  color: AppColors.textRed,
                  tooltip: 'حذف المستخدم',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    if (user.id == null) return;
    final confirmed = await AppDialogs.showConfirmation(
      context,
      title: 'حذف المستخدم',
      message: 'هل أنت متأكد من حذف ${user.fullName}؟ لا يمكن التراجع عن هذا الإجراء.',
    );
    if (confirmed == true && context.mounted) {
      context.read<UsersCubit>().deleteUser(user.id!);
    }
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
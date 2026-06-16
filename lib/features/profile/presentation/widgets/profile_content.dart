import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:main_tech/features/profile/presentation/widgets/profile_info_tile.dart';
import 'package:main_tech/features/profile/presentation/widgets/update_profile_sheet.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/utils/styles/app_styles.dart';
import '../../../auth/logout/presentation/manager/logout_cubit.dart';
import '../../domain/entities/profile_entity.dart';
import '../manager/profile_cubit.dart';

class ProfileContent extends StatelessWidget {
  final ProfileEntity profile;

  const ProfileContent({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryCyan,
      onRefresh: () => context.read<ProfileCubit>().getProfile(),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        children: [
          Text('Profile', style: AppStyles.titleStyle),
          const SizedBox(height: 4),
          Text(
            'Your account information',
            style: AppStyles.inputLabelStyle.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          Center(child: ProfileAvatar(profile: profile)),
          const SizedBox(height: 16),
          Center(child: Text(profile.fullName, style: AppStyles.userNameStyle)),
          if (profile.role != null) ...[
            const SizedBox(height: 8),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryCyan.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  profile.role!.toUpperCase(),
                  style: AppStyles.badgeHighStyle.copyWith(
                    color: AppColors.primaryCyan,
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: 28),
          ProfileInfoTile(
            icon: Icons.email_outlined,
            label: 'Email',
            value: profile.email ?? '-',
          ),
          ProfileInfoTile(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: profile.phone ?? '-',
          ),
          ProfileInfoTile(
            icon: Icons.location_on_outlined,
            label: 'Address',
            value: profile.address ?? '-',
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () =>
                  UpdateProfileSheet.show(context, profile: profile),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryCyan,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(Icons.edit_outlined),
              label: Text(
                'Edit Profile',
                style: AppStyles.nextButtonStyle.copyWith(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => context.read<LogoutCubit>().logout(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.logoutButtonBackground,
                foregroundColor: AppColors.textRed,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(Icons.logout),
              label: Text('Logout', style: AppStyles.logoutButtonStyle),
            ),
          ),
        ],
      ),
    );
  }
}
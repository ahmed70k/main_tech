import 'package:flutter/material.dart';

import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/utils/styles/app_styles.dart';
import '../../domain/entities/profile_entity.dart';

class ProfileAvatar extends StatelessWidget {
  final ProfileEntity profile;

  const ProfileAvatar({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final imageUrl = profile.profileImage;

    return CircleAvatar(
      radius: 52,
      backgroundColor: AppColors.cardBackground,
      child: CircleAvatar(
        radius: 48,
        backgroundColor: AppColors.primaryCyan.withValues(alpha: 0.15),
        backgroundImage: imageUrl != null && imageUrl.isNotEmpty
            ? NetworkImage(imageUrl)
            : null,
        child: imageUrl == null || imageUrl.isEmpty
            ? Text(
          _initials(profile),
          style: AppStyles.titleStyle.copyWith(fontSize: 28),
        )
            : null,
      ),
    );
  }

  String _initials(ProfileEntity profile) {
    final first = profile.fname?.trim().isNotEmpty == true
        ? profile.fname!.trim()[0].toUpperCase()
        : '';
    final last = profile.lname?.trim().isNotEmpty == true
        ? profile.lname!.trim()[0].toUpperCase()
        : '';
    final initials = '$first$last';
    return initials.isEmpty ? '?' : initials;
  }
}
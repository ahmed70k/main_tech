import 'package:main_tech/features/admin/home/domain/entities/admin_stats_entity.dart';

class TopUserDto extends TopUserEntity {
  TopUserDto({super.userId});

  factory TopUserDto.fromJson(Map<String, dynamic> json) {
    return TopUserDto(userId: json['user_id'] as int?);
  }
}

class AdminStatsDataDto extends AdminStatsDataEntity {
  AdminStatsDataDto({
    super.users,
    super.activeSubscriptions,
    super.dailySearches,
    super.monthlySearches,
    super.topUsers,
  });

  factory AdminStatsDataDto.fromJson(Map<String, dynamic> json) {
    final topUsersJson = json['top_users'] as List<dynamic>? ?? [];
    return AdminStatsDataDto(
      users: json['users'] as int?,
      activeSubscriptions: json['active_subscriptions'] as int?,
      dailySearches: json['daily_searches'] as int?,
      monthlySearches: json['monthly_searches'] as int?,
      topUsers: topUsersJson
          .map((user) => TopUserDto.fromJson(user as Map<String, dynamic>))
          .toList(),
    );
  }
}

class AdminStatsResponseDto extends AdminStatsResponseEntity {
  AdminStatsResponseDto({
    super.message,
    super.data,
    super.status,
  });

  factory AdminStatsResponseDto.fromJson(Map<String, dynamic> json) {
    return AdminStatsResponseDto(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AdminStatsDataDto.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
    );
  }
}

class TopUserEntity {
  final int? userId;

  TopUserEntity({this.userId});
}

class AdminStatsDataEntity {
  final int? users;
  final int? activeSubscriptions;
  final int? dailySearches;
  final int? monthlySearches;
  final List<TopUserEntity> topUsers;

  AdminStatsDataEntity({
    this.users,
    this.activeSubscriptions,
    this.dailySearches,
    this.monthlySearches,
    this.topUsers = const [],
  });
}

class AdminStatsResponseEntity {
  final String? message;
  final AdminStatsDataEntity? data;
  final int? status;

  AdminStatsResponseEntity({
    this.message,
    this.data,
    this.status,
  });
}

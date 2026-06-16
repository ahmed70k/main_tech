import 'package:main_tech/features/notifications/domain/entities/notification_entity.dart';

class NotificationDto extends NotificationEntity {
  NotificationDto({
    super.id,
    super.type,
    super.data,
    super.readAt,
    super.createdAt,
    super.updatedAt,
  });

  factory NotificationDto.fromJson(Map<String, dynamic> json) {
    return NotificationDto(
      id: json['id']?.toString(),
      type: json['type'] as String?,
      data: json['data'] is Map<String, dynamic>
          ? json['data'] as Map<String, dynamic>
          : null,
      readAt: json['read_at'] == null
          ? null
          : DateTime.parse(json['read_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
  }
}

class NotificationsPaginatedDto extends NotificationsPaginatedEntity {
  NotificationsPaginatedDto({
    super.currentPage,
    super.notifications,
    super.lastPage,
    super.perPage,
    super.total,
  });

  factory NotificationsPaginatedDto.fromJson(Map<String, dynamic> json) {
    final notificationsJson = json['data'] as List<dynamic>? ?? [];
    return NotificationsPaginatedDto(
      currentPage: json['current_page'] as int?,
      notifications: notificationsJson
          .map(
            (notification) => NotificationDto.fromJson(
              notification as Map<String, dynamic>,
            ),
          )
          .toList(),
      lastPage: json['last_page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
    );
  }
}

class NotificationsListDto extends NotificationsListEntity {
  NotificationsListDto({
    super.message,
    super.data,
    super.status,
  });

  factory NotificationsListDto.fromJson(Map<String, dynamic> json) {
    return NotificationsListDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : NotificationsPaginatedDto.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );
  }
}

class UnreadNotificationsCountDto extends UnreadNotificationsCountEntity {
  UnreadNotificationsCountDto({
    super.message,
    super.count,
    super.status,
  });

  factory UnreadNotificationsCountDto.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return UnreadNotificationsCountDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      count: data is int
          ? data
          : data is String
              ? int.tryParse(data)
              : null,
    );
  }
}

class UnreadNotificationsListDto extends UnreadNotificationsListEntity {
  UnreadNotificationsListDto({
    super.message,
    super.notifications,
    super.status,
  });

  factory UnreadNotificationsListDto.fromJson(Map<String, dynamic> json) {
    final notificationsJson = json['data'] as List<dynamic>? ?? [];
    return UnreadNotificationsListDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      notifications: notificationsJson
          .map(
            (notification) => NotificationDto.fromJson(
              notification as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}

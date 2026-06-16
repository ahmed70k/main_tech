class NotificationEntity {
  final String? id;
  final String? type;
  final Map<String, dynamic>? data;
  final DateTime? readAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  NotificationEntity({
    this.id,
    this.type,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  bool get isRead => readAt != null;

  String get title {
    final payload = data;
    if (payload == null) return type ?? '-';
    return (payload['title'] ??
            payload['subject'] ??
            payload['heading'] ??
            type ??
            '-')
        .toString();
  }

  String get body {
    final payload = data;
    if (payload == null) return '-';
    return (payload['message'] ??
            payload['body'] ??
            payload['content'] ??
            payload['text'] ??
            '-')
        .toString();
  }
}

class NotificationsPaginatedEntity {
  final int? currentPage;
  final List<NotificationEntity> notifications;
  final int? lastPage;
  final int? perPage;
  final int? total;

  NotificationsPaginatedEntity({
    this.currentPage,
    this.notifications = const [],
    this.lastPage,
    this.perPage,
    this.total,
  });
}

class NotificationsListEntity {
  final String? message;
  final NotificationsPaginatedEntity? data;
  final int? status;

  NotificationsListEntity({
    this.message,
    this.data,
    this.status,
  });
}

class UnreadNotificationsListEntity {
  final String? message;
  final List<NotificationEntity> notifications;
  final int? status;

  UnreadNotificationsListEntity({
    this.message,
    this.notifications = const [],
    this.status,
  });
}

class UnreadNotificationsCountEntity {
  final String? message;
  final int? count;
  final int? status;

  UnreadNotificationsCountEntity({
    this.message,
    this.count,
    this.status,
  });
}

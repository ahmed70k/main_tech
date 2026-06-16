import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/notifications/domain/entities/notification_entity.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, NotificationsListEntity>> getNotifications({
    int? page,
  });

  Future<Either<Failure, UnreadNotificationsListEntity>>
      getUnreadNotifications();

  Future<Either<Failure, UnreadNotificationsCountEntity>>
      getUnreadNotificationsCount();

  Future<Either<Failure, NotificationsListEntity>> markNotificationAsRead(
    String id,
  );

  Future<Either<Failure, NotificationsListEntity>> markAllNotificationsAsRead();

  Future<Either<Failure, NotificationsListEntity>> deleteNotification(String id);
}

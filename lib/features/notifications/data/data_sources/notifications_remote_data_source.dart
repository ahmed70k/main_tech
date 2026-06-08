import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/notifications/data/models/notification_dto.dart';

abstract class NotificationsRemoteDataSource {
  Future<Either<Failure, NotificationsListDto>> getNotifications({int? page});

  Future<Either<Failure, UnreadNotificationsListDto>> getUnreadNotifications();

  Future<Either<Failure, UnreadNotificationsCountDto>>
  getUnreadNotificationsCount();

  Future<Either<Failure, NotificationsListDto>> markNotificationAsRead(
    String id,
  );

  Future<Either<Failure, NotificationsListDto>> markAllNotificationsAsRead();

  Future<Either<Failure, NotificationsListDto>> deleteNotification(String id);
}

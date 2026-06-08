import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/notifications/domain/entities/notification_entity.dart';
import 'package:main_tech/features/notifications/domain/repositories/notifications_repository.dart';

import '../data_sources/notifications_remote_data_source.dart';

@Injectable(as: NotificationsRepository)
class NotificationsRepositoryImp implements NotificationsRepository {
  final NotificationsRemoteDataSource remoteDataSource;

  NotificationsRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, NotificationsListEntity>> getNotifications({
    int? page,
  }) {
    return remoteDataSource.getNotifications(page: page);
  }

  @override
  Future<Either<Failure, UnreadNotificationsListEntity>>
      getUnreadNotifications() {
    return remoteDataSource.getUnreadNotifications();
  }

  @override
  Future<Either<Failure, UnreadNotificationsCountEntity>>
      getUnreadNotificationsCount() {
    return remoteDataSource.getUnreadNotificationsCount();
  }

  @override
  Future<Either<Failure, NotificationsListEntity>> markNotificationAsRead(
    String id,
  ) {
    return remoteDataSource.markNotificationAsRead(id);
  }

  @override
  Future<Either<Failure, NotificationsListEntity>> markAllNotificationsAsRead() {
    return remoteDataSource.markAllNotificationsAsRead();
  }

  @override
  Future<Either<Failure, NotificationsListEntity>> deleteNotification(String id) {
    return remoteDataSource.deleteNotification(id);
  }
}

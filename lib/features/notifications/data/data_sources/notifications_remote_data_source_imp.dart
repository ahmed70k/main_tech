import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/notifications/data/models/notification_dto.dart';

import 'notifications_remote_data_source.dart';

@Injectable(as: NotificationsRemoteDataSource)
class NotificationsRemoteDataSourceImp
    implements NotificationsRemoteDataSource {
  final ApiManager apiManager;

  NotificationsRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<Failure, NotificationsListDto>> getNotifications({
    int? page,
  }) async {
    try {
      final response = await apiManager.getData(
        endpoint: Endpoints.notifications,
        headers: {'Accept': 'application/json'},
        queryParameters: page != null ? {'page': page} : null,
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(NotificationsListDto.fromJson(response.data));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UnreadNotificationsListDto>>
      getUnreadNotifications() async {
    try {
      final response = await apiManager.getData(
        endpoint: Endpoints.notificationsUnread,
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(UnreadNotificationsListDto.fromJson(response.data));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UnreadNotificationsCountDto>>
      getUnreadNotificationsCount() async {
    try {
      final response = await apiManager.getData(
        endpoint: Endpoints.notificationsUnreadCount,
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(UnreadNotificationsCountDto.fromJson(response.data));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationsListDto>> markNotificationAsRead(
    String id,
  ) async {
    try {
      final response = await apiManager.postData(
        endpoint: Endpoints.markNotificationAsRead(id),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(NotificationsListDto.fromJson(response.data));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationsListDto>> markAllNotificationsAsRead() async {
    try {
      final response = await apiManager.postData(
        endpoint: Endpoints.markAllNotificationsAsRead,
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(NotificationsListDto.fromJson(response.data));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationsListDto>> deleteNotification(
    String id,
  ) async {
    try {
      final response = await apiManager.deleteData(
        endpoint: Endpoints.deleteNotification(id),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(NotificationsListDto.fromJson(response.data));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

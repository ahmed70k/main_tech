import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions/data/models/subscription_dto.dart';

import 'subscriptions_remote_data_source.dart';

@Injectable(as: SubscriptionsRemoteDataSource)
class SubscriptionsRemoteDataSourceImp implements SubscriptionsRemoteDataSource {
  final ApiManager apiManager;

  SubscriptionsRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<Failure, SubscriptionsListDto>> getSubscriptions({
    int? page,
  }) async {
    try {
      final response = await apiManager.getData(
        endpoint: Endpoints.subscriptions,
        headers: {'Accept': 'application/json'},
        queryParameters: page != null ? {'page': page} : null,
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(SubscriptionsListDto.fromJson(response.data));
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
  Future<Either<Failure, SubscriptionGetIdDto>> getIdSubscription(
    int id,
  ) async {
    try {
      final response = await apiManager.getData(
        endpoint: Endpoints.subscriptionById(id),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(SubscriptionGetIdDto.fromJson(response.data));
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
  Future<Either<Failure, SubscriptionUpdateIdDto>> updateIdSubscription({
    required int id,
    required int userId,
    required int planId,
    required String startDate,
    required String endDate,
    required bool isActive,
  }) async {
    try {
      final response = await apiManager.putData(
        endpoint: Endpoints.subscriptionById(id),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        data: {
          'user_id': userId,
          'plan_id': planId,
          'start_date': startDate,
          'end_date': endDate,
          'is_active': isActive,
        },
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(SubscriptionUpdateIdDto.fromJson(response.data));
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
  Future<Either<Failure, DeleteIdSubscriptionDto>> deleteIdSubscription(
    int id,
  ) async {
    try {
      final response = await apiManager.deleteData(
        endpoint: Endpoints.subscriptionById(id),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(DeleteIdSubscriptionDto.fromJson(response.data));
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
  Future<Either<Failure, AssignSubscriptionDto>> assignSubscription({
    required int userId,
    required int planId,
  }) async {
    try {
      final response = await apiManager.postData(
        endpoint: Endpoints.subscriptionsAssign,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        data: {
          'user_id': userId,
          'plan_id': planId,
        },
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(AssignSubscriptionDto.fromJson(response.data));
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

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions_plans/data/models/subscription_plan_dto.dart';

import 'subscription_plans_remote_data_source.dart';

@Injectable(as: SubscriptionPlansRemoteDataSource)
class SubscriptionPlansRemoteDataSourceImp
    implements SubscriptionPlansRemoteDataSource {
  final ApiManager apiManager;

  SubscriptionPlansRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<Failure, SubscriptionPlansListDto>> getSubscriptionPlans({
    int? page,
  }) async {
    try {
      final response = await apiManager.getData(
        endpoint: Endpoints.subscriptionPlans,
        headers: {'Accept': 'application/json'},
        queryParameters: page != null ? {'page': page} : null,
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(SubscriptionPlansListDto.fromJson(response.data));
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
  Future<Either<Failure, SubscriptionPlanGetIdDto>> getIdSubscriptionPlan(
    int id,
  ) async {
    try {
      final response = await apiManager.getData(
        endpoint: Endpoints.subscriptionPlanById(id),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(SubscriptionPlanGetIdDto.fromJson(response.data));
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
  Future<Either<Failure, SubscriptionPlanUpdateIdDto>> updateIdSubscriptionPlan({
    required int id,
    required String name,
    required double price,
    required int durationDays,
  }) async {
    try {
      final response = await apiManager.putData(
        endpoint: Endpoints.subscriptionPlanById(id),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        data: {
          'name': name,
          'price': price,
          'duration_days': durationDays,
        },
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(SubscriptionPlanUpdateIdDto.fromJson(response.data));
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
  Future<Either<Failure, CreateSubscriptionPlanDto>> createSubscriptionPlan({
    required String name,
    required double price,
    required int durationDays,
    required String description,
  }) async {
    try {
      final response = await apiManager.postData(
        endpoint: Endpoints.subscriptionPlans,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        data: {
          'name': name,
          'price': price,
          'duration_days': durationDays,
          'description': description,
        },
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(CreateSubscriptionPlanDto.fromJson(response.data));
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
  Future<Either<Failure, DeleteIdSubscriptionPlanDto>> deleteIdSubscriptionPlan(
    int id,
  ) async {
    try {
      final response = await apiManager.deleteData(
        endpoint: Endpoints.subscriptionPlanById(id),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(DeleteIdSubscriptionPlanDto.fromJson(response.data));
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

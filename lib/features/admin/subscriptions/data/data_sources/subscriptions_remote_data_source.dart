import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions/data/models/subscription_dto.dart';

abstract class SubscriptionsRemoteDataSource {
  Future<Either<Failure, SubscriptionsListDto>> getSubscriptions({
    int? page,
  });

  Future<Either<Failure, SubscriptionGetIdDto>> getIdSubscription(int id);

  Future<Either<Failure, SubscriptionUpdateIdDto>> updateIdSubscription({
    required int id,
    required int userId,
    required int planId,
    required String startDate,
    required String endDate,
    required bool isActive,
  });

  Future<Either<Failure, DeleteIdSubscriptionDto>> deleteIdSubscription(int id);

  Future<Either<Failure, AssignSubscriptionDto>> assignSubscription({
    required int userId,
    required int planId,
  });
}

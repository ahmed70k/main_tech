import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions/domain/entities/subscription_entity.dart';

abstract class SubscriptionsRepository {
  Future<Either<Failure, SubscriptionsListEntity>> getSubscriptions({
    int? page,
  });

  Future<Either<Failure, SubscriptionGetIdEntity>> getIdSubscription(int id);

  Future<Either<Failure, SubscriptionUpdateIdEntity>> updateIdSubscription({
    required int id,
    required int userId,
    required int planId,
    required String startDate,
    required String endDate,
    required bool isActive,
  });

  Future<Either<Failure, DeleteIdSubscriptionEntity>> deleteIdSubscription(
    int id,
  );

  Future<Either<Failure, AssignSubscriptionEntity>> assignSubscription({
    required int userId,
    required int planId,
  });
}

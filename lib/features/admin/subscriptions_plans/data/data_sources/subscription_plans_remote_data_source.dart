import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions_plans/data/models/subscription_plan_dto.dart';

abstract class SubscriptionPlansRemoteDataSource {
  Future<Either<Failure, SubscriptionPlansListDto>> getSubscriptionPlans({
    int? page,
  });

  Future<Either<Failure, SubscriptionPlanGetIdDto>> getIdSubscriptionPlan(
    int id,
  );

  Future<Either<Failure, SubscriptionPlanUpdateIdDto>> updateIdSubscriptionPlan({
    required int id,
    required String name,
    required double price,
    required int durationDays,
  });

  Future<Either<Failure, CreateSubscriptionPlanDto>> createSubscriptionPlan({
    required String name,
    required double price,
    required int durationDays,
    required String description,
  });

  Future<Either<Failure, DeleteIdSubscriptionPlanDto>> deleteIdSubscriptionPlan(
    int id,
  );
}

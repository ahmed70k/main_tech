import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/entities/subscription_plan_entity.dart';

abstract class SubscriptionPlansRepository {
  Future<Either<Failure, SubscriptionPlansListEntity>> getSubscriptionPlans({
    int? page,
  });

  Future<Either<Failure, SubscriptionPlanGetIdEntity>> getIdSubscriptionPlan(
    int id,
  );

  Future<Either<Failure, SubscriptionPlanUpdateIdEntity>> updateIdSubscriptionPlan({
    required int id,
    required String name,
    required double price,
    required int durationDays,
  });

  Future<Either<Failure, CreateSubscriptionPlanEntity>> createSubscriptionPlan({
    required String name,
    required double price,
    required int durationDays,
    required String description,
  });

  Future<Either<Failure, DeleteIdSubscriptionPlanEntity>> deleteIdSubscriptionPlan(
    int id,
  );
}

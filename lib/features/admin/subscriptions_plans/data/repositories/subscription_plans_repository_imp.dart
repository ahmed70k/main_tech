import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/entities/subscription_plan_entity.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/repositories/subscription_plans_repository.dart';

import '../data_sources/subscription_plans_remote_data_source.dart';

@Injectable(as: SubscriptionPlansRepository)
class SubscriptionPlansRepositoryImp implements SubscriptionPlansRepository {
  final SubscriptionPlansRemoteDataSource remoteDataSource;

  SubscriptionPlansRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, SubscriptionPlansListEntity>> getSubscriptionPlans({
    int? page,
  }) {
    return remoteDataSource.getSubscriptionPlans(page: page);
  }

  @override
  Future<Either<Failure, SubscriptionPlanGetIdEntity>> getIdSubscriptionPlan(
    int id,
  ) {
    return remoteDataSource.getIdSubscriptionPlan(id);
  }

  @override
  Future<Either<Failure, SubscriptionPlanUpdateIdEntity>> updateIdSubscriptionPlan({
    required int id,
    required String name,
    required double price,
    required int durationDays,
  }) {
    return remoteDataSource.updateIdSubscriptionPlan(
      id: id,
      name: name,
      price: price,
      durationDays: durationDays,
    );
  }

  @override
  Future<Either<Failure, CreateSubscriptionPlanEntity>> createSubscriptionPlan({
    required String name,
    required double price,
    required int durationDays,
    required String description,
  }) {
    return remoteDataSource.createSubscriptionPlan(
      name: name,
      price: price,
      durationDays: durationDays,
      description: description,
    );
  }

  @override
  Future<Either<Failure, DeleteIdSubscriptionPlanEntity>> deleteIdSubscriptionPlan(
    int id,
  ) {
    return remoteDataSource.deleteIdSubscriptionPlan(id);
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/entities/subscription_plan_entity.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/repositories/subscription_plans_repository.dart';

@injectable
class CreateSubscriptionPlanUseCase {
  final SubscriptionPlansRepository repository;

  CreateSubscriptionPlanUseCase(this.repository);

  Future<Either<Failure, CreateSubscriptionPlanEntity>> call({
    required String name,
    required double price,
    required int durationDays,
    required String description,
  }) {
    return repository.createSubscriptionPlan(
      name: name,
      price: price,
      durationDays: durationDays,
      description: description,
    );
  }
}

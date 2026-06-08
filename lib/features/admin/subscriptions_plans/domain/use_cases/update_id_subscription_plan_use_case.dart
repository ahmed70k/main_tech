import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/entities/subscription_plan_entity.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/repositories/subscription_plans_repository.dart';

@injectable
class UpdateIdSubscriptionPlanUseCase {
  final SubscriptionPlansRepository repository;

  UpdateIdSubscriptionPlanUseCase(this.repository);

  Future<Either<Failure, SubscriptionPlanUpdateIdEntity>> call({
    required int id,
    required String name,
    required double price,
    required int durationDays,
  }) {
    return repository.updateIdSubscriptionPlan(
      id: id,
      name: name,
      price: price,
      durationDays: durationDays,
    );
  }
}

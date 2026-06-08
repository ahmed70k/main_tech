import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/entities/subscription_plan_entity.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/repositories/subscription_plans_repository.dart';

@injectable
class GetIdSubscriptionPlanUseCase {
  final SubscriptionPlansRepository repository;

  GetIdSubscriptionPlanUseCase(this.repository);

  Future<Either<Failure, SubscriptionPlanGetIdEntity>> call(int id) {
    return repository.getIdSubscriptionPlan(id);
  }
}

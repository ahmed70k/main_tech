import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/entities/subscription_plan_entity.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/repositories/subscription_plans_repository.dart';

@injectable
class GetSubscriptionPlansUseCase {
  final SubscriptionPlansRepository repository;

  GetSubscriptionPlansUseCase(this.repository);

  Future<Either<Failure, SubscriptionPlansListEntity>> call({int? page}) {
    return repository.getSubscriptionPlans(page: page);
  }
}

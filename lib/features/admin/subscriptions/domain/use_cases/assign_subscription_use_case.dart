import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions/domain/entities/subscription_entity.dart';
import 'package:main_tech/features/admin/subscriptions/domain/repositories/subscriptions_repository.dart';

@injectable
class AssignSubscriptionUseCase {
  final SubscriptionsRepository repository;

  AssignSubscriptionUseCase(this.repository);

  Future<Either<Failure, AssignSubscriptionEntity>> call({
    required int userId,
    required int planId,
  }) {
    return repository.assignSubscription(
      userId: userId,
      planId: planId,
    );
  }
}

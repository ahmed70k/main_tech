import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions/domain/entities/subscription_entity.dart';
import 'package:main_tech/features/admin/subscriptions/domain/repositories/subscriptions_repository.dart';

@injectable
class UpdateIdSubscriptionUseCase {
  final SubscriptionsRepository repository;

  UpdateIdSubscriptionUseCase(this.repository);

  Future<Either<Failure, SubscriptionUpdateIdEntity>> call({
    required int id,
    required int userId,
    required int planId,
    required String startDate,
    required String endDate,
    required bool isActive,
  }) {
    return repository.updateIdSubscription(
      id: id,
      userId: userId,
      planId: planId,
      startDate: startDate,
      endDate: endDate,
      isActive: isActive,
    );
  }
}

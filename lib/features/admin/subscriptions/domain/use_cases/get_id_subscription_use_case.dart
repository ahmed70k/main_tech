import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions/domain/entities/subscription_entity.dart';
import 'package:main_tech/features/admin/subscriptions/domain/repositories/subscriptions_repository.dart';

@injectable
class GetIdSubscriptionUseCase {
  final SubscriptionsRepository repository;

  GetIdSubscriptionUseCase(this.repository);

  Future<Either<Failure, SubscriptionGetIdEntity>> call(int id) {
    return repository.getIdSubscription(id);
  }
}

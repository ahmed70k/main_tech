import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/subscriptions/domain/entities/subscription_entity.dart';
import 'package:main_tech/features/admin/subscriptions/domain/repositories/subscriptions_repository.dart';

import '../data_sources/subscriptions_remote_data_source.dart';

@Injectable(as: SubscriptionsRepository)
class SubscriptionsRepositoryImp implements SubscriptionsRepository {
  final SubscriptionsRemoteDataSource remoteDataSource;

  SubscriptionsRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, SubscriptionsListEntity>> getSubscriptions({
    int? page,
  }) {
    return remoteDataSource.getSubscriptions(page: page);
  }

  @override
  Future<Either<Failure, SubscriptionGetIdEntity>> getIdSubscription(int id) {
    return remoteDataSource.getIdSubscription(id);
  }

  @override
  Future<Either<Failure, SubscriptionUpdateIdEntity>> updateIdSubscription({
    required int id,
    required int userId,
    required int planId,
    required String startDate,
    required String endDate,
    required bool isActive,
  }) {
    return remoteDataSource.updateIdSubscription(
      id: id,
      userId: userId,
      planId: planId,
      startDate: startDate,
      endDate: endDate,
      isActive: isActive,
    );
  }

  @override
  Future<Either<Failure, DeleteIdSubscriptionEntity>> deleteIdSubscription(
    int id,
  ) {
    return remoteDataSource.deleteIdSubscription(id);
  }

  @override
  Future<Either<Failure, AssignSubscriptionEntity>> assignSubscription({
    required int userId,
    required int planId,
  }) {
    return remoteDataSource.assignSubscription(
      userId: userId,
      planId: planId,
    );
  }
}

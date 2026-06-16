import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/notifications/domain/entities/notification_entity.dart';
import 'package:main_tech/features/notifications/domain/repositories/notifications_repository.dart';

@injectable
class GetUnreadNotificationsCountUseCase {
  final NotificationsRepository repository;

  GetUnreadNotificationsCountUseCase(this.repository);

  Future<Either<Failure, UnreadNotificationsCountEntity>> call() {
    return repository.getUnreadNotificationsCount();
  }
}

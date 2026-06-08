import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/domain/entities/auth_base_message_entity.dart';
import '../repositories/logout_repository.dart';

@injectable
class LogoutUseCase {
  final LogoutRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<Failure, AuthBaseMessageEntity>> call() => repository.logout();
}

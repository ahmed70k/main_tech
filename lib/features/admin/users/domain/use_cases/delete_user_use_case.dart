import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/users/domain/entities/user_entity.dart';
import 'package:main_tech/features/admin/users/domain/repositories/users_repository.dart';

@injectable
class DeleteUserUseCase {
  final UsersRepository repository;

  DeleteUserUseCase(this.repository);

  Future<Either<Failure, DeleteUserEntity>> call(int id) {
    return repository.deleteUser(id);
  }
}

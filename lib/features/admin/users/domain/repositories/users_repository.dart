import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/users/domain/entities/user_entity.dart';

abstract class UsersRepository {
  Future<Either<Failure, UsersListEntity>> getUsers({int? page});
  Future<Either<Failure, DeleteUserEntity>> deleteUser(int id);
  Future<Either<Failure, GetUserByIdEntity>> getUser(int id);
}

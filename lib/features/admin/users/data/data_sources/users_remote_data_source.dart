import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/users/data/models/user_dto.dart';

abstract class UsersRemoteDataSource {
  Future<Either<Failure, UsersListDto>> getUsers({int? page});
  Future<Either<Failure, DeleteUserDto>> deleteUser(int id);
  Future<Either<Failure, GetUserByIdDto>> getUser(int id);
}

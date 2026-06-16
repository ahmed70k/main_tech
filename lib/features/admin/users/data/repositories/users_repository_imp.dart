import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/users/data/data_sources/users_remote_data_source.dart';
import 'package:main_tech/features/admin/users/domain/entities/user_entity.dart';
import 'package:main_tech/features/admin/users/domain/repositories/users_repository.dart';

@Injectable(as: UsersRepository)
class UsersRepositoryImp implements UsersRepository {
  final UsersRemoteDataSource remoteDataSource;

  UsersRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, UsersListEntity>> getUsers({int? page}) {
    return remoteDataSource.getUsers(page: page);
  }

  @override
  Future<Either<Failure, DeleteUserEntity>> deleteUser(int id) {
    return remoteDataSource.deleteUser(id);
  }

  @override
  Future<Either<Failure, GetUserByIdEntity>> getUser(int id) {
    return remoteDataSource.getUser(id);
  }
}

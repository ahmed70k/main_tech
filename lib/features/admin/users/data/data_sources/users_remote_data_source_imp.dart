import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/users/data/data_sources/users_remote_data_source.dart';
import 'package:main_tech/features/admin/users/data/models/user_dto.dart';

@Injectable(as: UsersRemoteDataSource)
class UsersRemoteDataSourceImp implements UsersRemoteDataSource {
  final ApiManager apiManager;

  UsersRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<Failure, UsersListDto>> getUsers({int? page}) async {
    try {
      final response = await apiManager.getData(
        endpoint: Endpoints.adminUsers,
        headers: {'Accept': 'application/json'},
        queryParameters: page != null ? {'page': page} : null,
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(UsersListDto.fromJson(response.data));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteUserDto>> deleteUser(int id) async {
    try {
      final response = await apiManager.deleteData(
        endpoint: Endpoints.adminUserById(id),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(DeleteUserDto.fromJson(response.data));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetUserByIdDto>> getUser(int id) async {
    try {
      final response = await apiManager.getData(
        endpoint: Endpoints.adminUserById(id),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(GetUserByIdDto.fromJson(response.data));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/login/data/models/login_response_dto.dart';
import 'package:main_tech/features/auth/login/domain/repositories/login_remote_data_source.dart';

@Injectable(as: LoginRemoteDataSourceInterface)
class LoginRemoteDataSourceImp implements LoginRemoteDataSourceInterface {
  final ApiManager apiManager;
  LoginRemoteDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failure, LoginResponseDto>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiManager.postData(
        endpoint: Endpoints.login,
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final loginResponse = LoginResponseDto.fromJson(response.data);
        return Right(loginResponse);
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

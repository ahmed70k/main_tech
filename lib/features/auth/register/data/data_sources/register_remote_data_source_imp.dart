import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/register/data/models/register_response_dto.dart';
import 'package:main_tech/features/auth/register/domain/repositories/register_remote_data_source.dart';

@Injectable(as: RegisterRemoteDataSourceInterface)
class RegisterRemoteDataSourceImp implements RegisterRemoteDataSourceInterface {
  ApiManager apiManager;
  RegisterRemoteDataSourceImp({required this.apiManager});
  @override
  Future<Either<Failure, RegisterResponseDto>> register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    // TODO: implement register
    try {
      final response = await apiManager.postData(
        endpoint: Endpoints.register,
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },
        data: {
          'email': email,
          'password': password,
          'password_confirmation': password,
          'fname': fullName,
          'lname': 'dummy data',
          'phone': phone,
          'address': 'dummy data',
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final registerResponse = RegisterResponseDto.fromJson(response.data);

        return Right(registerResponse);
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

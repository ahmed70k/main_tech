import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/data/models/auth_base_message_dto.dart';
import 'reset_password_remote_data_source.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImp implements ResetPasswordRemoteDataSource {
  final ApiManager apiManager;

  ResetPasswordRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<Failure, AuthBaseMessageDto>> resetPassword({
    required String otp,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await apiManager.postData(
        endpoint: Endpoints.resetPasswordOtp,
        data: {
          'otp': otp,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      return Right(AuthBaseMessageDto.fromJson(response.data));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

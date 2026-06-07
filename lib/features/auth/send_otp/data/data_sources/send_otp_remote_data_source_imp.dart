import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/data/models/auth_base_message_dto.dart';
import 'send_otp_remote_data_source.dart';

@Injectable(as: SendOtpRemoteDataSource)
class SendOtpRemoteDataSourceImp implements SendOtpRemoteDataSource {
  final ApiManager apiManager;

  SendOtpRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<Failure, AuthBaseMessageDto>> sendOtp({
    required String email,
  }) async {
    try {
      final response = await apiManager.postData(
        endpoint: Endpoints.sendOtp,
        data: {'email': email},
      );
      return Right(AuthBaseMessageDto.fromJson(response.data));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

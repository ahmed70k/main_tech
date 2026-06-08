import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/data/models/auth_base_message_dto.dart';
import 'logout_remote_data_source.dart';

@Injectable(as: LogoutRemoteDataSource)
class LogoutRemoteDataSourceImp implements LogoutRemoteDataSource {
  final ApiManager apiManager;

  LogoutRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<Failure, AuthBaseMessageDto>> logout() async {
    try {
      final response = await apiManager.postData(
        endpoint: Endpoints.logout,
      );
      return Right(AuthBaseMessageDto.fromJson(response.data));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

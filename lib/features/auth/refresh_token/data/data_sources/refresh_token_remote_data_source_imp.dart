import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import '../models/refresh_token_response_dto.dart';
import 'refresh_token_remote_data_source.dart';

@Injectable(as: RefreshTokenRemoteDataSource)
class RefreshTokenRemoteDataSourceImp implements RefreshTokenRemoteDataSource {
  final ApiManager apiManager;

  RefreshTokenRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<Failure, RefreshTokenResponseDto>> refreshToken() async {
    try {
      final response = await apiManager.postData(
        endpoint: Endpoints.refreshToken,
      );
      return Right(RefreshTokenResponseDto.fromJson(response.data));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

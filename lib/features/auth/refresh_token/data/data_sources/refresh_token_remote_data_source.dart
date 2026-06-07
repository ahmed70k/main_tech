import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import '../models/refresh_token_response_dto.dart';

abstract class RefreshTokenRemoteDataSource {
  Future<Either<Failure, RefreshTokenResponseDto>> refreshToken();
}

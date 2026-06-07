import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import '../entities/refresh_token_response_entity.dart';

abstract class RefreshTokenRepository {
  Future<Either<Failure, RefreshTokenResponseEntity>> refreshToken();
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import '../entities/refresh_token_response_entity.dart';
import '../repositories/refresh_token_repository.dart';

@injectable
class RefreshTokenUseCase {
  final RefreshTokenRepository repository;

  RefreshTokenUseCase(this.repository);

  Future<Either<Failure, RefreshTokenResponseEntity>> call() =>
      repository.refreshToken();
}

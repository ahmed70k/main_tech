import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import '../../domain/entities/refresh_token_response_entity.dart';
import '../../domain/repositories/refresh_token_repository.dart';
import '../data_sources/refresh_token_remote_data_source.dart';

@Injectable(as: RefreshTokenRepository)
class RefreshTokenRepositoryImp implements RefreshTokenRepository {
  final RefreshTokenRemoteDataSource remoteDataSource;

  RefreshTokenRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, RefreshTokenResponseEntity>> refreshToken() async {
    return await remoteDataSource.refreshToken();
  }
}

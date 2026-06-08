import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/domain/entities/auth_base_message_entity.dart';
import '../../domain/repositories/logout_repository.dart';
import '../data_sources/logout_remote_data_source.dart';

@Injectable(as: LogoutRepository)
class LogoutRepositoryImp implements LogoutRepository {
  final LogoutRemoteDataSource remoteDataSource;

  LogoutRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, AuthBaseMessageEntity>> logout() async {
    return await remoteDataSource.logout();
  }
}

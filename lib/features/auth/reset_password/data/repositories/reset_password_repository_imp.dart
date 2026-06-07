import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/domain/entities/auth_base_message_entity.dart';
import '../../domain/repositories/reset_password_repository.dart';
import '../data_sources/reset_password_remote_data_source.dart';

@Injectable(as: ResetPasswordRepository)
class ResetPasswordRepositoryImp implements ResetPasswordRepository {
  final ResetPasswordRemoteDataSource remoteDataSource;

  ResetPasswordRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, AuthBaseMessageEntity>> resetPassword({
    required String otp,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await remoteDataSource.resetPassword(
      otp: otp,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}

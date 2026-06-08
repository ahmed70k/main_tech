import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/login/domain/entities/login_response_entity.dart';
import 'package:main_tech/features/auth/login/domain/repositories/login_remote_data_source.dart';
import 'package:main_tech/features/auth/login/domain/repositories/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImp implements LoginRepository {
  final LoginRemoteDataSourceInterface loginRemoteDataSource;
  LoginRepositoryImp({required this.loginRemoteDataSource});

  @override
  Future<Either<Failure, LoginResponseEntity>> login({
    required String email,
    required String password,
  }) async {
    return await loginRemoteDataSource.login(
      email: email,
      password: password,
    );
  }
}

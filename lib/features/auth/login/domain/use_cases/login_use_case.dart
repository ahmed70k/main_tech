import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/login/domain/entities/login_response_entity.dart';
import '../repositories/login_repository.dart';

@injectable
class LoginUseCase {
  final LoginRepository loginRepository;
  LoginUseCase({required this.loginRepository});

  Future<Either<Failure, LoginResponseEntity>> call({
    required String email,
    required String password,
  }) {
    return loginRepository.login(
      email: email,
      password: password,
    );
  }
}

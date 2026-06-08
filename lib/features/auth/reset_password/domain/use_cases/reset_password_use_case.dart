import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/domain/entities/auth_base_message_entity.dart';
import '../repositories/reset_password_repository.dart';

@injectable
class ResetPasswordUseCase {
  final ResetPasswordRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<Either<Failure, AuthBaseMessageEntity>> call({
    required String otp,
    required String password,
    required String passwordConfirmation,
  }) {
    return repository.resetPassword(
      otp: otp,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}

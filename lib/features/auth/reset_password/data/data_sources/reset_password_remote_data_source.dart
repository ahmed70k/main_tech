import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/data/models/auth_base_message_dto.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<Either<Failure, AuthBaseMessageDto>> resetPassword({
    required String otp,
    required String password,
    required String passwordConfirmation,
  });
}

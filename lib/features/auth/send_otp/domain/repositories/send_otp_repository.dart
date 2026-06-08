import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/domain/entities/auth_base_message_entity.dart';

abstract class SendOtpRepository {
  Future<Either<Failure, AuthBaseMessageEntity>> sendOtp({required String email});
}

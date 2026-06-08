import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/data/models/auth_base_message_dto.dart';

abstract class SendOtpRemoteDataSource {
  Future<Either<Failure, AuthBaseMessageDto>> sendOtp({required String email});
}

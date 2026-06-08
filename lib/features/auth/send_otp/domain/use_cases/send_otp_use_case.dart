import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/domain/entities/auth_base_message_entity.dart';
import '../repositories/send_otp_repository.dart';

@injectable
class SendOtpUseCase {
  final SendOtpRepository repository;

  SendOtpUseCase(this.repository);

  Future<Either<Failure, AuthBaseMessageEntity>> call({required String email}) {
    return repository.sendOtp(email: email);
  }
}

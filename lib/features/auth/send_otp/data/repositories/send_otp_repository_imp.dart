import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/domain/entities/auth_base_message_entity.dart';
import '../../domain/repositories/send_otp_repository.dart';
import '../data_sources/send_otp_remote_data_source.dart';

@Injectable(as: SendOtpRepository)
class SendOtpRepositoryImp implements SendOtpRepository {
  final SendOtpRemoteDataSource remoteDataSource;

  SendOtpRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, AuthBaseMessageEntity>> sendOtp({
    required String email,
  }) async {
    return await remoteDataSource.sendOtp(email: email);
  }
}

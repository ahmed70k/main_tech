import 'package:dartz/dartz.dart';
import 'package:main_tech/features/auth/register/domain/entities/register_response_entitiy.dart';

import '../../../../../core/errors/failures/errors.dart';

abstract class RegisterRemoteDataSourceInterface {
  Either<Failure, RegisterResponseEntity> register({
    required String email,
    required String password,
    required String fname,
    required String lname,
    required String phone,
    required String address,
  });
}

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures/errors.dart';
import '../entities/register_response_entitiy.dart';

abstract class RegisterRepository {
  Future<Either<Failure,RegisterResponseEntity>> register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  });
}
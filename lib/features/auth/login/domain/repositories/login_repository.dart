import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures/errors.dart';
import '../entities/login_response_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseEntity>> login({
    required String email,
    required String password,
  });
}

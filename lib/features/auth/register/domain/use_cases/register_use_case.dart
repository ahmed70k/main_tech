import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/register/domain/entities/register_response_entitiy.dart';

import '../repositories/register_repository.dart';
@injectable
class RegisterUseCase {
  // todo: add repository as a dependency
  final RegisterRepository registerRepository;
  RegisterUseCase({required this.registerRepository});

  // todo: call method to execute the use case
  Future<Either<Failure, RegisterResponseEntity>> call({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) {
    return registerRepository.register(
      email: email,
      password: password,
      fullName: fullName,
      phone: phone,
    );
  }
}

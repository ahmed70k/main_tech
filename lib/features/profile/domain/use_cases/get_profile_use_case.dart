import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/profile/domain/entities/profile_entity.dart';
import 'package:main_tech/features/profile/domain/repositories/profile_repository.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<Either<Failure, ProfileResponseEntity>> call() {
    return repository.getProfile();
  }
}

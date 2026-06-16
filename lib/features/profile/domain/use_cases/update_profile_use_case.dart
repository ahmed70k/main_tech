import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/profile/domain/entities/profile_entity.dart';
import 'package:main_tech/features/profile/domain/entities/update_profile_params.dart';
import 'package:main_tech/features/profile/domain/repositories/profile_repository.dart';

@injectable
class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, ProfileResponseEntity>> call(
    UpdateProfileParams params,
  ) {
    return repository.updateProfile(params);
  }
}

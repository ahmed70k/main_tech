import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/profile/domain/entities/profile_entity.dart';
import 'package:main_tech/features/profile/domain/entities/update_profile_params.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileResponseEntity>> getProfile();

  Future<Either<Failure, ProfileResponseEntity>> updateProfile(
    UpdateProfileParams params,
  );
}


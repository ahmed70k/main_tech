import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/profile/data/models/profile_dto.dart';
import 'package:main_tech/features/profile/domain/entities/update_profile_params.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<Failure, ProfileResponseDto>> getProfile();

  Future<Either<Failure, ProfileResponseDto>> updateProfile(
    UpdateProfileParams params,
  );
}


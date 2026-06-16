import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/profile/domain/entities/profile_entity.dart';
import 'package:main_tech/features/profile/domain/entities/update_profile_params.dart';
import 'package:main_tech/features/profile/domain/repositories/profile_repository.dart';

import '../data_sources/profile_remote_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImp implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, ProfileResponseEntity>> getProfile() {
    return remoteDataSource.getProfile();
  }

  @override
  Future<Either<Failure, ProfileResponseEntity>> updateProfile(
    UpdateProfileParams params,
  ) {
    return remoteDataSource.updateProfile(params);
  }
}


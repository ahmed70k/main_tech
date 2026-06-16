import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/profile/data/models/profile_dto.dart';
import 'package:main_tech/features/profile/domain/entities/update_profile_params.dart';

import 'profile_remote_data_source.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImp implements ProfileRemoteDataSource {
  final ApiManager apiManager;

  ProfileRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<Failure, ProfileResponseDto>> getProfile() async {
    try {
      final response = await apiManager.getData(
        endpoint: Endpoints.profile,
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(ProfileResponseDto.fromJson(response.data));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileResponseDto>> updateProfile(
    UpdateProfileParams params,
  ) async {
    try {
      final formMap = <String, dynamic>{
        'fname': params.fname,
        'lname': params.lname,
        'phone': params.phone,
        'address': params.address,
        'email': params.email,
      };

      if (params.password != null && params.password!.isNotEmpty) {
        formMap['password'] = params.password;
        formMap['password_confirmation'] = params.passwordConfirmation;
      }

      if (params.profileImagePath != null &&
          params.profileImagePath!.isNotEmpty) {
        formMap['profile_image'] = await MultipartFile.fromFile(
          params.profileImagePath!,
        );
      }

      final response = await apiManager.postData(
        endpoint: Endpoints.profile,
        headers: {'Accept': 'application/json'},
        data: FormData.fromMap(formMap),
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(ProfileResponseDto.fromJson(response.data));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

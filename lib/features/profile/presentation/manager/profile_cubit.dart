import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/features/profile/domain/entities/profile_entity.dart';
import 'package:main_tech/features/profile/domain/entities/update_profile_params.dart';
import 'package:main_tech/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:main_tech/features/profile/domain/use_cases/update_profile_use_case.dart';

import 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit(
    this.getProfileUseCase,
    this.updateProfileUseCase,
  ) : super(ProfileInitialState());

  ProfileResponseEntity? _cachedProfile;

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    final result = await getProfileUseCase.call();
    result.fold(
      (failure) => emit(ProfileErrorState(failure.message)),
      (response) {
        _cachedProfile = response;
        emit(ProfileLoadedState(response));
      },
    );
  }

  Future<String?> updateProfile(UpdateProfileParams params) async {
    final result = await updateProfileUseCase.call(params);
    return result.fold(
      (failure) {
        if (_cachedProfile != null) {
          emit(ProfileLoadedState(_cachedProfile!));
        } else {
          emit(ProfileErrorState(failure.message));
        }
        return failure.message;
      },
      (response) {
        _cachedProfile = response;
        emit(ProfileLoadedState(response));
        return null;
      },
    );
  }
}


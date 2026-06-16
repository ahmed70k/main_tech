import 'package:main_tech/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final ProfileResponseEntity response;

  ProfileLoadedState(this.response);
}

class ProfileErrorState extends ProfileState {
  final String message;

  ProfileErrorState(this.message);
}


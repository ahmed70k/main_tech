import 'package:main_tech/features/admin/users/domain/entities/user_entity.dart';

abstract class UsersState {}

class UsersInitialState extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final UsersListEntity response;
  UsersLoadedState(this.response);
}

class UsersErrorState extends UsersState {
  final String message;
  UsersErrorState(this.message);
}

class UsersDeleteLoadingState extends UsersState {
  final UsersListEntity? cachedList;
  UsersDeleteLoadingState({this.cachedList});
}

class UsersDeleteSuccessState extends UsersState {
  final DeleteUserEntity response;
  UsersDeleteSuccessState(this.response);
}

class UsersDeleteErrorState extends UsersState {
  final String message;
  final UsersListEntity? cachedList;
  UsersDeleteErrorState(this.message, {this.cachedList});
}

class UsersGetByIdLoadingState extends UsersState {
  final UsersListEntity? cachedList;
  UsersGetByIdLoadingState({this.cachedList});
}

class UsersGetByIdLoadedState extends UsersState {
  final GetUserByIdEntity response;
  UsersGetByIdLoadedState(this.response);
}

class UsersGetByIdErrorState extends UsersState {
  final String message;
  final UsersListEntity? cachedList;
  UsersGetByIdErrorState(this.message, {this.cachedList});
}

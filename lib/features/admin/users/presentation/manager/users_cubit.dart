import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/features/admin/users/domain/entities/user_entity.dart';
import 'package:main_tech/features/admin/users/domain/use_cases/delete_user_use_case.dart';
import 'package:main_tech/features/admin/users/domain/use_cases/get_user_by_id_use_case.dart';
import 'package:main_tech/features/admin/users/domain/use_cases/get_users_use_case.dart';

import 'users_state.dart';

@injectable
class UsersCubit extends Cubit<UsersState> {
  final GetUsersUseCase getUsersUseCase;
  final DeleteUserUseCase deleteUserUseCase;
  final GetUserByIdUseCase getUserByIdUseCase;

  UsersCubit(
    this.getUsersUseCase,
    this.deleteUserUseCase,
    this.getUserByIdUseCase,
  ) : super(UsersInitialState());

  UsersListEntity? _cachedList;

  Future<void> getUsers({int? page}) async {
    emit(UsersLoadingState());
    final result = await getUsersUseCase.call(page: page);
    result.fold(
      (failure) => emit(UsersErrorState(failure.message)),
      (response) {
        _cachedList = response;
        emit(UsersLoadedState(response));
      },
    );
  }

  Future<void> getUserById(int id) async {
    emit(UsersGetByIdLoadingState(cachedList: _cachedList));
    final result = await getUserByIdUseCase.call(id);
    result.fold(
      (failure) =>
          emit(UsersGetByIdErrorState(failure.message, cachedList: _cachedList)),
      (response) => emit(UsersGetByIdLoadedState(response)),
    );
  }

  void restoreListState() {
    if (_cachedList != null) emit(UsersLoadedState(_cachedList!));
  }

  Future<void> deleteUser(int id) async {
    emit(UsersDeleteLoadingState(cachedList: _cachedList));
    final result = await deleteUserUseCase.call(id);
    await result.fold(
      (failure) async {
        emit(UsersDeleteErrorState(failure.message, cachedList: _cachedList));
        if (_cachedList != null) emit(UsersLoadedState(_cachedList!));
      },
      (response) async {
        emit(UsersDeleteSuccessState(response));
        await getUsers();
      },
    );
  }
}

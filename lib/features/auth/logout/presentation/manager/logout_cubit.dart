import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/local_storage/auth_token_storage.dart';
import '../../domain/use_cases/logout_use_case.dart';
import 'logout_state.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;
  final AuthTokenStorage authTokenStorage;

  LogoutCubit(this.logoutUseCase, this.authTokenStorage)
      : super(LogoutInitialState());

  Future<void> logout() async {
    emit(LogoutLoadingState());
    final result = await logoutUseCase.call();
    await result.fold(
      (failure) async => emit(LogoutErrorState(failure.message)),
      (response) async {
        await authTokenStorage.clearToken();
        emit(LogoutSuccessState(response));
      },
    );
  }
}

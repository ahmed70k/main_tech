import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/local_storage/auth_token_storage.dart';
import 'package:main_tech/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:main_tech/features/auth/login/presentation/manager/login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final AuthTokenStorage authTokenStorage;

  LoginViewModel(this.loginUseCase, this.authTokenStorage)
      : super(LoginInitialState());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final either = await loginUseCase.call(
        email: email,
        password: password,
      );
      await either.fold(
        (error) async => emit(LoginErrorState(error.message)),
        (response) async {
          final token = response.data?.token;
          if (token != null && token.isNotEmpty) {
            await authTokenStorage.saveToken(token);
          }
          emit(LoginSuccessState(response));
        },
      );
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}

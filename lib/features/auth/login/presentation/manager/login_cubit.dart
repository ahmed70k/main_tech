import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:main_tech/features/auth/login/presentation/manager/login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase) : super(LoginInitialState());

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      var either = await loginUseCase.call(
        email: email,
        password: password,
      );
      either.fold(
        (error) => emit(LoginErrorState(error.message)),
        (response) => emit(LoginSuccessState(response)),
      );
    } catch (e) {
      print("LoginViewModel login error: $e");
      emit(LoginErrorState(e.toString()));
    }
  }
}

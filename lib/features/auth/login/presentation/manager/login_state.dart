import 'package:main_tech/features/auth/login/domain/entities/login_response_entity.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginResponseEntity loginResponseEntity;
  LoginSuccessState(this.loginResponseEntity);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}

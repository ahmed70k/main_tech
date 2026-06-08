import 'package:main_tech/features/auth/register/domain/entities/register_response_entitiy.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState(this.registerResponseEntity);
}

class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState(this.error);
}

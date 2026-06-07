import 'package:main_tech/features/auth/domain/entities/auth_base_message_entity.dart';

abstract class LogoutState {}

class LogoutInitialState extends LogoutState {}

class LogoutLoadingState extends LogoutState {}

class LogoutSuccessState extends LogoutState {
  final AuthBaseMessageEntity responseEntity;
  LogoutSuccessState(this.responseEntity);
}

class LogoutErrorState extends LogoutState {
  final String message;
  LogoutErrorState(this.message);
}

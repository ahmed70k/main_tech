import 'package:main_tech/features/auth/domain/entities/auth_base_message_entity.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {
  final AuthBaseMessageEntity responseEntity;
  ResetPasswordSuccessState(this.responseEntity);
}

class ResetPasswordErrorState extends ResetPasswordState {
  final String message;
  ResetPasswordErrorState(this.message);
}

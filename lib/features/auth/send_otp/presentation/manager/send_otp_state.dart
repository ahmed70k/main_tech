import 'package:main_tech/features/auth/domain/entities/auth_base_message_entity.dart';

abstract class SendOtpState {}

class SendOtpInitial extends SendOtpState {}

class SendOtpLoading extends SendOtpState {}

class SendOtpSuccessState extends SendOtpState {
  final AuthBaseMessageEntity responseEntity;
  SendOtpSuccessState(this.responseEntity);
}

class SendOtpErrorState extends SendOtpState {
  final String message;
  SendOtpErrorState(this.message);
}

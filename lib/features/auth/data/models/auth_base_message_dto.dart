import 'package:main_tech/features/auth/domain/entities/auth_base_message_entity.dart';

class AuthBaseMessageDto extends AuthBaseMessageEntity {
  AuthBaseMessageDto({
    super.message,
    super.status,
  });

  factory AuthBaseMessageDto.fromJson(Map<String, dynamic> json) {
    return AuthBaseMessageDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
    };
  }
}

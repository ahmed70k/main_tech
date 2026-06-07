import '../../domain/entities/refresh_token_response_entity.dart';

class RefreshTokenResponseDto extends RefreshTokenResponseEntity {
  RefreshTokenResponseDto({
    super.message,
    super.data,
    super.status,
  });

  factory RefreshTokenResponseDto.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponseDto(
      message: json['message'] as String?,
      data: json['data'] != null
          ? RefreshTokenDataDto.fromJson(json['data'])
          : null,
      status: json['status'] as int?,
    );
  }
}

class RefreshTokenDataDto extends RefreshTokenDataEntity {
  RefreshTokenDataDto({super.token});

  factory RefreshTokenDataDto.fromJson(Map<String, dynamic> json) {
    return RefreshTokenDataDto(
      token: json['token'] as String?,
    );
  }
}

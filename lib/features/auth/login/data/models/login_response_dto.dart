import '../../domain/entities/login_response_entity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({super.message, super.data, super.status});
  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      LoginResponseDto(
        message: json["message"],
        data: json["data"] == null
            ? null
            : LoginDataResponseDto.fromJson(json["data"]),
        status: json["status"],
      );
}

class LoginDataResponseDto extends LoginDataResponseEntity {
  LoginDataResponseDto({super.user, super.token});
  factory LoginDataResponseDto.fromJson(Map<String, dynamic> json) =>
      LoginDataResponseDto(
        user: json["user"] == null
            ? null
            : LoginUserResponseDto.fromJson(json["user"]),
        token: json["token"],
      );
}

class LoginUserResponseDto extends LoginUserResponseEntity {
  LoginUserResponseDto({
    super.fname,
    super.lname,
    super.email,
    super.address,
    super.phone,
    super.profileImage,
    super.role,
    super.updatedAt,
    super.createdAt,
    super.id,
  });
  factory LoginUserResponseDto.fromJson(Map<String, dynamic> json) =>
      LoginUserResponseDto(
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        profileImage: json["profile_image"],
        role: json["role"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );
}

// To parse this JSON data, do
//
//     final registerResponseDto = registerResponseDtoFromJson(jsonString);
import '../../domain/entities/register_response_entitiy.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({super.message, super.data, super.status});
  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) =>
      RegisterResponseDto(
        message: json["message"],
        data: json["data"] == null
            ? null
            : DataResponseDTO.fromJson(json["data"]),
        status: json["status"],
      );
}

class DataResponseDTO extends DataResponseEntity {
  DataResponseDTO({super.user});
  factory DataResponseDTO.fromJson(Map<String, dynamic> json) =>
      DataResponseDTO(
        user: json["user"] == null
            ? null
            : UserResponseDTO.fromJson(json["user"]),
      );
}

class UserResponseDTO extends UserResponseEntity {
  UserResponseDTO({
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
  factory UserResponseDTO.fromJson(Map<String, dynamic> json) =>
      UserResponseDTO(
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

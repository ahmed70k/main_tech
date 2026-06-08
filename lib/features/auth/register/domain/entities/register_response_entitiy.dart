// To parse this JSON data, do
//
//     final registerResponseDto = registerResponseDtoFromJson(jsonString);
class RegisterResponseEntity {
  final String? message;
  final DataResponseEntity? data;
  final int? status;

  RegisterResponseEntity({
    this.message,
    this.data,
    this.status,
  });
}

class DataResponseEntity {
  final UserResponseEntity? user;
  DataResponseEntity({
    this.user,
  });
}

class UserResponseEntity {
  final String? fname;
  final String? lname;
  final String? email;
  final String? address;
  final String? phone;
  final String? profileImage;
  final String? role;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  UserResponseEntity({
    this.fname,
    this.lname,
    this.email,
    this.address,
    this.phone,
    this.profileImage,
    this.role,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

}

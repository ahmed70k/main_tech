import 'package:main_tech/core/api/api_constans/api_constant.dart';
import 'package:main_tech/features/admin/users/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  UserDto({
    super.id,
    super.fname,
    super.lname,
    super.email,
    super.phone,
    super.profileImage,
    super.address,
    super.role,
    super.emailVerifiedAt,
    super.createdAt,
    super.updatedAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      profileImage: json['profile_image'] == null
          ? null
          : ApiConstant.resolveStorageUrl(json['profile_image'] as String),
      address: json['address'] as String?,
      role: json['role'] as String?,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.tryParse(json['email_verified_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.tryParse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.tryParse(json['updated_at'] as String),
    );
  }
}

class UsersPaginatedDto extends UsersPaginatedEntity {
  UsersPaginatedDto({
    super.currentPage,
    super.users,
    super.lastPage,
    super.perPage,
    super.total,
  });

  factory UsersPaginatedDto.fromJson(Map<String, dynamic> json) {
    final usersJson = json['data'] as List<dynamic>? ?? [];
    return UsersPaginatedDto(
      currentPage: json['current_page'] as int?,
      users: usersJson
          .map((u) => UserDto.fromJson(u as Map<String, dynamic>))
          .toList(),
      lastPage: json['last_page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
    );
  }
}

class UsersListDto extends UsersListEntity {
  UsersListDto({super.message, super.data, super.status});

  factory UsersListDto.fromJson(Map<String, dynamic> json) {
    return UsersListDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : UsersPaginatedDto.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class DeleteUserDto extends DeleteUserEntity {
  DeleteUserDto({super.message, super.status});

  factory DeleteUserDto.fromJson(Map<String, dynamic> json) {
    return DeleteUserDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
    );
  }
}

class GetUserByIdDto extends GetUserByIdEntity {
  GetUserByIdDto({super.message, super.data, super.status});

  factory GetUserByIdDto.fromJson(Map<String, dynamic> json) {
    return GetUserByIdDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : UserDto.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

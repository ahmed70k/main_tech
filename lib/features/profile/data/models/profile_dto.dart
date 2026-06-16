import 'package:main_tech/core/api/api_constans/api_constant.dart';
import 'package:main_tech/features/profile/domain/entities/profile_entity.dart';

class ProfileDto extends ProfileEntity {
  ProfileDto({
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

  factory ProfileDto.fromJson(Map<String, dynamic> json) {
    return ProfileDto(
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

class ProfileResponseDto extends ProfileResponseEntity {
  ProfileResponseDto({
    super.message,
    super.data,
    super.status,
  });

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return ProfileResponseDto(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProfileDto.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
    );
  }
}

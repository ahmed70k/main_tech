import 'package:main_tech/core/api/api_constans/api_constant.dart';
import 'package:main_tech/features/admin/subscriptions/domain/entities/subscription_entity.dart';

class SubscriptionUserDto extends SubscriptionUserEntity {
  SubscriptionUserDto({
    super.id,
    super.fname,
    super.lname,
    super.email,
    super.phone,
    super.profileImage,
    super.address,
    super.role,
  });

  factory SubscriptionUserDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionUserDto(
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
    );
  }
}

class SubscriptionPlanSummaryDto extends SubscriptionPlanSummaryEntity {
  SubscriptionPlanSummaryDto({
    super.id,
    super.name,
    super.price,
    super.durationDays,
  });

  factory SubscriptionPlanSummaryDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanSummaryDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: _parsePrice(json['price']),
      durationDays: json['duration_days'] as int?,
    );
  }
}

class SubscriptionDto extends SubscriptionEntity {
  SubscriptionDto({
    super.id,
    super.userId,
    super.planId,
    super.startsAt,
    super.endsAt,
    super.isActive,
    super.createdAt,
    super.updatedAt,
    super.user,
    super.plan,
  });

  factory SubscriptionDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionDto(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      planId: json['plan_id'] as int?,
      startsAt: json['starts_at'] == null
          ? null
          : DateTime.parse(json['starts_at'] as String),
      endsAt: json['ends_at'] == null
          ? null
          : DateTime.parse(json['ends_at'] as String),
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      user: json['user'] == null
          ? null
          : SubscriptionUserDto.fromJson(json['user'] as Map<String, dynamic>),
      plan: json['plan'] == null
          ? null
          : SubscriptionPlanSummaryDto.fromJson(
              json['plan'] as Map<String, dynamic>,
            ),
    );
  }
}

class SubscriptionsPaginatedDto extends SubscriptionsPaginatedEntity {
  SubscriptionsPaginatedDto({
    super.currentPage,
    super.subscriptions,
    super.lastPage,
    super.perPage,
    super.total,
  });

  factory SubscriptionsPaginatedDto.fromJson(Map<String, dynamic> json) {
    final subscriptionsJson = json['data'] as List<dynamic>? ?? [];
    return SubscriptionsPaginatedDto(
      currentPage: json['current_page'] as int?,
      subscriptions: subscriptionsJson
          .map(
            (subscription) => SubscriptionDto.fromJson(
              subscription as Map<String, dynamic>,
            ),
          )
          .toList(),
      lastPage: json['last_page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
    );
  }
}

class SubscriptionsListDto extends SubscriptionsListEntity {
  SubscriptionsListDto({
    super.message,
    super.data,
    super.status,
  });

  factory SubscriptionsListDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionsListDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : SubscriptionsPaginatedDto.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );
  }
}

class SubscriptionGetIdDto extends SubscriptionGetIdEntity {
  SubscriptionGetIdDto({
    super.message,
    super.data,
    super.status,
  });

  factory SubscriptionGetIdDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionGetIdDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : SubscriptionDto.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class SubscriptionUpdateIdDto extends SubscriptionUpdateIdEntity {
  SubscriptionUpdateIdDto({
    super.message,
    super.data,
    super.status,
  });

  factory SubscriptionUpdateIdDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionUpdateIdDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : SubscriptionDto.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class DeleteIdSubscriptionDto extends DeleteIdSubscriptionEntity {
  DeleteIdSubscriptionDto({
    super.message,
    super.status,
  });

  factory DeleteIdSubscriptionDto.fromJson(Map<String, dynamic> json) {
    return DeleteIdSubscriptionDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
    );
  }
}

class AssignSubscriptionDto extends AssignSubscriptionEntity {
  AssignSubscriptionDto({
    super.message,
    super.data,
    super.status,
  });

  factory AssignSubscriptionDto.fromJson(Map<String, dynamic> json) {
    return AssignSubscriptionDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : SubscriptionDto.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

double? _parsePrice(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

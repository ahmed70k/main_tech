import 'package:main_tech/features/admin/subscriptions_plans/domain/entities/subscription_plan_entity.dart';

class SubscriptionPlanDto extends SubscriptionPlanEntity {
  SubscriptionPlanDto({
    super.id,
    super.name,
    super.price,
    super.durationDays,
    super.description,
    super.createdAt,
    super.updatedAt,
  });

  factory SubscriptionPlanDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: _parsePrice(json['price']),
      durationDays: json['duration_days'] as int?,
      description: json['description'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
  }
}

class SubscriptionPlansPaginatedDto extends SubscriptionPlansPaginatedEntity {
  SubscriptionPlansPaginatedDto({
    super.currentPage,
    super.plans,
    super.lastPage,
    super.perPage,
    super.total,
  });

  factory SubscriptionPlansPaginatedDto.fromJson(Map<String, dynamic> json) {
    final plansJson = json['data'] as List<dynamic>? ?? [];
    return SubscriptionPlansPaginatedDto(
      currentPage: json['current_page'] as int?,
      plans: plansJson
          .map(
            (plan) => SubscriptionPlanDto.fromJson(
              plan as Map<String, dynamic>,
            ),
          )
          .toList(),
      lastPage: json['last_page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
    );
  }
}

class SubscriptionPlansListDto extends SubscriptionPlansListEntity {
  SubscriptionPlansListDto({
    super.message,
    super.data,
    super.status,
  });

  factory SubscriptionPlansListDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlansListDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : SubscriptionPlansPaginatedDto.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );
  }
}

class SubscriptionPlanGetIdDto extends SubscriptionPlanGetIdEntity {
  SubscriptionPlanGetIdDto({
    super.message,
    super.data,
    super.status,
  });

  factory SubscriptionPlanGetIdDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanGetIdDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : SubscriptionPlanDto.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );
  }
}

class SubscriptionPlanUpdateIdDto extends SubscriptionPlanUpdateIdEntity {
  SubscriptionPlanUpdateIdDto({
    super.message,
    super.data,
    super.status,
  });

  factory SubscriptionPlanUpdateIdDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanUpdateIdDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : SubscriptionPlanDto.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );
  }
}

class CreateSubscriptionPlanDto extends CreateSubscriptionPlanEntity {
  CreateSubscriptionPlanDto({
    super.message,
    super.data,
    super.status,
  });

  factory CreateSubscriptionPlanDto.fromJson(Map<String, dynamic> json) {
    return CreateSubscriptionPlanDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : SubscriptionPlanDto.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );
  }
}

class DeleteIdSubscriptionPlanDto extends DeleteIdSubscriptionPlanEntity {
  DeleteIdSubscriptionPlanDto({
    super.message,
    super.status,
  });

  factory DeleteIdSubscriptionPlanDto.fromJson(Map<String, dynamic> json) {
    return DeleteIdSubscriptionPlanDto(
      message: json['message'] as String?,
      status: json['status'] as int?,
    );
  }
}

double? _parsePrice(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

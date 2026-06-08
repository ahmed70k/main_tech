class SubscriptionPlanEntity {
  final int? id;
  final String? name;
  final double? price;
  final int? durationDays;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SubscriptionPlanEntity({
    this.id,
    this.name,
    this.price,
    this.durationDays,
    this.description,
    this.createdAt,
    this.updatedAt,
  });
}

class SubscriptionPlansPaginatedEntity {
  final int? currentPage;
  final List<SubscriptionPlanEntity> plans;
  final int? lastPage;
  final int? perPage;
  final int? total;

  SubscriptionPlansPaginatedEntity({
    this.currentPage,
    this.plans = const [],
    this.lastPage,
    this.perPage,
    this.total,
  });
}

class SubscriptionPlansListEntity {
  final String? message;
  final SubscriptionPlansPaginatedEntity? data;
  final int? status;

  SubscriptionPlansListEntity({
    this.message,
    this.data,
    this.status,
  });
}

class CreateSubscriptionPlanEntity {
  final String? message;
  final SubscriptionPlanEntity? data;
  final int? status;

  CreateSubscriptionPlanEntity({
    this.message,
    this.data,
    this.status,
  });
}

class SubscriptionPlanGetIdEntity {
  final String? message;
  final SubscriptionPlanEntity? data;
  final int? status;

  SubscriptionPlanGetIdEntity({
    this.message,
    this.data,
    this.status,
  });
}

class SubscriptionPlanUpdateIdEntity {
  final String? message;
  final SubscriptionPlanEntity? data;
  final int? status;

  SubscriptionPlanUpdateIdEntity({
    this.message,
    this.data,
    this.status,
  });
}

class DeleteIdSubscriptionPlanEntity {
  final String? message;
  final int? status;

  DeleteIdSubscriptionPlanEntity({
    this.message,
    this.status,
  });
}

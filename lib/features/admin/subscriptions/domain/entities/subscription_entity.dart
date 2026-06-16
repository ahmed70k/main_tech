class SubscriptionUserEntity {
  final int? id;
  final String? fname;
  final String? lname;
  final String? email;
  final String? phone;
  final String? profileImage;
  final String? address;
  final String? role;

  SubscriptionUserEntity({
    this.id,
    this.fname,
    this.lname,
    this.email,
    this.phone,
    this.profileImage,
    this.address,
    this.role,
  });

  String get fullName {
    final parts = [fname, lname].where((part) => part?.isNotEmpty ?? false);
    final name = parts.join(' ').trim();
    return name.isEmpty ? '-' : name;
  }
}

class SubscriptionPlanSummaryEntity {
  final int? id;
  final String? name;
  final double? price;
  final int? durationDays;

  SubscriptionPlanSummaryEntity({
    this.id,
    this.name,
    this.price,
    this.durationDays,
  });
}

class SubscriptionEntity {
  final int? id;
  final int? userId;
  final int? planId;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final SubscriptionUserEntity? user;
  final SubscriptionPlanSummaryEntity? plan;

  SubscriptionEntity({
    this.id,
    this.userId,
    this.planId,
    this.startsAt,
    this.endsAt,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.plan,
  });
}

class SubscriptionsPaginatedEntity {
  final int? currentPage;
  final List<SubscriptionEntity> subscriptions;
  final int? lastPage;
  final int? perPage;
  final int? total;

  SubscriptionsPaginatedEntity({
    this.currentPage,
    this.subscriptions = const [],
    this.lastPage,
    this.perPage,
    this.total,
  });
}

class SubscriptionsListEntity {
  final String? message;
  final SubscriptionsPaginatedEntity? data;
  final int? status;

  SubscriptionsListEntity({
    this.message,
    this.data,
    this.status,
  });
}

class AssignSubscriptionEntity {
  final String? message;
  final SubscriptionEntity? data;
  final int? status;

  AssignSubscriptionEntity({
    this.message,
    this.data,
    this.status,
  });
}

class SubscriptionGetIdEntity {
  final String? message;
  final SubscriptionEntity? data;
  final int? status;

  SubscriptionGetIdEntity({
    this.message,
    this.data,
    this.status,
  });
}

class SubscriptionUpdateIdEntity {
  final String? message;
  final SubscriptionEntity? data;
  final int? status;

  SubscriptionUpdateIdEntity({
    this.message,
    this.data,
    this.status,
  });
}

class DeleteIdSubscriptionEntity {
  final String? message;
  final int? status;

  DeleteIdSubscriptionEntity({
    this.message,
    this.status,
  });
}

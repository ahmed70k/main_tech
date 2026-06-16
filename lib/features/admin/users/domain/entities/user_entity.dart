class UserEntity {
  final int? id;
  final String? fname;
  final String? lname;
  final String? email;
  final String? phone;
  final String? profileImage;
  final String? address;
  final String? role;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserEntity({
    this.id,
    this.fname,
    this.lname,
    this.email,
    this.phone,
    this.profileImage,
    this.address,
    this.role,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  String get fullName {
    final parts = [fname, lname].where((p) => p?.isNotEmpty ?? false);
    final name = parts.join(' ').trim();
    return name.isEmpty ? '-' : name;
  }
}

class UsersPaginatedEntity {
  final int? currentPage;
  final List<UserEntity> users;
  final int? lastPage;
  final int? perPage;
  final int? total;

  UsersPaginatedEntity({
    this.currentPage,
    this.users = const [],
    this.lastPage,
    this.perPage,
    this.total,
  });
}

class UsersListEntity {
  final String? message;
  final UsersPaginatedEntity? data;
  final int? status;

  UsersListEntity({
    this.message,
    this.data,
    this.status,
  });
}

class DeleteUserEntity {
  final String? message;
  final int? status;

  DeleteUserEntity({this.message, this.status});
}

class GetUserByIdEntity {
  final String? message;
  final UserEntity? data;
  final int? status;

  GetUserByIdEntity({this.message, this.data, this.status});
}

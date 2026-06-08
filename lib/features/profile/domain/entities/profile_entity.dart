class ProfileEntity {
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

  ProfileEntity({
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
    final parts = [fname, lname]
        .where((part) => part != null && part.trim().isNotEmpty)
        .map((part) => part!.trim())
        .toList();
    return parts.isEmpty ? '-' : parts.join(' ');
  }
}

class ProfileResponseEntity {
  final String? message;
  final ProfileEntity? data;
  final int? status;

  ProfileResponseEntity({
    this.message,
    this.data,
    this.status,
  });
}

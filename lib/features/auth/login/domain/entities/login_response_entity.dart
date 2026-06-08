class LoginResponseEntity {
  final String? message;
  final LoginDataResponseEntity? data;
  final int? status;

  LoginResponseEntity({
    this.message,
    this.data,
    this.status,
  });
}

class LoginDataResponseEntity {
  final LoginUserResponseEntity? user;
  final String? token;
  LoginDataResponseEntity({
    this.user,
    this.token,
  });
}

class LoginUserResponseEntity {
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

  LoginUserResponseEntity({
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

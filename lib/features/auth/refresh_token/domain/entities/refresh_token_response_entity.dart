class RefreshTokenResponseEntity {
  final String? message;
  final RefreshTokenDataEntity? data;
  final int? status;

  RefreshTokenResponseEntity({this.message, this.data, this.status});
}

class RefreshTokenDataEntity {
  final String? token;

  RefreshTokenDataEntity({this.token});
}

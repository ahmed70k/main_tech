import 'package:dio/dio.dart';
import 'package:main_tech/core/local_storage/auth_token_storage.dart';

class AuthInterceptor extends Interceptor {
  final AuthTokenStorage tokenStorage;

  AuthInterceptor(this.tokenStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = tokenStorage.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

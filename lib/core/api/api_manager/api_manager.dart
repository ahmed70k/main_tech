import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_constans/api_constant.dart';

@singleton
class ApiManager {
  final Dio dio;
  ApiManager(this.dio);
  Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.get(
      ApiConstant.baseUrl + endpoint,
      queryParameters: queryParameters,
      options: Options(headers: headers, validateStatus: (context) => true),
    );
  }

  Future<Response> postData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Object? data,
  }) async {
    return await dio.post(
      ApiConstant.baseUrl + endpoint,
      queryParameters: queryParameters,
      data: data,
      options: Options(headers: headers, validateStatus: (context) => true),
    );
  }

  Future<Response> putData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Object? data,
  }) async {
    return await dio.put(
      ApiConstant.baseUrl + endpoint,
      queryParameters: queryParameters,
      data: data,
      options: Options(headers: headers, validateStatus: (context) => true),
    );
  }

  Future<Response> deleteData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.delete(
      ApiConstant.baseUrl + endpoint,
      queryParameters: queryParameters,
      options: Options(headers: headers, validateStatus: (context) => true),
    );
  }
}

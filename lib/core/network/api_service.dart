import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:veda_learn/app/constant/api/api_endpoint.dart';
import 'package:veda_learn/core/network/dio_error_interceptor.dart';
import 'package:veda_learn/core/network/hive_service.dart';

 
class ApiService {
  final Dio _dio;
 
  Dio get dio => _dio;
 
  ApiService(this._dio) {
    _dio
      ..options.baseUrl = ApiEndpoints.baseUrl
      ..options.connectTimeout = ApiEndpoints.connectionTimeout
      ..options.receiveTimeout = ApiEndpoints.receiveTimeout
      ..interceptors.add(DioErrorInterceptor())
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
 
          requestBody: true,
 
          responseHeader: true,
        ),
      )
      ..interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler) async {
      final hiveService = HiveService();
      final token = await hiveService.getToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    },
  ),
)
      ..options.headers = {
        'Accept': 'application/json',
 
        'Content-Type': 'application/json',
      };
  }
}
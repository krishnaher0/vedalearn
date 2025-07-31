import 'package:dio/dio.dart';
import 'package:veda_learn/app/constant/api/api_endpoint.dart';
import 'package:veda_learn/core/network/api_service.dart';
import 'package:veda_learn/features/auth/data/data_source/auth_datasource.dart';
import 'package:veda_learn/features/auth/data/model/user_api_model.dart';
import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';

class UserRemoteDataSource implements IAuthDataSource {
  final ApiService _apiService;

  UserRemoteDataSource({required ApiService apiService})
    : _apiService = apiService;


  @override
  Future<UserEntity> loginToAccount(String email, String password) async {
    try {
      final response = await _apiService.dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 && response.data['data'] != null) {
        final token = response.data['token'];
        final data = response.data['data'];

        // Merge token with data and convert via model
        final user =
            UserApiModel.fromJson({...data, 'token': token}).toEntity();

        return user;
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      throw Exception(
        'Failed to login: ${e.response?.data?['message'] ?? e.message}',
      );
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  @override
  Future<void> createAccount(UserEntity userData) async {
    try {
      final userApiModel = UserApiModel.fromEntity(userData);

      final response = await _apiService.dio.post(
        ApiEndpoints.register,
        data: userApiModel.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        throw Exception(
          'Failed to register: ${response.statusMessage ?? 'Unknown error'}',
        );
      }
    } on DioException catch (e) {
      throw Exception(
        'Failed to register: ${e.response?.data?['message'] ?? e.message}',
      );
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}

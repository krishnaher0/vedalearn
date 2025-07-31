import 'package:veda_learn/core/network/api_service.dart';
import 'package:veda_learn/app/constant/api/api_endpoint.dart';
import 'package:veda_learn/features/course/data/datasource/course_datasource.dart';
import 'package:veda_learn/features/course/data/model/course_api_model.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart'; // Import CourseEntity

class CourseRemoteDataSource implements ICourseDataSource {
  final ApiService apiService;

  /// Constructor for [CourseRemoteDataSource].
  /// Requires an [ApiService] instance to make API calls.
  CourseRemoteDataSource({required this.apiService});

  @override
  Future<List<CourseEntity>> getAllCourses() async {
    try {
      final res = await apiService.dio.get(ApiEndpoints.courses);

      // Assuming the response structure is { "data": [...] }
      final List data = res.data['data'] ?? [];

      // Map JSON data to CourseApiModel and then convert to CourseEntity
      return data
          .map((json) => CourseApiModel.fromJson(json).toEntity())
          .toList();
    } catch (e) {
      // Re-throw or handle error appropriately, e.g., throw a custom exception
      rethrow;
    }
  }

  @override
  Future<List<CourseEntity>> getEnrolledCourses(String userId) async {
    try {
      final res = await apiService.dio.get(
        '${ApiEndpoints.enrolledCourses(userId)}enrolled-courses',
      );

      final List data = res.data['enrolledCourses'] ?? [];

      return data
          .map((json) => CourseApiModel.fromJson(json).toEntity())
          .toList();
    } catch (e) {
      // Re-throw or handle error appropriately, e.g., throw a custom exception
      rethrow;
    }
  }
}

import 'package:veda_learn/core/network/api_service.dart';
import 'package:veda_learn/features/course/data/model/course_api_model.dart';

class CourseRemoteDataSource {
  final ApiService apiService;

  CourseRemoteDataSource({required this.apiService});

  Future<List<CourseApiModel>> getAllCourses() async {
    final res = await apiService.dio.get('/admin/courses');

    final List data = res.data['data'] ?? [];

    return data.map((json) => CourseApiModel.fromJson(json)).toList();
  }
}

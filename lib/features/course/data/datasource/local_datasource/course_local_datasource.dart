import 'package:veda_learn/core/network/hive_service.dart';
import 'package:veda_learn/features/course/data/model/course_hive_model.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';

abstract class ICourseLocalDataSource {
  Future<void> saveCourse(CourseEntity course);
  Future<List<CourseEntity>> getAllCourses();
  Future<void> deleteCourse(String courseId);
}

class CourseLocalDataSource implements ICourseLocalDataSource {
  final HiveService _hiveService;

  CourseLocalDataSource({required HiveService hiveService})
      : _hiveService = hiveService;

  @override
  Future<void> saveCourse(CourseEntity course) async {
    final courseModel = CourseHiveModel.fromEntity(course);
    await _hiveService.save('courses', courseModel.id, courseModel);
  }

  @override
  Future<List<CourseEntity>> getAllCourses() async {
    final data = await _hiveService.getAll<CourseHiveModel>('courses');
    return data.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> deleteCourse(String courseId) async {
    await _hiveService.delete('courses', courseId);
  }
}

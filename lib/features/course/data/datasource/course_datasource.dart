import 'package:veda_learn/features/course/domain/entity/course_entity.dart';

abstract interface class ICourseDataSource {
  Future<List<CourseEntity>> getAllCourses();
  Future<List<CourseEntity>> getEnrolledCourses(String userId);
}

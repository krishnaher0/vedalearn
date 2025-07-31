import 'package:dartz/dartz.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';

abstract interface class ICourseRepository {
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();
  // Future<Either<Failure, List<CourseEntity>>> getEnrolledCourses(String userId);
}

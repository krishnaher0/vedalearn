
import 'package:dartz/dartz.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/core/error/server_exception.dart';
import 'package:veda_learn/features/course/data/datasource/course_datasource.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';
import 'package:veda_learn/features/course/domain/repository/course_repository.dart';

class CourseRepositoryImpl implements ICourseRepository {
  final ICourseDataSource dataSource;

  CourseRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      final allCourses = await dataSource.getAllCourses();
      return Right(allCourses);
    } on ServerException catch (e) {
      return Left(ApiFailure(message: e.message));
    }
  }



//   @override
//   Future<Either<Failure, List<CourseEntity>>> getEnrolledCourses(String userId) async {
//     try {
//       final enrolledCourses = await dataSource.getEnrolledCourses(userId);
//       return Right(enrolledCourses);
      
//     }on ServerException   catch (e) {
//       return Left(ApiFailure(message: e.message));
//     }
//   }
}
import 'package:dartz/dartz.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/features/course/data/datasource/remote_datasource/course_remote_datasource.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';
import 'package:veda_learn/features/course/domain/repository/course_repository.dart';

class CourseRemoteRepository implements ICourseRepository {
  final CourseRemoteDataSource remoteDataSource;

  CourseRemoteRepository({required CourseRemoteDataSource remoteDataSource});

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      final models = await remoteDataSource.getAllCourses();
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}

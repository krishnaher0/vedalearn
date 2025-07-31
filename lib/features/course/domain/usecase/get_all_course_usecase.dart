import 'package:dartz/dartz.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/app/use_case/use_case.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';
import 'package:veda_learn/features/course/domain/repository/course_repository.dart';

class GetAllCoursesUseCase implements UseCaseWithoutParams<List<CourseEntity>> {
  final ICourseRepository repository;

  GetAllCoursesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<CourseEntity>>> call() {
    return repository.getAllCourses();
  }
}


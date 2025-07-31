import 'package:equatable/equatable.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';

enum CourseStatus { initial, loading, success, failure }

class CourseState extends Equatable {
  final CourseStatus allCoursesStatus;
  // final CourseStatus enrolledCoursesStatus;
  final List<CourseEntity> allCourses;
  // final List<CourseEntity> enrolledCourses;
  final String? error;

  const CourseState({
    this.allCoursesStatus = CourseStatus.initial,
    // this.enrolledCoursesStatus = CourseStatus.initial,
    this.allCourses = const [],
    // this.enrolledCourses = const [],
    this.error,
  });

  CourseState copyWith({
    CourseStatus? allCoursesStatus,
    // CourseStatus? enrolledCoursesStatus,
    List<CourseEntity>? allCourses,
    // List<CourseEntity>? enrolledCourses,
    String? error,
  }) {
    return CourseState(
      allCoursesStatus: allCoursesStatus ?? this.allCoursesStatus,
      // enrolledCoursesStatus: enrolledCoursesStatus ?? this.enrolledCoursesStatus,
      allCourses: allCourses ?? this.allCourses,
      // enrolledCourses: enrolledCourses ?? this.enrolledCourses,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        allCoursesStatus,
        // enrolledCoursesStatus,
        allCourses,
        // enrolledCourses,
        error ?? '',
      ];
}

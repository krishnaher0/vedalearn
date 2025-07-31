import 'package:equatable/equatable.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class FetchCourses extends CourseEvent {
  const FetchCourses();
}

// class FetchEnrolledCourses extends CourseEvent {
//   final String userId;
  
//   const FetchEnrolledCourses({required this.userId});
  
//   @override
//   List<Object> get props => [userId];
// }
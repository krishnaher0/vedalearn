import 'package:equatable/equatable.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class TabSelected extends DashboardEvent {
  final int tabIndex;

  const TabSelected(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}

class LanguageSelected extends DashboardEvent {
  final CourseEntity selectedCourse;

  const LanguageSelected({required this.selectedCourse});

  @override
  List<Object> get props => [selectedCourse];
}

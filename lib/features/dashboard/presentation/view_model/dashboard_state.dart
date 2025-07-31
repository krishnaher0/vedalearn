import 'package:equatable/equatable.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';

abstract class DashboardState extends Equatable {
  final CourseEntity? selectedCourse;
  final int selectedIndex;

  const DashboardState({required this.selectedIndex, this.selectedCourse});

  @override
  List<Object?> get props => [selectedIndex, selectedCourse];
}

class DashboardInitial extends DashboardState {
  const DashboardInitial({super.selectedIndex = 0, super.selectedCourse});
}

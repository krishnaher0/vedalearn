// lib/features/course/presentation/view_model/course_view_model.dart

import 'package:veda_learn/features/course/domain/usecase/get_all_course_usecase.dart';
import 'package:veda_learn/features/course/presentation/view_model/course_event.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';
import 'package:veda_learn/features/course/presentation/view_model/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseViewModel extends Bloc<CourseEvent, CourseState> {
  final GetAllCoursesUseCase getAllCoursesUseCase;

  CourseViewModel({
    required this.getAllCoursesUseCase,
  }) : super(const CourseState()) {
    on<FetchCourses>(_onFetchCourses);
  }

  void fetchCourses() => add(FetchCourses());

  bool get isAllCoursesLoading => state.allCoursesStatus == CourseStatus.loading;
  bool get isAllCoursesSuccess => state.allCoursesStatus == CourseStatus.success;
  bool get isAllCoursesFailure => state.allCoursesStatus == CourseStatus.failure;

  String? get error => state.error;

  List<CourseEntity> get allCourses => state.allCourses;

  void _onFetchCourses(FetchCourses event, Emitter<CourseState> emit) async {
    emit(state.copyWith(allCoursesStatus: CourseStatus.loading, error: null));
    // getAllCoursesUseCase is a UseCaseWithoutParams, so it needs NoParams()
    final result = await getAllCoursesUseCase(); // <-- NoParams comes from usecase.dart

    result.fold(
      (failure) => emit(state.copyWith(allCoursesStatus: CourseStatus.failure, error: failure.message)),
      (courses) => emit(state.copyWith(allCoursesStatus: CourseStatus.success, allCourses: courses)),
    );
  }
}
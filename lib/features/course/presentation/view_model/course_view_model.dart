import 'package:flutter/material.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';
import 'package:veda_learn/features/course/domain/usecase/get_all_course_usecase.dart';
import 'package:veda_learn/core/error/failure.dart';

class CourseViewModel extends ChangeNotifier {
  final GetAllCoursesUseCase getAllCoursesUseCase;

  CourseViewModel({required this.getAllCoursesUseCase});

  List<CourseEntity> _courses = [];
  List<CourseEntity> get courses => _courses;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchCourses() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await getAllCoursesUseCase();

    result.fold(
      (Failure failure) {
        _error = failure.message;
      },
      (List<CourseEntity> data) {
        _courses = data;
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}

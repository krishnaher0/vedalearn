// import 'package:veda_learn/core/network/hive_service.dart'; // Ensure this is the refactored, generic HiveService
// import 'package:veda_learn/features/course/data/datasource/course_datasource.dart';
// import 'package:veda_learn/features/course/data/model/course_hive_model.dart';
// import 'package:veda_learn/features/course/domain/entity/course_entity.dart';
// import 'package:veda_learn/app/constant/hive/hive_table_constant.dart'; // Assuming you have this constant

// class CourseLocalDatasource implements ICourseDataSource { // Implements the common interface
//   final HiveService _hiveService;
//   final String _courseBoxName = HiveTableConstant.courseBox;

//   CourseLocalDatasource({required HiveService hiveService})
//       : _hiveService = hiveService;

//   @override
//   Future<List<CourseEntity>> getAllCourses() async {
//     final data = await _hiveService.getAll<CourseHiveModel>(_courseBoxName);
//     return data.map((e) => e.toEntity()).toList();
//   }

//   @override
//   Future<void> saveCourses(List<CourseEntity> courses) async {
//     final List<CourseHiveModel> courseModels = courses.map((e) => CourseHiveModel.fromEntity(e)).toList();

//     await _hiveService.clearBox<CourseHiveModel>(_courseBoxName);

//     for (var courseModel in courseModels) {
//       if (courseModel.id != null) {
//         await _hiveService.save<CourseHiveModel>(_courseBoxName, courseModel.id!, courseModel);
//       } else {
//         print('Warning: CourseHiveModel with null ID encountered. Cannot save.');
//       }
//     }
//   }
  
//   @override
//   Future<CourseEntity> getCourseByLesson(String courseId) {
//     throw UnimplementedError();
//   }
// }
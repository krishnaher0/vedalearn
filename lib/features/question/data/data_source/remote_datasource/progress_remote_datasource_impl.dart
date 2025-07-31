// import 'package:dio/dio.dart';
// import 'package:veda_learn/features/question/domain/entity/user_progress.dart';
// import 'package:veda_learn/features/question/data/model/user_progress_api_model.dart';

// import 'package:veda_learn/app/constant/api/api_endpoint.dart';

// import 'package:veda_learn/features/question/data/data_source/progress_remote_datasource.dart';


// class UserProgressRemoteDataSourceImpl implements IUserProgressRemoteDataSource {
//   final Dio dio;

//   UserProgressRemoteDataSourceImpl(this.dio);

//   @override
//   Future<bool> updateProgress(String userId, UserProgressApiModel progressModel) async {
//     final response = await dio.post(
//       '/$userId/update-progress',
//       data: progressModel.toJson(),
//     );

//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       throw Exception('Failed to update user progress');
//     }
//   }
// }

// question_remote_datasource_impl.dart


import 'package:dio/dio.dart';
import 'package:veda_learn/app/constant/api/api_endpoint.dart';
import 'package:veda_learn/features/question/data/data_source/question_remote_datasource.dart';
import 'package:veda_learn/features/question/data/model/question_api_model.dart';

// QuestionRemoteDataSourceImpl (implementation)
class QuestionRemoteDataSourceImpl implements QuestionRemoteDataSource {
  final Dio dio;

  QuestionRemoteDataSourceImpl(this.dio);

  @override
  Future<QuestionApiModel> getQuestionsByLesson(String lessonId, {required int questionIndex}) async {
    final response = await dio.get(ApiEndpoints.questions(lessonId, questionIndex));
    final json = response.data['question'];
    return QuestionApiModel.fromJson(json);
  }
}



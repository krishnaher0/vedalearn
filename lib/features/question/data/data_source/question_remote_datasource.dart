// question_remote_datasource.dart
import 'package:veda_learn/features/question/data/model/question_api_model.dart';
abstract class QuestionRemoteDataSource {
  Future<QuestionApiModel> getQuestionsByLesson(String lessonId, {required int questionIndex});
}

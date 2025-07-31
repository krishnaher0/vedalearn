import 'package:dartz/dartz.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/features/question/domain/entity/question_entity.dart';

abstract class IQuestionRepository {
  Future<Either<Failure, QuestionEntity>> getQuestionsByLesson(String lessonId, int questionIndex);
}

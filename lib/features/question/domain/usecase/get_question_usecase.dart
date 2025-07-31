import 'package:veda_learn/features/question/domain/repository/question_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/features/question/domain/entity/question_entity.dart';

class GetQuestionsUseCase {
  final IQuestionRepository repository;

  GetQuestionsUseCase(this.repository);

  Future<Either<Failure, QuestionEntity>> call(String lessonId, int questionIndex) {
    return repository.getQuestionsByLesson(lessonId, questionIndex);
  }
}

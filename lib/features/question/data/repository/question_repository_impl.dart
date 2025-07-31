import 'package:dartz/dartz.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/features/question/domain/repository/question_repository.dart';
import 'package:veda_learn/features/question/domain/entity/question_entity.dart';
import 'package:veda_learn/features/question/data/data_source/question_remote_datasource.dart';

class QuestionRepositoryImpl implements IQuestionRepository {
  final QuestionRemoteDataSource remoteDataSource;

  QuestionRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, QuestionEntity>> getQuestionsByLesson(String lessonId, int questionIndex) async {
    try {
      final apiModel = await remoteDataSource.getQuestionsByLesson(lessonId, questionIndex: questionIndex);
      return Right(apiModel.toEntity());
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}

// import 'package:dartz/dartz.dart';
// import 'package:veda_learn/core/error/failure.dart';
// import 'package:veda_learn/features/question/domain/repository/progress_repository.dart';
// import 'package:veda_learn/features/question/data/model/user_progress_api_model.dart';
// import 'package:veda_learn/features/question/domain/entity/user_progress.dart';
// import 'package:veda_learn/features/question/data/data_source/progress_remote_datasource.dart';
// import 'package:veda_learn/features/question/data/data_source/remote_datasource/progress_remote_datasource_impl.dart';
// class UserProgressRepositoryImpl implements IUserProgressRepository {
//   final IUserProgressRemoteDataSource remoteDataSource;

//   UserProgressRepositoryImpl(this.remoteDataSource);

//   @override
//  @override
// Future<Either<Failure, bool>> updateUserProgress(UserProgress submission) async {
//   try {
//     final model = UserProgressApiModel.fromEntity(submission);
//     final success = await remoteDataSource.updateProgress(submission.userId, model);
//     return Right(success);
//   } catch (e) {
//     return Left(ApiFailure(message: e.toString()));
//   }
// }

// }
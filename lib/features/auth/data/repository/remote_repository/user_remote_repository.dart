 
import 'package:dartz/dartz.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/features/auth/data/data_source/remote_datasource/user_remote_datasource.dart';
import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';
import 'package:veda_learn/features/auth/domain/repository/auth_repository.dart';

 
class UserRemoteRepository implements IAuthRepository {
  final UserRemoteDataSource _userRemoteDataSource;
 
  UserRemoteRepository({required UserRemoteDataSource userRemoteDataSource})
    : _userRemoteDataSource = userRemoteDataSource;
  @override
Future<Either<Failure, UserEntity>> loginToAccount(
  String email,
  String password,
) async {
  try {
    // Call remote data source that now returns UserEntity directly
    final UserEntity user = await _userRemoteDataSource.loginToAccount(email, password);
   

    return Right(user);
  } catch (e) {
    return Left(ApiFailure(message: e.toString()));
  }
}

 
  @override
  Future<Either<Failure, void>> createAccount(UserEntity user) async {
    try {
      await _userRemoteDataSource.createAccount(user);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
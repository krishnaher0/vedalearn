import 'package:dartz/dartz.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/features/auth/data/data_source/local_datasource/auth_local_datasource.dart';
import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';
import 'package:veda_learn/features/auth/domain/repository/auth_repository.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;
 
  AuthLocalRepository({ required AuthLocalDataSource authLocalDataSource }) : _authLocalDataSource = authLocalDataSource;
 
  @override
  Future<Either<Failure, void>> createAccount(UserEntity user) async {
    try {
      await _authLocalDataSource.createAccount(user);
      return Right(null);
    } catch (error) {
      return Left(LocalDatabaseFailure(message: 'User Registration Failed!: $error'));
    }
  }
  
  @override
  Future<Either<Failure, String>> loginToAccount(String email, String password) async {
    try {
      final result = await _authLocalDataSource.loginToAccount(email, password);
      return Right(result);
    } catch(e) {
      return Left(LocalDatabaseFailure(message: 'Login Failed $e'));
    }
  }
}
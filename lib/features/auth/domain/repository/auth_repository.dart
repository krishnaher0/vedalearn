import 'package:dartz/dartz.dart';
import 'package:veda_learn/core/error/failure.dart';

import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';
 
abstract interface class IAuthRepository {
  Future<Either<Failure, void>> createAccount(UserEntity user);
  Future<Either<Failure, UserEntity>> loginToAccount(String email, String password);
}
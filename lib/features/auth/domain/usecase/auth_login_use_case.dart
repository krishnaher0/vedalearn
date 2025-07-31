import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:veda_learn/app/use_case/use_case.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';
import 'package:veda_learn/features/auth/domain/repository/auth_repository.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;
 
  const LoginParams({required this.email, required this.password});
 
  const LoginParams.initial() : email = '', password = '';
  @override
  List<Object?> get props => [email, password];
}
 
class AuthLoginUsecase implements UseCaseWithParams<UserEntity, LoginParams> {
  final IAuthRepository _authRepository;

  AuthLoginUsecase({required IAuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await _authRepository.loginToAccount(
      params.email,
      params.password,
    );
  }
}

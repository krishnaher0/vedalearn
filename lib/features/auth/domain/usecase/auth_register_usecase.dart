import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:veda_learn/app/use_case/use_case.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';
import 'package:veda_learn/features/auth/domain/repository/auth_repository.dart';

 
class AuthRegisterParams extends Equatable {
  final String email;
  final String name;
  final String password;
  final int age;
 
  const AuthRegisterParams({
    required this.email,
    required this.name,
    required this.password,
    required this.age
  });
 
  const AuthRegisterParams.initial({
    required this.email,
    required this.name,
    required this.password,
    required this.age
  });
 
  @override
  List<Object?> get props => [email, name, password];
}
 
 
class AuthRegisterUsecase implements UseCaseWithParams<void, AuthRegisterParams>{
 
  final IAuthRepository _authRepository;
 
  AuthRegisterUsecase({ required IAuthRepository authRepository}) : _authRepository = authRepository;
 
  @override
  Future<Either<Failure, void>> call(AuthRegisterParams params) {
    final userEntity = UserEntity(
      email: params.email,
      name: params.name,
      password: params.password,
      age:params.age
    );
 
    return _authRepository.createAccount(userEntity);
  }
}
 
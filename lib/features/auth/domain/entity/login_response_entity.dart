import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';

class LoginResponseEntity {
  final UserEntity user;
  final String token;

  LoginResponseEntity({required this.user, required this.token});
}

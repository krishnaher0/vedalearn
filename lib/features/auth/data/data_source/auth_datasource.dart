
import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';
 
abstract interface class IAuthDataSource {
  Future<void> createAccount(UserEntity user);
  Future<String> loginToAccount(String email, String password);
}
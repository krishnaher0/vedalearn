
 
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  
Future<void> printAllSecureStorageValues() async {
  try {
    // Read all keys
    final allValues = await _secureStorage.readAll();
    print('All values in FlutterSecureStorage:');
    allValues.forEach((key, value) {
      print('$key: $value');
    });
  } catch (e) {
    print('Error reading secure storage: $e');
  }
}

 
  // Save values
  Future<void> saveUserData({
    required String token,
    required String role,
    required String id,
    required String name,
    required String email,
  }) async {
    await _secureStorage.write(key: SecureStorageKeys.token, value: token);
    await _secureStorage.write(key: SecureStorageKeys.role, value: role);
    await _secureStorage.write(key: SecureStorageKeys.id, value: id);
    await _secureStorage.write(
      key: SecureStorageKeys.name,
      value: name,
    );
    await _secureStorage.write(key: SecureStorageKeys.email, value: email);
  }

 
  // Read individual values
  Future<String?> getToken() =>
      _secureStorage.read(key: SecureStorageKeys.token);
  Future<String?> getRole() => _secureStorage.read(key: SecureStorageKeys.role);
  Future<String?> getId() => _secureStorage.read(key: SecureStorageKeys.id);
  Future<String?> getEmail() =>
      _secureStorage.read(key: SecureStorageKeys.email);
  Future<String?> getFullName() =>
      _secureStorage.read(key: SecureStorageKeys.name);
 
  // Delete all
  Future<void> clearUserData() async {
    await _secureStorage.deleteAll();
  }
}

class SecureStorageKeys {
  static const token = 'token';
  static const role = 'role';
  static const id = '_id';
  static const email = 'email';
  static const name = 'name';
}
 
 
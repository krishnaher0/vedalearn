import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';
import 'package:veda_learn/features/auth/domain/repository/auth_repository.dart';
import 'package:veda_learn/features/auth/domain/usecase/auth_register_usecase.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late AuthRegisterUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUpAll(() {
    registerFallbackValue(UserEntity(email: '', name: '', password: '', age: 0));
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = AuthRegisterUsecase(authRepository: mockAuthRepository);
  });

  const tParams = AuthRegisterParams(
    email: 'test@example.com',
    name: 'Test User',
    password: 'password123',
    age: 25,
  );

  final tUserEntity = UserEntity(
    email: tParams.email,
    name: tParams.name,
    password: tParams.password,
    age: tParams.age,
  );

  group('AuthRegisterParams', () {
    test('initial constructor should create correct object', () {
      const params = AuthRegisterParams.initial(
        email: 'initial@example.com',
        name: 'Initial User',
        password: 'initialPassword',
        age: 30,
      );

      expect(params.email, 'initial@example.com');
      expect(params.name, 'Initial User');
      expect(params.password, 'initialPassword');
      expect(params.age, 30);
    });

    test('can handle empty strings and zero age', () {
      const params = AuthRegisterParams(email: '', name: '', password: '', age: 0);

      expect(params.email, '');
      expect(params.name, '');
      expect(params.password, '');
      expect(params.age, 0);
    });

    test('equality and hashCode work correctly', () {
      const p1 = AuthRegisterParams(email: 'a', name: 'b', password: 'c', age: 1);
      const p2 = AuthRegisterParams(email: 'a', name: 'b', password: 'c', age: 1);
      const p3 = AuthRegisterParams(email: 'x', name: 'y', password: 'z', age: 99);

      expect(p1, equals(p2));
      expect(p1.hashCode, equals(p2.hashCode));
      expect(p1 == p3, isFalse);
    });
  });

  group('AuthRegisterUsecase', () {
    test('should call repository createAccount and return Right(void)', () async {
      // Arrange
      when(() => mockAuthRepository.createAccount(any()))
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await usecase(tParams);

      // Assert
      expect(result, equals(const Right(null)));

      final captured = verify(() => mockAuthRepository.createAccount(captureAny())).captured.single as UserEntity;
      expect(captured.email, tUserEntity.email);
      expect(captured.name, tUserEntity.name);
      expect(captured.password, tUserEntity.password);
      expect(captured.age, tUserEntity.age);

      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return Failure when repository createAccount fails', () async {
      // Arrange
      final tFailure = ApiFailure(message: "Failed Registering users");
      when(() => mockAuthRepository.createAccount(any()))
          .thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await usecase(tParams);

      // Assert
      expect(result, equals(Left(tFailure)));

      final captured = verify(() => mockAuthRepository.createAccount(captureAny())).captured.single as UserEntity;
      expect(captured.email, tUserEntity.email);
      expect(captured.name, tUserEntity.name);
      expect(captured.password, tUserEntity.password);
      expect(captured.age, tUserEntity.age);

      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}

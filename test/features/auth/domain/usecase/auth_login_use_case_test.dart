import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:veda_learn/core/error/failure.dart';
import 'package:veda_learn/features/auth/domain/repository/auth_repository.dart';
import 'package:veda_learn/features/auth/domain/usecase/auth_login_use_case.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late AuthLoginUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = AuthLoginUsecase(authRepository: mockAuthRepository);
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  const tToken = 'dummy_token';

  const tParams = LoginParams(email: tEmail, password: tPassword);

  group('LoginParams', () {
    test('default constructor should create correct object', () {
      const params = LoginParams(email: 'a@a.com', password: 'abc123');
      expect(params.email, 'a@a.com');
      expect(params.password, 'abc123');
    });

    test('initial constructor should create empty email and password', () {
      const params = LoginParams.initial();
      expect(params.email, '');
      expect(params.password, '');
    });

    test('equality and hashCode should work correctly', () {
      const p1 = LoginParams(email: 'a', password: 'b');
      const p2 = LoginParams(email: 'a', password: 'b');
      const p3 = LoginParams(email: 'x', password: 'y');

      expect(p1, equals(p2));
      expect(p1.hashCode, equals(p2.hashCode));
      expect(p1 == p3, isFalse);
    });
  });

  group('AuthLoginUsecase', () {
    test('should call repository loginToAccount and return Right(token)', () async {
      // Arrange
      when(() => mockAuthRepository.loginToAccount(any(), any()))
          .thenAnswer((_) async => const Right(tToken));

      // Act
      final result = await usecase(tParams);

      // Assert
      expect(result, equals(const Right(tToken)));

      verify(() => mockAuthRepository.loginToAccount(tEmail, tPassword)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return Failure when repository loginToAccount fails', () async {
      // Arrange
      final tFailure = ApiFailure(message: "Invalid credentials");
      when(() => mockAuthRepository.loginToAccount(any(), any()))
          .thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await usecase(tParams);

      // Assert
      expect(result, equals(Left(tFailure)));

      verify(() => mockAuthRepository.loginToAccount(tEmail, tPassword)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should handle empty email and password gracefully', () async {
      const emptyParams = LoginParams.initial();

      when(() => mockAuthRepository.loginToAccount(any(), any()))
          .thenAnswer((_) async => const Right("empty_token"));

      final result = await usecase(emptyParams);

      expect(result, equals(const Right("empty_token")));

      verify(() => mockAuthRepository.loginToAccount('', '')).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}

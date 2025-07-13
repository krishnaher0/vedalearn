import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:veda_learn/features/auth/domain/usecase/auth_login_use_case.dart';
// Note: Use LoginParams here
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_event.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_state.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_viewmodel.dart';
import 'package:veda_learn/core/error/failure.dart';

// --- Fake class for fallback value ---
class LoginParamsFake extends Fake implements LoginParams {}

// Mock usecase
class MockLoginUsecase extends Mock implements AuthLoginUsecase {}

void main() {
  late LoginViewModel loginViewModel;
  late MockLoginUsecase mockLoginUsecase;

  const testEmail = 'test@example.com';
  const testPassword = 'password123';

  setUpAll(() {
    registerFallbackValue(LoginParamsFake());
  });

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    loginViewModel = LoginViewModel(mockLoginUsecase);
  });

  blocTest<LoginViewModel, LoginState>(
    'emits updated email when LoginEmailChanged is added',
    build: () => loginViewModel,
    act: (bloc) => bloc.add(const LoginEmailChanged(testEmail)),
    expect: () => [
      const LoginState(email: testEmail),
    ],
  );

  blocTest<LoginViewModel, LoginState>(
    'emits updated password when LoginPasswordChanged is added',
    build: () => loginViewModel,
    act: (bloc) => bloc.add(const LoginPasswordChanged(testPassword)),
    expect: () => [
      const LoginState(password: testPassword),
    ],
  );

  blocTest<LoginViewModel, LoginState>(
    'emits [submitting, success] when login is successful',
    build: () {
      when(() => mockLoginUsecase(any()))
          .thenAnswer((_) async => const Right('token_123'));
      return loginViewModel;
    },
    act: (bloc) {
      bloc.add(const LoginSubmitted(testEmail, testPassword));
    },
    wait: const Duration(seconds: 2),
    expect: () => [
      const LoginState(
        email: testEmail,
        password: testPassword,
        formStatus: FormStatus.submitting,
        message: 'Submission Under Process',
      ),
      const LoginState(
        email: testEmail,
        password: testPassword,
        formStatus: FormStatus.success,
        message: 'Login Successful',
      ),
    ],
    verify: (_) {
      verify(() => mockLoginUsecase(
        LoginParams(email: testEmail, password: testPassword),
      )).called(1);
    },
  );

  blocTest<LoginViewModel, LoginState>(
    'emits [submitting, failure] when login fails',
    build: () {
      when(() => mockLoginUsecase(any()))
          .thenAnswer((_) async => Left(ApiFailure(message: 'Login failed')));
      return loginViewModel;
    },
    act: (bloc) {
      bloc.add(const LoginSubmitted(testEmail, testPassword));
    },
    wait: const Duration(seconds: 2),
    expect: () => [
      const LoginState(
        email: testEmail,
        password: testPassword,
        formStatus: FormStatus.submitting,
        message: 'Submission Under Process',
      ),
      const LoginState(
        email: testEmail,
        password: testPassword,
        formStatus: FormStatus.failure,
        message: 'Login failed!',
      ),
    ],
    verify: (_) {
      verify(() => mockLoginUsecase(
        LoginParams(email: testEmail, password: testPassword),
      )).called(1);
    },
  );
}

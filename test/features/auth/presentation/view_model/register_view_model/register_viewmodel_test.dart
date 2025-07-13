import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import 'package:veda_learn/features/auth/domain/usecase/auth_register_usecase.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_event.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_state.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_viewmodel.dart';
import 'package:veda_learn/core/error/failure.dart';

// --- Fake class for fallback value ---
class AuthRegisterParamsFake extends Fake implements AuthRegisterParams {}

class MockAuthRegisterUsecase extends Mock implements AuthRegisterUsecase {}
class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late RegisterViewmodel registerViewmodel;
  late MockAuthRegisterUsecase mockAuthRegisterUsecase;

  // Test data
  const testEmail = 'test@example.com';
  const testName = 'Test User';
  const testPassword = 'password123';
  const testAge = 25;

  setUpAll(() {
    registerFallbackValue(AuthRegisterParamsFake());
    registerFallbackValue(MockBuildContext());
  });

  setUp(() {
    mockAuthRegisterUsecase = MockAuthRegisterUsecase();
    registerViewmodel = RegisterViewmodel(mockAuthRegisterUsecase);
  });

  // 1. Test input changes update state properly
  blocTest<RegisterViewmodel, RegisterState>(
    'emits updated email when RegisterEmailChanged is added',
    build: () => registerViewmodel,
    act: (bloc) => bloc.add(const RegisterEmailChanged(testEmail)),
    expect: () => [const RegisterState(email: testEmail)],
  );

  
  // 1. Test input changes update state properly

  blocTest<RegisterViewmodel, RegisterState>(
    'emits updated email when RegisterEmailChanged is added',
    build: () => registerViewmodel,
    act: (bloc) => bloc.add(const RegisterEmailChanged(testEmail)),
    expect: () => [const RegisterState(email: testEmail)],
  );

  blocTest<RegisterViewmodel, RegisterState>(
    'emits updated name when RegisterFullNameChanged is added',
    build: () => registerViewmodel,
    act: (bloc) => bloc.add(const RegisterFullNameChanged(testName)),
    expect: () => [const RegisterState(name: testName)],
  );

  blocTest<RegisterViewmodel, RegisterState>(
    'emits updated password when RegisterPasswordChanged is added',
    build: () => registerViewmodel,
    act: (bloc) => bloc.add(const RegisterPasswordChanged(testPassword)),
    expect: () => [const RegisterState(password: testPassword)],
  );

  blocTest<RegisterViewmodel, RegisterState>(
    'emits updated age when RegisterAgeChanged is added',
    build: () => registerViewmodel,
    act: (bloc) => bloc.add(const RegisterAgeChanged(testAge)),
    expect: () => [const RegisterState(age: testAge)],
  );

  // 2. Test submitted individual fields (async with delay)

  blocTest<RegisterViewmodel, RegisterState>(
    'emits submitting then success when RegisterEmailSubmitted is added',
    build: () => registerViewmodel,
    act: (bloc) => bloc.add(const RegisterEmailSubmitted(testEmail)),
    wait: const Duration(seconds: 3),
    expect: () => [
      const RegisterState(
        emailFormStatus: EmailFormStatus.submitting,
        message: 'Submitting...',
      ),
      const RegisterState(
        email: testEmail,
        emailFormStatus: EmailFormStatus.success,
        message: 'Done Submitting...',
      ),
    ],
  );

  blocTest<RegisterViewmodel, RegisterState>(
    'emits submitting then success when RegisterNameSubmitted is added',
    build: () => registerViewmodel,
    act: (bloc) => bloc.add(const RegisterNameSubmitted(testName)),
    wait: const Duration(seconds: 3),
    expect: () => [
      const RegisterState(
        emailFormStatus: EmailFormStatus.submitting,
        message: 'Submitting...',
      ),
      const RegisterState(
        name: testName,
        emailFormStatus: EmailFormStatus.success,
        message: 'Done Submitting...',
      ),
    ],
  );

  blocTest<RegisterViewmodel, RegisterState>(
    'emits submitting then success when RegisterAgeSubmitted is added',
    build: () => registerViewmodel,
    act: (bloc) => bloc.add(const RegisterAgeSubmitted(testAge)),
    wait: const Duration(seconds: 3),
    expect: () => [
      const RegisterState(
        emailFormStatus: EmailFormStatus.submitting,
        message: 'Submitting...',
      ),
      const RegisterState(
        age: testAge,
        emailFormStatus: EmailFormStatus.success,
        message: 'Done Submitting...',
      ),
    ],
  );

  // 3. Test successful registration flow

  blocTest<RegisterViewmodel, RegisterState>(
    'emits [submitting, success] when final submission succeeds',
    build: () {
      when(() => mockAuthRegisterUsecase(any()))
          .thenAnswer((_) async => const Right(null));
      return registerViewmodel;
    },
    act: (bloc) {
      bloc.add(OnFinalSubmission(testEmail, testName, testPassword, testAge));
    },
    wait: const Duration(seconds: 3),
    expect: () => [
      const RegisterState(emailFormStatus: EmailFormStatus.submitting),
      const RegisterState(
        emailFormStatus: EmailFormStatus.success,
        message: 'Registration Successful!',
      ),
    ],
    verify: (_) {
      verify(() => mockAuthRegisterUsecase(AuthRegisterParams(
            email: testEmail,
            name: testName,
            password: testPassword,
            age: testAge,
          ))).called(1);
    },
  );

  // 4. Test failed registration flow

  blocTest<RegisterViewmodel, RegisterState>(
    'emits [submitting, failure] when final submission fails',
    build: () {
      when(() => mockAuthRegisterUsecase(any()))
          .thenAnswer((_) async => Left(ApiFailure(message: 'Register failed')));
      return registerViewmodel;
    },
    act: (bloc) {
      bloc.add(OnFinalSubmission(testEmail, testName, testPassword, testAge));
    },
    wait: const Duration(seconds: 3),
    expect: () => [
      const RegisterState(emailFormStatus: EmailFormStatus.submitting),
      const RegisterState(
        emailFormStatus: EmailFormStatus.failure,
        message: 'Registration Failed!',
      ),
    ],
    verify: (_) {
      verify(() => mockAuthRegisterUsecase(AuthRegisterParams(
            email: testEmail,
            name: testName,
            password: testPassword,
            age: testAge,
          ))).called(1);
    },
  );

  // 5. Test reset form event resets the state correctly

  blocTest<RegisterViewmodel, RegisterState>(
    'emits initial state when FormReset is added',
    build: () => registerViewmodel,
    seed: () => const RegisterState(
      email: testEmail,
      emailFormStatus: EmailFormStatus.success,
      message: 'Some message',
    ),
    act: (bloc) => bloc.add(FormReset()),
    expect: () => [
      const RegisterState(
        email: testEmail,
        emailFormStatus: EmailFormStatus.initial,
        message: "Some message",
      ),
    ],
  );


  blocTest<RegisterViewmodel, RegisterState>(
    'emits updated name when RegisterFullNameChanged is added',
    build: () => registerViewmodel,
    act: (bloc) => bloc.add(const RegisterFullNameChanged(testName)),
    expect: () => [const RegisterState(name: testName)],
  );

  blocTest<RegisterViewmodel, RegisterState>(
    'emits updated password when RegisterPasswordChanged is added',
    build: () => registerViewmodel,
    act: (bloc) => bloc.add(const RegisterPasswordChanged(testPassword)),
    expect: () => [const RegisterState(password: testPassword)],
  );

  // 2. Test successful registration flow
  blocTest<RegisterViewmodel, RegisterState>(
    'emits [submitting, success] when final submission succeeds',
    build: () {
      when(() => mockAuthRegisterUsecase(any()))
          .thenAnswer((_) async => const Right(null));
      return registerViewmodel;
    },
    act: (bloc) {
      bloc.add(OnFinalSubmission(testEmail, testName, testPassword, testAge));
    },
    wait: const Duration(seconds: 2),
    expect: () => [
      const RegisterState(emailFormStatus: EmailFormStatus.submitting),
      const RegisterState(
        emailFormStatus: EmailFormStatus.success,
        message: 'Registration Successful!',
      ),
    ],
    verify: (_) {
      verify(() => mockAuthRegisterUsecase(AuthRegisterParams(
            email: testEmail,
            name: testName,
            password: testPassword,
            age: testAge,
          ))).called(1);
    },
  );

  // 3. Test failed registration flow
  blocTest<RegisterViewmodel, RegisterState>(
    'emits [submitting, failure] when final submission fails',
    build: () {
      when(() => mockAuthRegisterUsecase(any()))
          .thenAnswer((_) async => Left(ApiFailure(message: 'Register failed')));
      return registerViewmodel;
    },
    act: (bloc) {
      bloc.add(OnFinalSubmission(testEmail, testName, testPassword, testAge));
    },
    wait: const Duration(seconds: 2),
    expect: () => [
      const RegisterState(emailFormStatus: EmailFormStatus.submitting),
      const RegisterState(
        emailFormStatus: EmailFormStatus.failure,
        message: 'Registration Failed!',
      ),
    ],
    verify: (_) {
      
      verify(() => mockAuthRegisterUsecase(AuthRegisterParams(
            email: testEmail,
            name: testName,
            password: testPassword,
            age: testAge,
          ))).called(1);
    },
  );

  // 4. Test reset form event resets the state correctly
  blocTest<RegisterViewmodel, RegisterState>(
  'emits initial state when FormReset is added',
  build: () => registerViewmodel,
  seed: () => const RegisterState(
    email: 'test@example.com',
    emailFormStatus: EmailFormStatus.success, // Important: different to ensure emit
    
  ),
  act: (bloc) => bloc.add(FormReset()),
  expect: () => [
    const RegisterState(
      email: 'test@example.com',
      emailFormStatus: EmailFormStatus.initial,
      message: null,
    ),
  ],
);
// 6. Test NavigateToLoginEvent
}
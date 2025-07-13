import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:veda_learn/features/auth/presentation/view/login_screen.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_event.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_state.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_viewmodel.dart';
import 'mock_holder.dart'; // Assumes your mock classes are here

void main() {
  late MockLoginViewModel mockLoginViewModel;
  late MockNavigatorObserver mockNavigatorObserver;
  late StreamController<LoginState> loginStateController;

  // Setup mock fallbacks once for all tests
  setUpAll(() {
    registerFallbackValue(FakeLoginEvent());
    registerFallbackValue(FakeRoute());
  });

  // Re-initialize mocks before each test
  setUp(() {
    mockLoginViewModel = MockLoginViewModel();
    mockNavigatorObserver = MockNavigatorObserver();
    loginStateController = StreamController<LoginState>.broadcast();

    when(() => mockLoginViewModel.stream).thenAnswer((_) => loginStateController.stream);
  });

  // Helper function to create the widget tree under test
  Widget createWidgetUnderTest() {
    return BlocProvider<LoginViewModel>(
      create: (_) => mockLoginViewModel,
      child: MaterialApp(
        home: LoginScreen(),
        routes: {
          '/dashboard': (_) => const Scaffold(body: Text('Dashboard')),
          '/register': (_) => const Scaffold(body: Text('Register')),
        },
        navigatorObservers: [mockNavigatorObserver],
      ),
    );
  }

  group('LoginScreen', () {
    testWidgets('renders all initial widgets correctly', (widgetTester) async {
      // Arrange
      when(() => mockLoginViewModel.state).thenReturn(const LoginState());

      // Act
      await widgetTester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(Image), findsNWidgets(2));
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
      expect(find.byKey(const Key('google_login_btn')), findsOneWidget,
          reason: 'Ensure the Google Login button has this key');
      expect(find.byKey(const Key('register_button')), findsOneWidget);
    });

    group('Form Validation', () {
      testWidgets('shows error when email is empty', (widgetTester) async {
        // Arrange
        when(() => mockLoginViewModel.state).thenReturn(const LoginState());
        await widgetTester.pumpWidget(createWidgetUnderTest());
        final loginButton = find.widgetWithText(ElevatedButton, 'Login');

        // Act
        await widgetTester.ensureVisible(loginButton);
        await widgetTester.pumpAndSettle();
        await widgetTester.tap(loginButton);
        await widgetTester.pump();

        // Assert
        expect(find.text('Please enter your email address'), findsOneWidget);
      });

      testWidgets('shows error when email is invalid', (widgetTester) async {
        // Arrange
        when(() => mockLoginViewModel.state).thenReturn(const LoginState());
        await widgetTester.pumpWidget(createWidgetUnderTest());
        final loginButton = find.widgetWithText(ElevatedButton, 'Login');

        // Act
        await widgetTester.enterText(
            find.byType(TextFormField).first, 'invalid-email');
        await widgetTester.ensureVisible(loginButton);
        await widgetTester.pumpAndSettle();
        await widgetTester.tap(loginButton);
        await widgetTester.pump();

        // Assert
        expect(find.text('Please enter a valid email'), findsOneWidget);
      });

      testWidgets('shows error when password is empty', (widgetTester) async {
        // Arrange
        when(() => mockLoginViewModel.state)
            .thenReturn(const LoginState(email: 'test@test.com'));
        await widgetTester.pumpWidget(createWidgetUnderTest());
        await widgetTester.enterText(
            find.byType(TextFormField).first, 'test@test.com');
        final loginButton = find.widgetWithText(ElevatedButton, 'Login');

        // Act
        await widgetTester.ensureVisible(loginButton);
        await widgetTester.pumpAndSettle();
        await widgetTester.tap(loginButton);
        await widgetTester.pump();

        // Assert
        expect(find.text('Please enter your password'), findsOneWidget);
      });

      testWidgets('shows error when password is too short',
          (widgetTester) async {
        // Arrange
        when(() => mockLoginViewModel.state)
            .thenReturn(const LoginState(email: 'test@test.com', password: '123'));
        await widgetTester.pumpWidget(createWidgetUnderTest());
        final loginButton = find.widgetWithText(ElevatedButton, 'Login');

        // Act
        await widgetTester.enterText(
            find.byType(TextFormField).first, 'test@test.com');
        await widgetTester.enterText(find.byType(TextFormField).last, '123');
        await widgetTester.ensureVisible(loginButton);
        await widgetTester.pumpAndSettle();
        await widgetTester.tap(loginButton);
        await widgetTester.pump();

        // Assert
        expect(find.text('Password must be at least 4 characters'),
            findsOneWidget);
      });
    });

    group('Bloc Interaction', () {
      testWidgets('adds LoginEmailChanged event when email is changed',
          (widgetTester) async {
        // Arrange
        when(() => mockLoginViewModel.state).thenReturn(const LoginState());
        await widgetTester.pumpWidget(createWidgetUnderTest());

        // Act
        await widgetTester.enterText(
            find.byType(TextFormField).first, 'test@test.com');

        // Assert
        verify(() => mockLoginViewModel.add(const LoginEmailChanged('test@test.com')))
            .called(1);
      });

      testWidgets('adds LoginPasswordChanged event when password is changed',
          (widgetTester) async {
        // Arrange
        when(() => mockLoginViewModel.state).thenReturn(const LoginState());
        await widgetTester.pumpWidget(createWidgetUnderTest());

        // Act
        await widgetTester.enterText(find.byType(TextFormField).last, 'password');

        // Assert
        verify(() => mockLoginViewModel.add(const LoginPasswordChanged('password')))
            .called(1);
      });

      testWidgets(
          'adds LoginSubmitted event when form is valid and login button is pressed',
          (widgetTester) async {
        // Arrange
        when(() => mockLoginViewModel.state).thenReturn(
          const LoginState(email: 'valid@email.com', password: 'validpassword'),
        );
        await widgetTester.pumpWidget(createWidgetUnderTest());
        final loginButton = find.widgetWithText(ElevatedButton, 'Login');

        // Act
        await widgetTester.enterText(
            find.byType(TextFormField).first, 'valid@email.com');
        await widgetTester.enterText(
            find.byType(TextFormField).last, 'validpassword');
        await widgetTester.ensureVisible(loginButton);
        await widgetTester.pumpAndSettle();
        await widgetTester.tap(loginButton);
        await widgetTester.pump();

        // Assert
        verify(() => mockLoginViewModel
            .add(const LoginSubmitted('valid@email.com', 'validpassword'))).called(1);
      });
    });

    group('BlocListener State Changes', () {
      testWidgets('shows SnackBar on login failure', (widgetTester) async {
        // Arrange
        whenListen(
          mockLoginViewModel,
          Stream.fromIterable([
            const LoginState(
                formStatus: FormStatus.failure, message: 'Login Failed..'),
          ]),
          initialState: const LoginState(),
        );

        // Act
        await widgetTester.pumpWidget(createWidgetUnderTest());
        await widgetTester.pump(); // Pump to process the state change from the stream

        // Assert
        expect(find.text('Login Failed..'), findsOneWidget);
      });

      testWidgets('shows SnackBar and navigates on login success',
          (widgetTester) async {
        // Arrange
        when(
          () => mockLoginViewModel.state
        ).thenReturn(const LoginState());

        // Act
        await widgetTester.pumpWidget(createWidgetUnderTest());
        clearInteractions(mockNavigatorObserver);

        loginStateController.add(
          const LoginState(formStatus: FormStatus.success, message: 'Login Successful...'),
        );
        await widgetTester.pumpAndSettle(); // Wait for snackbar and navigation animations

        verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
        expect(find.text('Dashboard'), findsOneWidget);
      });

      tearDown(() {
        loginStateController.close();
      });
    });

    group('Navigation', () {
      testWidgets('navigates to register screen when register button is tapped',
          (widgetTester) async {
        // Arrange
        when(() => mockLoginViewModel.state).thenReturn(const LoginState());
        await widgetTester.pumpWidget(createWidgetUnderTest());

        clearInteractions(mockNavigatorObserver);
        final registerButton = find.byKey(const Key('register_button'));

        // Act
        await widgetTester.ensureVisible(registerButton);
        await widgetTester.pumpAndSettle();
        await widgetTester.tap(registerButton);
        await widgetTester.pumpAndSettle(); // Wait for navigation animation

        // Assert
        verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
        expect(find.text('Register'), findsOneWidget);
      });
    });
  });
}

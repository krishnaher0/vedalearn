import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:veda_learn/features/auth/presentation/view/email_screen.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_event.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_state.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_viewmodel.dart';

// --- Mock Bloc ---
class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterViewmodel {}

class FakeRegisterEvent extends Fake implements RegisterEvent {}

class FakeRoute extends Fake implements Route<dynamic> {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRegisterEvent());
    registerFallbackValue(FakeRoute());
  });

  late MockRegisterBloc mockBloc;
  late MockNavigatorObserver mockObserver;

  setUp(() {
    mockBloc = MockRegisterBloc();
    mockObserver = MockNavigatorObserver();

    when(() => mockBloc.state).thenReturn(const RegisterState());
    when(() => mockBloc.stream).thenAnswer((_) => const Stream<RegisterState>.empty());
  });

  Widget createTestWidget({NavigatorObserver? observer}) {
    return MaterialApp(
      home: BlocProvider<RegisterViewmodel>.value(
        value: mockBloc,
        child: const EmailScreen(),
      ),
      navigatorObservers: observer != null ? [observer] : [],
      routes: {
        '/password-screen': (context) => const Scaffold(body: Text('Password Screen')),
      },
    );
  }

  testWidgets('Renders all UI elements properly', (tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    expect(find.text("What is your email?"), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, "Next"), findsOneWidget);
    expect(find.widgetWithText(TextButton, "Skip"), findsOneWidget);
  });

  testWidgets('Typing in TextField triggers RegisterEmailChanged event', (tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    const testEmail = 'test@example.com';
    await tester.enterText(find.byType(TextField), testEmail);

    verify(() => mockBloc.add(RegisterEmailChanged(testEmail))).called(1);
  });

  testWidgets('Pressing Next button triggers RegisterEmailSubmitted event', (tester) async {
    const email = 'hello@mail.com';
    when(() => mockBloc.state).thenReturn(RegisterState(email: email));

    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, "Next"));
    await tester.pump();

    verify(() => mockBloc.add(RegisterEmailSubmitted(email))).called(1);
  });

  testWidgets('Pressing back button pops navigation', (tester) async {
    await tester.pumpWidget(createTestWidget(observer: mockObserver));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_sharp));
    await tester.pumpAndSettle();

    verify(() => mockObserver.didPop(any(), any())).called(greaterThanOrEqualTo(1));
  });

  testWidgets('Navigates to password screen on success', (tester) async {
    when(() => mockBloc.stream).thenAnswer((_) => Stream.fromIterable([
      const RegisterState(),
      const RegisterState(emailFormStatus: EmailFormStatus.success, message: "Done Submitting.."),
    ]));

    await tester.pumpWidget(createTestWidget(observer: mockObserver));
    await tester.pumpAndSettle();

    // Verify navigator push
    verify(() => mockObserver.didPush(any(), any())).called(greaterThanOrEqualTo(1));
    expect(find.text('Password Screen'), findsOneWidget);
  });

  testWidgets('Shows failure snackbar on failure', (tester) async {
    when(() => mockBloc.stream).thenAnswer((_) => Stream.fromIterable([
      const RegisterState(),
      const RegisterState(emailFormStatus: EmailFormStatus.failure, message: "Failure Submitting.."),
    ]));

    await tester.pumpWidget(createTestWidget());
    await tester.pump(); // First frame
    await tester.pump(const Duration(seconds: 1)); // Let snackbar appear

    expect(find.text('Failure Submitting..'), findsOneWidget);
  });

  testWidgets('Skip button can be tapped', (tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(TextButton, "Skip"));
    await tester.pump();

    // No crash, button tap works
  });
}

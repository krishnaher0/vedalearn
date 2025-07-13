import 'package:bloc_test/bloc_test.dart';

import 'package:flutter/material.dart';

import 'package:mocktail/mocktail.dart';

import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_event.dart';

import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_state.dart';

import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_viewmodel.dart';
 
// Mock for the LoginViewModel

class MockLoginViewModel extends MockBloc<LoginEvent, LoginState> implements LoginViewModel {}
 
// Mock for the Navigator

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
 
// Fakes for LoginEvent and Route

class FakeLoginEvent extends Fake implements LoginEvent {}

class FakeRoute extends Fake implements Route<dynamic> {}
 
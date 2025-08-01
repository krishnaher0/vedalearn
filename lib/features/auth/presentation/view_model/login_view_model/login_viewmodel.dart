import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:veda_learn/features/auth/domain/usecase/auth_login_use_case.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_event.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_state.dart';

class LoginViewModel extends Bloc<LoginEvent, LoginState> {
  final AuthLoginUsecase _authLoginUsecase;
  LoginViewModel(this._authLoginUsecase) : super(LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = event.email;

    emit(state.copyWith(email: email));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = event.password;

    emit(state.copyWith(password: password));
  }
void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
  final email = event.email;
  final password = event.password;

  emit(
    state.copyWith(
      email: email,
      password: password,
      formStatus: FormStatus.submitting,
      message: 'Submission Under Process',
    ),
  );

  await Future.delayed(Duration(seconds: 2));

  final result = await _authLoginUsecase(
    LoginParams(email: email, password: password),
  );

  result.fold(
    (l) {
      emit(state.copyWith(
        formStatus: FormStatus.failure,
        message: 'Login failed!',
      ));
    },
    (userEntity) {
      emit(state.copyWith(
        formStatus: FormStatus.success,
        message: 'Login Successful',
        email: email,
        user: userEntity
      ));
    },
  );
}
}

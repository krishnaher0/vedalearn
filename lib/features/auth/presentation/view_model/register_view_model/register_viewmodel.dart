import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veda_learn/features/auth/domain/usecase/auth_register_usecase.dart';
import 'package:veda_learn/features/auth/presentation/view/login_screen.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_event.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_state.dart';

class RegisterViewmodel extends Bloc<RegisterEvent, RegisterState> {
  final AuthRegisterUsecase _authRegisterUsecase;

  RegisterViewmodel(this._authRegisterUsecase) : super(const RegisterState()) {
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterFullNameChanged>(_onFullNameChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterAgeChanged>(_onAgeChanged);
    on<FormReset>(_onResetForm);
    on<OnFinalSubmission>(_onSubmitted);
    on<NavigateToLoginEvent>(_onNavigateToLogin);
    on<RegisterEmailSubmitted>(_onEmailSubmitted);
    on<RegisterNameSubmitted>(_onNameSubmitted);
    on<RegisterAgeSubmitted>(_onAgeSubmitted);
  }

  void _onEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    final email = event.email;

    emit(state.copyWith(email: email));
  }

  void _onFullNameChanged(
    RegisterFullNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final name = event.name;

    emit(state.copyWith(name: name));
  }

  void _onAgeChanged(
    RegisterAgeChanged event,
    Emitter<RegisterState> emit,
  ) {
    final age = event.age;

    emit(state.copyWith(age: age));
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = event.password;

    emit(state.copyWith(password: password));
  }

  void _onEmailSubmitted(
    RegisterEmailSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(emailFormStatus: EmailFormStatus.submitting, message: 'Submitting...'));
    await Future.delayed(Duration(seconds: 2));
    final email = event.email;

    emit(
      state.copyWith(
        email: email,
        emailFormStatus: EmailFormStatus.success,
        message: 'Done Submitting...',
      ),
    );
  }

  void _onAgeSubmitted(
    RegisterAgeSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(emailFormStatus: EmailFormStatus.submitting, message: 'Submitting...'));
    await Future.delayed(Duration(seconds: 2));
    final age = event.age;

    emit(
      state.copyWith(
        age: age,
        emailFormStatus: EmailFormStatus.success,
        message: 'Done Submitting...',
      ),
    );
  }

  void _onNameSubmitted(
    RegisterNameSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(emailFormStatus: EmailFormStatus.submitting, message: 'Submitting...'));
    await Future.delayed(Duration(seconds: 2));
    final name = event.name;

    emit(
      state.copyWith(
        name: name,
        emailFormStatus: EmailFormStatus.success,
        message: 'Done Submitting...',
      ),
    );
  }

  Future<void> _onSubmitted(
    OnFinalSubmission event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(emailFormStatus: EmailFormStatus.submitting));

    final data = await _authRegisterUsecase(
      AuthRegisterParams(
        email: event.email,
        name: event.name,
        password: event.password,
        age: event.age,
      ),
    );

    Future.delayed(Duration(seconds: 2));

    data.fold(
      (l) {
        emit(
          state.copyWith(
            emailFormStatus: EmailFormStatus.failure,
            message: 'Registration Failed!',
          ),
        );
      },

      (r) {
        emit(
          state.copyWith(
            emailFormStatus: EmailFormStatus.success,
            message: 'Registration Successful!',
          ),
        );
      },
    );
  }

  void _onResetForm(FormReset event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(emailFormStatus: EmailFormStatus.initial, message: null),
    );
  }
}

void _onNavigateToLogin(
  NavigateToLoginEvent event,
  Emitter<RegisterState> emit,
) {
  if (event.context.mounted) {
    Navigator.push(
      event.context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}

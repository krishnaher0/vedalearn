import 'package:equatable/equatable.dart';

enum EmailFormStatus { initial, submitting, success, failure }

class RegisterState extends Equatable {
  final String email;
  final String name;
  final String password;
  final int age;
  final EmailFormStatus emailFormStatus;
  final String? message;

  const RegisterState({
    this.email = '',
    this.name = '',
    this.password = '',
    this.age=0,
    this.emailFormStatus = EmailFormStatus.initial,
    this.message,
  });

  RegisterState copyWith({
    String? email,
    String? name,
    String? password,
    int? age,
    EmailFormStatus? emailFormStatus,
    String? message,
  }) {
    return RegisterState(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      age:age ?? this.age,
      emailFormStatus: emailFormStatus ?? this.emailFormStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    email,
    name,
    password,
    age,
    emailFormStatus,
    message,
  ];
}

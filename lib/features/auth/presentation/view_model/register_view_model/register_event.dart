import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
 
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
 
  @override
  List<Object?> get props => [];
}
 
class RegisterEmailChanged extends RegisterEvent {
  final String email;
  const RegisterEmailChanged(this.email);
 
  @override
  List<Object?> get props => [email];
}
class RegisterAgeChanged extends RegisterEvent {
  final int age;
  const RegisterAgeChanged(this.age);
 
  @override
  List<Object?> get props => [age];
}
 
class RegisterFullNameChanged extends RegisterEvent {
  final String name;
  const RegisterFullNameChanged(this.name);
 
  @override
  List<Object?> get props => [name];
}
 
class RegisterPasswordChanged extends RegisterEvent {
  final String password;
  const RegisterPasswordChanged(this.password);
 
  @override
  List<Object?> get props => [password];
}


// Steps for data submission
class RegisterEmailSubmitted extends RegisterEvent {
  final String email;
  const RegisterEmailSubmitted(this.email);

  @override
  List<Object?> get props => [email];
}

class RegisterNameSubmitted extends RegisterEvent {
  final String name;
  const RegisterNameSubmitted(this.name);

  @override
  List<Object?> get props => [name];
}

class RegisterAgeSubmitted extends RegisterEvent {
  final int age;
  const RegisterAgeSubmitted(this.age);

  @override
  List<Object?> get props => [age];
}
 
class OnFinalSubmission extends RegisterEvent {
  final String email;
  final String name;
  final String password;
  final int age;
 
  const OnFinalSubmission(this.email, this.name, this.password,this.age);
 
  @override
  List<Object?> get props => [email, name, password,age];
}
 
class FormReset extends RegisterEvent {}

class NavigateToLoginEvent extends RegisterEvent {
  final BuildContext context;
 
  const NavigateToLoginEvent({required this.context});
}
 
 
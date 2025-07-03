import 'package:equatable/equatable.dart';


class UserEntity extends Equatable {
  final String? id;
final String name;
final int age;
final String email;
final String password;

  const UserEntity({
    required this.name, 
  required this.age, 
  required this.email, 
  required this.password, 
  this.id
  });

  @override
  List<Object?> get props => [
   name,age,email,
    password,
  ];
}

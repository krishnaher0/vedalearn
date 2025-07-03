import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';

 
part 'user_api_model.g.dart';
 
@JsonSerializable()
class UserApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String name;
  final String email;
  final int age;
  final String password;
 
  const UserApiModel({
    this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.password,
  });
 
  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);
 
  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);
 
  UserEntity toEntity() {
    return UserEntity(
      id: id,
 
      name: name,
 
      email: email,
 
      age: age,
 
      password: password,
    );
  }
 
  factory UserApiModel.fromEntity(UserEntity userEntity) {
    final user = UserApiModel(
      name: userEntity.name,
 
      age: userEntity.age,
 
      email: userEntity.email,
 
      password: userEntity.password,
    );
 
    return user;
  }
 
  @override
  List<Object?> get props => [id, name, age, email, password];
}
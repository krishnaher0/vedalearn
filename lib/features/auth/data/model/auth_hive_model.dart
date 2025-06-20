import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:uuid/uuid.dart';
import 'package:veda_learn/app/constant/hive/hive_table_constant.dart';
import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';

part 'auth_hive_model.g.dart';
 
@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? id;
 
  @HiveField(1)
  final String? email;
 
  @HiveField(2)
  final String? name;
 
  @HiveField(3)
  final String? password;

  @HiveField(4)
  final int? age;
 
  AuthHiveModel({
    String? id,
    required this.email,
    required this.name,
    required this.password,
    required this.age
  }) : id = id ?? const Uuid().v4();
 
  // From Entity to Hive Model
  factory AuthHiveModel.fromEntity(UserEntity entity) {
    return AuthHiveModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      password: entity.password, 
      age: entity.age
    );
  }
 
  // From Hive Model to Entity
  UserEntity toEntity() {
    return UserEntity(
       id: id,
      email: email,
      name: name,
      password: password, 
      age: age
      
    );
  }
 
  @override
  List<Object?> get props => [
    id,
    email,
    name,
    password,
    age
  ];
}
 
 
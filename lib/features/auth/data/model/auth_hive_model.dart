import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart'; // Used for generating IDs if not provided
import 'package:veda_learn/app/constant/hive/hive_table_constant.dart';
import 'package:veda_learn/features/auth/data/model/enrolled_course_hive_model.dart';
import 'package:veda_learn/features/auth/data/model/player_stats_hive_model.dart';
import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String name; // Required as per UserEntity

  @HiveField(2)
  final String email; // Required as per UserEntity

  @HiveField(3)
  final String? password; // Required as per UserEntity

  @HiveField(4)
  final int age; // Required as per UserEntity

  @HiveField(5)
  final String? role; // Optional from UserEntity

  @HiveField(6)
  final bool? subscribed; // Optional from UserEntity

  @HiveField(7)
  final List<EnrolledCourseHiveModel>? enrolledCourses; // Optional from UserEntity

  @HiveField(8)
  final PlayerStatsHiveModel? playerStats; // Optional from UserEntity

  @HiveField(9) // Increased field index
  final String? token; // This field is specific to AuthHiveModel/session

  AuthHiveModel({
    String? id,
    required this.name,
    required this.email,
    this.password,
    required this.age,
    this.role,
    this.subscribed,
    this.enrolledCourses,
    this.playerStats,
    this.token, // Made token optional in constructor if it's not always available
  }) : id = id ?? const Uuid().v4();

  // From Entity to Hive Model
  factory AuthHiveModel.fromEntity(UserEntity entity, {String? token}) {
    return AuthHiveModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      password: entity.password,
      age: entity.age,
      role: entity.role,
      subscribed: entity.subscribed,
      enrolledCourses:
          entity.enrolledCourses
              ?.map((e) => EnrolledCourseHiveModel.fromEntity(e))
              .toList(),
      playerStats:
          entity.playerStats != null
              ? PlayerStatsHiveModel.fromEntity(entity.playerStats!)
              : null,
      token: token, // Pass the token explicitly if available
    );
  }

  // From Hive Model to Entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      password: password,
      age: age,
      role: role,
      subscribed: subscribed,
      enrolledCourses: enrolledCourses?.map((e) => e.toEntity()).toList(),
      playerStats: playerStats?.toEntity(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    password,
    age,
    role,
    subscribed,
    enrolledCourses,
    playerStats,
    token,
  ];
}

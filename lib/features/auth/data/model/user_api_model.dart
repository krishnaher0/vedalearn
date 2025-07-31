import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:veda_learn/features/auth/data/model/enrolled_course_api_model.dart';
import 'package:veda_learn/features/auth/data/model/player_stats_api_model.dart';
import 'package:veda_learn/features/auth/domain/entity/user_entity.dart';

part 'user_api_model.g.dart';

@JsonSerializable()
class UserApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? token;
  final String name;
  final String email;
  final int age;
  final String? password;
  final String? role;
  final bool? subscribed;
  final List<EnrolledCourseApiModel>? enrolledCourses;
  final PlayerStatsApiModel? playerStats;

  const UserApiModel({
    this.id,
    required this.name,
    required this.email,
    required this.age,
    this.password,
    this.role,
    this.subscribed,
    this.enrolledCourses,
    this.playerStats,
    this.token
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      token:token,
      email: email,
      age: age,
      password: '',
      role: role,
      subscribed: subscribed,
      enrolledCourses: enrolledCourses?.map((e) => e.toEntity()).toList(),
      playerStats: playerStats?.toEntity(),

    );
  }

  factory UserApiModel.fromEntity(UserEntity userEntity) {
    return UserApiModel(
      id: userEntity.id,
      name: userEntity.name,
      email: userEntity.email,
      token:userEntity.token,
      age: userEntity.age,
      password: userEntity.password,
      role: userEntity.role,
      subscribed: userEntity.subscribed,
      enrolledCourses: userEntity.enrolledCourses
          ?.map((e) => EnrolledCourseApiModel.fromEntity(e))
          .toList(),
      playerStats: userEntity.playerStats != null
          ? PlayerStatsApiModel.fromEntity(userEntity.playerStats!)
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        age,
        password,
        role,
        subscribed,
        enrolledCourses,
        playerStats,
        token
      ];
}
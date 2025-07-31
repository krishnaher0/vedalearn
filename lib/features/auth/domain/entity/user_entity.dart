import 'package:equatable/equatable.dart';
import 'package:veda_learn/features/auth/domain/entity/enrolled_course_entity.dart';
import 'package:veda_learn/features/auth/domain/entity/player_stats_entity.dart';

class UserEntity extends Equatable {
  final String? token;
  final String? id;
  final String name;
  final int age;
  final String email;
  final String? password;
  final String? role;
  final bool? subscribed;
  final List<EnrolledCourseEntity>? enrolledCourses;
  final PlayerStatsEntity? playerStats;

  const UserEntity({
    this.id,
    required this.name,
    required this.age,
    required this.email,
    this.password,
    this.role,
    this.subscribed,
    this.enrolledCourses,
    this.playerStats,
    this.token,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    age,
    email,
    password,
    role,
    subscribed,
    enrolledCourses,
    playerStats,
    token,
  ];
}

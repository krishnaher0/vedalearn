// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
      id: json['_id'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      age: (json['age'] as num).toInt(),
      password: json['password'] as String?,
      role: json['role'] as String?,
      subscribed: json['subscribed'] as bool?,
      enrolledCourses: (json['enrolledCourses'] as List<dynamic>?)
          ?.map(
              (e) => EnrolledCourseApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      playerStats: json['playerStats'] == null
          ? null
          : PlayerStatsApiModel.fromJson(
              json['playerStats'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserApiModelToJson(UserApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'token': instance.token,
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'password': instance.password,
      'role': instance.role,
      'subscribed': instance.subscribed,
      'enrolledCourses': instance.enrolledCourses,
      'playerStats': instance.playerStats,
    };

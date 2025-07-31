// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrolled_course_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrolledCourseApiModel _$EnrolledCourseApiModelFromJson(
        Map<String, dynamic> json) =>
    EnrolledCourseApiModel(
      course: json['course'] as String?,
      lessonsCompleted: (json['lessonsCompleted'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      completed: json['completed'] as bool?,
      score: (json['score'] as num?)?.toInt(),
      enrolledAt: json['enrolledAt'] == null
          ? null
          : DateTime.parse(json['enrolledAt'] as String),
      questionProgress: (json['questionProgress'] as List<dynamic>?)
          ?.map((e) =>
              QuestionProgressApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCorrectQuestions: (json['totalCorrectQuestions'] as num?)?.toInt(),
      totalIncorrectQuestions:
          (json['totalIncorrectQuestions'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EnrolledCourseApiModelToJson(
        EnrolledCourseApiModel instance) =>
    <String, dynamic>{
      'course': instance.course,
      'lessonsCompleted': instance.lessonsCompleted,
      'completed': instance.completed,
      'score': instance.score,
      'enrolledAt': instance.enrolledAt?.toIso8601String(),
      'questionProgress': instance.questionProgress,
      'totalCorrectQuestions': instance.totalCorrectQuestions,
      'totalIncorrectQuestions': instance.totalIncorrectQuestions,
    };

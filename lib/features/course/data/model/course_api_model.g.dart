// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseApiModel _$CourseApiModelFromJson(Map<String, dynamic> json) =>
    CourseApiModel(
      id: json['_id'] as String?,
      language: json['language'] as String,
      description: json['description'] as String,
      flagPath: json['flagPath'] as String,
    );

Map<String, dynamic> _$CourseApiModelToJson(CourseApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'language': instance.language,
      'description': instance.description,
      'flagPath': instance.flagPath,
    };

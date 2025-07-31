// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_progress_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionProgressApiModel _$QuestionProgressApiModelFromJson(
        Map<String, dynamic> json) =>
    QuestionProgressApiModel(
      question: json['question'] as String?,
      isCorrect: json['isCorrect'] as bool?,
      answeredAt: json['answeredAt'] == null
          ? null
          : DateTime.parse(json['answeredAt'] as String),
      userAnswer: json['userAnswer'] as String?,
    );

Map<String, dynamic> _$QuestionProgressApiModelToJson(
        QuestionProgressApiModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'isCorrect': instance.isCorrect,
      'answeredAt': instance.answeredAt?.toIso8601String(),
      'userAnswer': instance.userAnswer,
    };

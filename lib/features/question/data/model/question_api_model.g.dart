// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionApiModel _$QuestionApiModelFromJson(Map<String, dynamic> json) =>
    QuestionApiModel(
      id: json['_id'] as String,
      questionType: json['questionType'] as String,
      prompt: json['prompt'] as String,
      choices:
          (json['choices'] as List<dynamic>?)?.map((e) => e as String).toList(),
      audioUrl: json['audioUrl'] as String?,
      pairs: (json['pairs'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
      correctOrder: (json['correctOrder'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      correctAnswer: json['correctAnswer'] as String?,
      question: json['question'] as String?,
    );

Map<String, dynamic> _$QuestionApiModelToJson(QuestionApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'questionType': instance.questionType,
      'prompt': instance.prompt,
      'choices': instance.choices,
      'audioUrl': instance.audioUrl,
      'pairs': instance.pairs,
      'correctOrder': instance.correctOrder,
      'correctAnswer': instance.correctAnswer,
      'question': instance.question,
    };

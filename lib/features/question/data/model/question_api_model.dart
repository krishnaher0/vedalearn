import 'package:json_annotation/json_annotation.dart';
import 'package:veda_learn/features/question/domain/entity/question_entity.dart';

part 'question_api_model.g.dart';

@JsonSerializable()
class QuestionApiModel {
  @JsonKey(name: '_id')
  final String id;
  final String questionType;
  final String prompt;
  final List<String>? choices;
  final String? audioUrl;
  final List<Map<String, String>>? pairs;
  final List<String>? correctOrder;
  final String? correctAnswer;
  final String? question; // <-- Add this line


QuestionApiModel({
  required this.id,
  required this.questionType,
  required this.prompt,
  this.choices,
  this.audioUrl,
  this.pairs,
  this.correctOrder,
  this.correctAnswer,
  this.question, // <-- Add this
});


  // ✅ Map API model to domain entity
  QuestionEntity toEntity() => QuestionEntity(
        id: id,
        questionType: _mapQuestionType(questionType),
        prompt: prompt,
        question: question,
        choices: choices,
        audioUrl: audioUrl,
        pairs: pairs,
        correctOrder: correctOrder,
        correctAnswer: correctAnswer,
      );

  QuestionType _mapQuestionType(String type) {
    switch (type.toLowerCase()) {
      case 'translation':
        return QuestionType.translation;
      case 'multiplechoice':
        return QuestionType.multipleChoice;
      case 'listening':
        return QuestionType.listening;
      case 'fillintheblank':
        return QuestionType.fillInTheBlank;
      case 'matchingpairs':
        return QuestionType.matchingPairs;
      case 'ordering':
        return QuestionType.ordering;
      case 'truefalse':
        return QuestionType.trueFalse;
      default:
        throw Exception('Unknown question type: $type');
    }
  }

  factory QuestionApiModel.fromJson(Map<String, dynamic> json) {
  return QuestionApiModel(
    id: json['_id'] as String,
    questionType: json['questionType'] as String,
    prompt: json['prompt'] as String,
    question: json['question'] as String?, 
    choices: (json['choices'] as List?)?.map((e) => e as String).toList(),
    audioUrl: json['audioUrl'] as String?,
    correctAnswer: json['correctAnswer'] as String?,
    correctOrder: (json['correctOrder'] as List?)?.map((e) => e as String).toList(),
    pairs: (json['pairs'] as List?)
        ?.map((e) => {
              'left': e['left'] as String,
              'right': e['right'] as String,
            })
        .toList(),
  );
}


  Map<String, dynamic> toJson() => _$QuestionApiModelToJson(this);
}

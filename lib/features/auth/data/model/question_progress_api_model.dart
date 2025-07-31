import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:veda_learn/features/auth/domain/entity/question_progress_entity.dart';

part 'question_progress_api_model.g.dart';

@JsonSerializable()
class QuestionProgressApiModel extends Equatable {
  final String? question;
  final bool? isCorrect;
  final DateTime? answeredAt;
  final String? userAnswer;

  const QuestionProgressApiModel({
    this.question,
    this.isCorrect,
    this.answeredAt,
    this.userAnswer,
  });

  factory QuestionProgressApiModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionProgressApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionProgressApiModelToJson(this);

  QuestionProgressEntity toEntity() {
    return QuestionProgressEntity(
      question: question,
      isCorrect: isCorrect,
      answeredAt: answeredAt,
      userAnswer: userAnswer,
    );
  }

  factory QuestionProgressApiModel.fromEntity(QuestionProgressEntity entity) {
    return QuestionProgressApiModel(
      question: entity.question,
      isCorrect: entity.isCorrect,
      answeredAt: entity.answeredAt,
      userAnswer: entity.userAnswer,
    );
  }

  @override
  List<Object?> get props => [
        question,
        isCorrect,
        answeredAt,
        userAnswer,
      ];
}
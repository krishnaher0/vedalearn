import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:veda_learn/app/constant/hive/hive_table_constant.dart';
import 'package:veda_learn/features/auth/domain/entity/question_progress_entity.dart';

part 'question_progress_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.questionProgressTableId) // Assign a unique typeId
class QuestionProgressHiveModel extends Equatable {
  @HiveField(0)
  final String? question;

  @HiveField(1)
  final bool? isCorrect;

  @HiveField(2)
  final DateTime? answeredAt;

  @HiveField(3)
  final String? userAnswer;

  const QuestionProgressHiveModel({
    this.question,
    this.isCorrect,
    this.answeredAt,
    this.userAnswer,
  });

  factory QuestionProgressHiveModel.fromEntity(QuestionProgressEntity entity) {
    return QuestionProgressHiveModel(
      question: entity.question,
      isCorrect: entity.isCorrect,
      answeredAt: entity.answeredAt,
      userAnswer: entity.userAnswer,
    );
  }

  QuestionProgressEntity toEntity() {
    return QuestionProgressEntity(
      question: question,
      isCorrect: isCorrect,
      answeredAt: answeredAt,
      userAnswer: userAnswer,
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
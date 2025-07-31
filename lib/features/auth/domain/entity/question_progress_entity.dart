import 'package:equatable/equatable.dart';

class QuestionProgressEntity extends Equatable {
  final String? question;
  final bool? isCorrect;
  final DateTime? answeredAt;
  final String? userAnswer;

  const QuestionProgressEntity({
    this.question,
    this.isCorrect,
    this.answeredAt,
    this.userAnswer,
  });

  @override
  List<Object?> get props => [question, isCorrect, answeredAt, userAnswer];
}


import 'package:equatable/equatable.dart';
import 'package:veda_learn/features/auth/domain/entity/question_progress_entity.dart';

class EnrolledCourseEntity extends Equatable {
  final String? course;
  final List<String>? lessonsCompleted;
  final bool? completed;
  final int? score;
  final DateTime? enrolledAt;
  final List<QuestionProgressEntity>? questionProgress;
  final int? totalCorrectQuestions;
  final int? totalIncorrectQuestions;

  const EnrolledCourseEntity({
    this.course,
    this.lessonsCompleted,
    this.completed,
    this.score,
    this.enrolledAt,
    this.questionProgress,
    this.totalCorrectQuestions,
    this.totalIncorrectQuestions,
  });

  @override
  List<Object?> get props => [
    course,
    lessonsCompleted,
    completed,
    score,
    enrolledAt,
    questionProgress,
    totalCorrectQuestions,
    totalIncorrectQuestions,
  ];
}
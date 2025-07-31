import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:veda_learn/app/constant/hive/hive_table_constant.dart';
import 'package:veda_learn/features/auth/data/model/question_progress_hive_model.dart';
import 'package:veda_learn/features/auth/domain/entity/enrolled_course_entity.dart';

part 'enrolled_course_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.enrolledCourseTableId) // Assign a unique typeId
class EnrolledCourseHiveModel extends Equatable {
  @HiveField(0)
  final String? course;

  @HiveField(1)
  final List<String>? lessonsCompleted;

  @HiveField(2)
  final bool? completed;

  @HiveField(3)
  final int? score;

  @HiveField(4)
  final DateTime? enrolledAt;

  @HiveField(5)
  final List<QuestionProgressHiveModel>? questionProgress;

  @HiveField(6)
  final int? totalCorrectQuestions;

  @HiveField(7)
  final int? totalIncorrectQuestions;

  const EnrolledCourseHiveModel({
    this.course,
    this.lessonsCompleted,
    this.completed,
    this.score,
    this.enrolledAt,
    this.questionProgress,
    this.totalCorrectQuestions,
    this.totalIncorrectQuestions,
  });

  factory EnrolledCourseHiveModel.fromEntity(EnrolledCourseEntity entity) {
    return EnrolledCourseHiveModel(
      course: entity.course,
      lessonsCompleted: entity.lessonsCompleted,
      completed: entity.completed,
      score: entity.score,
      enrolledAt: entity.enrolledAt,
      questionProgress: entity.questionProgress
          ?.map((e) => QuestionProgressHiveModel.fromEntity(e))
          .toList(),
      totalCorrectQuestions: entity.totalCorrectQuestions,
      totalIncorrectQuestions: entity.totalIncorrectQuestions,
    );
  }

  EnrolledCourseEntity toEntity() {
    return EnrolledCourseEntity(
      course: course,
      lessonsCompleted: lessonsCompleted,
      completed: completed,
      score: score,
      enrolledAt: enrolledAt,
      questionProgress: questionProgress?.map((e) => e.toEntity()).toList(),
      totalCorrectQuestions: totalCorrectQuestions,
      totalIncorrectQuestions: totalIncorrectQuestions,
    );
  }

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
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:veda_learn/features/auth/data/model/question_progress_api_model.dart';
import 'package:veda_learn/features/auth/domain/entity/enrolled_course_entity.dart';

part 'enrolled_course_api_model.g.dart';

@JsonSerializable()
class EnrolledCourseApiModel extends Equatable {
  final String? course;
  final List<String>? lessonsCompleted;
  final bool? completed;
  final int? score;
  final DateTime? enrolledAt;
  final List<QuestionProgressApiModel>? questionProgress;
  final int? totalCorrectQuestions;
  final int? totalIncorrectQuestions;

  const EnrolledCourseApiModel({
    this.course,
    this.lessonsCompleted,
    this.completed,
    this.score,
    this.enrolledAt,
    this.questionProgress,
    this.totalCorrectQuestions,
    this.totalIncorrectQuestions,
  });

  factory EnrolledCourseApiModel.fromJson(Map<String, dynamic> json) =>
      _$EnrolledCourseApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$EnrolledCourseApiModelToJson(this);

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

  factory EnrolledCourseApiModel.fromEntity(EnrolledCourseEntity entity) {
    return EnrolledCourseApiModel(
      course: entity.course,
      lessonsCompleted: entity.lessonsCompleted,
      completed: entity.completed,
      score: entity.score,
      enrolledAt: entity.enrolledAt,
      questionProgress: entity.questionProgress
          ?.map((e) => QuestionProgressApiModel.fromEntity(e))
          .toList(),
      totalCorrectQuestions: entity.totalCorrectQuestions,
      totalIncorrectQuestions: entity.totalIncorrectQuestions,
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
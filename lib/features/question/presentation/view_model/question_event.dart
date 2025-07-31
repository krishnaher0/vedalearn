// // features/question/presentation/view_model/question_event.dart

// import 'package:equatable/equatable.dart';

// abstract class QuestionEvent extends Equatable {
//   const QuestionEvent();

//   @override
//   List<Object> get props => [];
// }

// class LoadQuestion extends QuestionEvent {
//   final String lessonId;
//   final int questionIndex;

//   const LoadQuestion({required this.lessonId, this.questionIndex = 1});

//   @override
//   List<Object> get props => [lessonId, questionIndex];
// }

// class SubmitAnswer extends QuestionEvent {
//   final String userId;
//   final String courseId;
//   final String lessonId;
//   final String questionId;
//   final String userAnswer;

//   const SubmitAnswer({
//     required this.userId,
//     required this.courseId,
//     required this.lessonId,
//     required this.questionId,
//     required this.userAnswer,
//   });

//   @override
//   List<Object> get props => [userId, courseId, lessonId, questionId, userAnswer];
// }

// class NextQuestion extends QuestionEvent {
//   final String lessonId;

//   const NextQuestion({required this.lessonId});

//   @override
//   List<Object> get props => [lessonId];
// }
// question_event.dart
import 'package:equatable/equatable.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object?> get props => [];
}

class LoadFirstQuestion extends QuestionEvent {
  final String lessonId;

  const LoadFirstQuestion(this.lessonId);

  @override
  List<Object?> get props => [lessonId];
}

class LoadNextQuestion extends QuestionEvent {}

class LoadPreviousQuestion extends QuestionEvent {}

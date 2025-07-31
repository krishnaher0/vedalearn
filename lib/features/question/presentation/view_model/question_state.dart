// // features/question/presentation/view_model/question_state.dart

// import 'package:equatable/equatable.dart';
// import 'package:veda_learn/features/question/domain/entity/question_entity.dart';

// abstract class QuestionState extends Equatable {
//   const QuestionState();

//   @override
//   List<Object?> get props => [];
// }

// class QuestionInitial extends QuestionState {}

// class QuestionLoading extends QuestionState {}

// class QuestionLoaded extends QuestionState {
//   final QuestionEntity question;
//   final int currentQuestionIndex;

//   const QuestionLoaded({required this.question, required this.currentQuestionIndex});

//   @override
//   List<Object> get props => [question, currentQuestionIndex];
// }

// class QuestionError extends QuestionState {
//   final String message;

//   const QuestionError({required this.message});

//   @override
//   List<Object> get props => [message];
// }

// class QuestionAnswerSubmitted extends QuestionState {
//   final bool success;
//   final String? message;

//   const QuestionAnswerSubmitted({required this.success, this.message});

//   @override
//   List<Object?> get props => [success, message];
// }

// question_state.dart
import 'package:equatable/equatable.dart';
import 'package:veda_learn/features/question/domain/entity/question_entity.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object?> get props => [];
}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

// question_state.dart
class QuestionLoaded extends QuestionState {
  final QuestionEntity question;
  final int currentIndex;

  const QuestionLoaded({required this.question, required this.currentIndex});

  @override
  List<Object?> get props => [question, currentIndex];
}



class QuestionError extends QuestionState {
  final String message;

  const QuestionError(this.message);

  @override
  List<Object?> get props => [message];
}

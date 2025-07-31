// // features/question/presentation/view_model/question_bloc.dart

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:veda_learn/features/question/domain/usecase/get_question_usecase.dart';
// import 'package:veda_learn/features/question/domain/usecase/submit_user_progress_usecase.dart';
// import 'package:veda_learn/features/question/presentation/view_model/question_event.dart';
// import 'package:veda_learn/features/question/presentation/view_model/question_state.dart';
// import 'package:veda_learn/features/question/domain/entity/user_progress.dart'; // Make sure this is imported

// class QuestionViewModel extends Bloc<QuestionEvent, QuestionState> {
//   final GetQuestionsUseCase getQuestionsUseCase;
//   final SubmitUserProgressUseCase submitUserProgressUseCase;

//   int _currentQuestionIndex = 1; // Keep track of the current question index internally

//   QuestionViewModel({
//     required this.getQuestionsUseCase,
//     required this.submitUserProgressUseCase,
//   }) : super(QuestionInitial()) {
//     on<LoadQuestion>(_onLoadQuestion);
//     on<SubmitAnswer>(_onSubmitAnswer);
//     on<NextQuestion>(_onNextQuestion);
//   }

//   Future<void> _onLoadQuestion(LoadQuestion event, Emitter<QuestionState> emit) async {
//     emit(QuestionLoading());
//     _currentQuestionIndex = event.questionIndex; // Update index if provided
//     final result = await getQuestionsUseCase(event.lessonId, _currentQuestionIndex);

//     result.fold(
//       (failure) => emit(QuestionError(message: failure.message)),
//       (question) => emit(QuestionLoaded(question: question, currentQuestionIndex: _currentQuestionIndex)),
//     );
//   }

//   Future<void> _onSubmitAnswer(SubmitAnswer event, Emitter<QuestionState> emit) async {
//     // Optionally, you might want a loading state here too if submission takes time
//     // For now, we'll assume it's quick or handled implicitly.

//     final progress = UserProgress(
//       userId: event.userId,
//       courseId: event.courseId,
//       lessonId: event.lessonId,
//       questionId: event.questionId,
//       userAnswer: event.userAnswer,
//     );

//     final result = await submitUserProgressUseCase.execute(progress);

//     result.fold(
//       (failure) {
//         emit(QuestionAnswerSubmitted(success: false, message: failure.message));
//         // If an error occurs during submission, you might want to re-emit the QuestionLoaded state
//         // to keep the current question visible, possibly with an error message.
//         // Or handle this by showing a SnackBar in the UI.
//         if (state is QuestionLoaded) {
//           emit(QuestionLoaded(question: (state as QuestionLoaded).question, currentQuestionIndex: (state as QuestionLoaded).currentQuestionIndex));
//         }
//       },
//       (_) {
//         emit(QuestionAnswerSubmitted(success: true));
//         // If submission is successful, we typically don't stay in this state.
//         // The UI should then trigger the next question event.
//       },
//     );
//   }

//   Future<void> _onNextQuestion(NextQuestion event, Emitter<QuestionState> emit) async {
//     _currentQuestionIndex++; // Increment for the next question
//     await _onLoadQuestion(LoadQuestion(lessonId: event.lessonId, questionIndex: _currentQuestionIndex), emit);
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veda_learn/features/question/domain/usecase/get_question_usecase.dart';
import 'package:veda_learn/features/question/presentation/view_model/question_event.dart';
import 'package:veda_learn/features/question/presentation/view_model/question_state.dart';

/// question_view_model.dart
class QuestionViewModel extends Bloc<QuestionEvent, QuestionState> {
  final GetQuestionsUseCase getQuestion;

  String? _lessonId;
  int _index = 0;

  QuestionViewModel({required this.getQuestion}) : super(QuestionInitial()) {
    on<LoadFirstQuestion>((event, emit) async {
      _lessonId = event.lessonId;
      _index = 1;
      await _loadQuestion(emit);
    });

    on<LoadNextQuestion>((event, emit) async {
      _index++;
      await _loadQuestion(emit);
    });

    on<LoadPreviousQuestion>((event, emit) async {
      if (_index > 0) {
        _index--;
        await _loadQuestion(emit);
      }
    });
  }

  Future<void> _loadQuestion(Emitter<QuestionState> emit) async {
    emit(QuestionLoading());
    final result = await getQuestion(_lessonId!, _index);
    result.fold(
      (failure) => emit(QuestionError(failure.message)),
      (question) => emit(QuestionLoaded(question: question, currentIndex: _index)),
    );
  }
}

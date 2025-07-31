
// // question_view_screen.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:veda_learn/app/service_locator/service_locator.dart';
// import 'package:veda_learn/features/question/presentation/view_model/question_event.dart';
// import 'package:veda_learn/features/question/presentation/view_model/question_state.dart';
// import 'package:veda_learn/features/question/presentation/view_model/question_view_model.dart';

// class QuestionViewScreen extends StatelessWidget {
//   final String lessonId;

//   const QuestionViewScreen({Key? key, required this.lessonId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) =>
//           serviceLocator<QuestionViewModel>()..add(LoadFirstQuestion(lessonId)),
//       child: Scaffold(
//         appBar: AppBar(title: const Text("Question")),
//         body: BlocBuilder<QuestionViewModel, QuestionState>(
//           builder: (context, state) {
//             if (state is QuestionLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is QuestionLoaded) {
//               final question = state.question;
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Text(
//                       'Q${state.currentIndex }: ${question.prompt}',
//                       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   if (question.choices != null)
//                     ...question.choices!.map((c) => ListTile(title: Text(c))),
//                   const Spacer(),
//                   const Text(question.correctAnswer);
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           context.read<QuestionViewModel>().add(LoadPreviousQuestion());
//                         },
//                         child: const Text("Previous"),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           context.read<QuestionViewModel>().add(LoadNextQuestion());
//                         },
//                         child: const Text("Next"),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               );
//             } else if (state is QuestionError) {
//               return Center(child: Text("Error: ${state.message}"));
//             } else {
//               return const Center(child: Text("No question loaded."));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veda_learn/app/service_locator/service_locator.dart';
import 'package:veda_learn/features/question/presentation/view_model/question_event.dart';
import 'package:veda_learn/features/question/presentation/view_model/question_state.dart';
import 'package:veda_learn/features/question/presentation/view_model/question_view_model.dart';
import 'package:audioplayers/audioplayers.dart'; // Add audioplayers dependency

class QuestionViewScreen extends StatefulWidget {
  final String lessonId;

  const QuestionViewScreen({Key? key, required this.lessonId}) : super(key: key);

  @override
  State<QuestionViewScreen> createState() => _QuestionViewScreenState();
}

class _QuestionViewScreenState extends State<QuestionViewScreen> {
  String? _selectedAnswer;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio(String url) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          serviceLocator<QuestionViewModel>()..add(LoadFirstQuestion(widget.lessonId)),
      child: Scaffold(
        appBar: AppBar(title: const Text("Questions")),
        body: BlocBuilder<QuestionViewModel, QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuestionLoaded) {
              final question = state.question;

              // Reset selected answer when question changes
              if (_selectedAnswer != null && !_isAnswerInChoices(question.choices, _selectedAnswer)) {
                _selectedAnswer = null;
              }

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${state.currentIndex}:',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),

                    // Show question type
                    Text(
                      'Type: ${question.questionType.toString().split('.').last}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),

                    // Show prompt
                    Text(
                      question.prompt,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 24),
                     Text(
                      'Question ${state.question.question}:',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),

                    // Audio player button if audioUrl present
                    if (question.audioUrl != null && question.audioUrl!.isNotEmpty)
                      ElevatedButton.icon(
                        icon: const Icon(Icons.volume_up),
                        label: const Text('Play Audio'),
                        onPressed: () {
                          _playAudio(state.question.audioUrl!);
                        },
                      ),

                    const SizedBox(height: 16),

                    // Choices with Radio buttons
                    if (question.choices != null)
                      ...question.choices!.map(
                        (choice) => RadioListTile<String>(
                          title: Text(choice),
                          value: choice,
                          groupValue: _selectedAnswer,
                          onChanged: (value) {
                            setState(() {
                              _selectedAnswer = value;
                            });
                          },
                        ),
                      ),

                    const Spacer(),

                    // Show correct answer for debug/demo (remove in production)
                    if (question.correctAnswer != null)
                      Text('Correct answer: ${question.correctAnswer}', style: TextStyle(color: Colors.green)),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<QuestionViewModel>().add(LoadPreviousQuestion());
                          },
                          child: const Text("Previous"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_selectedAnswer != null) {
                              // You can trigger answer submission event here if implemented
                              context.read<QuestionViewModel>().add(LoadNextQuestion());
                              setState(() {
                                _selectedAnswer = null; // Reset selection for next question
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please select an answer')),
                              );
                            }
                          },
                          child: const Text("Next"),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is QuestionError) {
              return Center(child: Text("Error: ${state.message}"));
            } else {
              return const Center(child: Text("No question loaded."));
            }
          },
        ),
      ),
    );
  }

  bool _isAnswerInChoices(List<String>? choices, String? answer) {
    if (choices == null || answer == null) return false;
    return choices.contains(answer);
  }
}

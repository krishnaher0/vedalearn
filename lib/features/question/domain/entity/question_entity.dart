
enum QuestionType {
  translation,
  multipleChoice,
  listening,
  fillInTheBlank,
  matchingPairs,
  ordering,
  trueFalse,
}

class QuestionEntity {
  final String id;
  final QuestionType questionType;
  final String prompt;

  // Optional fields depending on question type
  final List<String>? choices; // For multipleChoice, trueFalse, ordering
  final String? audioUrl; // For listening
  final List<Map<String, String>>? pairs; // For matchingPairs, e.g. [{'left': 'a', 'right': 'b'}]
  final List<String>? correctOrder; // For ordering
  final String? correctAnswer; // For translation, fillInTheBlank, trueFalse
  bool isAnswered;
  final String? question;

  String? userSelectedAnswer;

  QuestionEntity({
    required this.id,
    required this.questionType,
    required this.prompt,
    
    this.choices,
    this.audioUrl,
    this.pairs,
    this.correctOrder,
    this.correctAnswer,
    this.userSelectedAnswer,
    this.isAnswered=false,
    this.question
  });


  // Convert string to QuestionType enum
  static QuestionType _parseQuestionType(String type) {
    switch (type.toLowerCase()) {
      case 'translation':
        return QuestionType.translation;
      case 'multiplechoice':
        return QuestionType.multipleChoice;
      case 'listening':
        return QuestionType.listening;
      case 'fillintheblank':
        return QuestionType.fillInTheBlank;
      case 'matchingpairs':
        return QuestionType.matchingPairs;
      case 'ordering':
        return QuestionType.ordering;
      case 'truefalse':
        return QuestionType.trueFalse;
      default:
        throw Exception('Unknown question type: $type');
    }
  }

  factory QuestionEntity.fromJson(Map<String, dynamic> json) {
    return QuestionEntity(
      id: json['_id'] as String,
      questionType: _parseQuestionType(json['questionType'] as String),
      prompt: json['prompt'] as String,
      question:json['question'] as String,
      choices: (json['choices'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      audioUrl: json['audioUrl'] as String?,
      pairs: (json['pairs'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
      correctOrder: (json['correctOrder'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      correctAnswer: json['correctAnswer'] as String?,
    );
  }

   QuestionEntity copyWith({
    String? id,
    QuestionType? questionType,
    String? prompt,
    List<String>? choices,
    String? audioUrl,
    List<Map<String, String>>? pairs,
    List<String>? correctOrder,
    String? correctAnswer,
    String? question,
    bool? isAnswered,
    String? userSelectedAnswer,
  }) {
    return QuestionEntity(
      id: id ?? this.id,
      questionType: questionType ?? this.questionType,
      prompt: prompt ?? this.prompt,
      question: question ?? this.question,
      choices: choices ?? this.choices,
      audioUrl: audioUrl ?? this.audioUrl,
      pairs: pairs ?? this.pairs,
      correctOrder: correctOrder ?? this.correctOrder,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      isAnswered: isAnswered ?? this.isAnswered,
      userSelectedAnswer: userSelectedAnswer ?? this.userSelectedAnswer,
    );
  }

  @override
  List<Object?> get props => [
        id,
        questionType,
        prompt,
        question,
        choices,
        audioUrl,
        pairs,
        correctOrder,
        correctAnswer,
      ];

}

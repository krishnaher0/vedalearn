// import 'package:hive/hive.dart';
// import 'package:equatable/equatable.dart';
// import 'package:hive_flutter/adapters.dart';

// import 'package:uuid/uuid.dart';
// import 'package:veda_learn/app/constant/hive/hive_table_constant.dart';
// import 'package:veda_learn/features/question/domain/entity/question_entity.dart';



// part 'question_hive_model.g.dart';

// @HiveType(typeId: HiveTableConstant.questionTableId)

// class QuestionHiveModel extends HiveObject {
//   @HiveField(0)
//   final String id;

//   @HiveField(1)
//   final String questionType;

//   @HiveField(2)
//   final String prompt;

//   @HiveField(3)
//   final List<String>? choices;

//   @HiveField(4)
//   final String? audioUrl;

//   @HiveField(5)
//   final List<Pair>? pairs;

//   @HiveField(6)
//   final List<String>? correctOrder;

//   @HiveField(7)
//   final String? correctAnswer;

//   QuestionHiveModel({
//     required this.id,
//     required this.questionType,
//     required this.prompt,
//     this.choices,
//     this.audioUrl,
//     this.pairs,
//     this.correctOrder,
//     this.correctAnswer,
//   });
// }

// @HiveType(typeId: 1)
// class Pair {
//   @HiveField(0)
//   final String left;

//   @HiveField(1)
//   final String right;

//   Pair({
//     required this.left,
//     required this.right,
//   });
// }

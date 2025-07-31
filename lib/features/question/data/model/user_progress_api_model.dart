// import 'package:veda_learn/features/question/domain/entity/user_progress.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'user_progress_api_model.g.dart';

// @JsonSerializable()


// class UserProgressApiModel {
//   final String userId;
//   final String courseId;
//   final String lessonId;
//   final String questionId;
//   final String userAnswer;

//   UserProgressApiModel({
//     required this.userId,
//     required this.courseId,
//     required this.lessonId,
//     required this.questionId,
//     required this.userAnswer,
//   });

//   factory UserProgressApiModel.fromEntity(UserProgress entity) {
//     return UserProgressApiModel(
//       userId: entity.userId,
//       courseId: entity.courseId,
//       lessonId: entity.lessonId,
//       questionId: entity.questionId,
//       userAnswer: entity.userAnswer,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'userId': userId,
//         'courseId': courseId,
//         'lessonId': lessonId,
//         'questionId': questionId,
//         'userAnswer': userAnswer,
//       };
// }

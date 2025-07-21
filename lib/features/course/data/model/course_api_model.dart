import 'package:json_annotation/json_annotation.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';

part 'course_api_model.g.dart';

@JsonSerializable()
class CourseApiModel {
  @JsonKey(name: '_id')
  final String? id;
  final String language;
  final String description;
  final String flagPath;

  CourseApiModel({
    this.id,
    required this.language,
    required this.description,
    required this.flagPath,
  });

  factory CourseApiModel.fromJson(Map<String, dynamic> json) =>
      _$CourseApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseApiModelToJson(this);

  CourseEntity toEntity() {
    return CourseEntity(
      id: id,
      language: language,
      description: description,
      flagPath: flagPath,
    );
  }

  factory CourseApiModel.fromEntity(CourseEntity entity) {
    return CourseApiModel(
      id: entity.id,
      language: entity.language,
      description: entity.description,
      flagPath: entity.flagPath,
    );
  }
}

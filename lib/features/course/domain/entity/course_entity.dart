import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final String? id;
  final String language;
  final String description;
  final String flagPath;
  

  const CourseEntity({
    this.id,
    required this.language,
    required this.description,
    required this.flagPath,
    
  });

  factory CourseEntity.fromJson(Map<String, dynamic> json) {
    return CourseEntity(
      id: json['_id'] as String?, // MongoDB _id field
      language: json['language'] as String,
      description: json['description'] as String,
      flagPath: json['flagPath'] as String,
    );
  }

  @override
  List<Object?> get props => [id, language, description, flagPath];
}

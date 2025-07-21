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

  @override
  List<Object?> get props => [ language, description, flagPath];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrolled_course_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnrolledCourseHiveModelAdapter
    extends TypeAdapter<EnrolledCourseHiveModel> {
  @override
  final int typeId = 2;

  @override
  EnrolledCourseHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnrolledCourseHiveModel(
      course: fields[0] as String?,
      lessonsCompleted: (fields[1] as List?)?.cast<String>(),
      completed: fields[2] as bool?,
      score: fields[3] as int?,
      enrolledAt: fields[4] as DateTime?,
      questionProgress: (fields[5] as List?)?.cast<QuestionProgressHiveModel>(),
      totalCorrectQuestions: fields[6] as int?,
      totalIncorrectQuestions: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, EnrolledCourseHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.course)
      ..writeByte(1)
      ..write(obj.lessonsCompleted)
      ..writeByte(2)
      ..write(obj.completed)
      ..writeByte(3)
      ..write(obj.score)
      ..writeByte(4)
      ..write(obj.enrolledAt)
      ..writeByte(5)
      ..write(obj.questionProgress)
      ..writeByte(6)
      ..write(obj.totalCorrectQuestions)
      ..writeByte(7)
      ..write(obj.totalIncorrectQuestions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnrolledCourseHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

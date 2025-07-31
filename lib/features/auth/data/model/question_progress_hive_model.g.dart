// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_progress_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionProgressHiveModelAdapter
    extends TypeAdapter<QuestionProgressHiveModel> {
  @override
  final int typeId = 4;

  @override
  QuestionProgressHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionProgressHiveModel(
      question: fields[0] as String?,
      isCorrect: fields[1] as bool?,
      answeredAt: fields[2] as DateTime?,
      userAnswer: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionProgressHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.isCorrect)
      ..writeByte(2)
      ..write(obj.answeredAt)
      ..writeByte(3)
      ..write(obj.userAnswer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionProgressHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

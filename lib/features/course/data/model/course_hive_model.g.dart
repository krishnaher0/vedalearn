// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseHiveModelAdapter extends TypeAdapter<CourseHiveModel> {
  @override
  final int typeId = 1;

  @override
  CourseHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseHiveModel(
      id: fields[0] as String?,
      language: fields[1] as String,
      description: fields[2] as String,
      flagPath: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CourseHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.language)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.flagPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

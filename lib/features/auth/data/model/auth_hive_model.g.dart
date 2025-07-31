// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthHiveModelAdapter extends TypeAdapter<AuthHiveModel> {
  @override
  final int typeId = 0;

  @override
  AuthHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthHiveModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      email: fields[2] as String,
      password: fields[3] as String?,
      age: fields[4] as int,
      role: fields[5] as String?,
      subscribed: fields[6] as bool?,
      enrolledCourses: (fields[7] as List?)?.cast<EnrolledCourseHiveModel>(),
      playerStats: fields[8] as PlayerStatsHiveModel?,
      token: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.role)
      ..writeByte(6)
      ..write(obj.subscribed)
      ..writeByte(7)
      ..write(obj.enrolledCourses)
      ..writeByte(8)
      ..write(obj.playerStats)
      ..writeByte(9)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

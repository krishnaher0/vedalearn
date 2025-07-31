// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stats_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerStatsHiveModelAdapter extends TypeAdapter<PlayerStatsHiveModel> {
  @override
  final int typeId = 5;

  @override
  PlayerStatsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerStatsHiveModel(
      xp: fields[0] as int?,
      hearts: fields[1] as int?,
      winningStreak: fields[2] as int?,
      dayStreak: fields[3] as int?,
      lastPlayed: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerStatsHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.xp)
      ..writeByte(1)
      ..write(obj.hearts)
      ..writeByte(2)
      ..write(obj.winningStreak)
      ..writeByte(3)
      ..write(obj.dayStreak)
      ..writeByte(4)
      ..write(obj.lastPlayed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerStatsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

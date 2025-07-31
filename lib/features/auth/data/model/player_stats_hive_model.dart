import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:veda_learn/app/constant/hive/hive_table_constant.dart';
import 'package:veda_learn/features/auth/domain/entity/player_stats_entity.dart';

part 'player_stats_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.playerStatsTableId) // Assign a unique typeId
class PlayerStatsHiveModel extends Equatable {
  @HiveField(0)
  final int? xp;

  @HiveField(1)
  final int? hearts;

  @HiveField(2)
  final int? winningStreak;

  @HiveField(3)
  final int? dayStreak;

  @HiveField(4)
  final DateTime? lastPlayed;

  const PlayerStatsHiveModel({
    this.xp,
    this.hearts,
    this.winningStreak,
    this.dayStreak,
    this.lastPlayed,
  });

  factory PlayerStatsHiveModel.fromEntity(PlayerStatsEntity entity) {
    return PlayerStatsHiveModel(
      xp: entity.xp,
      hearts: entity.hearts,
      winningStreak: entity.winningStreak,
      dayStreak: entity.dayStreak,
      lastPlayed: entity.lastPlayed,
    );
  }

  PlayerStatsEntity toEntity() {
    return PlayerStatsEntity(
      xp: xp,
      hearts: hearts,
      winningStreak: winningStreak,
      dayStreak: dayStreak,
      lastPlayed: lastPlayed,
    );
  }

  @override
  List<Object?> get props => [
        xp,
        hearts,
        winningStreak,
        dayStreak,
        lastPlayed,
      ];
}
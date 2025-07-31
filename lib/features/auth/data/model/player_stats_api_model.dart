import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:veda_learn/features/auth/domain/entity/player_stats_entity.dart';

part 'player_stats_api_model.g.dart';

@JsonSerializable()
class PlayerStatsApiModel extends Equatable {
  final int? xp;
  final int? hearts;
  final int? winningStreak;
  final int? dayStreak;
  final DateTime? lastPlayed;

  const PlayerStatsApiModel({
    this.xp,
    this.hearts,
    this.winningStreak,
    this.dayStreak,
    this.lastPlayed,
  });

  factory PlayerStatsApiModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatsApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStatsApiModelToJson(this);

  PlayerStatsEntity toEntity() {
    return PlayerStatsEntity(
      xp: xp,
      hearts: hearts,
      winningStreak: winningStreak,
      dayStreak: dayStreak,
      lastPlayed: lastPlayed,
    );
  }

  factory PlayerStatsApiModel.fromEntity(PlayerStatsEntity entity) {
    return PlayerStatsApiModel(
      xp: entity.xp,
      hearts: entity.hearts,
      winningStreak: entity.winningStreak,
      dayStreak: entity.dayStreak,
      lastPlayed: entity.lastPlayed,
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
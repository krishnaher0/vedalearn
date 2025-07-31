// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stats_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerStatsApiModel _$PlayerStatsApiModelFromJson(Map<String, dynamic> json) =>
    PlayerStatsApiModel(
      xp: (json['xp'] as num?)?.toInt(),
      hearts: (json['hearts'] as num?)?.toInt(),
      winningStreak: (json['winningStreak'] as num?)?.toInt(),
      dayStreak: (json['dayStreak'] as num?)?.toInt(),
      lastPlayed: json['lastPlayed'] == null
          ? null
          : DateTime.parse(json['lastPlayed'] as String),
    );

Map<String, dynamic> _$PlayerStatsApiModelToJson(
        PlayerStatsApiModel instance) =>
    <String, dynamic>{
      'xp': instance.xp,
      'hearts': instance.hearts,
      'winningStreak': instance.winningStreak,
      'dayStreak': instance.dayStreak,
      'lastPlayed': instance.lastPlayed?.toIso8601String(),
    };

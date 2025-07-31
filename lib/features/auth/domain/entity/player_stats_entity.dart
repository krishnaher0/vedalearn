import 'package:equatable/equatable.dart';

class PlayerStatsEntity extends Equatable {
  final int? xp;
  final int? hearts;
  final int? winningStreak;
  final int? dayStreak;
  final DateTime? lastPlayed;

  const PlayerStatsEntity({
    this.xp,
    this.hearts,
    this.winningStreak,
    this.dayStreak,
    this.lastPlayed,
  });

  @override
  List<Object?> get props => [xp, hearts, winningStreak, dayStreak, lastPlayed];
}

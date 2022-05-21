part of 'game_bloc.dart';

class GameState extends Equatable {
  const GameState({
    this.moves = 0, 
    this.remaining = 0});

  final int moves;
  final int remaining ;

  GameState copyWith({
    int? moves,
    int? remaining,
  }) {
    return GameState(
      moves: moves ?? this.moves,
      remaining: remaining ?? this.remaining,
    );
  }

  @override
  List<Object> get props => [
    moves,
    remaining
  ];
}

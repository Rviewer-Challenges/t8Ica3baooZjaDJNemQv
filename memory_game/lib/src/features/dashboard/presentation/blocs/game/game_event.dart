part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class CleanBloc extends GameEvent {
  @override
  List<Object?> get props => [];
}

class OnSetMove extends GameEvent {
  final int move;

  const OnSetMove(this.move);

  @override
  List<Object> get props => [move];
}

class OnSetRemaining extends GameEvent {
  final int remaining;

  const OnSetRemaining(this.remaining);

  @override
  List<Object> get props => [remaining];
}


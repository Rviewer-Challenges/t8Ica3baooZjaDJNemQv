import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameState()) {
    on<GameEvent>((event, emit) {
    });
    on<OnSetMove>((event, emit) {
      emit(state.copyWith(moves: event.move));
    });
    on<OnSetRemaining>((event, emit) {
      emit(state.copyWith(remaining: event.remaining));
    });
  }

  addMove(){
    add(OnSetMove(state.moves + 1));
  }

  setRemaining(int remaining){
    add(OnSetRemaining(remaining));
  }
  
  subtractRemaining(){
    add(OnSetRemaining(state.remaining - 1));
  }
}

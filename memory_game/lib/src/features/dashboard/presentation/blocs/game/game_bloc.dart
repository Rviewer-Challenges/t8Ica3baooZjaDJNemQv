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

    on<CleanBloc>((event, emit) {
      emit(const GameState());
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


  cleanBloc(){
    add(CleanBloc());
  }
}

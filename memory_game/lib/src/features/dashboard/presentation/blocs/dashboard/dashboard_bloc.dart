import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memory_game/src/features/dashboard/data/models/card.dart';
import 'package:memory_game/src/features/dashboard/domain/usecases/rick_morty_get_character_use_case.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  final RickMortyGetCharacterUseCase _getCharacterUseCase;

  DashboardBloc({required RickMortyGetCharacterUseCase getCharacterUseCase}) :
  _getCharacterUseCase = getCharacterUseCase,
  super(const DashboardState()) {
    on<OnSetDashboardEvent>((event, emit) => emit(state.copyWith(cards: event.cards)));
    on<OnStartDashboardEvent>((event, emit) => emit(state.copyWith(totalCount: event.totalCount)));
    on<OnCardTapped>((event, emit) =>_cardTapped(event.position, event.visible));
  }

  createDashboard(int totalCount) async {
    final cards = <RickMortyCard>[];
    for (var i = 0; i < totalCount; i++) {
      cards.add(RickMortyCard(
        position: i,
        character: 1,
        visible: false,
        isMatched: false,
        info: await _getCharacterUseCase.call(1)
      ));
    }
    add(OnStartDashboardEvent(totalCount: totalCount));
    setDashboard(cards);
  }

  _cardTapped(int position, bool visible) {
    final auxCards = state.cards.map((card) => card.copyWith()).toList();
    auxCards[position] = auxCards[position].copyWith(visible: visible);
    setDashboard(auxCards);
  }

  setDashboard(List<RickMortyCard> cards) {
    add(OnSetDashboardEvent(cards: cards));
  }
}
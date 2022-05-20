import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memory_game/src/features/dashboard/data/models/card.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    on<OnSetDashboardEvent>((event, emit) => emit(state.copyWith(cards: event.cards)));
    on<OnStartDashboardEvent>((event, emit) => emit(state.copyWith(totalCount: event.totalCount)));
    on<OnCardTapped>((event, emit) =>_cardTapped(event.position, event.visible));
  }

  createDashboard(int totalCount) {
    final cards = <RickMortyCard>[];
    for (var i = 0; i < totalCount; i++) {
      cards.add(RickMortyCard(
        position: i,
        character: 1,
        visible: false,
        isMatched: false,
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
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memory_game/src/features/dashboard/data/models/card.dart';
import 'package:memory_game/src/features/dashboard/domain/usecases/rick_morty_get_character_use_case.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final RickMortyGetCharacterUseCase _getCharacterUseCase;

  DashboardBloc({required RickMortyGetCharacterUseCase getCharacterUseCase})
      : _getCharacterUseCase = getCharacterUseCase,
        super(const DashboardState()) {
    on<OnSetDashboardEvent>(
        (event, emit) => emit(state.copyWith(cards: event.cards)));
    on<OnStartDashboardEvent>(
        (event, emit) => emit(state.copyWith(totalCount: event.totalCount)));
    on<OnCardTapped>(
        (event, emit) => _cardTapped(event.position, event.visible));
    on<OnPairNotMatched>(
        (event, emit) => _pairNotMatched(event.cardOne, event.cardTwo));
    on<OnPairMatched>(
        (event, emit) => _pairMatched(event.cardOne, event.cardTwo));
    on<OnCleanBloc>((event, emit) => emit(const DashboardState()));
    on<OnSetTap>((event, emit) => emit(state.copyWith(tapped: event.cards)));
  }

  createDashboard(int totalCount) async {
    const auxCard = RickMortyCard(
        position: 100,
        character: 1,
        visible: false,
        isMatched: false,
        info: 'prueba');

    final cards =
        List<RickMortyCard>.filled(totalCount, auxCard, growable: true);

    final _random = Random();
    List<int> characters = [];
    int next(int min, int max) => min + _random.nextInt(max - min);

    while (characters.length < (totalCount / 2)) {
      final character = next(1, 300);
      if (!characters.contains(character)) {
        characters.add(character);
      }
    }

    for (int i = 0; i < totalCount / 2; i++) {
      int count = 0;
      final character = characters[i];
      final image = (await _getCharacterUseCase.call(character)).image;
      while (count != 2) {
        final position = next(0, totalCount);
        if (cards.elementAt(position).position == 100) {
          final card = RickMortyCard(
              position: position,
              character: character,
              visible: false,
              isMatched: false,
              info: image);
          cards[position] = card;
          count++;
        }
      }
    }

    add(OnStartDashboardEvent(totalCount: totalCount));
    setDashboard(cards);
  }

  _cardTapped(int position, bool visible) {
    final auxCards = state.cards.map((card) => card.copyWith()).toList();
    add(OnSetTap(cards: [auxCards[position]]));
    auxCards[position] = auxCards[position].copyWith(visible: visible);
    setDashboard(auxCards);

    if (state.tapped.isNotEmpty) {
      if (state.tapped.elementAt(0).character ==
          auxCards[position].character) {
        add(OnPairMatched(state.tapped.elementAt(0).position,
            position));
      } else {
        add(OnPairNotMatched(state.tapped.elementAt(0).position,
            position));
      }
    }
  }

  setDashboard(List<RickMortyCard> cards) {
    add(OnSetDashboardEvent(cards: cards));
  }

  _pairMatched(int cardOne, int cardTwo) {
    final auxCards = state.cards.map((card) => card.copyWith()).toList();
    auxCards[cardOne] =
        auxCards[cardOne].copyWith(visible: true, isMatched: true);
    auxCards[cardTwo] =
        auxCards[cardTwo].copyWith(visible: true, isMatched: true);
    setDashboard(auxCards);
    add(const OnSetTap(cards: []));
  }

  _pairNotMatched(int cardOne, int cardTwo) {
    final auxCards = state.cards.map((card) => card.copyWith()).toList();
    auxCards[cardOne] =
        auxCards[cardOne].copyWith(visible: false, isMatched: false);
    auxCards[cardTwo] =
        auxCards[cardTwo].copyWith(visible: false, isMatched: false);
    setDashboard(auxCards);
    add(const OnSetTap(cards: []));
  }

  cleanBloc() {
    add(OnCleanBloc());
  }
}

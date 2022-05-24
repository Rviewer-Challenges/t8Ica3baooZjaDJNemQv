import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_downloader/image_downloader.dart';
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
    on<OnCardTapped>((event, emit) => _cardTapped(event.position));
    on<OnPairNotMatched>(
        (event, emit) => _pairNotMatched(event.cardOne, event.cardTwo));
    on<OnPairMatched>(
        (event, emit) => _pairMatched(event.cardOne, event.cardTwo));
    on<OnCleanBloc>((event, emit) => emit(const DashboardState()));
    on<OnSetTap>((event, emit) => emit(state.copyWith(tapped: event.cards)));
    on<OnDashboardStartedEvent>(
        (event, emit) => emit(state.copyWith(isCreated: event.isCreated)));
    on<OnSetTappedEvent>(
        (event, emit) => emit(state.copyWith(isTapped: event.isTapped)));
    on<OnSetMove>((event, emit) => emit(state.copyWith(moves: event.move)));
    on<OnSetRemaining>(
        (event, emit) => emit(state.copyWith(remaining: event.remaining)));
    on<OnToggleEnabled>(
        (event, emit) => emit(state.copyWith(isEnabled: event.isEnabled)));
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
      await getImages(image);
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
    add(const OnDashboardStartedEvent(isCreated: true));
    setRemaining(totalCount ~/ 2);
  }

  _cardTapped(int position) async {
    final auxCards = state.cards.map((card) => card.copyWith()).toList();
    add(OnSetTap(cards: [auxCards[position]]));
    auxCards[position] = auxCards[position].copyWith(visible: true);
    await setDashboard(auxCards);
    if (state.tapped.isNotEmpty) {
      addMove();
      toggleIsEnabled();
      if (state.tapped.elementAt(0).character == auxCards[position].character) {
        add(OnPairMatched(state.tapped.elementAt(0).position, position));
      } else {
        add(OnPairNotMatched(state.tapped.elementAt(0).position, position));
      }
    }
  }

  toggleIsEnabled() {
    add(OnToggleEnabled(isEnabled: !state.isEnabled));
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
    toggleIsEnabled();
    subtractRemaining();
  }

  setRemaining(int remaining) {
    add(OnSetRemaining(remaining));
  }

  subtractRemaining() {
    add(OnSetRemaining(state.remaining - 1));
  }

  getImages(String url) async {
    var imageId = await ImageDownloader.downloadImage(url);
    var path = await ImageDownloader.findPath(imageId!);
    var fileBytes = await File(path!).readAsBytes();
    await DefaultCacheManager().putFile(
      url,
      fileBytes,
      fileExtension: "jpg",
    );
  }

  _pairNotMatched(int cardOne, int cardTwo) async {
    final auxCards = state.cards.map((card) => card.copyWith()).toList();
    auxCards[cardOne] =
        auxCards[cardOne].copyWith(visible: false, isMatched: false);
    setDashboard(auxCards);
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    auxCards[cardTwo] =
        auxCards[cardTwo].copyWith(visible: false, isMatched: false);
    setDashboard(auxCards);
    toggleIsEnabled();
    add(const OnSetTap(cards: []));
  }

  addMove() {
    add(OnSetMove(state.moves + 1));
  }

  cleanBloc() async {
    for (int i = 0; i < state.cards.length; i++) {
      await CachedNetworkImage.evictFromCache(state.cards[i].info);
    }
    add(OnCleanBloc());
  }
}

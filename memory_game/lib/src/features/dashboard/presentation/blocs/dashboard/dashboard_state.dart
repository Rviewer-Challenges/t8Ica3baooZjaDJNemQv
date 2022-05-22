part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final List<RickMortyCard> cards;
  final int totalCount;
  final List<RickMortyCard> tapped;
  final bool isCreated;
  final bool isTapped;
  final int moves;
  final int remaining;

  const DashboardState(
      {this.cards = const [],
      this.totalCount = 30,
      this.tapped = const [],
      this.isCreated = false,
      this.isTapped = false,
      this.moves = 0,
      this.remaining = 0});

  DashboardState copyWith(
      {List<RickMortyCard>? cards,
      int? totalCount,
      List<RickMortyCard>? tapped,
      bool? isCreated,
      bool? isTapped,
      int? moves,
      int? remaining}) {
    return DashboardState(
      cards: cards ?? this.cards,
      totalCount: totalCount ?? this.totalCount,
      tapped: tapped ?? this.tapped,
      isCreated: isCreated ?? this.isCreated,
      isTapped: isTapped ?? this.isTapped,
      moves: moves ?? this.moves,
      remaining: remaining ?? this.remaining,
    );
  }

  @override
  List<Object> get props =>
      [cards, totalCount, tapped, isCreated, isTapped, moves, remaining];
}

part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final List<RickMortyCard> cards;
  final int totalCount;
  final List<RickMortyCard> tapped;
  final bool isCreated;

  const DashboardState(
      {this.cards = const [], this.totalCount = 30, this.tapped = const [], this.isCreated = false});

  DashboardState copyWith(
      {List<RickMortyCard>? cards,
      int? totalCount,
      List<RickMortyCard>? tapped,
      bool? isCreated}) {
    return DashboardState(
      cards: cards ?? this.cards,
      totalCount: totalCount ?? this.totalCount,
      tapped: tapped ?? this.tapped,
      isCreated: isCreated ?? this.isCreated,
    );
  }

  @override
  List<Object> get props => [
        cards,
        totalCount,
        tapped,
        isCreated,
      ];
}

part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final List<RickMortyCard> cards;
  final int totalCount;
  final List<RickMortyCard> tapped;
  
  const DashboardState({this.cards = const [], this.totalCount = 30, this.tapped = const []});

  DashboardState copyWith({
    List<RickMortyCard>? cards,
    int? totalCount,
    List<RickMortyCard>? tapped,
  }) {
    return DashboardState(
      cards: cards ?? this.cards,
      totalCount: totalCount ?? this.totalCount,
      tapped: tapped ?? this.tapped,
    );
  }

  @override
  List<Object> get props => [
        cards,
        totalCount,
        tapped,
      ];
}

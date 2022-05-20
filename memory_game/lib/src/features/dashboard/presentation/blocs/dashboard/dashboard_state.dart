part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final List <RickMortyCard> cards ;
  final int totalCount;
  const DashboardState({this.cards= const [], this.totalCount= 30});

  DashboardState copyWith({
    List <RickMortyCard>? cards,
    int? totalCount,
  }) {
    return DashboardState(
      cards: cards ?? this.cards,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  @override
  List<Object> get props => [
    cards,
    totalCount,
  ];
}

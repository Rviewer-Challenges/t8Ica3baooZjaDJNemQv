part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class OnSetDashboardEvent extends DashboardEvent {
  final List<RickMortyCard> cards;
  const OnSetDashboardEvent({required this.cards});
}

class OnStartDashboardEvent extends DashboardEvent {
  final int totalCount;
  const OnStartDashboardEvent({required this.totalCount});
}

class OnCardTapped extends DashboardEvent {
  final int position;
  final bool visible;
  const OnCardTapped({required this.position, required this.visible});
}

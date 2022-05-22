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

class OnDashboardStartedEvent extends DashboardEvent {
  final bool isCreated;
  const OnDashboardStartedEvent({required this.isCreated});
}

class OnSetTappedEvent extends DashboardEvent {
  final bool isTapped;
  const OnSetTappedEvent({required this.isTapped});
}

class OnCardTapped extends DashboardEvent {
  final int position;
  const OnCardTapped({required this.position});
}

class OnCleanBloc extends DashboardEvent {}

class OnPairNotMatched extends DashboardEvent {
  final int cardOne;
  final int cardTwo;

  const OnPairNotMatched(this.cardOne, this.cardTwo);

  @override
  List<Object> get props => [cardOne, cardTwo];
}

class OnPairMatched extends DashboardEvent {
  final int cardOne;
  final int cardTwo;

  const OnPairMatched(this.cardOne, this.cardTwo);

  @override
  List<Object> get props => [cardOne, cardTwo];
}

class OnSetTap extends DashboardEvent {
  final List<RickMortyCard> cards;
  const OnSetTap({required this.cards});

  @override
  List<Object> get props => [cards];
}
class OnSetMove extends DashboardEvent {
  final int move;

  const OnSetMove(this.move);

  @override
  List<Object> get props => [move];
}

class OnSetRemaining extends DashboardEvent {
  final int remaining;

  const OnSetRemaining(this.remaining);

  @override
  List<Object> get props => [remaining];
}


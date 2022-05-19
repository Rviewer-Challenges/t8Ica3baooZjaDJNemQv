part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class OnSetLevelSelected extends NavigationEvent {
  final Object levelSelected;

  const OnSetLevelSelected(this.levelSelected);
}
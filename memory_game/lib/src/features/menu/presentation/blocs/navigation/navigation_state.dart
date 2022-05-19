part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  const NavigationState({
    this.levelSelected = 'A',
  });

  final Object levelSelected;

  NavigationState copyWith({
    Object? levelSelected,
  }) {
    return NavigationState(
      levelSelected: levelSelected ?? this.levelSelected,
    );
  }

  @override
  List<Object> get props => [ levelSelected ];
}

class RickMortyCard {
  const RickMortyCard(
      {required this.position, 
      required this.character, 
      required this.visible,
      required this.isMatched,});

  final int position;
  final int character;
  final bool visible;
  final bool isMatched;

  RickMortyCard copyWith({
    int? position,
    int? character,
    bool? visible,
    bool? isMatched,
  }) {
    return RickMortyCard(
      position: position ?? this.position,
      character: character ?? this.character,
      visible: visible ?? this.visible,
      isMatched: isMatched ?? this.isMatched,
    );
  }

  @override
  String toString() {
    return 'RickMortyCard{position: $position, character: $character, visible: $visible, isMatched: $isMatched}';
  }
}

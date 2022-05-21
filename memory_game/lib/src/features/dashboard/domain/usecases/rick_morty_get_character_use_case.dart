import 'package:memory_game/src/features/dashboard/data/models/character_model.dart';
import 'package:memory_game/src/features/dashboard/domain/repositories/rick_morty_repository.dart';

class RickMortyGetCharacterUseCase {
  RickMortyGetCharacterUseCase(
    {required RickMortyRepository rickMortyRepository})
    :_rickMortyRepository = rickMortyRepository;

  final RickMortyRepository _rickMortyRepository;

  Future<CharacterModel> call(int id) async {
    return await _rickMortyRepository.getCharacter(id);
  }
}
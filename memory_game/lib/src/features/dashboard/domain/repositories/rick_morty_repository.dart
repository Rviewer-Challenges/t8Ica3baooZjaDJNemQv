import 'package:memory_game/src/features/dashboard/data/models/character_model.dart';

abstract class RickMortyRepository {
  Future<CharacterModel> getCharacter(int id);
}
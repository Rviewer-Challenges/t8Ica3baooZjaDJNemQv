import 'package:memory_game/src/features/dashboard/data/datasources/rick_morty_data_source.dart';
import 'package:memory_game/src/features/dashboard/data/models/character_model.dart';
import 'package:memory_game/src/features/dashboard/domain/repositories/rick_morty_repository.dart';

class RickMortyRepositoryImpl implements RickMortyRepository{


  RickMortyRepositoryImpl(
      {required RickMortyDataSource rickMortyDataSource})
      : _rickMortyDataSource = rickMortyDataSource;

  final RickMortyDataSource _rickMortyDataSource;

 @override
  Future<CharacterModel> getCharacter(int id)async{
    return await _rickMortyDataSource.getCharacter(id);
  }
}
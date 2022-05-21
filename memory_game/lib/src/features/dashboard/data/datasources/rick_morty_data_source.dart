import 'package:memory_game/src/core/rest_api_service.dart';
import 'package:memory_game/src/features/dashboard/data/models/character_model.dart';

abstract class RickMortyDataSource{
  Future<CharacterModel> getCharacter(int id);
}

class RickMortyDataSourceImpl implements RickMortyDataSource{
  RickMortyDataSourceImpl({required RestApiBaseHelper restApiBaseHelper})
      : _apiBaseHelper = restApiBaseHelper;
final RestApiBaseHelper _apiBaseHelper;

  @override
  Future<CharacterModel> getCharacter(int id) async{
    final url = 'character/$id';
    final resp = await _apiBaseHelper.get(url);
    return CharacterModel.fromJson(resp);
  }


}
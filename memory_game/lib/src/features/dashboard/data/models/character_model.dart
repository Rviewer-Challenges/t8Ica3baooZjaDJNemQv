import 'package:json_annotation/json_annotation.dart';
import 'package:memory_game/src/features/dashboard/domain/entities/character.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel implements Character {
  
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });

factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
      
      Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  @override
  final int id;
  @override
  final String name;
  @override
  final String status;
  @override
  final String image;


  @override
  List<Object?> get props => [id, name, status, image];

  @override
  bool? get stringify => true;
}
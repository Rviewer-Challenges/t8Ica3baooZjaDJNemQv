import 'package:equatable/equatable.dart';

class Character extends Equatable{
  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });

  final int id;
  final String name;
  final String status;
  final String image;

  @override
  List<Object?> get props => [id, name, status, image];
}

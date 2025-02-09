import 'package:equatable/equatable.dart';

class CatBreedEntity extends Equatable {
  const CatBreedEntity({
    required this.name,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.intelligence,
    required this.image,
  });

  final String name;
  final String origin;
  final String description;
  final String lifeSpan;
  final int adaptability;
  final int intelligence;
  final String image;

  @override
  List<Object?> get props => [
        name,
        origin,
        description,
        lifeSpan,
        adaptability,
        intelligence,
        image,
      ];
}

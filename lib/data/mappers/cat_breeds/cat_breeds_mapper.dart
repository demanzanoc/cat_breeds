import 'package:cats_app/data/models/cat_breeds/cat_breed_model.dart';
import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';

abstract class CatBreedsMapper {
  static CatBreedEntity mapCatApiToEntity(CatBreedModel catBreedModel) =>
      CatBreedEntity(
        name: catBreedModel.name,
        origin: catBreedModel.origin,
        description: catBreedModel.description,
        lifeSpan: catBreedModel.lifeSpan,
        adaptability: catBreedModel.adaptability,
        intelligence: catBreedModel.intelligence,
        image: catBreedModel.image,
      );
}

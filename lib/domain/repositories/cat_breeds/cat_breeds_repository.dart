import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';

abstract class CatBreedsRepository {
  Future<List<CatBreedEntity>> getCatBreeds();
}

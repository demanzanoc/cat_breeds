import 'package:cats_app/data/models/cat_breeds/cat_breed_model.dart';

abstract class CatBreedsDatasource {
  Future<List<CatBreedModel>> getCatBreeds();
}

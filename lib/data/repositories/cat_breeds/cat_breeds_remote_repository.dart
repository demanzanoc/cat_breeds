import 'package:cats_app/data/mappers/cat_breeds/cat_breeds_mapper.dart';
import 'package:cats_app/domain/datasources/cat_breeds/cat_breeds_datasource.dart';
import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';
import 'package:cats_app/domain/repositories/cat_breeds/cat_breeds_repository.dart';

class CatBreedsRemoteRepository implements CatBreedsRepository {
  CatBreedsRemoteRepository({
    required CatBreedsDatasource catBreedsDatasource,
  }) : _catBreedsDatasource = catBreedsDatasource;

  final CatBreedsDatasource _catBreedsDatasource;

  @override
  Future<List<CatBreedEntity>> getCatBreeds() async {
    try {
      final catBreedsModel = await _catBreedsDatasource.getCatBreeds();
      return catBreedsModel
          .map((catBreed) => CatBreedsMapper.mapCatApiToEntity(catBreed))
          .toList();
    } catch (exception) {
      throw Exception(exception);
    }
  }
}

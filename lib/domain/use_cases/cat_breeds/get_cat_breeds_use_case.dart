import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';
import 'package:cats_app/domain/repositories/cat_breeds/cat_breeds_repository.dart';

class GetCatBreedsUseCase {
  GetCatBreedsUseCase({
    required CatBreedsRepository catBreedsRepository,
  }) : _catBreedsRepository = catBreedsRepository;

  final CatBreedsRepository _catBreedsRepository;

  Future<List<CatBreedEntity>> call() {
    return _catBreedsRepository.getCatBreeds();
  }
}

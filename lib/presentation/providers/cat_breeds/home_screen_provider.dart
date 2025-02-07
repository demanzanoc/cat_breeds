import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';
import 'package:cats_app/domain/use_cases/cat_breeds/get_cat_breeds_use_case.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  HomeScreenProvider({
    required GetCatBreedsUseCase getCatBreedsUseCase,
  }) : _getCatBreedsUseCase = getCatBreedsUseCase;

  final GetCatBreedsUseCase _getCatBreedsUseCase;

  final List<CatBreedEntity> _catBreeds = [];
  List<CatBreedEntity> get catBreeds => _catBreeds;

  bool _isLoadingCatBreeds = false;
  bool get isLoadingCatBreeds => _isLoadingCatBreeds;

  Future<void> getCatBreeds() async {
    try {
      if (_catBreeds.isEmpty) {
        _isLoadingCatBreeds = true;
        _catBreeds.addAll(await _getCatBreedsUseCase());
        _isLoadingCatBreeds = false;
        notifyListeners();
      }
    } catch (exception) {
      // TODO(demanzanoc): Handle error
    }
  }
}

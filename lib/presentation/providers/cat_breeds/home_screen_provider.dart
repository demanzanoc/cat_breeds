import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';
import 'package:cats_app/domain/use_cases/cat_breeds/get_cat_breeds_use_case.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  HomeScreenProvider({
    required GetCatBreedsUseCase getCatBreedsUseCase,
  }) : _getCatBreedsUseCase = getCatBreedsUseCase;

  final GetCatBreedsUseCase _getCatBreedsUseCase;

  final List<CatBreedEntity> _catBreeds = [];
  List<CatBreedEntity> _filteredCatBreeds = [];
  List<CatBreedEntity> get catBreeds => _filteredCatBreeds;

  bool _isLoadingCatBreeds = false;
  bool get isLoadingCatBreeds => _isLoadingCatBreeds;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> getCatBreeds() async {
    try {
      if (_catBreeds.isEmpty) {
        _isLoadingCatBreeds = true;
        _catBreeds.addAll(await _getCatBreedsUseCase());
        _filteredCatBreeds = _catBreeds;
        _isLoadingCatBreeds = false;
      }
    } catch (_) {
      _errorMessage = 'Error getting cat breeds.';
      _isLoadingCatBreeds = false;
    }
    notifyListeners();
  }

  void filterCatBreeds(String query) {
    if (query.isEmpty) {
      _filteredCatBreeds = _catBreeds;
    } else {
      _filteredCatBreeds = _catBreeds.where((catBreed) {
        return catBreed.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void retryGetCatBreeds() {
    _errorMessage = '';
    notifyListeners();
    getCatBreeds();
  }
}

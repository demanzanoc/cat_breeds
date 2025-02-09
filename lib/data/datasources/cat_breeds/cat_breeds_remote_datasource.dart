import 'dart:developer';

import 'package:cats_app/data/api/http_client.dart';
import 'package:cats_app/data/models/cat_breeds/cat_breed_model.dart';
import 'package:cats_app/domain/datasources/cat_breeds/cat_breeds_datasource.dart';

class CatBreedsRemoteDatasource implements CatBreedsDatasource {
  CatBreedsRemoteDatasource({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  final HttpClient _httpClient;

  @override
  Future<List<CatBreedModel>> getCatBreeds() async {
    try {
      final response = await _httpClient.get('/breeds');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => CatBreedModel.fromJson(json)).toList();
      } else {
        throw Exception('Error getting cat breeds data. Code: ${response.statusCode}');
      }
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }
}

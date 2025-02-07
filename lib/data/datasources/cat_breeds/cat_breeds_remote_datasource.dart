import 'package:cats_app/data/api/http_client.dart';
import 'package:cats_app/data/models/cat_breeds/cat_breed_model.dart';
import 'package:cats_app/domain/datasources/cat_breeds/cat_breeds_datasource.dart';

class CatBreedsRemoteDatasource implements CatBreedsDatasource {
  CatBreedsRemoteDatasource({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  final HttpClient _httpClient;
  final String _errorMessage = 'Error getting data. Code:';

  @override
  Future<List<CatBreedModel>> getCatBreeds() async {
    try {
      final response = await _httpClient.get('/breeds');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => CatBreedModel.fromJson(json)).toList();
      } else {
        throw Exception('$_errorMessage ${response.statusCode}');
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}

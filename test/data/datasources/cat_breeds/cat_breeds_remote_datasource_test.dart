import 'package:cats_app/data/api/api_response.dart';
import 'package:cats_app/data/api/http_client.dart';
import 'package:cats_app/data/datasources/cat_breeds/cat_breeds_remote_datasource.dart';
import 'package:cats_app/data/models/cat_breeds/cat_breed_model.dart';
import 'package:cats_app/domain/datasources/cat_breeds/cat_breeds_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/data/cat_breeds_respose_mock.dart';
import '../../../mocks/data/http_client_mock.dart';

void main() {
  late HttpClient httpClient;
  late CatBreedsDatasource catBreedsDatasource;

  void setUpDependencies() {
    httpClient = HttpClientMock();
    catBreedsDatasource = CatBreedsRemoteDatasource(httpClient: httpClient);
  }

  setUp(() {
    setUpDependencies();
  });

  group('CatBreedsRemoteDatasource tests', () {
    test(
      'should return CatBreedModel when the http request is successful',
      () async {
        // Arrange
        final catBreedModelMock = CatBreedModel.fromJson(catBreedsResponseMock);
        when(() => httpClient.get(any())).thenAnswer(
          (_) async => ApiResponse(
            data: [catBreedsResponseMock],
            statusCode: 200,
          ),
        );

        // Act
        final response = await catBreedsDatasource.getCatBreeds();

        // Assert
        expect(response.first.name, catBreedModelMock.name);
      },
    );

    test(
      'should throw Exception when the http request return statusCode: 500',
      () async {
        // Arrange
        when(() => httpClient.get(any())).thenAnswer(
          (_) async => ApiResponse(
            data: [''],
            statusCode: 500,
          ),
        );

        // Act - Assert
        expect(
          catBreedsDatasource.getCatBreeds(),
          throwsException,
        );
      },
    );

    test(
      'should throw Exception when the http request fails',
      () async {
        // Arrange
        when(() => httpClient.get(any())).thenThrow(Exception('Error'));

        // Act - Assert
        expect(
          catBreedsDatasource.getCatBreeds(),
          throwsException,
        );
      },
    );
  });
}

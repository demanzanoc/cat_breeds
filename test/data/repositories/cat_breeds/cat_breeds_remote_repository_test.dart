import 'package:cats_app/data/mappers/cat_breeds/cat_breeds_mapper.dart';
import 'package:cats_app/data/models/cat_breeds/cat_breed_model.dart';
import 'package:cats_app/data/repositories/cat_breeds/cat_breeds_remote_repository.dart';
import 'package:cats_app/domain/datasources/cat_breeds/cat_breeds_datasource.dart';
import 'package:cats_app/domain/repositories/cat_breeds/cat_breeds_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/data/cat_breeds_datasource_mock.dart';
import '../../../mocks/data/cat_breeds_respose_mock.dart';

void main() {
  late CatBreedsDatasource catBreedsDatasource;
  late CatBreedsRepository catBreedsRepository;

  void setUpDependencies() {
    catBreedsDatasource = CatBreedsDatasourceMock();
    catBreedsRepository = CatBreedsRemoteRepository(
      catBreedsDatasource: catBreedsDatasource,
    );
  }

  setUp(() {
    setUpDependencies();
  });
  group('CatBreedsRemoteRepository tests', () {
    test(
      'should return a CatBreedEntity when the datasource call is successful',
      () async {
        // Arrange
        final catBreedModelMock = CatBreedModel.fromJson(catBreedsResponseMock);
        final catBreedEntity = CatBreedsMapper.mapCatApiToEntity(
          catBreedModelMock,
        );
        when(() => catBreedsDatasource.getCatBreeds())
            .thenAnswer((_) async => [catBreedModelMock]);

        // Act
        final catBreed = await catBreedsRepository.getCatBreeds();

        // Assert
        expect(catBreed.first, equals(catBreedEntity));
      },
    );

    test(
      'should return an Exception when the datasource call fails',
      () async {
        // Arrange
        when(() => catBreedsDatasource.getCatBreeds()).thenThrow(Exception());

        // Act - Assert
        expect(catBreedsRepository.getCatBreeds(), throwsException);
      },
    );
  });
}

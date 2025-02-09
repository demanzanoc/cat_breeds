import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/presentation/cat_breed_entity_mock.dart';

void main() {
  group('CatBreedEntity tests', () {
    test('cat breed entity ...', () async {
      // Arrange
      final catBreed = CatBreedEntity(
        name: catBreedMock.name,
        origin: catBreedMock.origin,
        description: catBreedMock.description,
        lifeSpan: catBreedMock.lifeSpan,
        adaptability: catBreedMock.adaptability,
        intelligence: catBreedMock.intelligence,
        image: catBreedMock.image,
      );

      // Assert
      expect(catBreed, equals(catBreedMock));
    });
  });
}

import 'package:cats_app/domain/repositories/cat_breeds/cat_breeds_repository.dart';
import 'package:cats_app/domain/use_cases/cat_breeds/get_cat_breeds_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/domain/cat_breeds_repository_mock.dart';
import '../../../mocks/presentation/cat_breed_entity_mock.dart';

void main() {
  late CatBreedsRepository catBreedsRepository;
  late GetCatBreedsUseCase getCatBreedsUseCase;

  void setUpDependencies() {
    catBreedsRepository = CatBreedsRepositoryMock();
    getCatBreedsUseCase = GetCatBreedsUseCase(
      catBreedsRepository: catBreedsRepository,
    );
  }

  final catBreedMockedList = [catBreedMock, catBreedMock];

  setUp(() {
    setUpDependencies();
  });

  group('GetCatBreedsUseCase tests', () {
    test(
      'should return the cat breeds list when the service call is successful',
      () async {
        // Arrange
        when(() => catBreedsRepository.getCatBreeds())
            .thenAnswer((_) async => catBreedMockedList);

        // Act
        final catBreeds = await getCatBreedsUseCase();

        // Assert
        expect(catBreeds, catBreedMockedList);
        verify(() => catBreedsRepository.getCatBreeds()).called(1);
      },
    );
  });
}

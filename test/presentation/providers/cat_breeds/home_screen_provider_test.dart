import 'package:cats_app/domain/use_cases/cat_breeds/get_cat_breeds_use_case.dart';
import 'package:cats_app/presentation/providers/cat_breeds/home_screen_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/domain/get_cat_breeds_use_case_mock.dart';
import '../../../mocks/presentation/cat_breed_entity_mock.dart';

void main() {
  late GetCatBreedsUseCase getCatBreedsUseCase;
  late HomeScreenProvider homeScreenProvider;

  void setUpDependencies() {
    getCatBreedsUseCase = GetCatBreedsUseCaseMock();
    homeScreenProvider = HomeScreenProvider(
      getCatBreedsUseCase: getCatBreedsUseCase,
    );
  }

  final catBreedMockedList = [catBreedMock, catBreedMock, catBreedMock];

  setUp(() {
    setUpDependencies();
  });

  group('HomeScreenProvider tests', () {
    test(
      'should load the cat breeds data when the service call is successful',
      () async {
        // Arrange
        when(() => getCatBreedsUseCase())
            .thenAnswer((_) async => catBreedMockedList);

        // Act
        await homeScreenProvider.getCatBreeds();

        // Assert
        expect(homeScreenProvider.catBreeds.length, 3);
        expect(homeScreenProvider.errorMessage, '');
        expect(homeScreenProvider.isLoadingCatBreeds, false);
      },
    );

    test('should throw a exception when the service call fails', () async {
      // Arrange
      when(() => getCatBreedsUseCase()).thenThrow(Exception());

      // Act
      await homeScreenProvider.getCatBreeds();

      // Assert
      expect(homeScreenProvider.catBreeds, isEmpty);
      expect(homeScreenProvider.errorMessage, 'Error getting cat breeds.');
      expect(homeScreenProvider.isLoadingCatBreeds, false);
    });

    test(
      'should filter cat breeds list when the user enters a query param',
      () async {
        // Arrange
        when(() => getCatBreedsUseCase())
            .thenAnswer((_) async => catBreedMockedList);

        // Act
        await homeScreenProvider.getCatBreeds();
        homeScreenProvider.filterCatBreeds('xyz');

        // Assert
        expect(homeScreenProvider.catBreeds, isEmpty);
        expect(homeScreenProvider.errorMessage, '');
        expect(homeScreenProvider.isLoadingCatBreeds, false);
      },
    );

    test(
      'should filter cat breeds list when the user enters a empty query param',
      () async {
        // Arrange
        when(() => getCatBreedsUseCase())
            .thenAnswer((_) async => catBreedMockedList);

        // Act
        await homeScreenProvider.getCatBreeds();
        homeScreenProvider.filterCatBreeds('');

        // Assert
        expect(homeScreenProvider.catBreeds, catBreedMockedList);
        expect(homeScreenProvider.errorMessage, '');
        expect(homeScreenProvider.isLoadingCatBreeds, false);
      },
    );

    test(
      'should retry the getCatBreeds call when the service call fails',
      () async {
        // Arrange
        when(() => getCatBreedsUseCase())
            .thenAnswer((_) async => catBreedMockedList);

        // Act
        homeScreenProvider.retryGetCatBreeds();

        // Assert
        expect(homeScreenProvider.errorMessage, '');
        verify(() => homeScreenProvider.getCatBreeds()).called(1);
      },
    );
  });
}

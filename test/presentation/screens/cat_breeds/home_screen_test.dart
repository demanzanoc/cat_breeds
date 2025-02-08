import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';
import 'package:cats_app/presentation/providers/cat_breeds/home_screen_provider.dart';
import 'package:cats_app/presentation/screens/cat_breeds/home_screen.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/cat_breed_card.dart';
import 'package:cats_app/presentation/widgets/common/ui_errors/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../mocks/presentation/home_screen_provider_mock.dart';

void main() {
  late HomeScreenProvider homeScreenProvider;

  void setUpDependencies() {
    homeScreenProvider = HomeScreenProviderMock();
  }

  void setUpStubs() {
    when(() => homeScreenProvider.getCatBreeds()).thenAnswer((_) async => {});
  }

  setUp(() {
    setUpDependencies();
    setUpStubs();
  });

  final materialApp = MaterialApp(
    home: HomeScreen(),
  );

  final catBreedMock = CatBreedEntity(
    name: 'bambino',
    origin: 'usa',
    description: 'cat',
    lifeSpan: '12',
    adaptability: 4,
    intelligence: 5,
    image: '',
  );

  final catBreedsMockedList = [catBreedMock, catBreedMock, catBreedMock];

  group('HomeScreen tests', () {
    testWidgets(
      'should show a CircularProgressIndicator when the service is loading',
      (tester) async {
        // Arrange
        when(() => homeScreenProvider.isLoadingCatBreeds).thenReturn(true);
        final widget = ChangeNotifierProvider<HomeScreenProvider>.value(
          value: homeScreenProvider,
          child: materialApp,
        );

        // Act
        await tester.pumpWidget(widget);

        // Assert
        expect(find.text('Catbreeds'), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'should show a ErrorView widget when the service fails',
      (tester) async {
        // Arrange
        when(() => homeScreenProvider.isLoadingCatBreeds).thenReturn(false);
        when(() => homeScreenProvider.errorMessage).thenReturn('Error');
        final widget = ChangeNotifierProvider<HomeScreenProvider>.value(
          value: homeScreenProvider,
          child: materialApp,
        );

        // Act
        await tester.pumpWidget(widget);

        // Assert
        expect(find.byType(ErrorView), findsOneWidget);
      },
    );

    testWidgets(
      'should show a ListView with the cat breeds when the service loads the data',
      (tester) async {
        // Arrange
        when(() => homeScreenProvider.isLoadingCatBreeds).thenReturn(false);
        when(() => homeScreenProvider.errorMessage).thenReturn('');
        when(() => homeScreenProvider.catBreeds)
            .thenReturn(catBreedsMockedList);
        final widget = ChangeNotifierProvider<HomeScreenProvider>.value(
          value: homeScreenProvider,
          child: materialApp,
        );

        // Act
        await tester.pumpWidget(widget);

        // Assert
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(CatBreedCard), findsWidgets);
      },
    );
  });
}

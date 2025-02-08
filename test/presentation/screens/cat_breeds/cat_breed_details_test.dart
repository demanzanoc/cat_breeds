import 'package:cats_app/presentation/screens/cat_breeds/cat_breed_details.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/cat_image.dart';
import 'package:cats_app/presentation/widgets/common/rating_star_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/presentation/cat_breed_entity_mock.dart';

void main() {
  group('CatBreedDetails tests', () {
    testWidgets('should display CatBreedDetails correctly', (tester) async {
      //Act
      await tester.pumpWidget(
        MaterialApp(home: CatBreedDetails(catBreed: catBreedMock)),
      );

      // Assert
      expect(find.text(catBreedMock.name), findsOneWidget);
      expect(find.text(catBreedMock.origin), findsOneWidget);
      expect(find.text(catBreedMock.description), findsOneWidget);
      expect(find.text('${catBreedMock.lifeSpan} years'), findsOneWidget);
      expect(find.byType(RatingStarIcons), findsExactly(2));
      expect(find.byType(CatImage), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  });
}

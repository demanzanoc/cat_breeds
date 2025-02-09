import 'package:cats_app/presentation/routes/routes.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/cat_breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../../../mocks/presentation/cat_breed_entity_mock.dart';

void main() {
  late GoRouter goRouter;

  setUp(() {
    goRouter = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => CatBreedCard(catBreed: catBreedMock),
        ),
        GoRoute(
          path: Routes.catBreedDetails,
          builder: (context, state) {
            return Scaffold(
              body: Text('CatBreedDetailsScreen'),
            );
          },
        ),
      ],
    );
  });

  group('CatBreedCard tests', () {
    testWidgets(
      'should navigate to CatBreedDetailsScreen when the user taps on card',
      (tester) async {
        // Arrange
        MaterialApp app = MaterialApp.router(
          routerConfig: goRouter,
        );

        // Act
        await tester.pumpWidget(app);
        expect(find.byType(GestureDetector), findsOneWidget);
        await tester.tap(find.byType(GestureDetector));
        await tester.pumpAndSettle();

        // Assert
        expect(find.text('CatBreedDetailsScreen'), findsOneWidget);
      },
    );
  });
}

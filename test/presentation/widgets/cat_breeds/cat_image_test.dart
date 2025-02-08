import 'package:cats_app/presentation/widgets/cat_breeds/cat_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  group('CatImage tests', () {
    testWidgets('should display cat breed network image correctly', (tester) async {
      // Arrange
      final image = 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg';

      // Act
      await mockNetworkImages(
        () async => tester.pumpWidget(
          MaterialApp(home: CatImage(image: image)),
        ),
      );

      // Assert
      expect(find.byType(Image), findsOneWidget);
    });
  });
}

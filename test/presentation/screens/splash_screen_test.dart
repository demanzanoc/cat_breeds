import 'package:cats_app/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    //Arrange
    MaterialApp app = MaterialApp.router(
      routerConfig: appRouter,
    );

    //Act
    await tester.pumpWidget(app);

    //Assert
    expect(find.text('Catbreeds'), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.text('Cats app'), findsOneWidget);
  });
}

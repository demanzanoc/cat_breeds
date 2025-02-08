import 'package:cats_app/presentation/routes/routes.dart';
import 'package:cats_app/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  late GoRouter goRouter;

  setUp(() {
    goRouter = GoRouter(
      initialLocation: Routes.splash,
      routes: [
        GoRoute(
          path: Routes.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: Routes.home,
          builder: (context, state) => const Scaffold(
            body: Text('Home Screen'),
          ),
        ),
      ],
    );
  });

  group('SplashScreen tests', () {
    testWidgets('should render SplashScreen correctly', (tester) async {
      //Arrange
      MaterialApp app = MaterialApp.router(
        routerConfig: goRouter,
      );

      //Act
      await tester.pumpWidget(app);

      //Assert
      expect(find.text('Catbreeds'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text('Home Screen'), findsOneWidget);
    });
  });
}

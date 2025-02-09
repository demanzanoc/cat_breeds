import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';
import 'package:cats_app/presentation/routes/routes.dart';
import 'package:cats_app/presentation/screens/cat_breeds/cat_breed_details.dart';
import 'package:cats_app/presentation/screens/cat_breeds/home_screen.dart';
import 'package:cats_app/presentation/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: Routes.catBreedDetails,
      builder: (context, state) {
        final catBreed = state.extra as CatBreedEntity;
        return CatBreedDetails(catBreed: catBreed);
      },
    ),
  ],
);

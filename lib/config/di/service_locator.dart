import 'package:cats_app/config/di/cat_breeds/cat_breeds_locator.dart';
import 'package:get_it/get_it.dart';

abstract class ServiceLocator {
  static final serviceLocator = GetIt.instance;

  static void setUpDependencies() {
    CatBreedsLocator.setUpCatBreedsDependencies(serviceLocator);
  }
}

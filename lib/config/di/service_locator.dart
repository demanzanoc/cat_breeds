import 'package:cats_app/config/di/cat_breeds/cat_breeds_locator.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setUpDependencies() {
  setUpCatBreedsDependencies();
}

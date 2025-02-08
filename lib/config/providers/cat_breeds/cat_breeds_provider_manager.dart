import 'package:cats_app/config/di/service_locator.dart';
import 'package:provider/provider.dart';

import '../../../presentation/providers/cat_breeds/home_screen_provider.dart';

abstract class CatBreedsProviderManager {
  static List<ChangeNotifierProvider> buildProviders() {
    return [
      ChangeNotifierProvider<HomeScreenProvider>(
        create: (_) =>
            HomeScreenProvider(getCatBreedsUseCase: serviceLocator()),
      ),
    ];
  }
}

import 'package:cats_app/config/providers/cat_breeds/cat_breeds_provider_manager.dart';
import 'package:provider/single_child_widget.dart';

abstract class ProviderManager {
  static List<SingleChildWidget> buildProviders() {
    return [
      ...CatBreedsProviderManager.buildProviders(),
    ];
  }
}

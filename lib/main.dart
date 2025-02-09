import 'package:cats_app/config/di/service_locator.dart';
import 'package:cats_app/presentation/cat_breeds_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  ServiceLocator.setUpDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const CatBreedsApp());
  });
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Environment {
  static String theCatApiKey = dotenv.env['THE_CAT_API_X_API_KEY'] ?? '';
}
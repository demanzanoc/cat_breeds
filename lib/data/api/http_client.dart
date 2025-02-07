import 'package:cats_app/data/api/api_response.dart';

abstract class HttpClient {
  Future<ApiResponse> get(String url);
}

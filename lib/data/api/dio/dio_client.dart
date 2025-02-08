import 'package:cats_app/data/api/api_response.dart';
import 'package:cats_app/data/api/http_client.dart';
import 'package:dio/dio.dart';

class DioClient implements HttpClient {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.thecatapi.com/v1',
      // TODO(demanzanoc): Add the API key to a secure place.
      headers: {
        'x-api-key':
            'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr',
      },
    ),
  );

  @override
  Future<ApiResponse> get(String url) async {
    try {
      final response = await _dio.get(url);
      return ApiResponse(
        data: response.data,
        statusCode: response.statusCode ?? 500,
      );
    } catch (exception) {
      throw Exception(exception);
    }
  }
}

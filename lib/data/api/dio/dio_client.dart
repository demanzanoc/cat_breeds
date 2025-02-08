import 'package:cats_app/config/constants/environment.dart';
import 'package:cats_app/data/api/api_response.dart';
import 'package:cats_app/data/api/http_client.dart';
import 'package:dio/dio.dart';

class DioClient implements HttpClient {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.thecatapi.com/v1',
      headers: {
        'x-api-key': Environment.theCatApiKey,
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

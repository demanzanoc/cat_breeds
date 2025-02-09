import 'package:cats_app/data/api/api_response.dart';
import 'package:cats_app/data/api/http_client.dart';
import 'package:dio/dio.dart';

class DioClient implements HttpClient {
  DioClient({required Dio dio}) : _dio = dio;

  final Dio _dio;

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

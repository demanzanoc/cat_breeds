class ApiResponse {
  ApiResponse({
    required this.data,
    required this.statusCode,
  });

  final dynamic data;
  final int statusCode;
}

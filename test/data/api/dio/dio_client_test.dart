import 'package:cats_app/data/api/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/data/dio_mock.dart';

void main() {
  late Dio dio;
  late DioClient dioClient;

  void setUpDependencies() {
    dio = DioMock();
    dioClient = DioClient(dio: dio);
  }

  setUp(() {
    setUpDependencies();
  });

  group('DioClient tests', () {
    test(
      'slould return Response with statusCode: 200 when the api call is successful',
      () async {
        // Arrange
        final responseMock = Response(
            data: {}, requestOptions: RequestOptions(), statusCode: 200);
        when(() => dio.get(any())).thenAnswer((_) async => responseMock);

        // Act
        final response = await dioClient.get('path');

        // Assert
        expect(response.statusCode, 200);
      },
    );

    test(
      'slould throw a Exception when the api call fails',
      () async {
        // Arrange
        when(() => dio.get(any())).thenThrow(Exception());

        // Act - Assert
        expect(dioClient.get('path'), throwsException);
      },
    );
  });
}

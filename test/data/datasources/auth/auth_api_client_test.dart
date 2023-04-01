import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:svik2/data/data_sources/auth/auth_api_client.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late AuthApiClient authApiClient;
  late MockDioClient mockDioClient;
  const baseUrl = "http://127.0.0.1:3000";
  final responseData = {"message": "verification completed", "verified": true};

  setUp(() {
    mockDioClient = MockDioClient();
    // when(mockDioClient.options.baseUrl).thenReturn(baseUrl);
    authApiClient = AuthApiClient(dioClient: mockDioClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockDioClient.get(
      '$baseUrl/session',
      options: anyNamed('options'),
    )).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(
          path: '$baseUrl/session',
          data: responseData,
        ),
      ),
    );
  }

  group('verifySession', () {
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpvZWxAZ21haWwuY29tIiwiaWF0IjoxNjgwMzU1Njc5LCJleHAiOjE2ODAzNTkyNzl9.05l3aQhBsMjKZWx9-37uMRVDNdPtnR3i7vIO3TOx92s';

    test('should return response data on success', () async {
      setUpMockHttpClientSuccess200();
      authApiClient.verifySession(token);

      verify(
        mockDioClient.get(
          '$baseUrl/session',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        ),
      );
    });
  });
}

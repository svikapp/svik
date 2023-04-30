import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:svik2/data/data_sources/auth/auth_api_client.dart';
import 'package:http/http.dart' as http;
class MockDioClient extends Mock implements Dio {}
class MockHttpClient extends Mock implements http.Client {}

void main() {
  late AuthApiClient authApiClient;
  late MockDioClient mockDioClient;
  late MockHttpClient mockHttpClient;
  const baseUrl = "http://127.0.0.1:3000";
  final responseData = {"message": "verification completed", "verified": true};

  setUp(() {
    mockDioClient = MockDioClient();
    // when(mockDioClient.options.baseUrl).thenReturn(baseUrl);
    authApiClient = AuthApiClient(dioClient: mockDioClient);
    mockHttpClient = MockHttpClient();
  });
}

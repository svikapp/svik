import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:svik/core/error/exceptions.dart';

/// Methods related to authentication with api
class AuthApiClient {
  final Dio dioClient;
  late final Logger logger;
  AuthApiClient({required this.dioClient});

  Future<Map<String, dynamic>> verifySession(String token) async {
    logger = Logger();

    try {
      final response = await dioClient.get(
        '/user/session',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final data = response.data;
      return data['verified']?data:data['message'];
    }on DioError catch (e) {
      throw ApiException(message: e.message.toString());
    }

    // final data = response.data;
    // logger.i("Got Data for session verification");
    // if (data['verified']) {
    //   logger.i("Session verified");
    //   return data;
    // } else {
    //   logger.i("Session unverified");
    //   throw ApiException(message: data['message']);
    // }
  }

  Future<Map<String, dynamic>> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        '/user/signup',
        data: {"username": username, "email": email, "password": password},
      );
      return response.data;
    } on DioError catch (e) {
      throw ApiException(message: e.response!.data['message']);
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient
          .get('/user/login', data: {"email": email, "password": password});
      return response.data;
    } on DioError catch (e) {
      throw ApiException(message: e.response!.data['message']);
    }
  }
}

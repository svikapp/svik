import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:svik2/core/error/exceptions.dart';

class AuthApiClient {
  final Dio dioClient;
  AuthApiClient({required this.dioClient});

  // Future<Map<String, dynamic>> login(String email, String password) async {}

  Future<Map<String, dynamic>> verifySession(String token) async {
    final response = await dioClient.get(
      '/user/session',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    final data = jsonDecode(response.data);
    if (data['verified']) {
      return data;
    } else {
      throw ApiException(message: data['message']);
    }
  }
}

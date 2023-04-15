import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:svik/core/error/exceptions.dart';

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

  Future<Map<String, dynamic>> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await dioClient.get(
      '/user/signup',
      options: Options(),
    );
    final data = jsonDecode(response.data);
    if (response.statusCode == 201) {
      return data;
    } else {
      throw ApiException(message: data['message']);
    }
  }


    Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await dioClient.get(
      '/user/login',
      options: Options(),
    );
    final data = jsonDecode(response.data);
    if (response.statusCode == 201) {
      return data;
    } else {
      throw ApiException(message: data['message']);
    }
  }
}

import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';

/// Methods related to user data from [API]

class UserApiClient {
  final Dio client;

  const UserApiClient(this.client);

  //Search user
  Future<List<Map<String, dynamic>>> searchUsers(
      {required String username, required String token}) async {
    try {
      final response = await client.get(
        '/user/search',
        queryParameters: {'username': username},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      throw ApiException(message: e.message.toString());
    }
  }
}

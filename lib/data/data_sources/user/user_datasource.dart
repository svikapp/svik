// This is the interface for the data source that provides user-related functionality.
// This interface defines the contract between the data layer and the domain layer.

import 'package:svik/core/error/exceptions.dart';
import 'package:svik/data/data_sources/user/user_api_client.dart';
import 'package:svik/data/local/cache_helper.dart';
import 'package:svik/data/models/auth/user.dart';

abstract class UserDataSource {
  Future<List<User>> searchUsers({required String username});
}

// Implementes the methods of [UserDataSource]
class UserDataSourceImpl implements UserDataSource {
  final CacheHelper cacheHelper;
  final UserApiClient userApiClient;

  const UserDataSourceImpl(
      {required this.userApiClient, required this.cacheHelper});

  @override
  Future<List<User>> searchUsers({required String username}) async {
    final token = await cacheHelper.getToken();
    try {
      final results = await userApiClient.searchUsers(
        username: username,
        token: token,
      );
      List<User> users = [];
      for (var userMap in results) {
        users.add(User.fromJson(userMap));
      }
      return users;
    } on ApiException catch (e) {
      throw UserException(message: e.message);
    }
  }
}

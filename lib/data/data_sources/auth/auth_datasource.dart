import 'package:svik2/core/error/exceptions.dart';
import 'package:svik2/data/data_sources/auth/auth_api_client.dart';
import 'package:svik2/data/local/cache_helper.dart';
import 'package:svik2/data/models/auth/session_result.dart';

abstract class AuthDataSource {
  Future<SessionResult> verifySession();
}

class AuthDataSourceImpl implements AuthDataSource {
  final AuthApiClient authApiClient;
  final CacheHelper cacheHelper;

  AuthDataSourceImpl({required this.authApiClient, required this.cacheHelper});
  @override
  Future<SessionResult> verifySession() async {
    try {
      final token = await cacheHelper.getToken();
      final result = await authApiClient.verifySession(token);
      return SessionResult(
        message: result['message'],
        verified: true,
      );
    } on CacheException {
      throw AuthException(message: "no token available");
    } on ApiException catch (e) {
      throw AuthException(message: e.message);
    }
  }
}

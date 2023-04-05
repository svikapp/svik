import 'package:svik2/core/error/exceptions.dart';
import 'package:svik2/data/data_sources/auth/auth_api_client.dart';
import 'package:svik2/data/local/cache_helper.dart';
import 'package:svik2/data/models/auth/session_result.dart';

// This is the interface for the data source that provides authentication-related functionality.
// This interface defines the contract between the data layer and the domain layer.
abstract class AuthDataSource {
  // This method verifies the user's authentication session and returns the result as a `SessionResult`.
  // The [SessionResult] type is defined in the domain layer and is used to encapsulate the result of the verification process.
  Future<SessionResult> verifySession();

  // This method logs the user out of the system by invalidating their authentication token or session.
  // The method doesn't return any data, as its purpose is to perform a side-effect (i.e., logging out the user).
  Future<void> logout();
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

  @override
  Future<void> logout() async {
    try {
      await cacheHelper.deleteToken();
    } on CacheException{
      throw AuthException(message: "Error Logging out");
    }
  }
}

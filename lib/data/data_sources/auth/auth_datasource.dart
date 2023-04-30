import 'package:svik/core/error/exceptions.dart';
import 'package:svik/data/data_sources/auth/auth_api_client.dart';
import 'package:svik/data/local/cache_helper.dart';
import 'package:svik/data/models/auth/auth_result.dart';
import 'package:svik/data/models/auth/session_result.dart';

// This is the interface for the data source that provides authentication-related functionality.
// This interface defines the contract between the data layer and the domain layer.
abstract class AuthDataSource {

  Future<AuthResult> signup({required String username,required String email,required String password});
  Future<AuthResult> login({required String email,required String password});
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
      return SessionResult.fromJson(result);
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
  
  @override
  Future<AuthResult> login({required String email, required String password})async {
    try {
      final response = await authApiClient.login(email: email, password: password);
      await cacheHelper.saveToken(response['message']);
      return AuthResult.fromJson(response);
    } on ApiException catch(e) {
      throw AuthException(message:e. message);
    }
  }
  
  @override
  Future<AuthResult> signup({required String username, required String email, required String password})async {
    try {
      final response = await authApiClient.signup(username: username, email: email, password: password);
      await cacheHelper.saveToken(response['message']);
      return AuthResult.fromJson(response);
    } on ApiException catch(e) {
      throw AuthException(message:e. message);
    }
  }
}

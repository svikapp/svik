class CacheException {}

class ApiException {
  final String message;
  ApiException({required this.message});
}

class AuthException {
  final String message;
  AuthException({required this.message});
}

class UserException {
  final String message;
  UserException({required this.message});
}

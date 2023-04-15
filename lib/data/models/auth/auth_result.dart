import 'package:svik/domain/entities/auth/auth_result.dart';

class AuthResult extends AuthResultEntity {
  const AuthResult(
      {required super.code,
      required super.message,
      required super.authentication});

  factory AuthResult.fromJson(Map<String, dynamic> json) {
    return AuthResult(
      code: json['code'],
      message: json['message'],
      authentication: json['authentication'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'authentication': authentication,
    };
  }
}

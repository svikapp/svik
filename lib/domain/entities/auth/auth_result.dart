import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthResult extends Equatable {
  int code;
  String message;
  bool authentication;
  AuthResult({
    required this.code,
    required this.message,
    required this.authentication,
  });
  
  @override
  List<Object?> get props => throw UnimplementedError();


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'authentication': authentication,
    };
  }

  factory AuthResult.fromMap(Map<String, dynamic> map) {
    return AuthResult(
      code: map['code'] as int,
      message: map['message'] as String,
      authentication: map['authentication'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResult.fromJson(String source) => AuthResult.fromMap(json.decode(source) as Map<String, dynamic>);
}

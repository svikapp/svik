import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthResultEntity extends Equatable {
  final int code;
  final String message;
  final bool authentication;
  const AuthResultEntity({
    required this.code,
    required this.message,
    required this.authentication,
  });
  
  @override
  List<Object?> get props => [code,message,authentication];


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'authentication': authentication,
    };
  }

  factory AuthResultEntity.fromMap(Map<String, dynamic> map) {
    return AuthResultEntity(
      code: map['code'] as int,
      message: map['message'] as String,
      authentication: map['authentication'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResultEntity.fromJson(String source) => AuthResultEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

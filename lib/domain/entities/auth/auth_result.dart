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
}

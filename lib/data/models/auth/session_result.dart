import 'package:svik/domain/entities/auth/session_result.dart';

class SessionResult extends SessionResultEntity {
  const SessionResult({required super.message, required super.verified});

  factory SessionResult.fromJson(Map<String, dynamic> json) {
    return SessionResult(
      message: json['message'],
      verified: json['verified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'verified': verified,
    };
  }
}

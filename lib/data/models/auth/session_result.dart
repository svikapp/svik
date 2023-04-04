import 'package:svik2/domain/entities/auth/session_result.dart';

class SessionResult extends SessionResultEntity {
  final String message;
  final bool verified;
  SessionResult({required this.message, required this.verified})
      : super(
          message: message,
          verified: verified,
        );
}

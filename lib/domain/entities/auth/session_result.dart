import 'package:equatable/equatable.dart';

class SessionResultEntity extends Equatable {
  final String message;
  final bool verified;
  const SessionResultEntity({required this.message, required this.verified});

  @override
  List<Object?> get props => [message, verified];
}

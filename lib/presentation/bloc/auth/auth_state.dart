part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {}

class UnAuthenticated extends AuthState {}

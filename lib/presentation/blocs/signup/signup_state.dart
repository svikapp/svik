part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
  
  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupFailure extends SignupState {
  final String message;

  const SignupFailure({required this.message});

  @override
  List<Object> get props => [message];
}
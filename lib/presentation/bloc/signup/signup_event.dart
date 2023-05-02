part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupButtonPressed extends SignupEvent {
  final String username;
  final String email;
  final String password;

  const SignupButtonPressed(this.username, this.email, this.password);

  @override
  List<Object> get props => [username,email, password];
}

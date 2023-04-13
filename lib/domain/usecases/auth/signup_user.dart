import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:svik2/core/error/failures.dart';
import 'package:svik2/core/usecases/usecase.dart';
import 'package:svik2/domain/entities/auth/auth_result.dart';
import 'package:svik2/domain/repositories/auth/auth_repository.dart';

// SignupUser calls the signup method from AuthRepository
class SignupUser implements UseCase<AuthResultEntity, SignupParams> {
  final AuthRepository authRepository;

  SignupUser({required this.authRepository});
  @override
  Future<Either<Failure, AuthResultEntity>> call(SignupParams params) async {
    return await authRepository.signup(
      params.username,
      params.email,
      params.password,
    );
  }
}

// Params for signup usecase
class SignupParams extends Equatable {
  final String username;
  final String email;
  final String password;
  const SignupParams(
      {required this.username, required this.email, required this.password});
  @override
  List<Object> get props => [username, email, password];
}

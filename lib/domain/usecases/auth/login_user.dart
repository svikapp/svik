import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:svik/core/error/failures.dart';
import 'package:svik/core/usecases/usecase.dart';
import 'package:svik/domain/repositories/auth/auth_repository.dart';

import '../../entities/auth/auth_result.dart';

class LoginUser implements UseCase<AuthResultEntity,LoginParams> {
  final AuthRepository authRepository;

  LoginUser({required this.authRepository});

  @override
  Future<Either<AuthFailure, AuthResultEntity>> call(LoginParams params) async {
    return authRepository.login(params.email, params.password);
  }
  
}


// Params for signup usecase
class LoginParams extends Equatable {
  final String email;
  final String password;
  const LoginParams(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}
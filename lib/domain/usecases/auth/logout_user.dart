import 'package:svik/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:svik/core/usecases/usecase.dart';
import 'package:svik/domain/repositories/auth/auth_repository.dart';

/// Logs the user out
class LogoutUser implements UseCase<void,NoParams>{
  final AuthRepository authRepository;

  LogoutUser({required this.authRepository});
  @override
  Future<Either<AuthFailure, void>> call(NoParams params)async {
    return await authRepository.logout(); 
  }
}
import 'package:svik/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:svik/core/usecases/usecase.dart';
import 'package:svik/domain/entities/auth/session_result.dart';
import 'package:svik/domain/repositories/auth/auth_repository.dart';

class VerifySession implements UseCase<SessionResultEntity,NoParams> {
  final AuthRepository authRepository;

  VerifySession({required this.authRepository});
  @override
  Future<Either<Failure, SessionResultEntity>> call(NoParams params)async {
    return await authRepository.verifySession();
  }
}
import 'package:svik2/data/data_sources/auth/auth_datasource.dart';
import 'package:svik2/domain/entities/auth/auth_result.dart';
import 'package:svik2/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:svik2/domain/entities/auth/session_result.dart';
import 'package:svik2/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  AuthRepositoryImpl({required this.authDataSource});
  @override
  Future<Either<AuthFailure, AuthResultEntity>> login(
      String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, AuthResultEntity>> signup(
      String username, String email, String password) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SessionResultEntity>> verifySession()async {
    try {
      final res = await authDataSource.verifySession();
      return Right(res);
    } catch (e) {
      return Left(SessionFailure());
    }
  }
}

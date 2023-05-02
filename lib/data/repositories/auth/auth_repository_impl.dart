import 'package:svik/core/error/exceptions.dart';
import 'package:svik/data/data_sources/auth/auth_datasource.dart';
import 'package:svik/domain/entities/auth/auth_result.dart';
import 'package:svik/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:svik/domain/entities/auth/session_result.dart';
import 'package:svik/domain/repositories/auth/auth_repository.dart';


/// Implements the [AuthRepository] methods
/// login,logout,signup,verifySession methods
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  AuthRepositoryImpl({required this.authDataSource});
  @override
  Future<Either<AuthFailure, AuthResultEntity>> login(
    String email,
    String password,
  ) async {
    try {
      return Right(
          await authDataSource.login(email: email, password: password));
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    }
  }

  @override
  Future<Either<AuthFailure, AuthResultEntity>> signup(
    String username,
    String email,
    String password,
  )async {
    try {
      return Right(await authDataSource.signup(username: username,email: email,password: password));
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    }
  }

  @override
  Future<Either<SessionFailure, SessionResultEntity>> verifySession() async {
    try {
      final res = await authDataSource.verifySession();
      return Right(res);
    }on AuthException catch (e) {
      return Left(SessionFailure(message: e.message));
    }
  }

  @override
  Future<Either<AuthFailure, void>> logout() async {
    try {
      return Right(await authDataSource.logout());
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    }
  }
}

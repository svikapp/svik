import 'package:dartz/dartz.dart';
import 'package:svik/core/error/failures.dart';
import 'package:svik/domain/entities/auth/auth_result.dart';

import '../../entities/auth/session_result.dart';


/// An abstract class that defines the interface for authentication repositories.
///
/// Implementations of this class should provide methods for authenticating users with a backend server,
/// including signing up new users, logging in existing users, and logging out users.


abstract class AuthRepository {

  /// Signup the user with the given [username], [email], and [password].
  ///
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthFailure]
  /// if there was an error with the signup process, or an [AuthResultEntity] if the signup was successful.
  ///
  /// Throws an [AuthException] if there is a problem communicating with the authentication server.
  
  Future<Either<AuthFailure, AuthResultEntity>> signup(
    String username,
    String email,
    String password,
  );


  /// Signup the user with the given [email] and [password].
  ///
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthFailure]
  /// if there was an error with the signup process, or an [AuthResultEntity] if the signup was successful.
  ///
  /// Throws an [AuthException] if there is a problem communicating with the authentication server.

  Future<Either<AuthFailure, AuthResultEntity>> login(
    String email,
    String password,
  );


  /// logs out the user 
  ///
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthFailure]
  /// if there was an error with the signup process, or an [void] if the signup was successful.
  ///
  /// Throws an [AuthException] if there is a problem communicating with the authentication server.

  Future<Either<AuthFailure,void>> logout();

  Future<Either<Failure,SessionResultEntity>> verifySession();
  
}

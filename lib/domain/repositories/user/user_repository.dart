import 'package:dartz/dartz.dart';
import 'package:svik/core/error/failures.dart';
import 'package:svik/domain/entities/auth/user.dart';

/// An abstract class that defines the interface for user repositories.
///
/// Implementations of this class should provide methods for user's data with a backend server,

abstract class UserRepository {
  Future<Either<Failure,List<UserEntity>>> searchUsers(String username);
}
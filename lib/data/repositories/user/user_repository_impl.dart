// Implements the methods of [UserRepository]
import 'package:svik/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:svik/data/data_sources/user/user_datasource.dart';
import 'package:svik/domain/entities/auth/user.dart';
import 'package:svik/domain/repositories/user/user_repository.dart';

import '../../../core/error/exceptions.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  const UserRepositoryImpl({required this.userDataSource});

  @override
  Future<Either<Failure, List<UserEntity>>> searchUsers(String username) async {
    try {
      return Right(await userDataSource.searchUsers(username: username));
    } on UserException catch (e) {
      return Left(UserFailure(message: e.message));
    }
  }
}

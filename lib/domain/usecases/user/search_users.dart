// Usecase for searching users
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:svik/core/error/failures.dart';
import 'package:svik/core/usecases/usecase.dart';
import 'package:svik/domain/entities/auth/user.dart';
import 'package:svik/domain/repositories/user/user_repository.dart';

class SearchUsers implements UseCase<List<UserEntity>,SearchUsersParams> {
  final UserRepository userRepository;
  const SearchUsers({required this.userRepository});
  @override
  Future<Either<Failure, List<UserEntity>>> call(SearchUsersParams params)async {
    return await userRepository.searchUsers(params.username);
  }

}

class SearchUsersParams extends Equatable {
  final String username;
  const SearchUsersParams(this.username);
  
  @override
  List<Object?> get props => [username];
}
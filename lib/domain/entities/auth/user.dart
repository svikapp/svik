import 'package:equatable/equatable.dart';

// This entity is used in search page

class UserEntity extends Equatable {
  final String id;
  final String username;
  final String photourl;
  final bool isFriend;
  const UserEntity({
    required this.id,
    required this.username,
    required this.photourl,
    required this.isFriend,
  });
  @override
  List<Object> get props => [id, username, photourl, isFriend];
}

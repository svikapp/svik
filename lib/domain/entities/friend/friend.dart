// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';


// This entitiy is used in friend list page

class FriendEntity extends Equatable {
  final String id;
  final String username;
  final String photourl;
  const FriendEntity({
    required this.id,
    required this.username,
    required this.photourl,
  });
  @override
  List<Object> get props => [id, username, photourl];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  FriendEntity copyWith({
    String? id,
    String? username,
    String? photourl,
  }) {
    return FriendEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      photourl: photourl ?? this.photourl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': id,
      'user_username': username,
      'user_photourl': photourl,
    };
  }

  factory FriendEntity.fromMap(Map<String, dynamic> map) {
    return FriendEntity(
      id: map['user_id'] as String,
      username: map['user_username'] as String,
      photourl: map['user_photourl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FriendEntity.fromJson(String source) => FriendEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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


  UserEntity copyWith({
    String? id,
    String? username,
    String? photourl,
    bool? isFriend,
  }) {
    return UserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      photourl: photourl ?? this.photourl,
      isFriend: isFriend ?? this.isFriend,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': id,
      'user_username': username,
      'user_photourl': photourl,
      'isFriend': isFriend,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['user_id'] as String,
      username: map['user_username'] as String,
      photourl: map['user_photourl'] as String,
      isFriend: map['isFriend'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

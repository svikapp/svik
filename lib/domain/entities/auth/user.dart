import 'dart:convert';

import 'package:equatable/equatable.dart';


// This entity is used in search page

class UserEntity extends Equatable {
  String id;
  String username;
  String photourl;
  bool isFriend;
  UserEntity(
    this.id,
    this.username,
    this.photourl,
    this.isFriend,
  );
  @override
  List<Object> get props => [id, username, photourl, isFriend];

  UserEntity copyWith({
    String? id,
    String? username,
    String? photourl,
    bool? isFriend,
  }) {
    return UserEntity(
      id ?? this.id,
      username ?? this.username,
      photourl ?? this.photourl,
      isFriend ?? this.isFriend,
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
      map['user_id'] as String,
      map['user_username'] as String,
      map['user_photourl'] as String,
      map['isFriend'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

import 'dart:convert';

import 'package:svik2/domain/entities/auth/user.dart';

class UserModel extends UserEntity {
  final String id;
  final String username;
  final String photourl;
  final bool isFriend;

  const UserModel({
    required this.id,
    required this.username,
    required this.photourl,
    required this.isFriend,
  }) : super(id:id, username:username, photourl:photourl, isFriend: isFriend);

  @override
  UserModel copyWith({
    String? id,
    String? username,
    String? photourl,
    bool? isFriend,
  }) {
    return UserModel(
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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['user_id'] as String,
      username: map['user_username'] as String,
      photourl: map['user_photourl'] as String,
      isFriend: map['isFriend'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, photourl: $photourl, isFriend: $isFriend)';
  }
}

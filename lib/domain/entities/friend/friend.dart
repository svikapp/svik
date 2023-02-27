// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';


// This entitiy is used in friend list page

class Friend extends Equatable {
  String id;
  String username;
  String photourl;
  Friend({
    required this.id,
    required this.username,
    required this.photourl,
  });
  @override
  List<Object> get props => [id, username, photourl];

  Friend copyWith({
    String? id,
    String? username,
    String? photourl,
  }) {
    return Friend(
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

  factory Friend.fromMap(Map<String, dynamic> map) {
    return Friend(
      id: map['user_id'] as String,
      username: map['user_username'] as String,
      photourl: map['user_photourl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Friend.fromJson(String source) => Friend.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

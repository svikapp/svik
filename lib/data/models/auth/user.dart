import 'package:svik/domain/entities/auth/user.dart';

class User extends UserEntity {
  const User({
    required super.id,
    required super.username,
    required super.photourl,
    required super.isFriend,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': id,
      'user_username': username,
      'user_photourl': photourl,
      'isFriend': isFriend,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['user_id'] as String,
      username: map['user_username'] as String,
      photourl: map['user_photourl'] as String,
      isFriend: map['isFriend'] as bool,
    );
  }
}

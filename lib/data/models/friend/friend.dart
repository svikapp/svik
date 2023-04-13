import 'package:svik2/domain/entities/friend/friend.dart';

class Friend extends FriendEntity {
  const Friend({required super.id, required super.username, required super.photourl});
  

  
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': id,
      'user_username': username,
      'user_photourl': photourl,
    };
  }

  factory Friend.fomJson(Map<String, dynamic> map) {
    return Friend(
      id: map['user_id'] as String,
      username: map['user_username'] as String,
      photourl: map['user_photourl'] as String,
    );
  }
}
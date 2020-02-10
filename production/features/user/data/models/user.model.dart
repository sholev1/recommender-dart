import 'package:flutter/foundation.dart';
import 'package:recommend/core/abstractions/models/models.interface.dart';
import 'package:recommend/production/features/user/domain/entities/user.entity.dart';

class UserModel extends User implements Modelable
{
  UserModel( {
    @required userUID,
    @required username,
    @required email,
    @required password,
    @required numUserId,
    }) : super(userUID: userUID, numUserId: numUserId, username: username, email: email, password: password);





  factory UserModel.fromJson(Map json)
  {
    return UserModel(
      userUID: json['user_id'],
      username: json['username'],
      numUserId: json['num_user_id'],
      email: json['email'],
      password: json['password'], 

    );
  }

  Map<String, dynamic> toJson(User instance) => <String, dynamic>{};


}
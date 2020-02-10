import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:recommend/core/abstractions/entities/entity.interface.dart';

class User extends Equatable implements Entity
{
  String userUID;
  String username;
  int numUserId;
  final String email;
  final String password;

  User({
    @required this.userUID,
    @required this.numUserId,
    @required this.username, 
    @required this.email, 
    @required this.password
    });
}
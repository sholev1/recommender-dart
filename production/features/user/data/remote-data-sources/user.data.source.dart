import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/foundation.dart';
import 'package:recommend/core/errors/server.exception.dart';
import 'package:recommend/production/features/movie/data/models/movie.model.dart';
import "package:http/http.dart" as http;
import 'package:recommend/production/features/user/data/models/user.model.dart';

abstract class UserRemoteDataSource {
  /// Calls the http://tmdb.api/movies endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> getUserInformation(String uuid);
}

class UserRemoteDataSourceImplementation implements UserRemoteDataSource {
  final fs.Firestore firestore;

  UserRemoteDataSourceImplementation({@required this.firestore});
  @override
  Future<UserModel> getUserInformation(String uuid) => getUserInformationFromDB(uuid);

  Future<UserModel> getUserInformationFromDB(String uuid) async {
    var snap = await firestore.collection('users').doc(uuid).get();

    return UserModel.fromJson(snap.data());

    // if (response.statusCode == 200) {
    //   return UserModel.fromJson(json.decode(response.body));
    // } else {
    //   throw ServerException();
    // }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:recommend/core/errors/server.exception.dart';
import 'package:recommend/production/features/movie/data/models/movie.model.dart';
import "package:http/http.dart" as http;

abstract class MovieRemoteDataSource {
  /// Calls the http://tmdb.api/movies endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MovieModel> getMovieInformation(int id);
}

class MovieRemoteDataSourceImplementation implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImplementation({@required this.client});
  @override
  Future<MovieModel> getMovieInformation(int id) => getMovieInformationFromUrl("https://api.themoviedb.org/3/movie/$id?&api_key=cfe422613b250f702980a3bbf9e90716");

  Future<MovieModel> getMovieInformationFromUrl(String url) async {

    
    final response = await client.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      },
    );

    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:recommend/production/features/movie/domain/entities/movie.entity.dart';
import 'package:recommend/core/abstractions/models/models.interface.dart';


class MovieModel extends Movie implements Modelable
{
  MovieModel( {
    @required id,
    @required title,
    @required tagline,
    @required overview,
    @required vote_count,
    @required vote_average}) : super(id: id, title: title, tagline: tagline, overview : overview, vote_count : vote_count, vote_average : vote_average);


  factory MovieModel.fromJson(Map<String, dynamic> json)
  {
    var model = MovieModel(
      id: json["id"],
      title: json["title"],
      tagline: json["tagline"] ,
      overview: json["overview"],
      vote_count: json["vote_count"],
      vote_average: json["vote_average"]);
      return model;
  }

  Map<String, dynamic> toJson(Movie instance) => <String, dynamic>{
    'id': instance.id,
    'title' : instance.title,
    'tagline' : instance.tagline,
    'overview' : instance.overview,
    'vote_count' : instance.vote_count,
    'vote_average' : instance.vote_average
  };


}
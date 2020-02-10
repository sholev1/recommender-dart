import 'package:flutter/foundation.dart';
import 'package:recommend/production/features/rating/domain/entities/rating.entity.dart';
import 'package:recommend/core/abstractions/models/models.interface.dart';

class RatingModel extends Rating implements Modelable
{
  RatingModel( {
    @required userId,
    @required movieId,
    @required rating
  }) : super(userId: userId, movieId: movieId, rating: rating);


  factory RatingModel.fromJson(Map<String, dynamic> json)
  {
    return RatingModel(
      movieId: json['movie_id' as int],
      userId: json['user_id' as int],
      rating: json['int' as double],
    );
  }

  Map<String, dynamic> toJson(Rating instance) => <String, dynamic>{
    'user_id': instance.userId,
    'movie_id' : instance.movieId,
    'rating' : instance.rating
  };
}
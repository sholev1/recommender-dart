import 'package:flutter/foundation.dart';
import 'package:recommend/core/abstractions/entities/entity.interface.dart';

class Rating implements Entity
{
  final int userId;
  final int movieId;
  final double rating;

  Rating({
    @required this.userId,
    @required this.movieId,
    @required this.rating
  });

}

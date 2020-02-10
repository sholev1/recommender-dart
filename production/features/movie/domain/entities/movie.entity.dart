import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:recommend/core/abstractions/entities/entity.interface.dart';
import 'package:recommend/core/abstractions/entities/item.interface.dart';

class Movie extends Equatable implements Entity, Item
{
  final int id;
  final String title;
  final String tagline;
  final String overview;
  final int vote_count;
  final num vote_average;

  Movie( {
    @required this.id,
    @required this.title,
    @required this.tagline,
    @required this.overview,
    @required this.vote_count,
    @required this.vote_average
  });
}

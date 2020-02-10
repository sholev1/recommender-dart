import 'package:hive/hive.dart';

part 'rating.adapter.g.dart';


@HiveType()
class Rating
{
  @HiveField(0)
  final int userId;
  @HiveField(1)
  final int movieId;
  @HiveField(2)
  final double rating;

  Rating(this.userId, this.movieId, this.rating);
}
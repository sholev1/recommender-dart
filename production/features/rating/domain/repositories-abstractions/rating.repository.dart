import 'package:dartz/dartz.dart';
import 'package:recommend/production/features/rating/domain/entities/rating.entity.dart';
import 'package:recommend/core/errors/failure.interface.dart';

abstract class RatingRepository
{
  Future<Either<Failure, Rating>> getRatingInformation(int userId, int movieId);
}
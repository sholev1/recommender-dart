import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:recommend/core/abstractions/usecase/usecase.interface.dart';
import 'package:recommend/production/features/rating/domain/entities/rating.entity.dart';
import 'package:recommend/core/errors/failure.interface.dart';
import 'package:recommend/production/features/rating/domain/repositories-abstractions/rating.repository.dart';

class GetRatingInformation implements UseCase<Rating, Params>
{
  final RatingRepository repository;

  GetRatingInformation(this.repository);

  @override
  Future<Either<Failure, Rating>> call(Params params) async 
  {
    return await repository.getRatingInformation(params.userId, params.movieId);
  }

}

class Params extends Equatable
{
  final int userId;
  final int movieId;
  Params({@required this.userId, @required this.movieId}) : super([userId, movieId]);
}
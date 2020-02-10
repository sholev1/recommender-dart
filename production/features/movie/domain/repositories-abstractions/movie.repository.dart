import 'package:dartz/dartz.dart';
import 'package:recommend/production/features/movie/domain/entities/movie.entity.dart';
import 'package:recommend/core/errors/failure.interface.dart';

abstract class MovieRepository
{
  Future<Either<Failure, Movie>> getMovieInformation(int id);
}

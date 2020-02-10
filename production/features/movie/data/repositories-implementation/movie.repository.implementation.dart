import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:recommend/core/network/instance.network.information.dart';
import 'package:recommend/production/features/movie/data/remote-data-sources/movie.remote.datasource.dart';
import 'package:recommend/production/features/movie/domain/entities/movie.entity.dart';
import 'package:recommend/core/errors/failure.interface.dart';
import 'package:recommend/core/errors/server.exception.dart';
import 'package:recommend/core/errors/server.failure.dart';
import 'package:recommend/production/features/movie/domain/repositories-abstractions/movie.repository.dart';

class MovieRepositoryImplementation implements MovieRepository
{
  final MovieRemoteDataSource remoteDataSource;
  final NetworkInformation networkInformation;

  MovieRepositoryImplementation({
    @required this.remoteDataSource, 
    @required this.networkInformation
    });

  @override
  Future<Either<Failure, Movie>> getMovieInformation(int id) 
  async {
    try {
      networkInformation.isConnected;

    return Right(await remoteDataSource.getMovieInformation(id));

    }
    on ServerException
    {
      return Left(ServerFailure());
    }
  }
  
}
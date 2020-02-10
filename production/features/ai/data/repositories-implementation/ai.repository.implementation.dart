import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:recommend/production/features/ai/data/remote-data-sources/ai.remote.datasource.dart';
import 'package:recommend/production/features/ai/domain/entities/ai.entity.dart';
import 'package:recommend/core/errors/failure.interface.dart';
import 'package:recommend/core/errors/server.exception.dart';
import 'package:recommend/core/errors/server.failure.dart';
import 'package:recommend/production/features/ai/domain/repositories-abstractions/ai.repository.dart';
import 'package:recommend/core/network/instance.network.information.dart';

class ArtificialIntelligenceKNNRepositoryImplementation implements ArtificialIntelligenceKNNRepository
{
  final ArtificialIntelligenceKNNRemoteDataSource remoteDataSource;
  final NetworkInformation networkInformation;

  ArtificialIntelligenceKNNRepositoryImplementation({
    @required this.remoteDataSource, 
    @required this.networkInformation});


  @override
  Future<Either<Failure, ArtificialIntelligenceKNN>> getSuggestions(int movieId, int n_suggestions) 
  async {
    try {
      networkInformation.isConnected;

    return Right(await remoteDataSource.getSuggestions(movieId, n_suggestions));

    }
    on ServerException
    {
      return Left(ServerFailure());
    }

  }
}
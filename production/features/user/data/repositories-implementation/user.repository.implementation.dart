import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:recommend/core/errors/failure.interface.dart';
import 'package:recommend/core/errors/server.exception.dart';
import 'package:recommend/core/errors/server.failure.dart';
import 'package:recommend/core/network/instance.network.information.dart';
import 'package:recommend/production/features/user/data/remote-data-sources/user.data.source.dart';
import 'package:recommend/production/features/user/domain/entities/user.entity.dart';
import 'package:recommend/production/features/user/domain/repositories-abstractions/user.repository.dart';

class UserRepositoryImplementation implements UserRepository
{
  final UserRemoteDataSource remoteDataSource;
  final NetworkInformation networkInformation;

  UserRepositoryImplementation({
    @required this.remoteDataSource, 
    @required this.networkInformation
    });

  @override
  Future<Either<Failure, User>> getUserInformation(String uuid) 
  async {
    try {
      networkInformation.isConnected;

    return Right(await remoteDataSource.getUserInformation(uuid));

    }
    on ServerException
    {
      return Left(ServerFailure());
    }
  }
}
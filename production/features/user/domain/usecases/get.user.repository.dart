import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:recommend/core/abstractions/usecase/usecase.interface.dart';
import 'package:recommend/core/errors/failure.interface.dart';
import 'package:recommend/production/features/user/domain/entities/user.entity.dart';
import 'package:recommend/production/features/user/domain/repositories-abstractions/user.repository.dart';

class GetUserInformation implements UseCase<User, Params>
{
  final UserRepository repository;

  GetUserInformation(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async 
  {
    return await repository.getUserInformation(params.uuid);
  }

}

class Params extends Equatable
{
  final String uuid;
  Params({@required this.uuid}) : super([id]);
}
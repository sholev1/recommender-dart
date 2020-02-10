import 'package:dartz/dartz.dart';
import 'package:recommend/core/errors/failure.interface.dart';
import 'package:recommend/production/features/user/domain/entities/user.entity.dart';

abstract class UserRepository
{
  Future<Either<Failure,User>> getUserInformation(String uuid);
}
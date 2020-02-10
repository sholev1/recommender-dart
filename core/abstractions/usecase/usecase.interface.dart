import 'package:dartz/dartz.dart';
import 'package:recommend/core/errors/failure.interface.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call(Params params);

}
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:recommend/core/abstractions/usecase/usecase.interface.dart';
import 'package:recommend/production/features/ai/domain/entities/ai.entity.dart';
import 'package:recommend/core/errors/failure.interface.dart';
import 'package:recommend/production/features/ai/domain/repositories-abstractions/ai.repository.dart';

class GetAISuggestions implements UseCase<ArtificialIntelligenceKNN, Params>
{
  final ArtificialIntelligenceKNNRepository repository;

  GetAISuggestions(this.repository);

  @override
  Future<Either<Failure, ArtificialIntelligenceKNN>> call(Params params) async 
  {
    return await repository.getSuggestions(params.id, params.n_suggestions);
  }

}

class Params extends Equatable
{
  final int id;
  final int n_suggestions;
  Params({@required this.id, @required this.n_suggestions}) : super([id, n_suggestions]);
}
import 'package:dartz/dartz.dart';
import 'package:recommend/production/features/ai/domain/entities/ai.entity.dart';
import 'package:recommend/core/errors/failure.interface.dart';

abstract class ArtificialIntelligenceKNNRepository
{
  Future<Either<Failure,ArtificialIntelligenceKNN>> getSuggestions(int movieId, int n_suggestions);
}
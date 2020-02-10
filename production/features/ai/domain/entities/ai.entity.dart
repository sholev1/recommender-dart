import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:recommend/core/abstractions/entities/entity.interface.dart';

class ArtificialIntelligenceKNN extends Equatable implements Entity
{
  final List<int> suggestions;

  ArtificialIntelligenceKNN({@required this.suggestions});

}
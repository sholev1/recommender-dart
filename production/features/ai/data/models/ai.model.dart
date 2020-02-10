
import 'package:flutter/foundation.dart';
import 'package:recommend/production/features/ai/domain/entities/ai.entity.dart';

class ArtificialIntelligenceKNNModel extends ArtificialIntelligenceKNN
{
  ArtificialIntelligenceKNNModel({@required suggestions}) : super(suggestions: suggestions);

  factory ArtificialIntelligenceKNNModel.fromJson(Map<String, dynamic> json)
  {

    print (ArtificialIntelligenceKNNModel(suggestions: json['suggestions']));
    return ArtificialIntelligenceKNNModel(
      suggestions: json["suggestions"]
    );
  }

  Map<String, dynamic> toJson(ArtificialIntelligenceKNN instance) => <String, dynamic>{
    'suggestions' : instance.suggestions
  };

}

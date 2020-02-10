import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:recommend/core/errors/server.exception.dart';
import 'package:recommend/production/features/ai/data/models/ai.model.dart';
import "package:http/http.dart" as http;

abstract class ArtificialIntelligenceKNNRemoteDataSource {
  /// Calls the http://tmdb.api/movies endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ArtificialIntelligenceKNNModel> getSuggestions(int movieId, nSuggestions);
}

class ArtificialIntelligenceKNNRemoteDataSourceImplementation implements ArtificialIntelligenceKNNRemoteDataSource {
  final http.Client client;

  ArtificialIntelligenceKNNRemoteDataSourceImplementation({@required this.client});
  @override
  Future<ArtificialIntelligenceKNNModel> getSuggestions(int movieId, nSuggestions) async => await _getAIInformationFromUrl("https://diamond-betty.herokuapp.com/$movieId/$nSuggestions");

  Future<ArtificialIntelligenceKNNModel> _getAIInformationFromUrl(String url) async {

    
    final response = await client.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      },
    );

    if (response.statusCode == 200) {
      return ArtificialIntelligenceKNNModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
  }
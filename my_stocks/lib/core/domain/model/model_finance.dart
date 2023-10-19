import 'dart:convert';

import 'package:my_stocks/core/domain/model/model_results.dart';

class ModelFinance {
  final String by;
  final bool validKey;
  final ModelResults results;
  final int executionTime;
  final bool fromCache;

  ModelFinance(
      {required this.by,
      required this.validKey,
      required this.results,
      required this.executionTime,
      required this.fromCache});

  Map<String, dynamic> toMap() {
    return {
      "by": by,
      "valid_key": validKey,
      "results": results?.toMap() ?? {},
      "execution_time": executionTime,
      "from_cache": fromCache,
    };
  }

  factory ModelFinance.fromMap(Map<String, dynamic> map) {
    return ModelFinance(
      by: map['by'] ?? '',
      validKey: map['valid_key'] ?? false,
      results: ModelResults.fromMap(map['results']),
      executionTime: map['execution_time'] ?? 0,
      fromCache: map['from_cache'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelFinance.fromJson(String source) =>
      ModelFinance.fromMap(json.decode(source));
}

import 'dart:convert';

import 'package:my_stocks/core/domain/model/model_bitcoin.dart';
import 'package:my_stocks/core/domain/model/model_currencies.dart';
import 'package:my_stocks/core/domain/model/model_stocks.dart';
import 'package:my_stocks/core/domain/model/model_tax.dart';

class ModelResults {
  final ModelCurrencies currencies;
  final ModelStocks stocks;
  final List<String> availableSources;
  final ModelBitcoin bitcoin;
  final List<ModelTax> taxes;

  ModelResults(
      {required this.currencies,
      required this.stocks,
      required this.availableSources,
      required this.bitcoin,
      required this.taxes});

  Map<String, dynamic> toMap() {
    return {
      "currencies": currencies.toJson(),
      "stocks": stocks.toJson(),
      "available_sources": List<dynamic>.from(availableSources.map((x) => x)),
      "bitcoin": bitcoin.toJson(),
      "taxes": List<dynamic>.from(taxes.map((x) => x.toJson())),
    };
  }

  factory ModelResults.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return ModelResults(
        currencies: ModelCurrencies.fromMap({}),
        stocks: ModelStocks.fromMap({}),
        availableSources: [],
        bitcoin: ModelBitcoin.fromMap({}),
        taxes: [],
      );
    }

    return ModelResults(
      currencies: ModelCurrencies.fromMap(map['currencies']),
      stocks: ModelStocks.fromMap(map['stocks']),
      availableSources:
          List<String>.from(map['available_sources'].map((x) => x)),
      bitcoin: ModelBitcoin.fromJson(map['bitcoin']),
      taxes: List<ModelTax>.from(map['taxes'].map((x) => x)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelResults.fromJson(String source) =>
      ModelResults.fromMap(json.decode(source));
}

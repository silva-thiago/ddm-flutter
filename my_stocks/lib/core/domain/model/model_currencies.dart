import 'dart:convert';

import 'package:my_stocks/core/domain/model/model_iso_currency.dart';

class ModelCurrencies {
  final String source;
  final ModelISOCurrency USD;
  final ModelISOCurrency EUR;
  final ModelISOCurrency GBP;
  final ModelISOCurrency ARS;
  final ModelISOCurrency CAD;
  final ModelISOCurrency AUD;
  final ModelISOCurrency JPY;
  final ModelISOCurrency CNY;
  final ModelISOCurrency BTC;

  ModelCurrencies(
      {required this.source,
      required this.USD,
      required this.EUR,
      required this.GBP,
      required this.ARS,
      required this.CAD,
      required this.AUD,
      required this.JPY,
      required this.CNY,
      required this.BTC});

  Map<String, dynamic> toMap() {
    return {
      "source": source,
      "USD": USD.toJson(),
      "EUR": EUR.toJson(),
      "GBP": GBP.toJson(),
      "ARS": ARS.toJson(),
      "CAD": CAD.toJson(),
      "AUD": AUD.toJson(),
      "JPY": JPY.toJson(),
      "CNY": CNY.toJson(),
      "BTC": BTC.toJson(),
    };
  }

  factory ModelCurrencies.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return ModelCurrencies(
        source: '',
        USD: ModelISOCurrency.fromMap({}),
        EUR: ModelISOCurrency.fromMap({}),
        GBP: ModelISOCurrency.fromMap({}),
        ARS: ModelISOCurrency.fromMap({}),
        CAD: ModelISOCurrency.fromMap({}),
        AUD: ModelISOCurrency.fromMap({}),
        JPY: ModelISOCurrency.fromMap({}),
        CNY: ModelISOCurrency.fromMap({}),
        BTC: ModelISOCurrency.fromMap({}),
      );
    }

    return ModelCurrencies(
      source: map['source'] ?? '',
      USD: ModelISOCurrency.fromMap(map['USD']),
      EUR: ModelISOCurrency.fromMap(map['EUR']),
      GBP: ModelISOCurrency.fromMap(map['GBP']),
      ARS: ModelISOCurrency.fromMap(map['ARS']),
      CAD: ModelISOCurrency.fromMap(map['CAD']),
      AUD: ModelISOCurrency.fromMap(map['AUD']),
      JPY: ModelISOCurrency.fromMap(map['JPY']),
      CNY: ModelISOCurrency.fromMap(map['CNY']),
      BTC: ModelISOCurrency.fromMap(map['BTC']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelCurrencies.fromJson(String source) =>
      ModelCurrencies.fromMap(json.decode(source));
}

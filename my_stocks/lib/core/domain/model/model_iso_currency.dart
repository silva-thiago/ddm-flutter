import 'dart:convert';

class ModelISOCurrency {
  final String name;
  final double buy;
  final double? sell;
  final double variation;

  ModelISOCurrency(
      {required this.name,
      required this.buy,
      this.sell,
      required this.variation});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "buy": buy,
      "sell": sell ?? 0.0,
      "variation": variation,
    };
  }

  factory ModelISOCurrency.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return ModelISOCurrency(
        name: '',
        buy: 0.0,
        sell: 0.0,
        variation: 0.0,
      );
    }

    return ModelISOCurrency(
      name: map['name'] ?? '',
      buy: map['buy'] * 1.0 ?? '',
      sell: map['sell'] * 1.0 ?? '',
      variation: map['variation'] * 1.0 ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelISOCurrency.fromJson(String source) =>
      ModelISOCurrency.fromMap(json.decode(source));
}

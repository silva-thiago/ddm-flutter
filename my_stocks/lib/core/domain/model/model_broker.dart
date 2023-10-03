class ModelBroker {
  final String name;
  final List<String> format;
  final double last;
  final double? buy;
  final double? sell;
  final double variation;

  ModelBroker({
    required this.name,
    required this.format,
    required this.last,
    this.buy,
    this.sell,
    required this.variation,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "format": List<dynamic>.from(format.map((x) => x)),
      "last": last,
      "buy": buy ?? 0.0,
      "sell": sell ?? 0.0,
      "variation": variation,
    };
  }

  factory ModelBroker.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return ModelBroker(
        name: '',
        format: [],
        last: 0.0,
        buy: 0.0,
        sell: 0.0,
        variation: 0.0,
      );
    }
    return ModelBroker(
      name: map["name"] ?? '',
      format: List<String>.from(map["format"].map((x) => x)),
      last: map["last"] * 1.0 ?? 0.0,
      buy: map["buy"] * 1.0 ?? 0.0,
      sell: map["sell"] * 1.0 ?? 0.0,
      variation: map["variation"] * 1.0 ?? 0.0,
    );
  }

  String toJson() => toMap().toString();

  factory ModelBroker.fromJson(Map<String, dynamic> map) => ModelBroker.fromMap(map);
}

class ModelStockIndex {
  final String name;
  final String location;
  final double points;
  final double variation;

  ModelStockIndex(
      {required this.name,
      required this.location,
      required this.points,
      required this.variation});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "location": location,
      "points": points,
      "variation": variation,
    };
  }

  factory ModelStockIndex.fromMap(Map<String, dynamic> map) {
    return ModelStockIndex(
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      points: map['points'] * 1.0 ?? 0.0,
      variation: map['variation'] * 1.0 ?? 0.0,
    );
  }

  String toJson() => toMap().toString();

  factory ModelStockIndex.fromJson(Map<String, dynamic> map) =>
      ModelStockIndex.fromMap(map);
}

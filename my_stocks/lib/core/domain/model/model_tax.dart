class ModelTax {
  final DateTime date;
  final double cdi;
  final double selic;
  final double dailyFactor;
  final double selicDaily;
  final double cdiDaily;

  ModelTax({
    required this.date,
    required this.cdi,
    required this.selic,
    required this.dailyFactor,
    required this.selicDaily,
    required this.cdiDaily,
  });

  factory ModelTax.fromJson(Map<String, dynamic> json) => ModelTax(
        date: DateTime.parse(json["date"]),
        cdi: json["cdi"] * 1.0,
        selic: json["selic"] * 1.0,
        dailyFactor: json["daily_factor"] * 1.0,
        selicDaily: json["selic_daily"] * 1.0,
        cdiDaily: json["cdi_daily"] * 1.0,
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "cdi": cdi,
        "selic": selic,
        "daily_factor": dailyFactor,
        "selic_daily": selicDaily,
        "cdi_daily": cdiDaily,
      };
}

import 'dart:convert';

import 'package:my_stocks/core/domain/model/model_stock_index.dart';

class ModelStocks {
  final ModelStockIndex ibovespa;
  final ModelStockIndex ifix;
  final ModelStockIndex nasdaq;
  final ModelStockIndex dowjones;
  final ModelStockIndex cac;
  final ModelStockIndex nikkei;

  ModelStocks(
      {required this.ibovespa,
      required this.ifix,
      required this.nasdaq,
      required this.dowjones,
      required this.cac,
      required this.nikkei});

  Map<String, dynamic> toMap() {
    return {
      "IBOVESPA": ibovespa.toJson(),
      "IFIX": ifix.toJson(),
      "NASDAQ": nasdaq.toJson(),
      "DOWJONES": dowjones.toJson(),
      "CAC": cac.toJson(),
      "NIKKEI": nikkei.toJson(),
    };
  }

  factory ModelStocks.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return ModelStocks(
        ibovespa: ModelStockIndex.fromMap({}),
        ifix: ModelStockIndex.fromMap({}),
        nasdaq: ModelStockIndex.fromMap({}),
        dowjones: ModelStockIndex.fromMap({}),
        cac: ModelStockIndex.fromMap({}),
        nikkei: ModelStockIndex.fromMap({}),
      );
    }

    return ModelStocks(
      ibovespa: ModelStockIndex.fromMap(map['IBOVESPA']),
      ifix: ModelStockIndex.fromMap(map['IFIX']),
      nasdaq: ModelStockIndex.fromMap(map['NASDAQ']),
      dowjones: ModelStockIndex.fromMap(map['DOWJONES']),
      cac: ModelStockIndex.fromMap(map['CAC']),
      nikkei: ModelStockIndex.fromMap(map['NIKKEI']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelStocks.fromMap(Map<String, dynamic> map) =>
      ModelStocks.fromJson(map);
}

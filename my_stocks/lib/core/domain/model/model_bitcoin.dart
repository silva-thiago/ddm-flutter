import 'package:my_stocks/core/domain/model/model_broker.dart';

class ModelBitcoin {
  final ModelBroker blockchainInfo;
  final ModelBroker coinbase;
  final ModelBroker bitstamp;
  final ModelBroker foxbit;
  final ModelBroker mercadobitcoin;

  ModelBitcoin({
    required this.blockchainInfo,
    required this.coinbase,
    required this.bitstamp,
    required this.foxbit,
    required this.mercadobitcoin,
  });

  Map<String, dynamic> toMap() {
    return {
      "blockchain_info": blockchainInfo.toJson(),
      "coinbase": coinbase.toJson(),
      "bitstamp": bitstamp.toJson(),
      "foxbit": foxbit.toJson(),
      "mercadobitcoin": mercadobitcoin.toJson(),
    };
  }

  factory ModelBitcoin.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return ModelBitcoin(
        blockchainInfo: ModelBroker.fromMap({}),
        coinbase: ModelBroker.fromMap({}),
        bitstamp: ModelBroker.fromMap({}),
        foxbit: ModelBroker.fromMap({}),
        mercadobitcoin: ModelBroker.fromMap({}),
      );
    }

    return ModelBitcoin(
      blockchainInfo: ModelBroker.fromMap(map["blockchain_info"]),
      coinbase: ModelBroker.fromMap(map["coinbase"]),
      bitstamp: ModelBroker.fromMap(map["bitstamp"]),
      foxbit: ModelBroker.fromMap(map["foxbit"]),
      mercadobitcoin: ModelBroker.fromMap(map["mercadobitcoin"]),
    );
  }

  String toJson() => toMap().toString();

  factory ModelBitcoin.fromMap(Map<String, dynamic> map) =>
      ModelBitcoin.fromJson(map);
}

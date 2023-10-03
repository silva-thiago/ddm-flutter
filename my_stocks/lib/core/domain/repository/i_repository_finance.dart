import '../model/model_finance.dart';

abstract class IRepositoryFinance {
  Future<List<ModelFinance>> getFinance();
}


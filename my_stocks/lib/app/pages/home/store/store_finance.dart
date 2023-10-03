import 'package:flutter/material.dart';
import 'package:my_stocks/core/domain/model/model_finance.dart';
import 'package:my_stocks/http/http_exceptions.dart';

import 'package:my_stocks/core/domain/repository/i_repository_finance.dart';

class StoreFinance {
  final IRepositoryFinance repository;

  final ValueNotifier<bool> loading = ValueNotifier<bool>(false);
  final ValueNotifier<List<ModelFinance>> state =
      ValueNotifier<List<ModelFinance>>([]);
  final ValueNotifier<String> error = ValueNotifier<String>('');

  StoreFinance({required this.repository});

  Future getFinance() async {
    loading.value = true;

    try {
      final response = await repository.getFinance();

      state.value = response;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }

    loading.value = false;
  }
}

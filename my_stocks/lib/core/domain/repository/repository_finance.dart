import 'dart:convert';

import 'package:my_stocks/core/domain/model/model_finance.dart';
import 'package:my_stocks/core/domain/repository/i_repository_finance.dart';
import 'package:my_stocks/http/http_client.dart';
import 'package:my_stocks/http/http_exceptions.dart';

const String CLIENT_ENDPOINT = 'https://api.hgbrasil.com/finance';

class RepositoryFinance implements IRepositoryFinance {
  final HttpClient client;

  RepositoryFinance({required this.client});

  @override
  Future<List<ModelFinance>> getFinance() async {
    final response = await client.get(
        url: '$CLIENT_ENDPOINT?format=json-cors');

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> body = jsonDecode(response.body);

      return body.map<ModelFinance>((response) => ModelFinance.fromMap(response)).toList();
    } else if (response.statusCode == 400) {
      throw NotFoundException('A URL informada não é válida.');
    } else {
      throw Exception('Não foi possível carregar os dados.');
    }
  }
}

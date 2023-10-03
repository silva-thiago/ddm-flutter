import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class IClient {
  Future get({required String url});
}

class HttpClient implements IClient {
  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}

class DioClient implements IClient {
  final client = Dio();

  @override
  Future get({required String url}) async {
    return await client.get(url);
  }
}

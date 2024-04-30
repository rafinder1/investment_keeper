import 'package:dio/dio.dart';

class BanksRemoteDioDataSource {
  Future<List<Map<String, dynamic>>?> getBanks() async {
    final response = await Dio().get<List<dynamic>>(
        'https://my-json-server.typicode.com/rafinder1/ik-fake-backend/banks');

    final listDynamic = response.data;

    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}

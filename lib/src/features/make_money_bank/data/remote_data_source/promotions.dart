import 'package:dio/dio.dart';

class PromotionsRemoteDioDataSource {
  Future<List<Map<String, dynamic>>?> getPromotions() async {
    final response = await Dio().get<List<dynamic>>(
        'https://my-json-server.typicode.com/rafinder1/ik-fake-backend/promotions');

    final listDynamic = response.data;

    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}

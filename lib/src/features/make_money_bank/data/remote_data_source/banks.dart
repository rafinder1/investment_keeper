import 'package:dio/dio.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/models/banks_model.dart';

class BanksRemoteDioDataSource {
  Future<List<BanksModel>?> getBanks() async {
    final response = await Dio().get<List<dynamic>>(
        'https://my-json-server.typicode.com/rafinder1/ik-fake-backend/banks');
    final listDynamic = response.data;

    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((item) => BanksModel.fromJson(item)).toList();
  }
}
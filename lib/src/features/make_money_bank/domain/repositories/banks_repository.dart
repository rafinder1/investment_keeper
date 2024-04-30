import 'package:investment_keeper/src/features/make_money_bank/data/remote_data_source/banks.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/models/banks_model.dart';

class BanksRepository {
  BanksRepository({required this.banksRemoteDioDataSource});

  final BanksRemoteDioDataSource banksRemoteDioDataSource;

  Future<List<BanksModel>> getBanksModels() async {
    final json = await banksRemoteDioDataSource.getBanks();

    if (json != null) {
      return json.map((item) => BanksModel.fromJson(item)).toList();
    } else {
      return [];
    }
  }
}

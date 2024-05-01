import 'package:investment_keeper/src/features/make_money_bank/data/remote_data_source/promotions.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/models/promotion_model.dart';

class PromotionRepository {
  PromotionRepository({required this.promotionsRemoteDioDataSource});

  final PromotionsRemoteDioDataSource promotionsRemoteDioDataSource;

  Future<List<PromotionModel>> getPromotionModelForBankId(int bankId) async {
    final json = await promotionsRemoteDioDataSource.getPromotions();

    if (json != null) {
      return json.map((item) => PromotionModel.fromJson(item)).toList();
    } else {
      return [];
    }
  }
}
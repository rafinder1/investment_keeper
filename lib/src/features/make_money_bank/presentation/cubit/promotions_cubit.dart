import 'package:bloc/bloc.dart';
import 'package:investment_keeper/src/core/enums.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/models/promotion_model.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/repositories/promotion_repository.dart';

part 'promotions_state.dart';

class PromotionsCubit extends Cubit<PromotionsState> {
  PromotionsCubit(this.promotionRemoteRepository) : super(PromotionsState());

  final PromotionRepository promotionRemoteRepository;

  Future<void> fetchData(bankId) async {
    emit(
      PromotionsState(
        status: Status.loading,
      ),
    );

    try {
      final results =
          await promotionRemoteRepository.getPromotionModelForBankId(bankId);
      emit(
        PromotionsState(
          status: Status.success,
          results: results,
        ),
      );
    } catch (error) {
      emit(
        PromotionsState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}

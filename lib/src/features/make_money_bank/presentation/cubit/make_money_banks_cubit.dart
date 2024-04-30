import 'package:bloc/bloc.dart';
import 'package:investment_keeper/src/core/enums.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/models/banks_model.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/repositories/banks_repository.dart';

part 'make_money_banks_state.dart';

class MakeMoneyBanksCubit extends Cubit<MakeMoneyBanksState> {
  MakeMoneyBanksCubit(this.banksRemoteRepository) : super(MakeMoneyBanksState());

  final BanksRepository banksRemoteRepository;

  Future<void> fetchData() async {
    emit(
      MakeMoneyBanksState(
        status: Status.loading,
      ),
    );

    try {
      final results = await banksRemoteRepository.getBanksModels();
      emit(
        MakeMoneyBanksState(
          status: Status.success,
          results: results,
        ),
      );
    } catch (error) {
      emit(
        MakeMoneyBanksState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}

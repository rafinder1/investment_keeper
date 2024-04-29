import 'package:bloc/bloc.dart';
import 'package:investment_keeper/src/core/enums.dart';
import 'package:investment_keeper/src/features/make_money_bank/data/remote_data_source/banks.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/models/banks_model.dart';

part 'make_money_banks_state.dart';

class MakeMoneyBanksCubit extends Cubit<MakeMoneyBanksState> {
  MakeMoneyBanksCubit(this.dataSource) : super(MakeMoneyBanksState());

  final BanksRemoteDioDataSource dataSource;

  Future<void> fetchData() async {
    emit(
      MakeMoneyBanksState(
        status: Status.loading,
      ),
    );

    try {
      final results = await dataSource.getBanks();
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

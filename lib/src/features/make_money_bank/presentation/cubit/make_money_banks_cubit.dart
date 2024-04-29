import 'package:bloc/bloc.dart';
import 'package:investment_keeper/src/core/enums.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/models/banks_model.dart';

part 'make_money_banks_state.dart';

class MakeMoneyBanksCubit extends Cubit<MakeMoneyBanksState> {
  MakeMoneyBanksCubit() : super(MakeMoneyBanksState());
}

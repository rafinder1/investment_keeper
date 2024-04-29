part of 'make_money_banks_cubit.dart';

class MakeMoneyBanksState {
  MakeMoneyBanksState({
    this.results = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<BanksModel> results;
  final Status status;
  final String? errorMessage;
}

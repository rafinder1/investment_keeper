import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_keeper/src/core/enums.dart';
import 'package:investment_keeper/src/features/make_money_bank/data/remote_data_source/banks.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/models/banks_model.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/repositories/banks_repository.dart';
import 'package:investment_keeper/src/features/make_money_bank/presentation/cubit/make_money_banks_cubit.dart';

class BanksDataScreen extends StatelessWidget {
  const BanksDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MakeMoneyBanksCubit(
          BanksRepository(
            banksRemoteDioDataSource: BanksRemoteDioDataSource(),
          ),
        )..fetchData(),
        child: Expanded(
          child: BlocBuilder<MakeMoneyBanksCubit, MakeMoneyBanksState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return const Center(
                    child: Text('Initial state'),
                  );
                case Status.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.success:
                  return ListView(
                    children: [
                      for (final author in state.results)
                        _BanksWidget(
                          model: author,
                        ),
                    ],
                  );
                case Status.error:
                  return Center(
                    child: Text(
                      state.errorMessage ?? 'Unknown error',
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _BanksWidget extends StatelessWidget {
  const _BanksWidget({required this.model});

  final BanksModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          color: Colors.black12,
          child: Row(
            children: [
              Expanded(
                child: Text(model.name),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    const Text('Koniec promocji:'),
                    Text(model.getFormattedEndPromotion()),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text('Data zamknięcia konta:'),
                    Text(model.getFormattedNoAccountSince()),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_right,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

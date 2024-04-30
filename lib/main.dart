import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_keeper/src/core/enums.dart';
import 'package:investment_keeper/src/features/make_money_bank/data/remote_data_source/banks.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/repositories/banks_repository.dart';
import 'package:investment_keeper/src/features/make_money_bank/presentation/cubit/make_money_banks_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: BanksDataScreen(),
      ),
    );
  }
}

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
                return ListView.builder(
                  itemCount: state.results.length,
                  itemBuilder: (context, index) {
                    final bank = state.results[index];
                    return ListTile(
                      title: Text(bank.name),
                      subtitle: Text(
                          'End Promotion: ${bank.endPromotion}, No Account Since: ${bank.noAccountSince}'),
                    );
                  },
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
    );
  }
}

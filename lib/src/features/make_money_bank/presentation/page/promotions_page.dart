import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_keeper/src/core/enums.dart';
import 'package:investment_keeper/src/features/make_money_bank/data/remote_data_source/promotions.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/models/banks_model.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/models/promotion_model.dart';
import 'package:investment_keeper/src/features/make_money_bank/domain/repositories/promotion_repository.dart';
import 'package:investment_keeper/src/features/make_money_bank/presentation/cubit/promotions_cubit.dart';

class PromotionsPage extends StatelessWidget {
  const PromotionsPage({super.key, required this.bank});

  final BanksModel bank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bank.name),
      ),
      body: BlocProvider(
        create: (context) => PromotionsCubit(
          PromotionRepository(
            promotionsRemoteDioDataSource: PromotionsRemoteDioDataSource(),
          ),
        )..fetchData(bank.id),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<PromotionsCubit, PromotionsState>(
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
                          for (final promotion in state.results)
                            _PromotionWidget(
                              model: promotion,
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
          ],
        ),
      ),
    );
  }
}

class _PromotionWidget extends StatelessWidget {
  const _PromotionWidget({required this.model});

  final PromotionModel model;

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
                child: Column(
                  children: [
                    Text('Opis promocji: ${model.description}'),
                    Text('Bank id: ${model.bankId}'),
                    Text('Zarobisz u nas: ${model.earningAmount}')
                  ],
                ),
              ),
              const SizedBox(width: 10),
              // const Icon(
              //   Icons.arrow_right,
              //   color: Colors.black,
              //   size: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

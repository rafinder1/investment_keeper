part of 'promotions_cubit.dart';

class PromotionsState {
  PromotionsState({
    this.results = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<PromotionModel> results;
  final Status status;
  final String? errorMessage;}

